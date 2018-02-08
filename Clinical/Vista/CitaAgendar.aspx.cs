using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;

namespace Clinical
{
    public partial class CitaAgendar : System.Web.UI.Page
    {
        int medicoCalendarioConsultorioID = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["medicoConsultorioID"] != null)
                {
                    txtFechaCita.Enabled = true;
                    medicoCalendarioConsultorioID = Convert.ToInt32(Request.QueryString["medicoConsultorioID"]);
                    CargarMensajeCitaSeleccionada();
                    CargarMotivoCIta();
                }
            }
            
        }
        private void CargarMensajeCitaSeleccionada()
        {
            try
            {
                SqlDataReader dr = CitaAgendar.ObtenerVisitas(medicoCalendarioConsultorioID);
                if (dr.HasRows)
                {
                     while (dr.Read())
                    {
                        string minutosSeleccion ="00";
                        if (dr.GetInt32(6) == 0)
                        {
                            minutosSeleccion = "00";
                        }
                        else
                        {
                            minutosSeleccion = Convert.ToString(dr.GetInt32(6));
                        }
                        string mensajeSeleccion = "Usted seleccionó al Dr. " + dr.GetString(1) +  " (" + dr.GetString(2) + ") para agendar una cita en su consultorio en la ciudad de " + dr.GetString(3) + " en el turno del día " + dr.GetString(4) + " hora inicial " + dr.GetInt32(5) + ":" + minutosSeleccion + ":" + dr.GetString(7) +", orden de llegada, dirección " + dr.GetString(8);
                        lblTitulo.Text = mensajeSeleccion;
                        hdnCodigoMedicoConsultorio.Value = dr.GetInt32(9).ToString();
                        EstablecerFechaCita(dr.GetString(4));
                    }
                }
            }
            catch (Exception ex)
            {
                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }
        private void EstablecerFechaCita(string diaCitaSeleccion)
        {
            CultureInfo ci = new CultureInfo("Es-Es");
            string diaActual = ci.DateTimeFormat.GetDayName(DateTime.Now.DayOfWeek).ToUpper();
            diaActual = diaActual.Replace("É", "E");
            diaActual = diaActual.Replace("Á", "A");
            string fechaCita;
            if(diaCitaSeleccion != diaActual)
            {
                for(int i = 1; i<= 7; i++)
                {
                    fechaCita = ci.DateTimeFormat.GetDayName(System.DateTime.Now.AddDays(i).DayOfWeek).ToUpper();
                    fechaCita = fechaCita.Replace("É", "E");
                    fechaCita = fechaCita.Replace("Á", "A");
                    if (fechaCita == diaCitaSeleccion)
                    {
                        DateTime dt = System.DateTime.Now.AddDays(i);
                        string fechaConvertida = dt.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
                        hdnFechaCita.Value = fechaConvertida;
                        txtFechaCita.Text = fechaConvertida +  " (" + diaCitaSeleccion +")";
                        hdnDiaCita.Value = diaCitaSeleccion;
                        txtFechaCita.Enabled = false;
                        txtCedula.Focus();
                        break;
                    }
                }
            }
            else
            {
                DateTime dt = System.DateTime.Now;
                string fechaConvertida = dt.ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
                hdnFechaCita.Value = fechaConvertida;
                txtFechaCita.Text = fechaConvertida + " (" + diaCitaSeleccion + ")";
                hdnDiaCita.Value = diaCitaSeleccion;
                txtFechaCita.Enabled = false;
                txtCedula.Focus();
            }
        }

        private void CargarMotivoCIta()
        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";
            strQuery = "select * From CitaMotivo";

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlMotivo.DataSource = cmd.ExecuteReader();
                    ddlMotivo.DataTextField = "NombreCitaMotivo";
                    ddlMotivo.DataValueField = "CitaMotivoID";
                    ddlMotivo.DataBind();
                    con.Close();
                }
            }
        }
        protected void btnAgendarCita_Click(object sender, EventArgs e)
        {
            ProcesoCita();
        }
        private void ProcesoCita()
        {
            if (EsTodoCorrecto() == true)
            {
                try
                {

                    CCita objetoCita = new CCita();
                    objetoCita.FechaCita = hdnFechaCita.Value;
                    objetoCita.CedulaPacienteCita = txtCedula.Text;
                    objetoCita.NombrePacienteCita = txtNombre.Text.ToUpper();
                    objetoCita.CelularPacienteCita = txtCelular.Text;
                    objetoCita.EmailPacienteCita = txtEmail.Text.ToUpper();
                    objetoCita.MedicoConsultorioID = Convert.ToInt32(hdnCodigoMedicoConsultorio.Value);
                    objetoCita.CitaMotivoID = Convert.ToInt32(ddlMotivo.SelectedValue);
                    if (CitaAgendar.InsertarCita(objetoCita) > 0)
                    {
                        string citaCreada = "Cita creada exitosamente para la fecha " + txtFechaCita.Text;
                        Response.Redirect("CitaResultado.aspx?citaCreada=" + citaCreada);
                    }
                }
                catch (Exception ex)
                {

                    messageBox.ShowMessage(ex.Message + ex.StackTrace);
                }
            }
       }
        private bool EsTodoCorrecto()
        {
            bool resultado = true;
            if (CitaAgendar.EsCitaAgendada(Convert.ToInt32(txtCedula.Text)) == true)
            {
                resultado = false;
                messageBox.ShowMessage("Ya tiene una cita creada para este día.");

            }
            if (CitaAgendar.EsHoraIncorrecta(Convert.ToInt32(hdnCodigoMedicoConsultorio.Value), hdnDiaCita.Value) == true)
            {
                resultado = false;
                messageBox.ShowMessage("Ya finalizaron las citas en esta hora y este día.");

            }
            if (CitaAgendar.EsNumeroMaximoCitas(Convert.ToInt32(hdnCodigoMedicoConsultorio.Value), hdnDiaCita.Value, hdnFechaCita.Value) == true)
            {
                resultado = false;
                messageBox.ShowMessage("Este cons.");

            }
            return resultado;
        }
    }
}