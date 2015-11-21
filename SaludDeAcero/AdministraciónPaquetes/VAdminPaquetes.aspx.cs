/*''=============================================
'' Autor:	Gilberto Adame
'' Modificado por: Faleg A. Peralta
'' Fecha de Modificación: 06.10.2015
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

namespace Sisa
{
    public partial class DiseñoPaqueta : System.Web.UI.Page
    {
        N_Paquete objU = new N_Paquete();

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
                cargaPaquetes();
                btnModificarPaquete.Visible = false;
                btnctrlServicios.Visible = false;
                btnEliminarPaquete.Visible = false;
            }
        }

        /// <summary>
        /// Evento que muestra el Dialog para dar de alta el Paquete
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAgregarPaquete_Click(object sender, EventArgs e)
        {
            this.popUpEditarPaquete.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = true;
            btnEliminarCambios.Visible = false;
        }

        /// <summary>
        /// Evento que muestra el Dialog para cancelar las acciones
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.popUpEditarPaquete.ShowOnPageLoad = false;
        }

        /// <summary>
        /// Evento que muestra el Dialog para Actualizar el Paquete
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnModificarPaquete_Click(object sender, EventArgs e)
        {
            this.popUpEditarPaquete.ShowOnPageLoad = true;
            btnGuardar.Visible = false;
            btnActualizar.Visible = true;
            btnEliminarCambios.Visible = false;
        }

        /// <summary>
        /// Evento que muestra el Dialog para dar de alta los servicios
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnctrlServicios_Click(object sender, EventArgs e)
        {

        }

        /// <summary>
        /// Evento que muestra el Dialog para Eliminar el Paquete
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarPaquete_Click(object sender, EventArgs e)
        {
            this.popUpEditarPaquete.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = false;
            btnEliminarCambios.Visible = true;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            string mensaje = "";
            int satisfactorio = objU.addPaquetes(txtNombrePaquete.Text, txtdescripcionPaquete.Text, txtCosto.Text, "3");
            if (satisfactorio == 1)
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
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            string mensaje = "";
            int satisfactorio = objU.updtPaquete(Convert.ToInt32(Session["Row"].ToString()),txtNombrePaquete.Text, txtdescripcionPaquete.Text, txtCosto.Text, "1",true);
            if (satisfactorio == 1)
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
        }

        /// <summary>
        /// Cancela la Eliminación del Paquete
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelarEliminar_Click(object sender, EventArgs e)
        {
            popUpEliminarPaquete.ShowOnPageLoad = false;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarCambios_Click(object sender, EventArgs e)
        {
            string mensaje = "";
            int satisfactorio = objU.updtPaquete(Convert.ToInt32(Session["Row"].ToString()), txtNombrePaquete.Text, txtdescripcionPaquete.Text, txtCosto.Text, Session["Usuario"].ToString(), false);
            if (satisfactorio == 1)
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
        }

        /// <summary>
        /// Llenado de Usuario
        /// </summary>
        protected void cargaPaquetes()
        {
            DataSet datosEmpleados = objU.getPaqueteGrid();
            grdPaquetes.DataSource = datosEmpleados;
            grdPaquetes.DataBind();
            grdPaquetes.KeyFieldName = "id_paquete";
        }
        /// <summary>
        /// Permite la edicion del usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdPaquetes_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            object id = e.KeyValue;
            Session["Row"] = id;
            LinkButton opLinkButton = (LinkButton)e.CommandSource;
            if (opLinkButton.Text == "Seleccionar")
            {
                DataSet datosEmpleados = objU.getPaqueteById(Convert.ToInt32(id));
                setDatosEmpleado(datosEmpleados);
                btnModificarPaquete.Visible = true;
                btnctrlServicios.Visible = false;
                btnEliminarPaquete.Visible = true;
            }
        }

        /// <summary>
        /// Pone los datos del empleado seleccionado
        /// </summary>
        protected void setDatosEmpleado(DataSet empleado)
        {
            //Modificación popUP
            txtNombrePaquete.Text = empleado.Tables[0].Rows[0]["Nombre"].ToString();
            txtCosto.Text = empleado.Tables[0].Rows[0]["Apellido_Pat"].ToString();
            txtdescripcionPaquete.Text = empleado.Tables[0].Rows[0]["Apellido_Mat"].ToString();
            //Eliminacion popUP
            txtNombrePaquete.Text = empleado.Tables[0].Rows[0]["Nombre"].ToString();
            txtCosto.Text = empleado.Tables[0].Rows[0]["Apellido_Pat"].ToString();
            txtdescripcionPaquete.Text = empleado.Tables[0].Rows[0]["Apellido_Mat"].ToString();
        }

        /// <summary>
        /// Cambia el Color de la celda seleccionada
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdPaquetes_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            object id = e.KeyValue;
            if (id != null && Session["Row"] != null)
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
            grdPaquetesExporter.WriteRtfToResponse();
        }

        /// <summary>
        /// Exporta los datos a Word
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnExcel_Click(object sender, EventArgs e)
        {
            grdPaquetesExporter.WriteXlsToResponse();
        }

        /// <summary>
        /// Exporta los datos a PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnPDF_Click(object sender, EventArgs e)
        {
            grdPaquetesExporter.WritePdfToResponse();
        }

        /// <summary>
        /// Permite la busqueda y el paginado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdPaquetes_Load(object sender, EventArgs e)
        {
            cargaPaquetes();
        }

    }
}