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
using System.Drawing;

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
            if (Session["Usuario"] == null)
            {
                //Session.Abandon();
                Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                Response.Redirect("~/Login.aspx");
            }
            else
            {
                Response.AddHeader("Refresh", Convert.ToString((Session.Timeout * 60) + 5));
            }
            if (!IsPostBack)
            {
                btnModificarEmpleado.Visible = false;
                btnConsultarHistorialEmpleado.Visible = false;
                btnBorrarEmpleado.Visible = false;
                cargaPerfiles();
                cargaUsuarios();
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
            limpiarCampos();
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
            string valNum = objE.valNumEmpleado(Convert.ToInt32(txtNumero.Text));
            string valSocio = objE.valEmpleado(txtNombre.Text, txtApPaterno.Text, txtApMaterno.Text);
            if (valNum != "" || valSocio != "")
            {
                if (valNum == "")
                {
                    btnMensajeAppContinuar.Visible = true;
                    btnMensajeApp.Visible = false;
                }
                else
                {
                    btnMensajeAppContinuar.Visible = false;
                    btnMensajeApp.Visible = true;
                }
                popUpMensajeAplicacion(3, valNum + " - " + valSocio);
            }
            else
            {
                guardaEmpleado();
            }
        }

        /// <summary>
        /// Guarda el Socio si este no existe
        /// </summary>
        public void guardaEmpleado()
        {
            int satisfactorio = objE.addEmpleados(txtNumero.Text, txtNombre.Text, txtApMaterno.Text, txtApPaterno.Text, txtTelefono.Text, txtDireccion.Text, Convert.ToInt32(ddlTipoUsuario.SelectedItem.Value));
            if (satisfactorio == 1)
            {
                popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
            }
            cargaUsuarios();
            limpiarCampos();
        }

        /// <summary>
        /// controla el mensaje de la aplicación y el color de las letras
        /// </summary>
        /// <param name="opcion"></param>
        /// <param name="Mensaje"></param>
        private void popUpMensajeAplicacion(Int32 opcion, String Mensaje)
        {
            switch (opcion)
            {
                case 1:
                    txtMensaje.Text = Mensaje;
                    txtMensaje.ForeColor = Color.Green;
                    txtMensaje.Font.Bold = true;
                    this.popUpMensajeAplicación.ShowOnPageLoad = true;
                    break;
                case 2:
                    txtMensaje.Text = Mensaje;
                    txtMensaje.ForeColor = Color.Red;
                    txtMensaje.Font.Bold = true;
                    this.popUpMensajeAplicación.ShowOnPageLoad = true;
                    break;
                case 3:
                    txtMensaje.Text = Mensaje;
                    txtMensaje.ForeColor = Color.DarkRed;
                    txtMensaje.Font.Bold = true;
                    this.popUpMensajeAplicación.ShowOnPageLoad = true;
                    break;
                default:
                    break;
            }
            this.popUpEditarAgregarEmpleado.ShowOnPageLoad = false;
            this.popUpEliminarEmpleado.ShowOnPageLoad = false;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            int satisfactorio = objE.updtEmpleados(Convert.ToInt32(Session["Row"].ToString()), txtNumero.Text, txtNombre.Text, txtApPaterno.Text, txtApMaterno.Text, txtTelefono.Text, txtDireccion.Text, true, Convert.ToInt32(ddlTipoUsuario.SelectedItem.Value));
            if (satisfactorio == 1)
            {
                popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
            }
            cargaUsuarios();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarSocio_Click(object sender, EventArgs e)
        {
            int satisfactorio = objE.DelEmpleado(Convert.ToInt32(Session["Row"].ToString()));
            if (satisfactorio == 1)
            {
                popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
            }
            cargaUsuarios();
            limpiarCampos();
            btnAgregarEmpleado.Visible = false;
            btnModificarEmpleado.Visible = true;
            btnBorrarEmpleado.Visible = true;
        }

        /// <summary>
        /// Limpia los controles de los datos obtenidos
        /// </summary>
        private void limpiarCampos()
        {
            //popup Agregar
            txtNumero.Text = "";
            txtNombre.Text = "";
            txtApPaterno.Text = "";
            txtApMaterno.Text = "";
            txtTelefono.Text = "";
            ddlEstado.SelectedIndex = 0;
            ddlTipoUsuario.SelectedIndex = 0;
            txtDireccion.Text = "";
            //popup Eliminar
            TxtBnumEmpleado.Text = "";
            TxtBNombre.Text = "";
            TxtBapPaterno.Text = "";
            TxtBapMaterno.Text = "";
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
                DataSet datosEmpleados = objE.getEmpleadoById(Convert.ToInt32(id));
                setDatosEmpleado(datosEmpleados);
                btnAgregarEmpleado.Visible = false;
                btnModificarEmpleado.Visible = true;
                btnBorrarEmpleado.Visible = true;
            }
            if (opLinkButton.Text == "Cancelar")
            {
                btnAgregarEmpleado.Visible = true;
                btnModificarEmpleado.Visible = false;
                btnBorrarEmpleado.Visible = false;
            }

        }
        /// <summary>
        /// Pone los datos del empleado seleccionado
        /// </summary>
        protected void setDatosEmpleado(DataSet empleado)
        {
            //popup Agregar
            txtNumero.Text = empleado.Tables[0].Rows[0]["num_empleado"].ToString();
            txtNombre.Text = empleado.Tables[0].Rows[0]["nombre"].ToString();
            txtApPaterno.Text = empleado.Tables[0].Rows[0]["ap_paterno"].ToString();
            txtApMaterno.Text = empleado.Tables[0].Rows[0]["ap_materno"].ToString();
            txtTelefono.Text = empleado.Tables[0].Rows[0]["telefono"].ToString();            
            if (Convert.ToBoolean(empleado.Tables[0].Rows[0]["activo"]))
            {
                ddlEstado.SelectedIndex = 1;
            }
            else
            {
                ddlEstado.SelectedIndex = 2;
            }
            ddlTipoUsuario.SelectedIndex = Convert.ToInt32(empleado.Tables[0].Rows[0]["id_Perfil"].ToString()); 
            txtDireccion.Text = empleado.Tables[0].Rows[0]["direccion"].ToString();
            //popup Eliminar
            TxtBnumEmpleado.Text = empleado.Tables[0].Rows[0]["num_empleado"].ToString();
            TxtBNombre.Text = empleado.Tables[0].Rows[0]["nombre"].ToString();
            TxtBapPaterno.Text = empleado.Tables[0].Rows[0]["ap_paterno"].ToString();
            TxtBapMaterno.Text = empleado.Tables[0].Rows[0]["ap_materno"].ToString();
           
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
            if (txtDireccion.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto Agregar la Direccion del Empleado, El empledo NO fue agregado al Sistema');", true);
                return false;
            }
            return true;
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
        /// <summary>
        /// Oculta el popUp de Mensaje
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMensajeApp_Click(object sender, EventArgs e)
        {
            this.popUpMensajeAplicación.ShowOnPageLoad = false;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMensajeAppCancelar_Click(object sender, EventArgs e)
        {
            this.popUpMensajeAplicación.ShowOnPageLoad = false;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMensajeAppContinuar_Click(object sender, EventArgs e)
        {
            guardaEmpleado();
        }
    }
}