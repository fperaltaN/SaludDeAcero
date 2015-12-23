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
using System.Drawing;

namespace SaludDeAcero.AdministraciónSocios
{
    public partial class VAdminSocios : System.Web.UI.Page
    {
        N_Socio objU = new N_Socio();
        N_Paquete objP = new N_Paquete();
        N_Pago objPagos = new N_Pago();
        N_ChecadorSocio objChecador = new N_ChecadorSocio();
        N_HistorialFisico objHF = new N_HistorialFisico();
        N_HistorialMedico objHM = new N_HistorialMedico();
        N_SocioMembresia objSM = new N_SocioMembresia();
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
                txtFecha.Value = DateTime.Now.AddYears(-26);
                FechaInicioConPago.Value = DateTime.Now;
                FechaFinalConPago.Value = DateTime.Now;
                cargaSocio();
                cargaPaquetes();
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
            btnGuardar.Visible = false;
            btnActualizar.Visible = true;
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
            popUpConsultaHistorial.ShowOnPageLoad = false;
        }

        /// <summary>
        /// Llenado de Usuario
        /// </summary>
        protected void cargaSocio()
        {
            DataSet datosSocios = objU.getSociosGrid();
            grdSocios.DataSource = datosSocios;
            grdSocios.DataBind();
            grdSocios.KeyFieldName = "id_socio";
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
            DataSet datosSocios = objPagos.getPagoById(Convert.ToInt32(Session["Row"].ToString()));
            GVConsultaPagos.DataSource = datosSocios;
            GVConsultaPagos.DataBind();
            GVConsultaPagos.KeyFieldName = "id_Socio";
        }

