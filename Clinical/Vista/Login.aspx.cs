﻿using Seguridad.Clases;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seguridad
{
    public partial class Index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            ProcesoLogin();
        }
        private void ProcesoLogin()
        {
            if (Convert.ToInt32(hdnCodigoUsuario.Value) == 0)
            {

                try
                {
                    DataSet ds = Login.ValidarLogin(txtLogin.Text, txtClave.Text);
                    DataTable dt = ds.Tables[0];
                    if (dt.Rows.Count == 0)
                    {
                        messageBox.ShowMessage("El usuario y/o la contraseña son incorrectos");
                    }
                    else
                    {
                        this.Session["UserId"] = dt.Rows[0]["SeguridadUsuarioDatosID"].ToString();
                        this.Session["UserName"] = dt.Rows[0]["LoginUsuario"].ToString();
                        this.Session["NombreCompletoUsuario"] = dt.Rows[0]["NombreCompleto"].ToString();
                        this.Session["ClaveUsuario"] = dt.Rows[0]["ClaveUsuario"].ToString();
                        this.Session["CodigoUsuario"] = dt.Rows[0]["SeguridadUsuarioDatosID"].ToString();
                        hdnCodigoUsuario.Value = dt.Rows[0]["SeguridadUsuarioDatosID"].ToString();
                        CargarEmpresa(Convert.ToInt32(dt.Rows[0]["SeguridadUsuarioDatosID"].ToString()));
                    }

                }
                catch (Exception ex)
                {
                    messageBox.ShowMessage(ex.Message);
                }
            }
            else
            {
                DataSet ds = Login.ValidarLogin(txtLogin.Text, txtClave.Text);
                DataTable dt = ds.Tables[0];
                if (dt.Rows.Count == 0)
                {
                    messageBox.ShowMessage("El usuario y/o la contraseña son incorrectos");
                }
                else
                {
                    this.Session["CodigoEmpresa"] = SeguridadUsuario.ObtenerCodigoEmpresa(Convert.ToInt32(ddlEmpresa.SelectedValue));
                    this.Session["CodigoSucursalEmpresa"] = ddlEmpresa.SelectedValue;
                    this.Session["NombreEmpresa"] = ddlEmpresa.SelectedItem;
                    this.Session["LogoEmpresa"] = LogoEmpresa(Convert.ToInt32(ddlEmpresa.SelectedValue));
                    Response.Redirect("/Vista/Principal.aspx");
                }

            }
        }
        private void CargarEmpresa(int codigoUsuario)
        {
            int codigoDeEmpresa = 0;
            CSeguridad objetoSeguridad = new CSeguridad();
            try
            {
                objetoSeguridad.SeguridadUsuarioDatosID = codigoUsuario;
                if (objetoSeguridad.EsUsuarioAdministrador() == true)
                {
                    EstablecerObjetos(true);
                    CargarComboEmpresas(0);
                }
                else
                {
                    if (CantidadEmpresasPorUsuario(codigoUsuario, false) < 1)
                    {
                        RestablecerVariables();
                        messageBox.ShowMessage("Este usuario no está configurado en el sistema.");
                    }
                    else if (CantidadEmpresasPorUsuario(codigoUsuario, false) == 1)
                    {
                        CargarComboEmpresas(codigoUsuario);
                        codigoDeEmpresa = CantidadEmpresasPorUsuario(codigoUsuario, true);
                        this.Session["CodigoEmpresa"] = SeguridadUsuario.ObtenerCodigoEmpresa(codigoDeEmpresa);
                        this.Session["CodigoSucursalEmpresa"] = codigoDeEmpresa;
                        this.Session["LogoEmpresa"] = LogoEmpresa(codigoDeEmpresa);
                        this.Session["NombreEmpresa"] = ddlEmpresa.SelectedItem;
                        Response.Redirect("/Vista/Principal.aspx");
                    }
                    else if (CantidadEmpresasPorUsuario(codigoUsuario, false) > 1)
                    {
                        EstablecerObjetos(true);
                        CargarComboEmpresas(codigoUsuario);
                    }
                }
            }
            catch (Exception ex)
            {
                messageBox.ShowMessage(ex.Message + ex.StackTrace);
            }
        }
        private int CantidadEmpresasPorUsuario(int codigoUsuario, bool esRetornoCodigoEmpresa)
        {
            int totalEncontrado = 0;
            int codigoEmpresa = 0;
            SqlDataReader dr = SeguridadUsuario.ObtenerEmpresas(codigoUsuario);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    codigoEmpresa = dr.GetInt32(3);
                    totalEncontrado = totalEncontrado + 1;
                }
            }
            dr.Close();
            if (esRetornoCodigoEmpresa == false)
            {
                return totalEncontrado;
            }
            else
            {
                return codigoEmpresa;
            }
        }
        private string LogoEmpresa(int codigoEmpresa)
        {
            string logo ="";
            SqlDataReader dr = SeguridadUsuario.ObtenerLogoEmpresa(codigoEmpresa);
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    logo = dr.GetString(1);
                }
            }
            dr.Close();
            return logo;
        }
        private void EstablecerObjetos(bool esVisible)
        {
            ddlEmpresa.Visible = esVisible;
            txtLogin.Enabled = false;
        }
        private void RestablecerVariables()
        {
            this.Session["UserId"] = "0";
            this.Session["UserName"] = "";
            this.Session["NombreCompletoUsuario"] = "";
            this.Session["ClaveUsuario"] = "";
            hdnCodigoUsuario.Value = "0";
        }
        private void CargarComboEmpresas(int codigoUsuario)
        {
            ddlEmpresa.Items.Clear();
            String strConnString = ConfigurationManager
            .ConnectionStrings["CallCenterConnectionString"].ConnectionString;
            String strQuery = "";

            //SI ES ADMINISTRADOR CARGA EL COMBO DE EMPRESAS CON TODAS
            if (codigoUsuario == 0)
            {
                strQuery = "select * From DetalleSucursalEmpresa ORDER BY NombreEmpresaSucursal";
            }
            else
            {
                strQuery = "select * From DetalleUsuarioEmpresa WHERE SeguridadUsuarioDatosID = " + codigoUsuario + " ORDER BY NombreEmpresaSucursal";
            }
            //********************************************************************************************************

            using (SqlConnection con = new SqlConnection(strConnString))
            {
                using (SqlCommand cmd = new SqlCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = strQuery;
                    cmd.Connection = con;
                    con.Open();
                    ddlEmpresa.DataSource = cmd.ExecuteReader();
                    ddlEmpresa.DataTextField = "NombreEmpresaSucursal";
                    ddlEmpresa.DataValueField = "ConsultorioID";
                    ddlEmpresa.DataBind();
                    con.Close();
                }
            }
        }
    }
}