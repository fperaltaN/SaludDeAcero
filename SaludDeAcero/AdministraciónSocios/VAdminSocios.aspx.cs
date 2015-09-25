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
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.AddHeader("Refresh", Convert.ToString((Session.Timeout * 60) + 5));

            //if (Session["Usuario"] == null)
            //{
            //    Session.Abandon();
            //    Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
            //    Response.Redirect("~/Login.aspx");
            //}

            //if (!IsPostBack)
            //{
            //    llenaGrid(1);
            //}
        }

        protected void grdEmpleados_Load(object sender, EventArgs e)
        {

        }

        protected void grdEmpleados_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {

        }

        protected void btnAgregarSocio_Click(object sender, EventArgs e)
        {
            this.popUpEditarRep.ShowOnPageLoad = true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.popUpEditarRep.ShowOnPageLoad = false;
        }
    }
}