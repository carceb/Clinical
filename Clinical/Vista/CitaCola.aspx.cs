using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical
{
    public partial class CitaCola : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                txtFechaCita.Text = DateTime.Now.ToString("dd/MM/yyyy");
                CargarCitas();
            }
        }

        private void CargarCitas()
        {
            try
            {
                int codigoConsultorio = Convert.ToInt32(this.Session["CodigoSucursalEmpresa"].ToString());
                DataSet ds = CitaCola.ObtenerColaDeCitas(codigoConsultorio, txtFechaCita.Text);
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
                String citaID = e.CommandArgument.ToString();
                if (e.CommandName == "EliminarDetalle")
                {
                    CitaCola.EliminarCitaCola(Convert.ToInt32(citaID));
                    CargarCitas();
                }
            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }

        protected void btnGuardaLista_Click(object sender, EventArgs e)
        {
            ProcesoActualizar();
        }
        private void ProcesoActualizar()
        {
            try
            {
                int contadorRegistros = 0;
                List<CCita> objetoLista = new List<CCita>();
                string sResultado = ValidarDatos(ref objetoLista);
                foreach (CCita prod in objetoLista)
                {
                    contadorRegistros = contadorRegistros + 1;
                    CitaCola.ActuaizarEstatusCita(prod);
                    CargarCitas();

                }
                if (contadorRegistros > 0)
                {
                    messageBox.ShowMessage("Lista actualizada.");
                }
                else
                {
                    messageBox.ShowMessage("No existen registros por actualizar");
                }

            }
            catch (Exception ex)
            {
                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }


        private string ValidarDatos(ref List<CCita> objetoAsignarEstatus)
        {
            try
            {
                string sResultado = "";
                CCita objetoAsignaEstatus = null;
                int j = 1;
                foreach (GridViewRow dr in this.gridDetalle.Rows)
                {
                    objetoAsignaEstatus = new CCita();
                    objetoAsignaEstatus.EstatusCitaID = Utils.utils.ToInt(((DropDownList)dr.FindControl("ddlEstatus")).SelectedValue);
                    objetoAsignaEstatus.CitaID = Utils.utils.ToInt(((TextBox)dr.FindControl("txtCitaID")).Text);
                    objetoAsignaEstatus.DescripcionPadecimiento = Utils.utils.ToString(((TextBox)dr.FindControl("txtDescripcionPadecimiento")).Text);
                    objetoAsignaEstatus.MedicoConsultorioID = Utils.utils.ToInt(((TextBox)dr.FindControl("txtMedicoConsultorioID")).Text);
                    if (objetoAsignaEstatus.EstatusCitaID == 0)
                        sResultado = "Estatus <br>";
                    objetoAsignarEstatus.Add(objetoAsignaEstatus);

                    if (sResultado != "")
                    {
                        sResultado = "En la Fila " + j.ToString() + " faltan ingresar los siguientes datos:<br><br>" + sResultado;
                        break;
                    }
                    j++;
                }

                return sResultado;
            }
            catch (Exception ex)
            {
                messageBox.ShowMessage(ex.Message + ex.StackTrace);
                return "";
            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            CargarCitas();
        }
    }
}