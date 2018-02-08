using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using Seguridad.Clases;
namespace Seguridad
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtLogin.Focus();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            ProcesoLogin();
        }

        private void ProcesoLogin()
        {
            if (Convert.ToInt32(hdnCodigoUsuario.Value) == 0)
            {

                try
                {
                    DataSet ds = Login.ValidarLogin(txtLogin.Text, txtClave.Text);
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count == 0)
                    {
                        messageBox.ShowMessage("El usuario y/o la contaseña son incorrectos");
                    }
                    else
                    {
                        this.Session["UserId"] = dt.Rows[0]["SeguridadUsuarioDatosID"].ToString();
                        this.Session["UserName"] = dt.Rows[0]["LoginUsuario"].ToString();
                        this.Session["NombreCompletoUsuario"] = dt.Rows[0]["NombreCompleto"].ToString();
                        this.Session["ClaveUsuario"] = dt.Rows[0]["ClaveUsuario"].ToString();
                        hdnCodigoUsuario.Value = dt.Rows[0]["SeguridadUsuarioDatosID"].ToString();
                        CargarEmpresa(Convert.ToInt32(dt.Rows[0]["SeguridadUsuarioDatosID"].ToString()));
                    }

                }
                catch (Exception ex)
                {
                    messageBox.ShowMessage(ex.Message);
                }
            }
            else
            {
                this.Session["CodigoEmpresa"] = ddlConsultorio.SelectedValue;
                this.Session["NombreEmpresa"] = ddlConsultorio.SelectedItem;
                Response.Redirect("/Vista/Main.aspx");
            }
        }
        private void CargarEmpresa(int codigoUsuario)
        {

            CSeguridad objetoSeguridad = new CSeguridad();
            try
            {
                objetoSeguridad.SeguridadUsuarioDatosID = codigoUsuario;
                if (objetoSeguridad.EsUsuarioAdministrador() == true)
                {
                    EstablecerObjetos(true);
                    CargarComboEmpresas(0);
                }
                else
                {
                    if (CantidadEmpresasPorUsuario(codigoUsuario, false) < 1)
                    {
                        RestablecerVariables();
                        messageBox.ShowMessage("Este usuario no está configurado en el sistema.");
                    }
                    else if (CantidadEmpresasPorUsuario(codigoUsuario, false) == 1)
                    {
                        CargarComboEmpresas(codigoUsuario);
                        this.Session["CodigoEmpresa"] = CantidadEmpresasPorUsuario(codigoUsuario, true);
                        this.Session["NombreEmpresa"] = ddlConsultorio.SelectedItem;
                        Response.Redirect("/Vista/Main.aspx");
                    }
                    else if (CantidadEmpresasPorUsuario(codigoUsuario, false) > 1)
                    {
                        EstablecerObjetos(true);
                        CargarComboEmpresas(codigoUsuario);
                    }
                }
            }
            catch (Exception ex)
            {
                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }
        private int CantidadEmpresasPorUsuario(int codigoUsuario, bool esRetornoCodigoEmpresa)
        {
            int totalEncontrado = 0;
            int codigoEmpresa = 0;
            SqlDataReader dr = SeguridadUsuario.ObtenerEmpresas(codigoUsuario);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    codigoEmpresa = dr.GetInt32(5);
                    totalEncontrado = totalEncontrado + 1;
                }
            }
            if(esRetornoCodigoEmpresa ==false)
            {
                return totalEncontrado;
            }
            else
            {
                return codigoEmpresa;
            }
            
        }

        private void EstablecerObjetos(bool esVisible)
        {
            lblConsultorio.Visible = esVisible;
            ddlConsultorio.Visible = esVisible;
            lblMensaje.Visible = esVisible;
            txtLogin.Enabled = false;
        }
        private void RestablecerVariables()
        {
            this.Session["UserId"] = "0";
            this.Session["UserName"] = "";
            this.Session["NombreCompletoUsuario"] = "";
            this.Session["ClaveUsuario"] = "";
            hdnCodigoUsuario.Value = "0";
        }
        private void CargarComboEmpresas(int codigoUsuario)
        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";

            //SI ES ADMINISTRADOR CARGA EL COMBO DE EMPRESAS CON TODAS
            if (codigoUsuario ==0)
            {
                strQuery = "select * From DetalleUsuarioConsultorio";
            }
            else
            {
                strQuery = "select * From DetalleUsuarioConsultorio WHERE SeguridadUsuarioDatosID = " + codigoUsuario;
            }
            //********************************************************************************************************

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlConsultorio.DataSource = cmd.ExecuteReader();
                    ddlConsultorio.DataTextField = "Consultorio_Medico";
                    ddlConsultorio.DataValueField = "ConsultorioID";
                    ddlConsultorio.DataBind();
                    con.Close();
                }
            }
        }
    }
}