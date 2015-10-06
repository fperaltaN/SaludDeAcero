/*''=============================================
'' Autor:	Gilberto Adame
'' Modificado por: Faleg A. Peralta
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: Valida el Inicio de Session
'' =============================================*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sisa
{
    public partial class DiseñoPaqueta : System.Web.UI.Page
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
        }

        /// <summary>
        /// Evento que muestra el Dialog para dar de alta el Paquete
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAgregarPaquete_Click(object sender, EventArgs e)
        {
            this.popUpEditarPaquete.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = true;
            btnEliminarCambios.Visible = false;
        }

        /// <summary>
        /// Evento que muestra el Dialog para cancelar las acciones
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.popUpEditarPaquete.ShowOnPageLoad = false;
        }

        /// <summary>
        /// Evento que muestra el Dialog para Actualizar el Paquete
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnModificarPaquete_Click(object sender, EventArgs e)
        {
            this.popUpEditarPaquete.ShowOnPageLoad = true;
            btnGuardar.Visible = false;
            btnActualizar.Visible = true;
            btnEliminarCambios.Visible = false;
        }

        /// <summary>
        /// Evento que muestra el Dialog para dar de alta los servicios
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnctrlServicios_Click(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento que muestra el Dialog para Eliminar el Paquete
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarPaquete_Click(object sender, EventArgs e)
        {
            this.popUpEditarPaquete.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = false;
            btnEliminarCambios.Visible = true;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnActualizar_Click(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Cancela la Eliminación del Paquete
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelarEliminar_Click(object sender, EventArgs e)
        {
            
        }
        
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarCambios_Click(object sender, EventArgs e)
        {

        }
    }
}