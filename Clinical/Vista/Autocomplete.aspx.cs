using System;
using System.Data;



namespace Admin
{
    public partial class Autocomplete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["query"] != "")
            {

                if (Request.QueryString["identifier"] == "Medicos")
                {
                    DataSet ds = Autocomplete.ObtenerMedicos(Request.QueryString["query"],false);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Write("<ul>" + "\n");
                        paginaBase.AutoCompleteResult item;
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            item = new paginaBase.AutoCompleteResult();
                            item.value = dr["NombreMedico"].ToString();
                            item.id = dr["MedicoID"].ToString();
                            item.value = item.value.Replace(Request.QueryString["query"].ToString(), "<span style='font-weight:bold;'>" + Request.QueryString["query"].ToString() + "</span>");
                            Response.Write("\t" + "<li id=autocomplete_" + item.id + " rel='" + item.id + "_" + dr["NombreMedico"].ToString() + "_" + dr["MedicoID"].ToString() + "_" + dr["SexoMedico"].ToString() + "_" + dr["RIFMedico"].ToString() + "_" + dr["MSAS"].ToString() + "_" + dr["ColegioMedico"].ToString() + "_" + dr["EspecialidadMedicaID"].ToString() + "_" + dr["DescripcionEspecialidad"].ToString() + "_" + dr["CelularMedico"].ToString() + "_" + dr["EmailMedico"].ToString() + "_" + dr["CedulaMedico"].ToString() + "'>" + item.value + "</li>" + "\n");
                        }
                        Response.Write("</ul>");
                        Response.End();
                    }
                }
                if (Request.QueryString["identifier"] == "MedicosNombre")
                {
                    DataSet ds = Autocomplete.ObtenerMedicos(Request.QueryString["query"], true);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Write("<ul>" + "\n");
                        paginaBase.AutoCompleteResult item;
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            item = new paginaBase.AutoCompleteResult();
                            item.value = dr["NombreMedico"].ToString();
                            item.id = dr["MedicoID"].ToString();
                            item.value = item.value.Replace(Request.QueryString["query"].ToString(), "<span style='font-weight:bold;'>" + Request.QueryString["query"].ToString() + "</span>");
                            Response.Write("\t" + "<li id=autocomplete_" + item.id + " rel='" + item.id + "_" + dr["NombreMedico"].ToString() + "_" + dr["MedicoID"].ToString() + "_" + dr["SexoMedico"].ToString() + "_" + dr["RIFMedico"].ToString() + "_" + dr["MSAS"].ToString() + "_" + dr["ColegioMedico"].ToString() + "_" + dr["EspecialidadMedicaID"].ToString() + "_" + dr["DescripcionEspecialidad"].ToString() + "_" + dr["CelularMedico"].ToString() + "_" + dr["EmailMedico"].ToString() + "_" + dr["CedulaMedico"].ToString() + "'>" + item.value + "</li>" + "\n");
                        }
                        Response.Write("</ul>");
                        Response.End();
                    }
                }
                if (Request.QueryString["identifier"] == "Consultorios")
                {
                    DataSet ds = Autocomplete.ObtenerConsultorios(Request.QueryString["query"]);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Write("<ul>" + "\n");
                        paginaBase.AutoCompleteResult item;
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            item = new paginaBase.AutoCompleteResult();
                            item.value = dr["NombreConsultorio"].ToString();
                            item.id = dr["ConsultorioID"].ToString();
                            item.value = item.value.Replace(Request.QueryString["query"].ToString(), "<span style='font-weight:bold;'>" + Request.QueryString["query"].ToString() + "</span>");
                            Response.Write("\t" + "<li id=autocomplete_" + item.id + " rel='" + item.id + "_" + dr["NombreConsultorio"].ToString() + "_" + dr["ConsultorioID"].ToString() + "_" + dr["RIFConsultorio"].ToString() + "_" + dr["DireccionConsultorio"].ToString() + "_" + dr["TelefonoConsultorio"].ToString() + "_" + dr["EmailConsultorio"].ToString() + "_" + dr["EstadoID"].ToString() + "_" + dr["CiudadID"].ToString() + "'>" + item.value + "</li>" + "\n");
                        }
                        Response.Write("</ul>");
                        Response.End();
                    }
                }
                if (Request.QueryString["identifier"] == "ConsultoriosMedicos")
                {
                    DataSet ds = Autocomplete.ObtenerMedicoConsultorios(Request.QueryString["query"]);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Write("<ul>" + "\n");
                        paginaBase.AutoCompleteResult item;
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            item = new paginaBase.AutoCompleteResult();
                            item.value = dr["DatosLargos"].ToString();
                            item.id = dr["ConsultorioID"].ToString();
                            item.value = item.value.Replace(Request.QueryString["query"].ToString(), "<span style='font-weight:bold;'>" + Request.QueryString["query"].ToString() + "</span>");
                            Response.Write("\t" + "<li id=autocomplete_" + item.id + " rel='" + item.id + "_" + dr["NombreConsultorio"].ToString() + "_" + dr["ConsultorioID"].ToString() + "_" + dr["MedicoConsultorioID"].ToString() + "_" + dr["DireccionConsultorio"].ToString() + "_" + dr["TelefonoConsultorio"].ToString() + "_" + dr["EmailConsultorio"].ToString() + "_" + dr["EstadoID"].ToString() + "_" + dr["CiudadID"].ToString() + "'>" + item.value + "</li>" + "\n");
                        }
                        Response.Write("</ul>");
                        Response.End();
                    }
                }
                if (Request.QueryString["identifier"] == "Usuarios")
                {
                    DataSet ds = Autocomplete.ObtenerUsuarios(Request.QueryString["query"]);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Write("<ul>" + "\n");
                        paginaBase.AutoCompleteResult item;
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            item = new paginaBase.AutoCompleteResult();
                            item.value = dr["NombreCompleto"].ToString();
                            item.id = dr["SeguridadUsuarioDatosID"].ToString();
                            item.value = item.value.Replace(Request.QueryString["query"].ToString(), "<span style='font-weight:bold;'>" + Request.QueryString["query"].ToString() + "</span>");
                            Response.Write("\t" + "<li id=autocomplete_" + item.id + " rel='" + item.id + "_" + dr["NombreCompleto"].ToString() + "_" + dr["LoginUsuario"].ToString() + "_" + dr["ClaveUsuario"].ToString() + "_" + dr["DescripcionUsuario"].ToString() + "_" + dr["SeguridadGrupoID"].ToString() + "_" + dr["UsuarioTecnico"].ToString()  + "_" + dr["EstatusUsuario"].ToString() + "'>" + item.value + "</li>" + "\n");
                        }
                        Response.Write("</ul>");
                        Response.End();
                    }
                }
                if (Request.QueryString["identifier"] == "Grupos")
                {
                    DataSet ds = Autocomplete.ObtenerGrupos(Request.QueryString["query"]);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Write("<ul>" + "\n");
                        paginaBase.AutoCompleteResult item;
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            item = new paginaBase.AutoCompleteResult();
                            item.value = dr["NombreGrupo"].ToString();
                            item.id = dr["SeguridadGrupoID"].ToString();
                            item.value = item.value.Replace(Request.QueryString["query"].ToString(), "<span style='font-weight:bold;'>" + Request.QueryString["query"].ToString() + "</span>");
                            Response.Write("\t" + "<li id=autocomplete_" + item.id + " rel='" + item.id + "_" + dr["NombreGrupo"].ToString() + "_" + dr["DescripcionGrupo"].ToString() + "_" + dr["SeguridadGrupoID"].ToString() + "'>" + item.value + "</li>" + "\n");
                        }
                        Response.Write("</ul>");
                        Response.End();
                    }
                }
                if (Request.QueryString["identifier"] == "Objetos")
                {
                    DataSet ds = Autocomplete.ObtenerObjetos(Request.QueryString["query"]);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        Response.Write("<ul>" + "\n");
                        paginaBase.AutoCompleteResult item;
                        foreach (DataRow dr in ds.Tables[0].Rows)
                        {
                            item = new paginaBase.AutoCompleteResult();
                            item.value = dr["NombreObjeto"].ToString();
                            item.id = dr["SeguridadObjetoID"].ToString();
                            item.value = item.value.Replace(Request.QueryString["query"].ToString(), "<span style='font-weight:bold;'>" + Request.QueryString["query"].ToString() + "</span>");
                            Response.Write("\t" + "<li id=autocomplete_" + item.id + " rel='" + item.id + "_" + dr["NombreObjeto"].ToString() + "_" + dr["SeguridadObjetoID"].ToString() +  "'>" + item.value + "</li>" + "\n");
                        }
                        Response.Write("</ul>");
                        Response.End();
                    }
                }

            }
        }
    }
}