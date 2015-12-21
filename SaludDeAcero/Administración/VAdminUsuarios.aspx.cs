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
                btnModificarEmpleado.Visible = false;
                btnEliminarEmpleado.Visible = false;
                txtContraseñaAcceso.Attributes["type"] = "password";
                txtConfContraseña.Attributes["type"] = "password";
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
        /// Evento  para dar de alta el Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (txtConfContraseña.Text == txtContraseñaAcceso.Text)
            {
                int satisfactorio = objU.addEmpleados(txtNombreUsuario.Text, txtApPaterno.Text, txtApMaterno.Text,
                                       txtNumeroArea.Text, txtNombreUsuario.Text, txtContraseñaAcceso.Text,
                                       Convert.ToInt32(ddlTipoUsuario.SelectedItem.Value), Session["Usuario"].ToString());
                if (satisfactorio == 1)
                {
                    popUpMensajeAplicacion(2, "Existe un error en la información que ingresaste, Por Favor revisa e intenta de nuevo; =(");
                }
                else
                {
                    popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
                }

            }
            else
            {
                popUpMensajeAplicacion(2, "Las contraseñas no coinciden. Verifica las Contraseña;");
            }



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
                    txtMensaje.ForeColor = Color.Yellow;
                    txtMensaje.Font.Bold = true;
                    this.popUpMensajeAplicación.ShowOnPageLoad = true;
                    break;
                default:
                    break;
            }
        }

        /// <summary>
        /// Evento  para Actualizar el Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (txtConfContraseña.Text == txtContraseñaAcceso.Text)
            {
                int satisfactorio = objU.updtEmpleados(Convert.ToInt32(Session["Row"]),txtNombre.Text, txtApPaterno.Text,
                                        txtApMaterno.Text,txtNumeroArea.Text, txtNombreUsuario.Text, txtContraseñaAcceso.Text,
                                       Convert.ToInt32(ddlTipoUsuario.SelectedItem.Value), true, Session["Usuario"].ToString());
                if (satisfactorio == 1)
                {
                    popUpMensajeAplicacion(2, "Existe un error en la información que ingresaste, Por Favor revisa e intenta de nuevo; =(");
                }
                else
                {
                    popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
                }

            }
            else
            {
                popUpMensajeAplicacion(2, "Las contraseñas no coinciden. Verifica las Contraseña;");
            }
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
            limpiarCampos();
        }

        /// <summary>
        /// Limpia los controles de los datos obtenidos
        /// </summary>
        private void limpiarCampos()
        {
            //popup Agregar
            txtNombre.Text = "";
            txtApPaterno.Text = "";
            txtApMaterno.Text = "";
            txtNumeroArea.Text = "";
            ddlTipoUsuario.SelectedIndex = 0;
            txtNombreUsuario.Text = "";
            txtContraseñaAcceso.Text = "";
            txtConfContraseña.Text = "";
            //popup Eliminar
            txtNomUsuarioEliminar.Text = "";
            txtNomSocioEliminar.Text = "";
            txtApPaternoEliminar.Text = "";
            txtApMaternoEliminar.Text = "";
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

        /// <summary>
        /// Llenado de Usuario
        /// </summary>
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
                DataSet datosEmpleados = objU.getUsuariosById(Convert.ToInt32(id));
                setDatosEmpleado(datosEmpleados);
                btnAgregarEmpleado.Visible = false;
                btnModificarEmpleado.Visible = true;
                btnEliminarEmpleado.Visible = true;
            }
            if (opLinkButton.Text == "Cancelar")
            {
                btnAgregarEmpleado.Visible = true;
                btnModificarEmpleado.Visible = false;
                btnEliminarEmpleado.Visible = false;
            }            
        }

        /// <summary>
        /// Pone los datos del empleado seleccionado
        /// </summary>
        protected void setDatosEmpleado(DataSet empleado)
        {
            //Modificación popUP
            txtNombre.Text = empleado.Tables[0].Rows[0]["Nombre"].ToString();
            txtApPaterno.Text = empleado.Tables[0].Rows[0]["Apellido_Pat"].ToString();
            txtApMaterno.Text = empleado.Tables[0].Rows[0]["Apellido_Mat"].ToString();
            txtNumeroArea.Text = empleado.Tables[0].Rows[0]["ID_Area"].ToString();
            txtNombreUsuario.Text = empleado.Tables[0].Rows[0]["Usuario"].ToString();
            txtContraseñaAcceso.Text = empleado.Tables[0].Rows[0]["Password"].ToString();
            txtConfContraseña.Text = empleado.Tables[0].Rows[0]["Password"].ToString();
            ddlTipoUsuario.SelectedValue = empleado.Tables[0].Rows[0]["Id_Perfil"].ToString();            
            //Eliminacion popUP
            txtNomSocioEliminar.Text = empleado.Tables[0].Rows[0]["Nombre"].ToString();
            txtApPaternoEliminar.Text = empleado.Tables[0].Rows[0]["Apellido_Pat"].ToString();
            txtApMaternoEliminar.Text = empleado.Tables[0].Rows[0]["Apellido_Mat"].ToString();
            txtNomUsuarioEliminar.Text = empleado.Tables[0].Rows[0]["Usuario"].ToString();
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

        /// <summary>
        /// Evento  para Actualizar (Baja) el empleado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarSocio_Click(object sender, EventArgs e)
        {
            int satisfactorio = objU.updtEmpleados(Convert.ToInt32(Session["Row"]), txtNombre.Text, txtApPaterno.Text,
                                       txtApMaterno.Text, txtNumeroArea.Text, txtNombreUsuario.Text, txtContraseñaAcceso.Text,
                                      Convert.ToInt32(ddlTipoUsuario.SelectedItem.Value), false, Session["Usuario"].ToString());
            if (satisfactorio == 1)
            {
                popUpMensajeAplicacion(2, "Existe un error en la información que ingresaste, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                popUpMensajeAplicacion(3, "Información guardada con éxito;El usuario se encuentra inactivo =)");
            }
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
    }
}