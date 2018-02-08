using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical
{
    public partial class MedicoConsultorio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarFormaPago();
            }
        }

        private void CargarFormaPago()
        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";

            strQuery = "select * From FormaPago ";

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlFormaPago.DataSource = cmd.ExecuteReader();
                    ddlFormaPago.DataTextField = "NombreFormaPago";
                    ddlFormaPago.DataValueField = "FormaPagoID";
                    ddlFormaPago.DataBind();
                    con.Close();
                }
            }
        }

        protected void gridDetalle_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                String medicoConsultorioID = e.CommandArgument.ToString();
                if (e.CommandName == "EliminarDetalle")
                {
                    MedicoConsultorio.EliminarMedicoConsultorio(Convert.ToInt32(medicoConsultorioID));
                    CargarMedicoConsultorios();
                }
            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
            
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            IngresarMedicoConsultorio();
        }

        private void IngresarMedicoConsultorio()
        {
            try
            {

                if (EsTodoCorrecto() == true)
                {
                    CMedicoConsultorio objetoMedicoConsultorio = new CMedicoConsultorio();
                    objetoMedicoConsultorio.MedicoID = Convert.ToInt32(hdnMedicoID.Value);
                    objetoMedicoConsultorio.ConsultorioID = Convert.ToInt32(hdnConsultorioID.Value);
                    objetoMedicoConsultorio.NumeroMaximoCitas = Convert.ToInt32(txtCitas.Text);
                    objetoMedicoConsultorio.FormaPagoID = Convert.ToInt32(ddlFormaPago.SelectedItem.Value);

                    if (MedicoConsultorio.InsertarMedicoConsultorio(objetoMedicoConsultorio) > 1)
                    {
                        messageBox.ShowMessage("Medico/Consultorio agregado.");
                        CargarMedicoConsultorios();
                    }
                }
            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }
        private void CargarMedicoConsultorios()
        {
            try
            {

                int codigoMedico = Convert.ToInt32(hdnMedicoID.Value);
                DataSet ds = MedicoConsultorio.ObtenerMedicoConsultorios(codigoMedico);
                DataTable dt = ds.Tables[0];
                gridDetalle.DataSource = dt;
                gridDetalle.DataBind();
            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }
        private void NuevoRegistro()
        {
            txtNombreMedico.Text ="";
            txtNombreConsultorio.Text = "";
            txtCitas.Text = "";
            hdnMedicoID.Value = "0";
            hdnConsultorioID.Value = "0";
            txtNombreMedico.Focus();
            gridDetalle.DataSource = null;
            gridDetalle.DataBind();
        }
        private bool EsTodoCorrecto()
        {
            bool resultado = true;
            SqlDataReader dr = MedicoConsultorio.ObtenerMedicoConConsultorio(Convert.ToInt32(hdnMedicoID.Value), Convert.ToInt32(hdnConsultorioID.Value));
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    resultado = false;
                    messageBox.ShowMessage("El doctor ya tiene asignado ese consultorio.");
                }
            }
            return resultado;
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            CargarMedicoConsultorios();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            NuevoRegistro();
        }
    }
}