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
    public partial class Consultorio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtNombreConsultorio.Focus();
                CargarEstado();
            }
        }

        private void CargarEstado()
        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";

            strQuery = "select * From Estado ORDER BY NombreEstado";

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlEstado.DataSource = cmd.ExecuteReader();
                    ddlEstado.DataTextField = "NombreEstado";
                    ddlEstado.DataValueField = "EstadoID";
                    ddlEstado.DataBind();
                    con.Close();
                }
            }
        }

        private void CargarCiudad(int estadoID)
        {
            ddlCiudad.Items.Clear();
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";

            if(Convert.ToInt32(hdnCodigoCiudad.Value) ==0)
            {
                strQuery = "select * From Ciudad Where EstadoID = " + estadoID;
            }
            else
            {
                strQuery = "select * From Ciudad Where EstadoID = " + estadoID + " AND CiudadID = "  + hdnCodigoCiudad.Value;
            }
           

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlCiudad.DataSource = cmd.ExecuteReader();
                    ddlCiudad.DataTextField = "NombreCiudad";
                    ddlCiudad.DataValueField = "CiudadID";
                    ddlCiudad.DataBind();
                    con.Close();
                }
            }
        }
        protected void ddlEstado_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCiudad(Convert.ToInt32(ddlEstado.SelectedItem.Value));
        }
        private void AgregarConsultorio()
        {
            try
            {
                CConsultorio objetoConsultorio = new CConsultorio();

                objetoConsultorio.ConsultorioID = Convert.ToInt32(hdnConsultorioID.Value);
                objetoConsultorio.NombreConsultorio = txtNombreConsultorio.Text.ToUpper();
                objetoConsultorio.Rif = txtRif.Text.ToUpper();
                objetoConsultorio.DireccionConsultorio = txtDireccion.Text.ToUpper();
                objetoConsultorio.CiudadID = Convert.ToInt32(ddlCiudad.SelectedItem.Value);
                objetoConsultorio.TelefonoConsultorio = txtTelefonos.Text;
                objetoConsultorio.EmailConsultorio = txtEmail.Text;

                if(Convert.ToInt32(hdnConsultorioID.Value) == 0)
                {
                    if (Consultorio.InsertarConsultorio(objetoConsultorio) > 0)
                    {
                        messageBox.ShowMessage("Registro insertado");
                        Nuevoregistro();
                    }
                }
                else
                {
                    if (Consultorio.ActualizarConsultorio(objetoConsultorio) > 0)
                    {
                        messageBox.ShowMessage("Registro modificado");
                        Nuevoregistro();
                    }
                }
            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }
        private void Nuevoregistro()
        {
            txtNombreConsultorio.Text = "";
            txtRif.Text = "";
            txtDireccion.Text = "";
            txtTelefonos.Text = "";
            txtEmail.Text = "";
            hdnCodigoCiudad.Value = "0";
            hdnConsultorioID.Value = "0";
            txtNombreConsultorio.Focus();
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            CargarCiudad(Convert.ToInt32(ddlEstado.SelectedItem.Value));
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            AgregarConsultorio();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            Nuevoregistro();
        }
    }
}