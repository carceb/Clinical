﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace Clinical
{
    public partial class AtencionDoctor : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarDatosPaciente();
            }
        }
        private void CargarDatosPaciente()
        {
            DataSet ds = AtencionDoctor.ObtenerDatosPacienteConsulta(Convert.ToInt32(this.Session["CodigoSucursalEmpresa"].ToString()), DateTime.Now.ToString("dd/MM/yyyy"), Convert.ToInt32(Session["MedicoID"]));
            DataTable dt = ds.Tables[0];
            if (dt.Rows.Count > 0)
            {
                txtNombrePaciente.Text = dt.Rows[0]["NombrePaciente"].ToString();
                txtEdad.Text = dt.Rows[0]["Edad"].ToString();
                txtEstado.Text = dt.Rows[0]["NombreEstado"].ToString();
                txtCiudad.Text = dt.Rows[0]["NombreCiudad"].ToString();
                txtDireccion.Text = dt.Rows[0]["DireccionPaciente"].ToString();
                gridDetalle.DataSource = dt;
                gridDetalle.DataBind();
            }
            else
            {
                NuevoRegistro();
            }
        }
        private void NuevoRegistro()
        {
            txtNombrePaciente.Text = "";
            txtEdad.Text = "";
            txtCiudad.Text = "";
            gridDetalle.DataSource = null;
            gridDetalle.DataBind();
        }
        private void ProcesoActualizar()
        {
            try
            {
                int contadorRegistros = 0;
                List<CConsulta> objetoLista = new List<CConsulta>();
                string sResultado = ValidarDatos(ref objetoLista);
                foreach (CConsulta prod in objetoLista)
                {
                    contadorRegistros = contadorRegistros + 1;
                    AtencionDoctor.ActualizarConsulta(prod, Convert.ToInt32(Session["CitaID"]));
                    CargarDatosPaciente();

                }
                if (contadorRegistros > 0)
                {
                    messageBox.ShowMessage("Consulta actualizada.");
                    Response.Redirect("AtencionDoctorSeleccion.aspx");
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


        private string ValidarDatos(ref List<CConsulta> objetoAsignarEstatus)
        {
            try
            {
                string sResultado = "";
                CConsulta objetoConsulta = null;
                int j = 1;
                foreach (GridViewRow dr in this.gridDetalle.Rows)
                {
                    objetoConsulta = new CConsulta();
                    objetoConsulta.PacienteConsultaID = Utils.utils.ToInt(((TextBox)dr.FindControl("txtCitaID")).Text);
                    objetoConsulta.DescripcionTratamiento = Utils.utils.ToString(((TextBox)dr.FindControl("txtDescripcionTratamiento")).Text);
                    objetoConsulta.Medicamentos = Utils.utils.ToString(((TextBox)dr.FindControl("txtMedicamentos")).Text);
                    objetoConsulta.DescripcionEvolucionTratamiento = Utils.utils.ToString(((TextBox)dr.FindControl("txtEvolucion")).Text);
                    objetoConsulta.EstatusCitaID = 4;
                    if (objetoConsulta.EstatusCitaID == 0)
                        sResultado = "Estatus <br>";
                    objetoAsignarEstatus.Add(objetoConsulta);

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
        protected void gridDetalle_RowCommand(object sender, System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ProcesoActualizar();
            CargarDatosPaciente();
        }
    }
}