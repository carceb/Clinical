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
                hdnConsultorioID.Value = this.Session["CodigoSucursalEmpresa"].ToString();
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
                    }
                    CargarCitas();
                if (contadorRegistros > 0)
                    {
                        messageBox.ShowMessage("Lista actualizada.");
                    }
                    else
                    {
                        messageBox.ShowMessage(sResultado);
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
                int totalEnAtencion = 0;
                string nombreMedico = "";
                string estatusPaciente = "";
                string sResultado = "";
                CCita objetoAsignaEstatus = null;
                
                int j = 1;
                foreach (GridViewRow dr in this.gridDetalle.Rows)
                {
                    objetoAsignaEstatus = new CCita();
                    objetoAsignaEstatus.EstatusCitaID = Utils.utils.ToInt(((DropDownList)dr.FindControl("ddlEstatus")).SelectedValue);
                    objetoAsignaEstatus.CitaID = Utils.utils.ToInt(((TextBox)dr.FindControl("txtCitaID")).Text);
                    objetoAsignaEstatus.DescripcionPadecimiento = Utils.utils.ToString(((TextBox)dr.FindControl("txtDescripcionPadecimiento")).Text);
                    objetoAsignaEstatus.FechaCita = txtFechaCita.Text.ToString();
                    objetoAsignaEstatus.CedulaPacienteCita = Utils.utils.ToString(((Label)dr.FindControl("lblCedula")).Text);
                    objetoAsignaEstatus.MedicoConsultorioID = Utils.utils.ToInt(((DropDownList)dr.FindControl("ddlMedico")).SelectedValue);
                    estatusPaciente = Utils.utils.ToString(((LinkButton)dr.FindControl("lnkEstadoHistoria")).Text);
                    objetoAsignaEstatus.OrdenDeLLegada = Utils.utils.ToInt(((TextBox)dr.FindControl("txtOrdenLLegada")).Text);
                    if (objetoAsignaEstatus.EstatusCitaID == 3)
                    {
                        if (estatusPaciente == "[PACIENTE SIN HISTORIA MEDICA]")
                        {
                            sResultado = "No puede enviar a atención a un paciente sin historia médica.";
                            objetoAsignarEstatus.Clear();
                            break;
                        }
                        else
                        {
                            dr.FindControl("lnkEstadoHistoria").Visible = false;
                        }
                    }
                    if (estatusPaciente != "[PACIENTE SIN HISTORIA MEDICA]")
                    {
                        dr.FindControl("lnkEstadoHistoria").Visible = false;
                    }
                    if (objetoAsignaEstatus.EstatusCitaID == 3)
                    {
                        if (nombreMedico == "")
                        {
                            nombreMedico = Utils.utils.ToString(((DropDownList)dr.FindControl("ddlMedico")).SelectedItem);
                        }
                        totalEnAtencion += 1;
                    }
                    if (totalEnAtencion > 1)
                    {
                        if (nombreMedico == Utils.utils.ToString(((DropDownList)dr.FindControl("ddlMedico")).SelectedItem))
                        {
                            sResultado = "Solo puede enviar a la atención médica a un paciente a la vez.";
                            return sResultado;
                        }
                    }
                    if (Utils.utils.ToString(((TextBox)dr.FindControl("txtOrdenLLegada")).Text) =="")
                    {
                        sResultado = "Debe colocar el orden de llegada.";
                        return sResultado;
                    }


                    objetoAsignarEstatus.Add(objetoAsignaEstatus);
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