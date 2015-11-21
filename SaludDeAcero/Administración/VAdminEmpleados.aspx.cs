/*''=============================================
'' Autor:	Gilberto Adame
'' Modificado por: Faleg A. Peralta
'' Fecha de Modificación: 16.10.2015
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

namespace SaludDeAcero.Administración
{
    public partial class VAdminEmpleados : System.Web.UI.Page
    {
        N_Empleados objE = new N_Empleados();
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
                btnModificarEmpleado.Visible = false;
                btnConsultarHistorialEmpleado.Visible = false;
                btnBorrarEmpleado.Visible = false;
                cargaPerfiles();
            }
        }

        /// <summary>
        /// Evento que muestra el Dialog para dar de alta el Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAgregarEmpleado_Click(object sender, EventArgs e)
        {
            this.popUpEditarAgregarEmpleado.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = true;
            ddlEstado.Visible = false;
            lblEstado.Visible = false;
        }

        /// <summary>
        /// Actualiza la Informacion del Usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnModificarEmpleado_Click(object sender, EventArgs e)
        {
            this.popUpEditarAgregarEmpleado.ShowOnPageLoad = true;
            btnGuardar.Visible = false;
            btnActualizar.Visible = true;
        }

        /// <summary>
        /// Evento que muestra el Dialog para dar de alta el Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            popUpEditarAgregarEmpleado.ShowOnPageLoad = false;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnConsultarHistorialEmpleado_Click(object sender, EventArgs e)
        {
            popupcontrolConsultaAsistencias.ShowOnPageLoad = true;
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
        /// Da de baja el empleado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnBorrarEmpleado_Click(object sender, EventArgs e)
        {
            this.popUpEliminarEmpleado.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = false;
            cargaUsuarios();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string mensaje = "";
            int satisfactorio = 0;// objU.addPaquetes(txtNombrePaquete.Text, txtdescripcionPaquete.Text, txtCosto.Text, Session["Id_Usuario"].ToString());
            if (satisfactorio == 0)
            {
                mensaje = "<script language='javascript' type='text/javascript'>" +
                                  " alert('Se guardo correctamente la información');</script> ";
            }
            else
            {
                mensaje = "<script language='javascript' type='text/javascript'>" +
                                  " alert('Se presentó un problema al guardar la información, favor de revisarla;');</script> ";
            }
            Page.ClientScript.RegisterStartupScript(typeof(Page), "PopupScript", mensaje);
            cargaUsuarios();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string mensaje = "";
            int satisfactorio = 0;// objU.addPaquetes(txtNombrePaquete.Text, txtdescripcionPaquete.Text, txtCosto.Text, Session["Id_Usuario"].ToString());
            if (satisfactorio == 0)
            {
                mensaje = "<script language='javascript' type='text/javascript'>" +
                                  " alert('Se guardo correctamente la información');</script> ";
            }
            else
            {
                mensaje = "<script language='javascript' type='text/javascript'>" +
                                  " alert('Se presentó un problema al guardar la información, favor de revisarla;');</script> ";
            }
            Page.ClientScript.RegisterStartupScript(typeof(Page), "PopupScript", mensaje);
            cargaUsuarios();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarSocio_Click(object sender, EventArgs e)
        {
            string mensaje = "";
            int satisfactorio = 0;// objU.addPaquetes(txtNombrePaquete.Text, txtdescripcionPaquete.Text, txtCosto.Text, Session["Id_Usuario"].ToString());
            if (satisfactorio == 0)
            {
                mensaje = "<script language='javascript' type='text/javascript'>" +
                                  " alert('Se guardo correctamente la información');</script> ";
            }
            else
            {
                mensaje = "<script language='javascript' type='text/javascript'>" +
                                  " alert('Se presentó un problema al guardar la información, favor de revisarla;');</script> ";
            }
            Page.ClientScript.RegisterStartupScript(typeof(Page), "PopupScript", mensaje);
            cargaUsuarios();
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
        //Carga los datos seleccionados
        protected void cargaUsuarios()
        {
            DataSet datos = objE.getEmpleadosGrid();
            grdEmpleados.DataSource = datos;
            grdEmpleados.DataBind();
            grdEmpleados.KeyFieldName = "id_empleado";
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
                btnModificarEmpleado.Visible = true;
                DataSet datosEmpleados = objE.getEmpleadosGrid();
                setDatosEmpleado(datosEmpleados);
                btnActualizar.Visible = true;
                //btnAgregarEmpleado.Visible = false;
                //btnAgregarEmpleado.Enabled = false;
            }

           }
        /// <summary>
        /// Pone los datos del empleado seleccionado
        /// </summary>
        protected void setDatosEmpleado(DataSet empleado)
        {
            txtNumero.Text = empleado.Tables[0].Rows[0] ["num_empleado"].ToString();
            TxtBnumEmpleado.Text = empleado.Tables[0].Rows[0] ["num_empleado"].ToString();

            txtNombre.Text = empleado.Tables[0].Rows[0] ["nombre"].ToString();
            TxtBNombre.Text = empleado.Tables[0].Rows[0] ["nombre"].ToString();

            txtApPaterno.Text = empleado.Tables[0].Rows[0] ["ap_paterno"].ToString();
            TxtBapPaterno.Text = empleado.Tables[0].Rows[0] ["ap_paterno"].ToString();

            txtApMaterno.Text = empleado.Tables[0].Rows[0] ["ap_materno"].ToString();
            TxtBapMaterno.Text = empleado.Tables[0].Rows[0] ["ap_materno"].ToString();
            TxtDireccion.Text = empleado.Tables[0].Rows[0] ["direccion"].ToString();

        }
        /// <summary>
        /// Cambia el Color de la celda seleccionada
        /// </summary
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdEmpleados_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            object id = e.KeyValue;
            if (id != null && Session["Row"] != null)
            {
                if (Session["Row"].ToString() == id.ToString())
                    e.Row.BackColor = System.Drawing.Color.LightGray;

            }
        }

        /// <summary>
        /// Validadores de Controles
        /// </summary>
        /// <returns></returns>
        public bool Valida()
        {

            //falta comparar el estodo y el tipo de empleado
            if (txtNumero.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto de Agregar el Número del Empleado, El empledo No fue agregado al Sitema');", true);
                return false;
            }

            if (txtNombre.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto Agregar Nombre de Empleado, El empledo NO fue agregado al Sistema');", true);
                return false;
            }
            if (txtApPaterno.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto Agregar Apellido Paterno del Empleado, El empledo NO fue agregado al Sistema');", true);
                return false;
            }
            if (txtApMaterno.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto Agregar Apellido Materno del Empleado, El empledo NO fue agregado al Sistema');", true);
                return false;
            }
            if (TxtDireccion.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto Agregar la Direccion del Empleado, El empledo NO fue agregado al Sistema');", true);
                return false;
            }
            return true;
        }

        /// <summary>
        /// Limpia los controles 
        /// </summary>
        public void Limpia()
        {
            //falta que limpie los dos ultimos
            txtNumero.Text = "";
            txtNombre.Text = "";
            txtApPaterno.Text = "";
            txtApMaterno.Text = "";
            TxtDireccion.Text = "";
            ddlEstado.SelectedItem.Value = null;
            ddlTipoUsuario.SelectedItem.Value = null;
        }

        /// <summary>
        /// Evento del grid que permite refrescar la información mostrada
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdEmpleados_Load(object sender, EventArgs e)
        {
            cargaUsuarios();
        }

        /// <summary>
        /// Exporta el Grid a Word
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnWord_Click(object sender, EventArgs e)
        {
            grdEmpleadosExporter.WriteRtfToResponse();
        }

        /// <summary>
        /// Exporta el Grid a Excel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnExcel_Click(object sender, EventArgs e)
        {
            grdEmpleadosExporter.WriteXlsToResponse();
        }

        /// <summary>
        /// Exporta el Grid a PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnPDF_Click(object sender, EventArgs e)
        {
            grdEmpleadosExporter.WritePdfToResponse();
        }
    }
}