using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sisa
{
    public partial class AdministracionUsuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAgregarEmpleado_Click(object sender, EventArgs e)
        {
          this.popUpEditarEmpleado.ShowOnPageLoad = true;
          btnActualizar.Visible = false;
          btnGuardar.Visible = true;
        }
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.popUpEditarEmpleado.ShowOnPageLoad = false;
        }

        protected void btnModificarEmplaedo_Click(object sender, EventArgs e)
        {
            this.popUpEditarEmpleado.ShowOnPageLoad = true;
            btnGuardar.Visible = false;
            btnActualizar.Visible = true;
        }

        

       


    }
}