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
            }
            
        }
        private void CargarMedicos()
        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "SELECT  dbo.Medico.MedicoID, dbo.Medico.SexoMedico, dbo.Medico.CedulaMedico, dbo.Medico.NombreMedico, dbo.MedicoConsultorio.ConsultorioID FROM dbo.Medico INNER JOIN dbo.MedicoConsultorio ON dbo.Medico.MedicoID = dbo.MedicoConsultorio.MedicoID WHERE dbo.MedicoConsultorio.ConsultorioID = " + Convert.ToInt32(this.Session["CodigoEmpresa"].ToString());
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
                ddlDoctor.Items.Insert(0, new ListItem("--Seleccione el Doctor--", "0"));
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

        protected void btnEntrar_Click(object sender, EventArgs e)
        {
            this.Session["MedicoID"] = ddlDoctor.SelectedValue.ToString();
            Response.Redirect("AtencionDoctor.aspx");
        }
    }
}