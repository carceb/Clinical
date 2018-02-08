using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace Clinical
{
    public partial class Medicos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ddlGenero.Focus();
                CargarEspecialidad();
            }
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ProcesoActulizacion();
            
        }

        private void CargarEspecialidad()

        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";

            strQuery = "select * From EspecialidadMedica ORDER BY NombreEspecialidadMedica";

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlEspecialidad.DataSource = cmd.ExecuteReader();
                    ddlEspecialidad.DataTextField = "NombreEspecialidadMedica";
                    ddlEspecialidad.DataValueField = "EspecialidadMedicaID";
                    ddlEspecialidad.DataBind();
                    con.Close();
                }
            }
        }

        private void ProcesoActulizacion()
        {
            try
            {
                CMedicos objetoMedicos = new CMedicos();
                objetoMedicos.MedicoID = Convert.ToInt32(hdnMedicoID.Value);
                objetoMedicos.SexoMedico = ddlGenero.SelectedItem.ToString();
                objetoMedicos.CedulaMedico = Convert.ToInt32(txtCedula.Text);
                objetoMedicos.NombreMedico = txtNombre.Text.ToUpper();
                objetoMedicos.RIFMedico = txtRIF.Text.ToUpper();
                objetoMedicos.MSAS = txtMSAS.Text.ToUpper();
                objetoMedicos.ColegioMedico = txtColegio.Text.ToUpper();
                objetoMedicos.EspecialidadMedicaID = Convert.ToInt32(ddlEspecialidad.SelectedValue);
                objetoMedicos.DescripcionEspecialidad = txtDescripcion.Text.ToUpper();
                objetoMedicos.CelularMedico = txtTelefonos.Text.ToUpper();
                objetoMedicos.EmailMedico = txtEmail.Text;

                if (hdnMedicoID.Value == "0")
                {
                    if (Medicos.InsertarMedico(objetoMedicos) > 0)
                    {
                        messageBox.ShowMessage("Registro insertado");
                    }
                }
                else
                {
                    if (Medicos.ActualizarMedico(objetoMedicos) > 0)
                    {
                        messageBox.ShowMessage("Registro modificado");
                    }
                }

            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {
            NuevoRegistro();
        }
        private void NuevoRegistro()
        {
            txtCedula.Text = "";
            txtNombre.Text = "";
            txtRIF.Text = "";
            txtMSAS.Text = "";
            txtColegio.Text = "";
            txtDescripcion.Text = "";
            txtTelefonos.Text = "";
            txtEmail.Text = "";
            hdnMedicoID.Value = "0";
            ddlGenero.Focus();
        }
    }
}