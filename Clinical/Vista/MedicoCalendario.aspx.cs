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
    public partial class MedicoCalendario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txtNombreConsultorio.Focus();
                CargarDias();
                CargarHora();
                CargarMinutos();
                CargarTipoHora();
            }
        }
        private void CargarDias()
        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";

            strQuery = "select * From DiaSemana ";

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlDia.DataSource = cmd.ExecuteReader();
                    ddlDia.DataTextField = "DiaSemana";
                    ddlDia.DataValueField = "DiaSemanaID";
                    ddlDia.DataBind();
                    con.Close();
                }
            }
        }
        private void CargarHora()
        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";

            strQuery = "select * From HoraSemana ";

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlHora.DataSource = cmd.ExecuteReader();
                    ddlHora.DataTextField = "HoraSemana";
                    ddlHora.DataValueField = "HoraSemanaID";
                    ddlHora.DataBind();
                    con.Close();
                }
            }
        }
        private void CargarMinutos()
        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";

            strQuery = "select * From MinutosSemana ";

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlMinutos.DataSource = cmd.ExecuteReader();
                    ddlMinutos.DataTextField = "MinutosSemana";
                    ddlMinutos.DataValueField = "MinutosSemanaID";
                    ddlMinutos.DataBind();
                    con.Close();
                }
            }
        }
        private void CargarTipoHora()
        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";

            strQuery = "select * From TipoHoraSemana";

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlTipoHora.DataSource = cmd.ExecuteReader();
                    ddlTipoHora.DataTextField = "NombreTipoHoraSemana";
                    ddlTipoHora.DataValueField = "TipoHoraSemanaID";
                    ddlTipoHora.DataBind();
                    con.Close();
                }
            }
        }
        private void CargarMedicoCalendario()
        {
            try
            {

                int codigoMedico = Convert.ToInt32(hdnMedicoID.Value);
                DataSet ds = MedicoCalendario.ObtenerMedicoCalendario(codigoMedico);
                DataTable dt = ds.Tables[0];
                gridDetalle.DataSource = dt;
                gridDetalle.DataBind();
            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }
        protected void gridDetalle_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                String medicoCalendarioSemanaID = e.CommandArgument.ToString();
                if (e.CommandName == "EliminarDetalle")
                {
                    MedicoCalendario.EliminarMedicoCalendario(Convert.ToInt32(medicoCalendarioSemanaID));
                    CargarMedicoCalendario();
                }
            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ProcesoActualizacion();
        }
        private void NuevoRegistro()
        {
            txtNombreConsultorio.Text = "";
            hdnConsultorioID.Value = "0";
            hdnMedicoConsultorioID.Value = "0";
            gridDetalle.DataSource = null;
            gridDetalle.DataBind();
            txtNombreConsultorio.Focus();

        }
        private void ProcesoActualizacion()
        {
            try
            {
                bool esIndicador = false;
                CMedicoCalendario objetoMedicoCalendario = new CMedicoCalendario();
                objetoMedicoCalendario.MedicoConsultorioID = Convert.ToInt32(hdnMedicoConsultorioID.Value);
                objetoMedicoCalendario.DiaSemanaID = Convert.ToInt32(ddlDia.SelectedItem.Value);
                objetoMedicoCalendario.HoraSemanaID = Convert.ToInt32(ddlHora.SelectedItem.Value);
                objetoMedicoCalendario.MinutosSemanaID = Convert.ToInt32(ddlMinutos.SelectedItem.Value);
                objetoMedicoCalendario.TipoHoraSemanaID = Convert.ToInt32(ddlTipoHora.SelectedItem.Value);
                if (ddlInicial.SelectedItem.Value == "SI")
                {
                    esIndicador = true;
                }
                objetoMedicoCalendario.IndicaHoraInicial = esIndicador;
                if(MedicoCalendario.InsertarMedicoCalendario(objetoMedicoCalendario) > 0)
                {
                    CargarMedicoCalendario();
                    messageBox.ShowMessage("Registro agregado.");
                }
            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }

        protected void btnTest_Click(object sender, EventArgs e)
        {
            CargarMedicoCalendario();
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            NuevoRegistro();
        }
    }
}