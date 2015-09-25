using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CapaNegocio.NegocioCatalogos;
using System.Data;

namespace SaludDeAcero.AdministraciónSocios
{
    public partial class VAdminSocio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            N_Empleados obj = new N_Empleados();
            DataSet a = new DataSet();
               a = obj.getEmpleadosGrid(1);
        }   
    }
}