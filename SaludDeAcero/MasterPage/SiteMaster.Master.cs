/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 25.09.2015
'' Descripcion General: Valida el Inicio de Session
'' =============================================*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SaludDeAcero.MasterPage
{
    public partial class SiteMaster : System.Web.UI.MasterPage
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
            else
            {
                lblUsuario.Text = Session["Nombre"].ToString();
            }
            
        }

        /// <summary>
        /// Cierra la Sesion del sistema
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnCerrarSession_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            Response.Redirect("~/Login.aspx");
            Session["Usuario"] = null;
        }

        /// <summary>
        /// Muestra el POPOUT Acerca de
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkAcercade_Click(object sender, EventArgs e)
        {
            //this.popUpInformacion.ShowOnPageLoad = true;
        }
    }
}