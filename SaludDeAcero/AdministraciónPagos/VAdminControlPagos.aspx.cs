/*''=============================================
'' Autor:	Gilberto Adame
'' Modificado por: Faleg A. Peralta
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: Valida el Inicio de Session
'' =============================================*/
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sisa
{
    public partial class ControlPagos : System.Web.UI.Page
    {
        N_Paquete objPa = new N_Paquete();
        N_Pago objp = new N_Pago();
        N_PagoRecargo objPR = new N_PagoRecargo();
        N_Recargo objR = new N_Recargo();
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
                cargaPagos();
                cargaPaquetes();
                btnModificarPago.Visible = false;
                btnEliminarPago.Visible = false;
            }
        }

        /// <summary>
        /// Muestra el popUp para realizar los pagos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAgregarPago_Click(object sender, EventArgs e)
        {
            this.popUpRegistrar.ShowOnPageLoad = true;
            limpiarCampos();
        }

        /// <summary>
        /// Muestra el popUp para modificar los pagos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnModificarPago_Click(object sender, EventArgs e)
        {
            this.popUpRegistrar.ShowOnPageLoad = true;
        }


        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarPago_Click(object sender, EventArgs e)
        {
            popupcontrolConsultaPagos.ShowOnPageLoad = true;
        }

        /// <summary>
        /// Cancela la agregacion de pagos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.popUpRegistrar.ShowOnPageLoad = false;
        }

        /// <summary>
        /// Guarda un nuevo pago en la BD
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            int idPago = 0,idRecargo = 0;
            int satisfactorio = objp.addPagos(Convert.ToInt32(ddlPaquete.SelectedItem.Value), Convert.ToInt32(txtNumero.Text), Convert.ToInt32(Session["Id_Usuario"].ToString()), Convert.ToInt32(txtTotalRecibido.Text), ref idPago);
            if (idPago == 0)
            {
                popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                satisfactorio = objR.addRecargos(Convert.ToInt32(ddlPaquete.SelectedItem.Value), Convert.ToInt32(txtNumero.Text), false, Convert.ToInt32(txtTotalRecibido.Text), ref idRecargo);
                if (satisfactorio == 1)
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                satisfactorio = objPR.addPagoRecargo(idPago, idRecargo);
                if (satisfactorio == 1)
                {
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                }
                else
                {
                    popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
                }
            }
            cargaPagos();
        }

        /// <summary>
        /// Modifica un nuevo pago en la BD
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            int idPago = 0, idRecargo = 0;
            int satisfactorio = objp.updtPagos(Convert.ToInt32(ddlPaquete.SelectedItem.Value), Convert.ToInt32(txtNumero.Text), Convert.ToInt32(Session["Id_Usuario"].ToString()), Convert.ToInt32(txtTotalRecibido.Text), Convert.ToInt32(ddlEstado.SelectedIndex) == 2 ? 0 : 1);
            if (idPago == 0)
            {
                popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
            }
            else
            {
                satisfactorio = objR.updtRecargos(idRecargo,Convert.ToInt32(ddlPaquete.SelectedItem.Value), Convert.ToInt32(txtNumero.Text), true, Convert.ToInt32(txtTotalRecibido.Text), Convert.ToInt32(ddlEstado.SelectedIndex) == 2 ? 0 : 1);
                if (satisfactorio == 1)
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                satisfactorio = objPR.updtPagoRecargo(idRecargo,idPago, idRecargo, Convert.ToInt32(ddlEstado.SelectedIndex) == 2 ? 0 : 1);
                if (satisfactorio == 1)
                {
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                }
                else
                {
                    popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
                }
            }
            cargaPagos();
        }


        /// <summary>
        /// Llenado de Usuario
        /// </summary>
        protected void cargaPagos()
        {
            DataSet datosPagos = objp.getPagoGrid();
            grdPagos.DataSource = datosPagos;
            grdPagos.DataBind();
            grdPagos.KeyFieldName = "id_pago";
        }

        /// <summary>
        /// Llena el dropdown de los paquetes
        /// </summary>
        protected void cargaPaquetes()
        {
            DataSet datosPerfiles = objPa.getAllPaquetes();
            this.ddlPaquete.DataSource = datosPerfiles;
            this.ddlPaquete.DataValueField = "Id_Paquete";
            this.ddlPaquete.DataTextField = "Nombre";
            this.ddlPaquete.DataBind();
            this.ddlPaquete.Items.Insert(0, new ListItem("Elija una Opcion..", "0"));
        }


        /// <summary>
        /// Permite la edicion del usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdPagos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            object id = e.KeyValue;
            Session["Row"] = id;
            LinkButton opLinkButton = (LinkButton)e.CommandSource;
            if (opLinkButton.Text == "Seleccionar")
            {
                //DataSet datosEmpleados = objU.getPaqueteById(Convert.ToInt32(id));
                //setDatosEmpleado(datosEmpleados);
                //btnAgregarPaquete.Visible = false;
                //btnModificarPaquete.Visible = true;
                //btnctrlServicios.Visible = false;
                //btnEliminarPaquete.Visible = true;
            }
            if (opLinkButton.Text == "Cancelar")
            {
                //btnAgregarPaquete.Visible = true;
                //btnModificarPaquete.Visible = false;
                //btnctrlServicios.Visible = false;
                //btnEliminarPaquete.Visible = false;
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
        /// Limpia los controles de los datos obtenidos
        /// </summary>
        private void limpiarCampos()
        {
            //popup Agregar
            txtNumero.Text = "";
            txtNombre.Text = "";
            txtApPaterno.Text = "";
            txtApMaterno.Text = "";
            txtFecha.Text = "";
            ddlPaquete.SelectedItem.Value = "";
            txtAdeudos.Text = "";
            txtTotalPagar.Text = "";
            txtTotalRecibido.Text = "";
        }


        /// <summary>
        /// Pone los datos del empleado seleccionado
        /// </summary>
        protected void setDatosEmpleado(DataSet pagos)
        {
            //Modificación popUP
            txtNumero.Text = pagos.Tables[0].Rows[0]["Numero"].ToString();
            txtNombre.Text = pagos.Tables[0].Rows[0]["Nombre"].ToString();
            txtApPaterno.Text = pagos.Tables[0].Rows[0]["Ap_Paterno"].ToString();
            txtApMaterno.Text = pagos.Tables[0].Rows[0]["Ap_Paterno"].ToString();
            txtFecha.Text = DateTime.Now + pagos.Tables[0].Rows[0]["dias"].ToString();
            ddlPaquete.SelectedIndex = Convert.ToInt32(pagos.Tables[0].Rows[0]["id_paquete"].ToString());
            txtAdeudos.Text = pagos.Tables[0].Rows[0]["Adeudos"].ToString();
            txtTotalPagar.Text = pagos.Tables[0].Rows[0]["Adeudos"].ToString();
            txtTotalRecibido.Text = pagos.Tables[0].Rows[0]["Adeudos"].ToString();
            ////Eliminacion popUP
            //txtNombrePaqueteEliminar.Text = empleado.Tables[0].Rows[0]["Nombre"].ToString();
            //txtCostoEliminar.Text = empleado.Tables[0].Rows[0]["Costo"].ToString();
            //txtDiasPaquete.Text = empleado.Tables[0].Rows[0]["diaspaquetes"].ToString();
            //txtdescripcionPaqueteEliminar.Text = empleado.Tables[0].Rows[0]["Descripcion"].ToString();
        }

        /// <summary>
        /// Cambia el Color de la celda seleccionada
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdPagos_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            object id = e.KeyValue;
            if (id != null && Session["Row"] != null)
            {
                if (Session["Row"].ToString() == id.ToString())
                    e.Row.BackColor = System.Drawing.Color.LightGray;
            }
        }

        /// <summary>
        /// Exporta los datos a Word
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnWord_Click(object sender, EventArgs e)
        {
            //grdEmpleadosExporter.ReportHeader = headerExporter().ToString();
            grdPagosExporter.WriteRtfToResponse();
        }

        /// <summary>
        /// Exporta los datos a Excel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnExcel_Click(object sender, EventArgs e)
        {
            grdPagosExporter.WriteXlsToResponse();
        }

        /// <summary>
        /// Exporta los datos a PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnPDF_Click(object sender, EventArgs e)
        {
            grdPagosExporter.WritePdfToResponse();
        }

        /// <summary>
        /// Permite la busqueda y el paginado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdPagos_Load(object sender, EventArgs e)
        {
            cargaPagos();
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
            this.popupcontrolConsultaPagos.ShowOnPageLoad = false;
        }


    }
}