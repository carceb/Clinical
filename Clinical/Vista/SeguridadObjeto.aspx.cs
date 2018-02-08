﻿using Seguridad.Clases;
using System;


namespace Seguridad
{
    public partial class SeguridadObjeto : Admin.paginaBase
    {
        protected new void Page_Load(object sender, EventArgs e)
        {

        }
        private void ActualizarRegistros()
        {
            try
            {
                CSeguridad objetoSeguridad = new CSeguridad();
                objetoSeguridad.SeguridadObjetoID = Convert.ToInt32(this.hdnSeguridadObjetoID.Value);
                objetoSeguridad.NombreObjeto = this.txtNombre.Text.ToUpper();
                if (SeguridadObjeto.InsertarObjeto(objetoSeguridad) > 0)
                {
                    messageBox.ShowMessage("El objeto se ingresó correctamente");
                    LimpiarPantalla();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        private void LimpiarPantalla()
        {
            this.txtNombre.Text = "";
            this.hdnSeguridadObjetoID.Value = "0";
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            ActualizarRegistros();
        }
    }
}