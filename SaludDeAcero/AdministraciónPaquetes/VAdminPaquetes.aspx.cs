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
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarPaquete_Click(object sender, EventArgs e)
        {
            this.popUpEditarPaquete.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = true;
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.popUpEditarPaquete.ShowOnPageLoad = false;
        }

        protected void btnModificarPaquete_Click(object sender, EventArgs e)
        {
            this.popUpEditarPaquete.ShowOnPageLoad = true;
            btnGuardar.Visible = false;
            btnActualizar.Visible = true;

        }
    }
}