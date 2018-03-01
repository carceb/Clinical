using Seguridad.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seguridad
{
    public partial class Seguridad : System.Web.UI.Page
    {
        protected  void Page_Load(object sender, EventArgs e)
        {
            if (SeguridadUsuario.EsUsuarioPermitido(Session, 17) == false)
            {
                Response.Redirect("/Index.aspx");
            }
            EstablecerObjetos();
        }
        private void EstablecerObjetos()
        {
            CSeguridad objetoSeguridad = new CSeguridad();
            objetoSeguridad.SeguridadUsuarioDatosID = Convert.ToInt32(Session["UserID"]);
            if (objetoSeguridad.EsUsuarioAdministrador() == true)
            {
                btnAgregarGrupo.Visible = true;
                btnAgregarObjeto.Visible = true;
                btmAgregarGrupoObjeto.Visible = true;
                btnAgregarEmpresa.Visible = true;
                btnAgregarSucursal.Visible = true;
                btnMedico.Visible = true;
                btnConsultorio.Visible = true;
                btnMedicoConsultorio.Visible = true;
                btnMedicoCalendario.Visible = true;
                lblOpcionesEmpresa.Visible = true;
                lblOpcionesSeguridad.Visible = true;
            }
            else
            {
                btnAgregarGrupo.Visible = false;
                btnAgregarObjeto.Visible = false;
                btmAgregarGrupoObjeto.Visible = false;
                btnAgregarEmpresa.Visible = false;
                btnAgregarSucursal.Visible = false;
                btnMedico.Visible = false;
                btnConsultorio.Visible = false;
                btnMedicoConsultorio.Visible = false;
                btnMedicoCalendario.Visible = false;
                lblOpcionesEmpresa.Visible = false;
                lblOpcionesSeguridad.Visible = false;
            }
        }
        protected void btnAgregarUsuario_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeguridadUsuario.aspx");
        }

        protected void btnAgregarGrupo_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeguridadGrupo.aspx");
        }

        protected void btnAgregarObjeto_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeguridadObjeto.aspx");
        }

        protected void btmAgregarGrupoObjeto_Click(object sender, EventArgs e)
        {
            Response.Redirect("SeguridadObjetoGrupo.aspx");
        }

        protected void btnAgregarEmpresa_Click(object sender, EventArgs e)
        {
            Response.Redirect("Empresa.aspx");
        }

        protected void btnAgregarSucursal_Click(object sender, EventArgs e)
        {
            Response.Redirect("Consultorio.aspx");
        }

        protected void btnMedico_Click(object sender, EventArgs e)
        {
            Response.Redirect("Medicos.aspx");
        }

        protected void btnConsultorio_Click(object sender, EventArgs e)
        {
            Response.Redirect("Consultorio.aspx");
        }

        protected void btnMedicoConsultorio_Click(object sender, EventArgs e)
        {
            Response.Redirect("MedicoConsultorio.aspx");
        }

        protected void btnMedicoCalendario_Click(object sender, EventArgs e)
        {
            Response.Redirect("MedicoCalendario.aspx");
        }
    }
}