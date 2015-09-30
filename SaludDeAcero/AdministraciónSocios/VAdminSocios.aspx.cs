﻿/*''=============================================
'' Autor:	Luis Lazaro
'' Modificado por: Faleg A. Peralta
'' Fecha de Modificación: 25.09.2015
'' Descripcion General: Valida el Inicio de Session
'' =============================================*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaludDeAcero.AdministraciónSocios
{
    public partial class VAdminSocios : System.Web.UI.Page
    {
        /// <summary>
        /// Evento de la Página cuando se termina de carga, este evento se genera por default
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AddHeader("Refresh", Convert.ToString((Session.Timeout * 60) + 5));

            if (Session["Usuario"] == null)
            {
                Session.Abandon();
                Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                Response.Redirect("~/Login.aspx");
            }

            //if (!IsPostBack)
            //{
            //    llenaGrid(1);
            //}
        }

        /// <summary>
        /// Este evento sirve para recargar el paginado del Grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdEmpleados_Load(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Este evento controla el boton editar del Grid, al dar clic automaticamente se selecciona la columna y obtenemos el id a modificar
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdEmpleados_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            object id = e.KeyValue;
            LinkButton opLinkButton = (LinkButton)e.CommandSource;

            if (opLinkButton.Text == "Editar")
            {
                //txtFolioRep.Text = dsInfoSolicitud.Tables[0].Rows[0]["FOLIO_REPORTE"].ToString();
            }
        }

        /// <summary>
        /// Evento que muestra el Dialog para dar de alta el Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAgregarSocio_Click(object sender, EventArgs e)
        {
            this.popUpEditarRep.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = true;
        }

        /// <summary>
        /// Evento que cierra el Dialog
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.popUpEditarRep.ShowOnPageLoad = false;
        }

        protected void btnModificarSocio_Click(object sender, EventArgs e)
        {
            this.popUpEditarRep.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = true;
        }
    }
}