        /// <summary>
        /// Llenado de Pago
        /// </summary>
        protected void cargaChecador()
        {
            DataSet datosSocios = objChecador.getChecadorSocioById(Convert.ToInt32(Session["Row"].ToString()));
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
            cargaPago();
            cargaChecador();
            //Modificación popUP
            txtNumero.Text = Socio.Tables[0].Rows[0]["num_socio"].ToString();
            txtNombre.Text = Socio.Tables[0].Rows[0]["Nombre"].ToString();
            txtApMaterno.Text = Socio.Tables[0].Rows[0]["ap_materno"].ToString();
            txtApPaterno.Text = Socio.Tables[0].Rows[0]["ap_paterno"].ToString();
            txtTelefono.Text = Socio.Tables[0].Rows[0]["telefono"].ToString();
            txtDireccion.Text = Socio.Tables[0].Rows[0]["direccion"].ToString();
            txtFecha.Value = Convert.ToDateTime(Socio.Tables[0].Rows[0]["fecha_nacimiento"].ToString());

            //Estado
            txtNumeroEstado.Text = Socio.Tables[0].Rows[0]["num_socio"].ToString();
            txtNombreEstado.Text= Socio.Tables[0].Rows[0]["Nombre"].ToString();
            txtApPaternoEstado.Text = Socio.Tables[0].Rows[0]["ap_paterno"].ToString();
            txtApMaternoEstado.Text = Socio.Tables[0].Rows[0]["ap_materno"].ToString();
            ddlEstado.SelectedIndex = (Convert.ToBoolean(Socio.Tables[0].Rows[0]["activo"].ToString()) == false ? 0 : 1);

            ////Eliminacion popUP
            txtNumSocioEliminar.Text = Socio.Tables[0].Rows[0]["num_socio"].ToString();
            txtNomSocioEliminar.Text = Socio.Tables[0].Rows[0]["Nombre"].ToString();
            txtApPaternoEliminar.Text = Socio.Tables[0].Rows[0]["ap_paterno"].ToString();
            txtApMaternoEliminar.Text = Socio.Tables[0].Rows[0]["ap_materno"].ToString();

            //HistorialPago
            txtNumeroSocioConPago.Text = Socio.Tables[0].Rows[0]["num_socio"].ToString();
            txtNombreSocioConPago.Text = Socio.Tables[0].Rows[0]["Nombre"].ToString();
            txtApeidoPaternoConPago.Text = Socio.Tables[0].Rows[0]["ap_paterno"].ToString();
            txtApeidoMaternoConPago.Text = Socio.Tables[0].Rows[0]["ap_materno"].ToString();

            DataSet datosSocios = objHM.getHistorialMedicoById(Convert.ToInt32(Session["Row"].ToString()));
            txtMedicos.Text = datosSocios.Tables[0].Rows[0]["descripcion"].ToString();
            datosSocios = objHF.getHistorialFisicoById(Convert.ToInt32(Session["Row"].ToString()));
            txtFisicos.Text = datosSocios.Tables[0].Rows[0]["descripcion"].ToString();
            datosSocios = objSM.getSocioMembresiaPaqueteById(Convert.ToInt32(Session["Row"].ToString()));
            ddlPaquete.SelectedIndex = Convert.ToInt32(datosSocios.Tables[0].Rows[0]["id_paquete"].ToString());

            
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
            int idSocio = 0;
            int satisfactorio = objU.addSocios(txtNumero.Text, txtNombre.Text, txtApPaterno.Text, txtApMaterno.Text, txtTelefono.Text, txtDireccion.Text, txtFecha.Text, ref idSocio);
            if (idSocio == 0)
            {
                popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                satisfactorio = objHF.addHistorialFisico(idSocio, txtFisicos.Text);
                if (satisfactorio == 1)
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                satisfactorio = objHM.addHistorialMedico(idSocio, txtFisicos.Text);
                if (satisfactorio == 1)
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                satisfactorio = objSM.addSocioMembresia(idSocio, Convert.ToInt32(ddlPaquete.SelectedItem.Value));
                if (satisfactorio == 1)
                {
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                }
                else
                {
                    popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
                }
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
            int idSocio = Convert.ToInt32(Session["Row"].ToString());
            int satisfactorio = objU.updtSocios(idSocio,txtNumero.Text, txtNombre.Text, txtApPaterno.Text, txtApMaterno.Text, txtTelefono.Text, txtDireccion.Text, txtFecha.Text, Convert.ToInt32(ddlEstado.SelectedIndex) == 2 ? 0 : 1);
            if (idSocio == 0)
            {
                popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                satisfactorio = objHF.updtHistorialFisico(idSocio, txtFisicos.Text, Convert.ToInt32(ddlEstado.SelectedIndex) == 2 ? 0 : 1);
                if (satisfactorio == 1)
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                satisfactorio = objHM.updtHistorialMedico(idSocio, txtFisicos.Text, Convert.ToInt32(ddlEstado.SelectedIndex) == 2 ? 0 : 1);
                if (satisfactorio == 1)
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                satisfactorio = objSM.updtSocioMembresia(idSocio, Convert.ToInt32(ddlPaquete.SelectedItem.Value), Convert.ToInt32(ddlEstado.SelectedIndex) == 2 ? 0 : 1);
                if (satisfactorio == 1)
                {
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                }
                else
                {
                    popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
                }
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
            int idSocio = Convert.ToInt32(Session["Row"].ToString());
            int satisfactorio = objU.updtSocios(idSocio, txtNumero.Text, txtNombre.Text, txtApPaterno.Text, txtApMaterno.Text, txtTelefono.Text, txtDireccion.Text, txtFecha.Text, Convert.ToInt32(ddlEstado.SelectedIndex) == 2 ? 0 : 2);
            if (idSocio == 0)
            {
                popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                satisfactorio = objHF.updtHistorialFisico(idSocio, txtFisicos.Text, Convert.ToInt32(ddlEstado.SelectedIndex) == 2 ? 0 : 2);
                if (satisfactorio == 1)
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                satisfactorio = objHM.updtHistorialMedico(idSocio, txtFisicos.Text, Convert.ToInt32(ddlEstado.SelectedIndex) == 2 ? 0 : 2);
                if (satisfactorio == 1)
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                satisfactorio = objSM.updtSocioMembresia(idSocio, Convert.ToInt32(ddlPaquete.SelectedItem.Value), Convert.ToInt32(ddlEstado.SelectedIndex) == 2 ? 0 : 2);
                if (satisfactorio == 1)
                {
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                }
                else
                {
                    popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
                }
            }
            cargaSocio();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnConPago_Click(object sender, EventArgs e)
        {
            int idSocio = Convert.ToInt32(Session["Row"].ToString());
            int satisfactorio = objU.updtSocios(Convert.ToInt32(Session["Row"].ToString()), txtNumero.Text, txtNombre.Text, txtApPaterno.Text, txtApMaterno.Text, txtTelefono.Text, txtDireccion.Text, txtFecha.Text, Convert.ToInt32(ddlEstado.SelectedItem.Value) == 2 ? 0 : 2);
            if (satisfactorio == 1)
            {
                popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                //satisfactorio = objHF.updtHistorialFisico(idSocio, txtFisicos.Text, Convert.ToInt32(ddlEstado.SelectedItem.Value) == 2 ? 0 : 2);
                //satisfactorio = objHM.updtHistorialMedico(idSocio, txtFisicos.Text, Convert.ToInt32(ddlEstado.SelectedItem.Value) == 2 ? 0 : 2);
                //popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
            }
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
            int idSocio = Convert.ToInt32(Session["Row"].ToString());
            int satisfactorio = objHF.DelHistorialFisico(idSocio);
            satisfactorio = objHM.DelHistorialMedico(idSocio);
            satisfactorio = objSM.DelSocioMembresia(idSocio, Convert.ToInt32(ddlPaquete.SelectedItem.Value));
            if (satisfactorio == 1)
            {
                popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                satisfactorio = objU.DelSocio(Convert.ToInt32(Session["Row"].ToString()));
                popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
            }
            cargaSocio();
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
            //this.popUpConsultaHistorial.ShowOnPageLoad = false;
            this.popUpEliminarSocio.ShowOnPageLoad = false;
        }
    }
}