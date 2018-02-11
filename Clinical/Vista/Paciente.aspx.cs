using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Clinical
{
    public partial class Paciente : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarEstados();
                CargarAseguradora();
                CargarTipoSanguineo();
                if (Request.QueryString["Cedula"] != null)
                {
                    txtCedula.Text = Request.QueryString["Cedula"];
                    txtNombre.Text = Request.QueryString["Nombre"];
                }
            }
        }
        private void CargarAseguradora()

        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";

            strQuery = "select * From Aseguradora ORDER BY NombreAseguradora";

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlAseguradora.DataSource = cmd.ExecuteReader();
                    ddlAseguradora.DataTextField = "NombreAseguradora";
                    ddlAseguradora.DataValueField = "AseguradoraID";
                    ddlAseguradora.DataBind();
                    con.Close();
                }
            }
        }
        private void CargarTipoSanguineo()

        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";

            strQuery = "select * From TipoSangre ORDER BY TipoSangreID";

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlTipoSangre.DataSource = cmd.ExecuteReader();
                    ddlTipoSangre.DataTextField = "NombreTipoSangre";
                    ddlTipoSangre.DataValueField = "TipoSangreID";
                    ddlTipoSangre.DataBind();
                    con.Close();
                }
            }
        }
        private void CargarEstados()
        {
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "select * From Estado Order By NombreEstado";
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlEstado.DataSource = cmd.ExecuteReader();
                    ddlEstado.DataTextField = "NombreEstado";
                    ddlEstado.DataValueField = "EstadoID";
                    ddlEstado.DataBind();
                    con.Close();
                }
            }
        }

        [System.Web.Services.WebMethod]
        public static ArrayList CargarCiudades(int estadoID)
        {
            ArrayList list = new ArrayList();
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "select * from Ciudad where EstadoID=@estadoID";
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@estadoID", estadoID);
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader sdr = cmd.ExecuteReader();
                    while (sdr.Read())
                    {
                        list.Add(new ListItem(
                       sdr["NombreCiudad"].ToString(),
                       sdr["CiudadID"].ToString()
                        ));
                    }
                    con.Close();
                    return list;
                }
            }
        }
        private void PopulateDropDownList(ArrayList list, DropDownList ddl)
        {
            ddl.DataSource = list;
            ddl.DataTextField = "Text";
            ddl.DataValueField = "Value";
            ddl.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ProcesoIngregsarDatosPaciente();
        }
        private void ProcesoIngregsarDatosPaciente()
        {
            try
            {
                CPaciente objetoPaciente = new CPaciente();
                objetoPaciente.PacienteID = Convert.ToInt32(hdnPacienteID.Value);
                objetoPaciente.SexoPaciente = Convert.ToString(ddlGenero.SelectedItem);
                objetoPaciente.CedulaPaciente = Convert.ToInt32(txtCedula.Text);
                objetoPaciente.FechaNacimientoPaciente = txtFechaNacimiento.Text.ToString();
                objetoPaciente.NombrePaciente = txtNombre.Text.ToString().ToUpper();
                objetoPaciente.CelularPaciente = txtTelefono.Text.ToString();
                objetoPaciente.CiudadID = CodigoDeCiudad();
                objetoPaciente.DireccionPaciente = txtDireccion.Text.ToString().ToUpper();
                objetoPaciente.AseguradoraID = Convert.ToInt32(ddlAseguradora.SelectedValue);
                objetoPaciente.TipoSangreID = Convert.ToInt32(ddlTipoSangre.SelectedValue);
                if(Paciente.InsertarPaciente(objetoPaciente)> 0)
                {
                    if(hdnPacienteID.Value =="0")
                    {
                        messageBox.ShowMessage("Paciente ingresado correctamente.");
                    }
                    else
                    {
                        messageBox.ShowMessage("Paciente modificado correctamente.");
                    }
                    NuevoRegistro();
                }
            }
            catch (Exception ex)
            {

                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }
        private int CodigoDeCiudad()
        {
            int codigoCiudad = 0;
            string estado = Request.Form[ddlEstado.UniqueID];
            string ciudad = Request.Form[ddlCiudad.UniqueID];

            //VARIABLE PUBLICA INTERNA CON EL CONTENIDO DEL CODIGO DE LA CIUDAD SELECCIONADA EN EL COMBO
            codigoCiudad = Convert.ToInt32(ciudad);
            //*******************************************

            PopulateDropDownList(CargarCiudades(int.Parse(estado)), ddlCiudad);
            ListItem oListItem = ddlCiudad.Items.FindByValue(ciudad);
            if (oListItem != null)
            {
                //CARGA EL VALOR SELCCIONADO EN EL COMBO NUEVAMENTE DEBIDO A QUE AL ENVIARLO AL SERVIDOR SE PIERDE
                ddlCiudad.SelectedValue = oListItem.Value;
            }
            return codigoCiudad;
        }

        protected void btnCiudad_Click(object sender, EventArgs e)
        {
            string estado = Request.Form[ddlEstado.UniqueID];
            string ciudad = hdnCodigoCiudad.Value;

            PopulateDropDownList(CargarCiudades(int.Parse(estado)), ddlCiudad);
            ListItem oListItem = ddlCiudad.Items.FindByValue(ciudad);
            if (oListItem != null)
            {
                //CARGA EL VALOR SELCCIONADO EN EL COMBO NUEVAMENTE DEBIDO A QUE AL ENVIARLO AL SERVIDOR SE PIERDE
                ddlCiudad.SelectedValue = oListItem.Value;
            }
        }

        protected void btnNuevo_Click(object sender, EventArgs e)
        {

        }
        private void NuevoRegistro()
        {
            txtCedula.Text = "";
            txtFechaNacimiento.Text = "";
            txtNombre.Text = "";
            txtTelefono.Text = "";
            txtDireccion.Text = "";
            hdnCodigoCiudad.Value = "0";
            hdnPacienteID.Value = "0";
        }
    }
}