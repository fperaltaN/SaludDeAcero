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
using CapaNegocio;
using System.Data;

namespace SaludDeAcero
{
    public partial class login : System.Web.UI.Page
    {
        /// <summary>
        /// Evento de la Página cuando se termina de carga, este evento se genera por default
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Page_Load(object sender, EventArgs e)
        {
            //doc.Attributes["src"] = "Galeria.html";
        }

        /// <summary>
        /// Valida el Inicio de Session y Redirecciona a la página default
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnIniciarSession_Click(object sender, EventArgs e)
        {
            N_Login obj = new N_Login();
            int acceso = obj.entrar(txtUser.Text, txtPass.Text);
            if (acceso == 1)
            {
                DataSet datos = new DataSet();
                datos = obj.getData(txtUser.Text, txtPass.Text);
                DataTable dt = datos.Tables[0];
                foreach (DataRow row in dt.Rows)
                {
                    string name = Convert.ToString(row["NOMBRE"]);
                    string app = Convert.ToString(row["APELLIDO_PAT"]);
                    string nombre = name + " " + app;
                    Session["Nombre"] = nombre;
                    Session["Perfil"] = Convert.ToString(row["ID_PERFIL"]);                    
                    Session["Usuario"] = Convert.ToString(row["USUARIO"]);
                    Session["Id_Usuario"] = Convert.ToInt32(row["ID_USUARIO"]);
                }
                Response.Redirect("~/MasterPage/default.aspx");

            }
            else
            {
                string mensaje = "<script language='javascript' type='text/javascript'>" +
                                  " alert('Error al iniciar sesion. Verifica Usuario y/o Contraseña');</script> ";
                Page.ClientScript.RegisterStartupScript(typeof(Page), "PopupScript", mensaje);
                txtUser.Text = "";
                txtPass.Text = "";
            }
        }
    }
}