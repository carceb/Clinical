using Admin;
using Seguridad.Clases;
using System;
using System.Web.UI;

namespace Teach
{
    public partial class UCNavigation : System.Web.UI.UserControl
    {
        private void Page_Load(object sender, EventArgs e)
        {

            bool Logged = paginaBase.LoggedIn(Session);

            if (this.lnkChangePassword.Enabled)
            {
                this.lnkChangePassword.CssClass = "izq";
            }
            else
            {
                this.lnkChangePassword.CssClass = "izqDesactivado";
            }


            Page.ClientScript.RegisterStartupScript(Page.GetType(), "tttt", "ocultarEnlaces(" + Logged.ToString().ToLower() + ");", true);
            this.divLogin.Visible = !Logged;
            if (Logged)
            {
                int codigoDeTecnico = Convert.ToInt32(this.Session["UserId"].ToString());
                CSeguridad objetoSeguridad = new CSeguridad();
                objetoSeguridad.SeguridadUsuarioDatosID = codigoDeTecnico;
                lnkHome.CssClass = "izq";

                if (objetoSeguridad.EsUsuarioAdministrador() == true)
                {
                    this.lblVentas.CssClass = "izq";
                    this.lnkAtencionCallCenter.CssClass = "izq";
                    this.lnkHistoriaMedica.CssClass = "izq";
                    this.lnkHistoriaMedica.CssClass = "izq";
                    this.lnkAtencionDoctor.CssClass = "izq";
                    this.lblConsultas.CssClass = "izq";
                    this.lnkAddProducto.CssClass = "izq";
                    this.lnkSeguridad.CssClass = "izq";

                    this.lblOpciones.CssClass = "izq";
                    this.lnkMedicos.CssClass = "izq";
                    this.lnkConsultorio.CssClass = "izq";
                    this.lnkConsultorioMedico.CssClass ="izq";
                    this.lnkCalendario.CssClass = "izq";
                }
                else
                {
                     this.lnkSeguridad.Visible = false;
                    //MENU ATENCION VISITAS
                    if (objetoSeguridad.EsAccesoPermitido(1) == true)
                    {
                        this.lblVentas.CssClass = "izq";
                        this.lnkAtencionCallCenter.CssClass = "izq";
                        this.lnkHistoriaMedica.CssClass = "izq";
                        this.lnkAtencionDoctor.CssClass = "izq";

                    }
                    else
                    {
                        this.lblVentas.Visible = false;
                        this.lnkAtencionCallCenter.Visible = false;
                        this.lnkHistoriaMedica.Visible = false;
                        this.lnkAtencionDoctor.Visible = false;
                    }



                    //MENU CONSULTAS
                    if (objetoSeguridad.EsAccesoPermitido(2) == true)
                    {
                        this.lblConsultas.CssClass = "izq";
                        this.lnkAddProducto.CssClass = "izq";
                    }
                    else
                    {
                        this.lblConsultas.Visible = false;
                        this.lnkAddProducto.Visible = false;
                    }

                }

            }
        }



        protected override void OnInit(EventArgs e)
        {
            this.InitializeComponent();
            base.OnInit(e);
        }
        private void InitializeComponent()
        {
            base.Load += new EventHandler(this.Page_Load);
        }
    }
}