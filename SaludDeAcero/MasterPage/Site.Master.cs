using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
namespace CLINI_MEX.MasterPage
{
    public partial class Site : System.Web.UI.MasterPage
    {
        DataSet datos;
        DataSet modulos;
        DataTable dtD;
        DataTable dtM;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                lblNameUser.Text = Session["Nombre"].ToString();
                lblAreaUser.Text = Session["Area"].ToString();
                lblFechaUser.Text = DateTime.Now.ToString("d");
                cerrar.Visible = true;
                ///N_Menu obj = new N_Menu();
                datos = new DataSet();
                //datos = obj.getData(Convert.ToInt32(Session["Perfil"]));
                //modulos = obj.getModulos();
                dtD = datos.Tables[0]; dtM = modulos.Tables[0];
                
                foreach (DataRow mod in dtM.Rows)
                {
                    int modulo = Convert.ToInt32(mod["ID_MODULO"]);

                    DataRow [] rows = dtD.Select("ID_MODULO = " + modulo);
                    int valor = rows.Count();
                    if (valor <= 0)
                    {
                        menuGral.Items[modulo].ClientVisible = false;
                    }
                }
                menuGral.Visible = true;
            }
        }

        protected void cerrar_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            Response.Redirect("~/Login.aspx");
            
        }
    }
}