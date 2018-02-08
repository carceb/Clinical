using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Clinical
{
    public partial class Cita : System.Web.UI.Page
    {
        //VARIBLE PUBLICA PARA CREAR EL EVENTO ROW COMMAND EN EL GRID HIJO
        GridView gridViewOrders;
        //****************************************************************

        private int codigoCiudad = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                if (Request.QueryString["citaCreada"] != null)
                {
                    lblCitaAgendada.Text = Request.QueryString["citaCreada"];
                }
                codigoCiudad = 0;
                this.CargarEstados();
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
        protected void btnBuscarPorEstado_Click(object sender, EventArgs e)
        {
            string estado = Request.Form[ddlEstado.UniqueID];
            string ciudad = Request.Form[ddlCiudad.UniqueID];

            PopulateDropDownList(CargarCiudades(int.Parse(estado)), ddlCiudad);
            ListItem oListItem = ddlCiudad.Items.FindByValue(ciudad);
            gvCustomers.DataSource = GetData("SELECT * FROM DetalleMedicos WHERE EstadoID = " + estado);
            gvCustomers.DataBind();
            lblExplica.Visible = true;
            if (oListItem != null)
            {
                ddlCiudad.SelectedValue = oListItem.Value;
            }

        }
        protected void btnBuscarPorCiudad_Click(object sender, EventArgs e)
        {
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
                //***********************************************************************************************

                //CARGA EL GRID ANIDADO FILTRANDO SIEMPRE POR TODOS LOS MEDICOS
                gvCustomers.DataSource = GetData("SELECT * FROM DetalleMedicos WHERE EstadoID = " + estado);
                gvCustomers.DataBind();
                //***********************************************************************************************
            }
            codigoCiudad = 0;
        }
        //FUNCIONES PARA EL MANEJO DE GRID ANIDADO (CARGA EL GRID PADRE)
        private static DataTable GetData(string query)
        {
            string strConnString = ConfigurationManager.ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandText = query;
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataSet ds = new DataSet())
                        {
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }
        //***********************************************************************************************

        //FUNCIONES PARA EL MANEJO DE GRID ANIDADO (CARGA EL GRID HIJO)
        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string medicoID = gvCustomers.DataKeys[e.Row.RowIndex].Value.ToString();
                GridView gvOrders = e.Row.FindControl("gvOrders") as GridView;
                gridViewOrders = e.Row.FindControl("gvOrders") as GridView;
                if (codigoCiudad == 0)
                {
                    gvOrders.DataSource = GetData("select * from DetalleCalendarioConsultorio where MedicoID= " + medicoID);
                }
                else
                {
                    gvOrders.DataSource = GetData("select * from DetalleCalendarioConsultorio where MedicoID= " + medicoID + " AND CiudadID = " + codigoCiudad);
                }
                gvOrders.DataBind();
            }
        }
        //***********************************************************************************************

        //CREAR EVENTO ROWN COMMAND PARA EL GRID ANIDADO HIJO
        protected void gvCustomers_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                gridViewOrders = e.Row.FindControl("gvOrders") as GridView;
                gridViewOrders.RowCommand += new GridViewCommandEventHandler(gvOrders_RowCommand);
            }
        }
        protected void gvOrders_RowCommand(Object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "AgendarCita")
            {
                String medicoConsultorioID = e.CommandArgument.ToString();
                Response.Redirect("CitaAgendar.aspx?medicoConsultorioID=" + medicoConsultorioID);
            }
        }
        //***********************************************************************************************
    }
}