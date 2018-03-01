using Seguridad.Clases;
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
    public partial class AtencionDoctorSeleccion : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                CargarMedicos();
                CargarCitas();
            }
            
        }
        private void CargarMedicos()
        {
            CSeguridad objetoSeguridad = new CSeguridad();
            String strQuery;
            objetoSeguridad.SeguridadUsuarioDatosID = Convert.ToInt32(this.Session["CodigoUsuario"].ToString());
            if (objetoSeguridad.EsUsuarioAdministrador() == true)
            {
                strQuery = "SELECT  dbo.Medico.MedicoID, dbo.Medico.SexoMedico, dbo.Medico.CedulaMedico, dbo.Medico.NombreMedico, dbo.MedicoConsultorio.ConsultorioID FROM dbo.Medico INNER JOIN dbo.MedicoConsultorio ON dbo.Medico.MedicoID = dbo.MedicoConsultorio.MedicoID WHERE dbo.MedicoConsultorio.ConsultorioID = " + Convert.ToInt32(this.Session["CodigoSucursalEmpresa"].ToString());
            }
            else
            {
                strQuery = "SELECT dbo.Medico.MedicoID, dbo.Medico.SexoMedico, dbo.Medico.CedulaMedico, dbo.Medico.NombreMedico, dbo.MedicoConsultorio.ConsultorioID, dbo.SeguridadUsuarioSucursalEmpresa.SeguridadUsuarioDatosID FROM   dbo.Medico INNER JOIN dbo.MedicoConsultorio ON dbo.Medico.MedicoID = dbo.MedicoConsultorio.MedicoID INNER JOIN dbo.SeguridadUsuarioSucursalEmpresa ON dbo.MedicoConsultorio.ConsultorioID = dbo.SeguridadUsuarioSucursalEmpresa.EmpresaSucursalID WHERE dbo.MedicoConsultorio.ConsultorioID = " + Convert.ToInt32(this.Session["CodigoSucursalEmpresa"].ToString()) + " AND dbo.SeguridadUsuarioSucursalEmpresa.SeguridadUsuarioDatosID =  " + Convert.ToInt32(this.Session["CodigoUsuario"].ToString());
            }
             String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            SqlConnection con = new SqlConnection(strConnString);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strQuery;
            cmd.Connection = con;

            try
            {
                con.Open();
                ddlDoctor.DataSource = cmd.ExecuteReader();
                ddlDoctor.DataTextField = "NombreMedico";
                ddlDoctor.DataValueField = "MedicoID";
                ddlDoctor.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                con.Close();
                con.Dispose();
            }
        }
        private void CargarCitas()
        {
            try
            {
                int codigoConsultorio = Convert.ToInt32(this.Session["CodigoSucursalEmpresa"].ToString());
                if(ddlDoctor.SelectedValue.ToString() != "0")
                {
                    DataSet ds = CitaCola.ObtenerColaCitasDoctor(codigoConsultorio, DateTime.Now.ToString("dd/MM/yyyy"), Convert.ToInt32(ddlDoctor.SelectedValue.ToString()));
                    DataTable dt = ds.Tables[0];
                    gridDetalle.DataSource = dt;
                    gridDetalle.DataBind();
                }

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
                if (e.CommandName == "EliminarDetalle")
                {
                    //CRecepcion objetoRecepcion = new CRecepcion();
                    //objetoRecepcion.RecepcionEquipoID = Convert.ToInt32(e.CommandArgument.ToString());

                    //if (Recepcion.EliminarRecepcion(Convert.ToInt32(e.CommandArgument.ToString())) > 0)
                    //{
                    //    messageBox.ShowMessage("Equipo eliminado.");
                    //    CargarDetalleServicio(true);
                    //}
                    //else
                    //{
                    //    messageBox.ShowMessage("No se pudo eliminar el detalle. Intente nuevamente.");
                    //}
                }
                else if (e.CommandName == "SeleccionarDetalle")
                {
                    this.Session["MedicoID"] = ddlDoctor.SelectedValue.ToString();
                    this.Session["CitaID"] = Convert.ToInt32(e.CommandArgument.ToString());
                    Response.Redirect("AtencionDoctor.aspx");
                }
            }
            catch (Exception ex)
            {
                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }

        protected void ddlDoctor_SelectedIndexChanged(object sender, EventArgs e)
        {
            CargarCitas();
        }
    }
}