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
using Negocio;
using System.Data;
using System.Drawing;

namespace Sisa
{
    public partial class AdministracionUsuarios : System.Web.UI.Page
    {
        N_Usuarios objU = new N_Usuarios();
        N_Perfiles objP = new N_Perfiles();

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
            if (!IsPostBack)
            {
                cargaPerfiles();
                cargaUsuarios();
                btnModificarEmplaedo.Visible = false;
                btnEliminarEmpleado.Visible = false;
            }
        }

        /// <summary>
        /// Evento que muestra el Dialog para dar de alta el Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.popUpEditarEmpleado.ShowOnPageLoad = false;
        }

        /// <summary>
        /// Evento que muestra el Dialog para dar de alta el Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento que muestra el Dialog para Actualizar el Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnActualizar_Click(object sender, EventArgs e)
        {

        }


        /// <summary>
        /// Agrega la Informacion del Usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAgregarEmpleado_Click(object sender, EventArgs e)
        {
            this.popUpEditarEmpleado.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = true;
        }

        /// <summary>
        /// Actualiza la Informacion del Usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnModificarEmplaedo_Click(object sender, EventArgs e)
        {
            this.popUpEditarEmpleado.ShowOnPageLoad = true;
            btnGuardar.Visible = false;
            btnActualizar.Visible = true;
        }

        /// <summary>
        /// Da de baja el empleado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarEmpleado_Click(object sender, EventArgs e)
        {
            this.popUpEliminarEmpleado.ShowOnPageLoad = true;
        }

        /// <summary>
        /// Cancela la Eliminacion del Empleado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelarEliminar_Click(object sender, EventArgs e)
        {
            this.popUpEliminarEmpleado.ShowOnPageLoad = false;
        }

        /// <summary>
        /// Llena el dropdown de los perfiles
        /// </summary>
        protected void cargaPerfiles()
        {
            DataSet datosPerfiles = objP.getAllPerfil();
            this.ddlTipoUsuario.DataSource = datosPerfiles;
            this.ddlTipoUsuario.DataValueField = "ID_PERFIL";
            this.ddlTipoUsuario.DataTextField = "PERFIL";
            this.ddlTipoUsuario.DataBind();
            this.ddlTipoUsuario.Items.Insert(0, new ListItem("Elija una Opcion..", "0"));
        }

        protected void cargaUsuarios()
        {
            DataSet datosEmpleados = objU.getUsuariosGrid();
            grdEmpleados.DataSource = datosEmpleados;
            grdEmpleados.DataBind();
            grdEmpleados.KeyFieldName = "ID_USUARIO";
        }

        /// <summary>
        /// Permite la edicion del usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdEmpleados_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            object id = e.KeyValue;
            Session["Row"] = id;
            LinkButton opLinkButton = (LinkButton)e.CommandSource;
            if (opLinkButton.Text == "Seleccionar")
            {
                DataSet datosEmpleados = objU.getUsuariosGrid();
                setDatosEmpleado(datosEmpleados);
                btnModificarEmplaedo.Visible = true;
                btnEliminarEmpleado.Visible = true;
            }
        }

        /// <summary>
        /// Pone los datos del empleado seleccionado
        /// </summary>
        protected void setDatosEmpleado(DataSet empleado)
        {
            txtNombre.Text = empleado.Tables[0].Rows[0]["nombre"].ToString();
        }

        /// <summary>
        /// Cambia el Color de la celda seleccionada
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdEmpleados_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            object id = e.KeyValue;
            if (id !=null && Session["Row"] != null)
            {
                if (Session["Row"].ToString() == id.ToString())
                    e.Row.BackColor = System.Drawing.Color.LightGray;
            }            
        }

        /// <summary>
        /// Exporta los datos a Excel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnWord_Click(object sender, EventArgs e)
        {
            //grdEmpleadosExporter.ReportHeader = headerExporter().ToString();
            grdEmpleadosExporter.WriteRtfToResponse();
        }

        /// <summary>
        /// Exporta los datos a Word
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnExcel_Click(object sender, EventArgs e)
        {
            grdEmpleadosExporter.WriteXlsToResponse();
        }

        /// <summary>
        /// Exporta los datos a PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnPDF_Click(object sender, EventArgs e)
        {
            grdEmpleadosExporter.WritePdfToResponse();
        }

        /// <summary>
        /// Permite la busqueda y el paginado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdEmpleados_Load(object sender, EventArgs e)
        {
            cargaUsuarios();
        }
    }
}