/*''=============================================
'' Autor:	Luis Lazaro
'' Modificado por: Faleg A. Peralta
'' Fecha de Modificación: 25.09.2015
'' Descripcion General: Valida el Inicio de Session
'' =============================================*/
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Negocio;

namespace SaludDeAcero.AdministraciónSocios
{
    public partial class VAdminSocios : System.Web.UI.Page
    {
        N_Socio objU = new N_Socio();
        N_Paquete objP = new N_Paquete();
        N_Pago objPagos = new N_Pago();
        N_Checador objChecador = new N_Checador();
        N_HistorialFisico objHF = new N_HistorialFisico();
        N_HistorialMedico objHM = new N_HistorialMedico();
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
                cargaSocio();
                cargaPaquetes();
                cargaChecador();
                btnModificarSocio.Visible = false;
                btnEstadoSocio.Visible = false;
                btnHistorialSocio.Visible = false;
                btnCancelarSocio.Visible = false;
            }
        }


        /// <summary>
        /// Evento que muestra el Dialog para dar de alta el Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAgregarSocio_Click(object sender, EventArgs e)
        {
            this.popUpRegistrar.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = true;
            ddlEstado.Visible = false;
            lblEstado.Visible = false;
        }

        /// <summary>
        /// Evento que cierra el Dialog
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.popUpRegistrar.ShowOnPageLoad = false;
        }

        /// <summary>
        /// Habilita el Pop Up para modificación del Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnModificarSocio_Click(object sender, EventArgs e)
        {
            this.popUpRegistrar.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = true;
            ddlEstado.Visible = true;
            lblEstado.Visible = true;
        }

        /// <summary>
        /// Habilita el Pop Up para modificación del Estado Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEstadoSocio_Click(object sender, EventArgs e)
        {
            this.popUpEstadoSocio.ShowOnPageLoad = true;
        }

        /// <summary>
        /// Habilita el Pop Up para Eliminación del Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelarSocio_Click(object sender, EventArgs e)
        {
            this.popUpEliminarSocio.ShowOnPageLoad = true;
        }

        /// <summary>
        /// Deshabilita el Pop Up para Eliminación del Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelarEliminar_Click(object sender, EventArgs e)
        {
            this.popUpEliminarSocio.ShowOnPageLoad = false;
        }

        /// <summary>
        /// Deshabilita el Pop Up para Estado del Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelarEstado_Click(object sender, EventArgs e)
        {
            this.popUpEstadoSocio.ShowOnPageLoad = false;
        }

        /// <summary>
        /// da un resumen de las Fechas de los pago 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnHistorialSocio_Click(object sender, EventArgs e)
        {
            popUpConsultaHistorial.ShowOnPageLoad = true;
        }

        /// <summary>
        /// Deshabilita el Pop Up para Consultar el Historial de Pago
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCanConPago_Click(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Llenado de Usuario
        /// </summary>
        protected void cargaSocio()
        {
            DataSet datosSocios = objU.getSociosGrid();
            grdSocios.DataSource = datosSocios;
            grdSocios.DataBind();
            grdSocios.KeyFieldName = "id_Socio";
        }

        /// <summary>
        /// Llena el dropdown de los paquetes
        /// </summary>
        protected void cargaPaquetes()
        {
            DataSet datosPerfiles = objP.getAllPaquetes();
            this.ddlPaquete.DataSource = datosPerfiles;
            this.ddlPaquete.DataValueField = "Id_Paquete";
            this.ddlPaquete.DataTextField = "Nombre";
            this.ddlPaquete.DataBind();
            this.ddlPaquete.Items.Insert(0, new ListItem("Elija una Opcion..", "0"));
        }

        /// <summary>
        /// Llenado de Pago
        /// </summary>
        protected void cargaPago()
        {
            DataSet datosSocios = objPagos.getPagoById(1);
            GVConsultaPagos.DataSource = datosSocios;
            GVConsultaPagos.DataBind();
            GVConsultaPagos.KeyFieldName = "id_Pago";
        }

        /// <summary>
        /// Llenado de Pago
        /// </summary>
        protected void cargaChecador()
        {
            DataSet datosSocios = objChecador.getChecadorById(1);
            GvAsistencia.DataSource = datosSocios;
            GvAsistencia.DataBind();
            GvAsistencia.KeyFieldName = "id_Checador";
        }

        /// <summary>
        /// Permite la edicion del usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdSocios_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            object id = e.KeyValue;
            Session["Row"] = id;
            LinkButton opLinkButton = (LinkButton)e.CommandSource;
            if (opLinkButton.Text == "Seleccionar")
            {
                DataSet datosSocios = objU.getSocioById(Convert.ToInt32(id));
                setDatosSocio(datosSocios);
                btnAgregarSocio.Visible = false;
                btnModificarSocio.Visible = true;
                btnEstadoSocio.Visible = true;
                btnHistorialSocio.Visible = true;
                btnCancelarSocio.Visible = true;
            }
            if (opLinkButton.Text == "Cancelar")
            {
                btnAgregarSocio.Visible = true;
                btnModificarSocio.Visible = false;
                btnEstadoSocio.Visible = false;
                btnHistorialSocio.Visible = false;
                btnCancelarSocio.Visible = false;
            }
        }

        /// <summary>
        /// Pone los datos del Socio seleccionado
        /// </summary>
        protected void setDatosSocio(DataSet Socio)
        {
            //Modificación popUP
            txtNumero.Text = Socio.Tables[0].Rows[0]["num_empleado"].ToString();
            txtNombre.Text = Socio.Tables[0].Rows[0]["Nombre"].ToString();
            txtApMaterno.Text = Socio.Tables[0].Rows[0]["ap_materno"].ToString();
            txtApPaterno.Text = Socio.Tables[0].Rows[0]["ap_paterno"].ToString();
            txtTelefono.Text = Socio.Tables[0].Rows[0]["telefono"].ToString();
            txtDireccion.Text = Socio.Tables[0].Rows[0]["direccion"].ToString();
            txtFecha.Text = Socio.Tables[0].Rows[0]["direccion"].ToString();
            txtMedicos.Text = Socio.Tables[0].Rows[0]["HistorialMedico"].ToString();
            txtFisicos.Text = Socio.Tables[0].Rows[0]["HistorialFisico"].ToString();

            //Estado
            txtNumeroEstado.Text = Socio.Tables[0].Rows[0]["num_empleado"].ToString();
            txtNombreEstado.Text= Socio.Tables[0].Rows[0]["Nombre"].ToString();
            txtApPaternoEstado.Text = Socio.Tables[0].Rows[0]["ap_materno"].ToString();
            txtApMaternoEstado.Text = Socio.Tables[0].Rows[0]["ap_paterno"].ToString();

            //Eliminacion popUP
            txtNumSocioEliminar.Text = Socio.Tables[0].Rows[0]["num_empleado"].ToString();
            txtNomSocioEliminar.Text = Socio.Tables[0].Rows[0]["Nombre"].ToString();
            txtApPaternoEliminar.Text = Socio.Tables[0].Rows[0]["ap_materno"].ToString();
            txtApMaternoEliminar.Text = Socio.Tables[0].Rows[0]["ap_paterno"].ToString();
        }

        /// <summary>
        /// Cambia el Color de la celda seleccionada
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdSocios_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            object id = e.KeyValue;
            if (id != null && Session["Row"] != null)
            {
                if (Session["Row"].ToString() == id.ToString())
                    e.Row.BackColor = System.Drawing.Color.LightGray;
            }
        }

        /// <summary>
        /// Permite la busqueda y el paginado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdSocios_Load(object sender, EventArgs e)
        {
            cargaSocio();
        }

        /// <summary>
        ///  Exporta los datos a Word
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnWord_Click(object sender, EventArgs e)
        {
            grdSociosExporter.WriteXlsToResponse();
        }

        /// <summary>
        /// Exporta los datos a Excel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnExcel_Click(object sender, EventArgs e)
        {
            grdSociosExporter.WriteXlsToResponse();
        }

        /// <summary>
        /// Exporta los datos a PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnPDF_Click(object sender, EventArgs e)
        {
            grdSociosExporter.WritePdfToResponse();
        }

        /// <summary>
        /// Agrega un Nuevo Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idSocio= 0;
            int satisfactorio =  objU.addSocios(txtNumero.Text, txtNombre.Text, txtApPaterno.Text, txtApMaterno.Text, txtTelefono.Text,txtDireccion.Text,txtFecha.Text);
            if (satisfactorio == 1)
            {
                popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                satisfactorio = objHF.addHistorialFisico(idSocio, txtFisicos.Text);
                satisfactorio = objHM.addHistorialMedico(idSocio, txtFisicos.Text);
                popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
            }
            cargaSocio();
        }

        /// <summary>
        /// Actualiza la información del empleado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            int idSocio = 0;
            int satisfactorio = objU.updtSocios(Convert.ToInt32(Session["Row"].ToString()),txtNumero.Text, txtNombre.Text, txtApPaterno.Text, txtApMaterno.Text, txtTelefono.Text, txtDireccion.Text, txtFecha.Text, Convert.ToInt32(ddlEstado.SelectedItem.Value));
            if (satisfactorio == 1)
            {
                popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                satisfactorio = objHF.addHistorialFisico(idSocio, txtFisicos.Text);
                satisfactorio = objHM.addHistorialMedico(idSocio, txtFisicos.Text);
                popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
            }
            cargaSocio();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGuardarEstado_Click(object sender, EventArgs e)
        {
            string mensaje = "";
            int satisfactorio = 0;// objU.updtEmpleados(Convert.ToInt32(Session["Row"].ToString()), txtNumero.Text, txtNombre.Text, txtApPaterno.Text, txtApMaterno.Text, txtTelefono.Text, txtDireccion.Text, true, 4);
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
            cargaSocio();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnConPago_Click(object sender, EventArgs e)
        {
            string mensaje = "";
            int satisfactorio = 0;//objU.updtEmpleados(Convert.ToInt32(Session["Row"].ToString()), txtNumero.Text, txtNombre.Text, txtApPaterno.Text, txtApMaterno.Text, txtTelefono.Text, txtDireccion.Text, true, 4);
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
            cargaSocio();
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

        protected void BtnReimprimir_Click(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Elimina el Socio de la BD
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarSocio_Click(object sender, EventArgs e)
        {
            string mensaje = "";
            int satisfactorio =  objU.DelEmpleado(Convert.ToInt32(Session["Id_Usuario"].ToString()));
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
            cargaPaquetes();
        }

        /// <summary>
        /// Oculta el popUp de Mensaje
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnMensajeApp_Click(object sender, EventArgs e)
        {
            this.popUpMensajeAplicación.ShowOnPageLoad = false;
            this.popUpRegistrar.ShowOnPageLoad = false;
            this.popUpEstadoSocio.ShowOnPageLoad = false;
            this.popUpConsultaHistorial.ShowOnPageLoad = false;
            this.popUpEliminarSocio.ShowOnPageLoad = false;
        }
    }
}