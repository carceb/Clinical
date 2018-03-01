using Admin;
using Seguridad.Clases;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical.Vista
{
    public partial class UCNavegacion : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            EstablecerSeguridad();
        }
        private void EstablecerSeguridad()
        {
            CSeguridad objetoSeguridad = new CSeguridad();
            objetoSeguridad.SeguridadUsuarioDatosID = Convert.ToInt32(this.Session["UserId"].ToString());
            if (objetoSeguridad.EsUsuarioAdministrador() == false)
            {
                ColocarEnlacesInvisibles();
                if (objetoSeguridad.EsAccesoPermitido(22) == true)
                {
                    lnkCitas.Visible = true;
                }
                if (objetoSeguridad.EsAccesoPermitido(23) == true)
                {
                    lnkPacientes.Visible = true;
                }
                if (objetoSeguridad.EsAccesoPermitido(24) == true)
                {
                    lnkConsultaDoctor.Visible = true;
                }
                if (objetoSeguridad.EsAccesoPermitido(12) == true)
                {
                    lnkPacientesAtendidos.Visible = true;
                }
                if (objetoSeguridad.EsAccesoPermitido(25) == true)
                {
                    lnkSeguridad.Visible = true;
                }
            }
        }
        private void ColocarEnlacesInvisibles()
        {
            lnkCitas.Visible = false;
            lnkPacientes.Visible = false;
            lnkConsultaDoctor.Visible = false;
            lnkPacientesAtendidos.Visible = false;
            lnkSeguridad.Visible = false;
        }
    }
}