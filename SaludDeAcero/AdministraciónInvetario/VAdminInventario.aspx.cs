﻿/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: Ticket socio
'' =============================================*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;
using System.Drawing;
using SaludDeAcero.AdministraciónPagos;

namespace Sisa.AdministraciónInvetario
{
    public partial class VAdminInventario : System.Web.UI.Page
    {
        N_Inventario objE = new N_Inventario();
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
                cargaProductos();
                btnModificarProducto.Visible = false;
                btnEliminarProducto.Visible = false;
                btnImprimir.Visible = false;
                lblEstado.Visible = false;
                ddlEstado.Visible = false;
            }
        }
        /// <summary>
        /// Evento que muestra el Dialog para dar de alta el Socio
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnAgregarProducto_Click(object sender, EventArgs e)
        {
            this.PopupControlInvetarioEntrada.ShowOnPageLoad = true;
            //Txttotal.Enabled = false;
            btnActualizar.Visible = false;
            btnGuardar.Visible = true;
            limpiarCampos();
            cargaProductos();
        }

        /// <summary>
        /// Llena el dropdown de los productos
        /// </summary>
        protected void cargaProductos()
        {
            DataSet datosPerfiles = objE.getAllProductos();
            this.ddlProducto.DataSource = datosPerfiles;
            this.ddlProducto.DataValueField = "Id_Producto";
            this.ddlProducto.DataTextField = "Nombre";
            this.ddlProducto.DataBind();
            this.ddlProducto.Items.Insert(0, new ListItem("Elija una Opcion..", "0"));
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            this.PopupControlInvetarioEntrada.ShowOnPageLoad = false;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnModificarProducto_Click(object sender, EventArgs e)
        {
            this.PopupControlInvetarioEntrada.ShowOnPageLoad = true;
            btnGuardar.Visible = false;
            btnActualizar.Visible = true;
            lblEstado.Visible = true;
            ddlEstado.Visible = true;
        }
        /// <summary>
        /// Guarda el producto en la bd
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            if (Valida())
            {
                Int32 informacion = 0;
                N_Inventario obj = new N_Inventario();
                informacion = obj.AddProducto(txtNombre.Text, TxtDescripcion.Text, Txtcosto.Text, Convert.ToInt32(Txtcantidad.Text), TxtClave.Text);
                if (informacion == 1)
                {
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                }
                else
                {
                    popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
                }
            }
        }

        /// <summary>
        /// Realiza la validaciones para verificar que los campos no vallan solos
        /// </summary>
        /// <returns></returns>
        public bool Valida()
        {

            if (txtNombre.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto de Agregar el Nombre del producto, El producto No fue agregado al Sitema');", true);
                return false;
            }

            if (TxtDescripcion.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto Agregar una descripcion del producto, El producto No fue agregado al Sitema');", true);
                return false;
            }


            if (Txtcosto.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto Agregar costo , El product del producto o No fue agregado al Sitema');", true);
                return false;
            }
            if (Txtcantidad.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto Agregar la cantidad del producto, El producto No fue agregado al Sitema');", true);
                return false;
            }
            return true;
        }
        /// <summary>
        /// carga y los muestra en el Grid
        /// </summary>
        protected void cargaProducto()
        {
            DataSet datos = objE.getProductosGrid();
            grdProductos.DataSource = datos;
            grdProductos.DataBind();
            grdProductos.KeyFieldName = "id_producto";
        }
        /// <summary>
        /// selecciona los datos en el grid
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdProductos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            object id = e.KeyValue;
            Session["Row"] = id;
            LinkButton opLinkButton = (LinkButton)e.CommandSource;
            if (opLinkButton.Text == "Seleccionar")
            {
                btnModificarProducto.Visible = true;
                DataSet datosEmpleados = objE.getProductosGrid();
                setDatosProducto(datosEmpleados);
                btnAgregarProducto.Visible = false;
                btnModificarProducto.Visible = true;
                btnEliminarProducto.Visible = true;
            }
            if (opLinkButton.Text == "Cancelar")
            {
                btnAgregarProducto.Visible = true;
                btnModificarProducto.Visible = false;
                btnEliminarProducto.Visible = false;
            }
        }

        /// <summary>
        /// manda llamar a carga usuario
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdProductos_Load(object sender, EventArgs e)
        {
            cargaProducto();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void grdProductos_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            object id = e.KeyValue;
            if (id != null && Session["Row"] != null)
            {
                if (Session["Row"].ToString() == id.ToString())
                    e.Row.BackColor = System.Drawing.Color.LightGray;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (Valida())
            {
                Int32 informacion = 0;
                N_Inventario obj = new N_Inventario();
                informacion = obj.updtInventario(Convert.ToInt32(Session["Row"].ToString()), txtNombre.Text, TxtDescripcion.Text, Txtcosto.Text, Txtcantidad.Text, TxtClave.Text, Convert.ToInt32(ddlEstado.SelectedIndex) == 2 ? 0 : 1);
                if (informacion == 1)
                {
                    popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
                    
                }
                else
                {
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                }
            }
            cargaProducto();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnEliminarProducto_Click(object sender, EventArgs e)
        {
            this.popEliminarProducto.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = false;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            if (Valida())
            {
                Int32 informacion = 0;
                N_Inventario ob = new N_Inventario();
                informacion = ob.DelProducto(Convert.ToInt32(Session["Row"].ToString()));
                if (informacion == 1)
                {
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                }
                else
                {
                    popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
                }
            }
            cargaProducto();

        }


        /// <summary>
        /// Metodo que limpia los txt del pop Agrega Producto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void BtnCancelarEliminacion_Click(object sender, EventArgs e)
        {

            this.popEliminarProducto.ShowOnPageLoad = false;
            limpiarCampos();
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnVentasProducto_Click(object sender, EventArgs e)
        {
            this.popVenta.ShowOnPageLoad = true;
        }

        /// <summary>
        /// Exporta el Grid a Word
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnWord_Click(object sender, EventArgs e)
        {
            grdProductosExporter.WriteRtfToResponse();
        }

        /// <summary>
        /// Exporta el Grid a Excel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnExcel_Click(object sender, EventArgs e)
        {
            grdProductosExporter.WriteXlsToResponse();
        }

        /// <summary>
        /// Exporta el Grid a PDF
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void lnkBtnPDF_Click(object sender, EventArgs e)
        {
            grdProductosExporter.WritePdfToResponse();
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
                    btnImprimir.Visible = true;
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
            this.popVenta.ShowOnPageLoad = false;
            this.popEliminarProducto.ShowOnPageLoad = false;
            this.popEliminarProducto.ShowOnPageLoad = false;
            this.PopupControlInvetarioEntrada.ShowOnPageLoad = false;
        }

        /// <summary>
        /// Limpia los controles de los datos obtenidos
        /// </summary>
        private void limpiarCampos()
        {
            //popup Agregar
            TxtClave.Text = "";
            txtNombre.Text = "";
            TxtDescripcion.Text = "";
            Txtcosto.Text = "";
            Txtcantidad.Text = "";
            //popup Eliminar
            TxteNombre.Text = "";
            TxteDescripcion.Text = "";
            TxteCosto.Text = "";
            TxteCantidad.Text = "";
        }

        /// <summary>
        /// Pone los datos del Prodcuto seleccionado
        /// </summary>
        protected void setDatosProducto(DataSet producto)
        {
            //popup Agregar
            txtNombre.Text = producto.Tables[0].Rows[0]["nombre"].ToString();
            TxtDescripcion.Text = producto.Tables[0].Rows[0]["descripcion"].ToString();
            Txtcosto.Text = producto.Tables[0].Rows[0]["costo"].ToString();
            Txtcantidad.Text = producto.Tables[0].Rows[0]["existencia"].ToString();
            TxtClave.Text = producto.Tables[0].Rows[0]["existencia"].ToString();
            if (Convert.ToBoolean(producto.Tables[0].Rows[0]["activo"]))
            {
                ddlEstado.SelectedIndex = 1;
            }
            else
            {
                ddlEstado.SelectedIndex = 2;
            }
            //popup Eliminar
            TxteNombre.Text = producto.Tables[0].Rows[0]["nombre"].ToString();
            TxteDescripcion.Text = producto.Tables[0].Rows[0]["descripcion"].ToString();
            TxteCosto.Text = producto.Tables[0].Rows[0]["costo"].ToString();
            TxteCantidad.Text = producto.Tables[0].Rows[0]["existencia"].ToString();

        }

        /// <summary>
        /// Carga los datos del producto seleccionado
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void ddlProducto_SelectedIndexChanged(object sender, EventArgs e)
        {
            DataSet producto = new DataSet();
            N_Inventario ob = new N_Inventario();
            producto = ob.getProductoById(Convert.ToInt32(ddlProducto.SelectedItem.Value));
            //popup Ventas
            txtVentaNombre.Text = producto.Tables[0].Rows[0]["nombre"].ToString();
            TxtFechaVenta.Text = DateTime.Now.ToShortDateString();
            TxtVentaDescripcion.Text = producto.Tables[0].Rows[0]["descripcion"].ToString();
            txtVentaCosto.Text = producto.Tables[0].Rows[0]["costo"].ToString();
            txtVentaCantidad.Text = "1";//producto.Tables[0].Rows[0]["existencia"].ToString();
            lblExistencias.Text = producto.Tables[0].Rows[0]["existencia"].ToString();
            txtTotalVenta.Text = (Convert.ToDecimal(txtVentaCosto.Text) * Convert.ToDecimal(txtVentaCantidad.Text)).ToString();
        }

        /// <summary>
        /// agrega los productos temporalmente al grid para realizar la venta
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnagregar_Click(object sender, EventArgs e)
        {
            //agregar
            DataTable dt;
            if (Session["datos"] == null)
            {
                dt = new DataTable();
                dt.Columns.Add(new DataColumn("Clave", typeof(String)));
                dt.Columns.Add(new DataColumn("IdProducto", typeof(String)));
                dt.Columns.Add(new DataColumn("Producto", typeof(String)));
                dt.Columns.Add(new DataColumn("Descripcion", typeof(String)));
                dt.Columns.Add(new DataColumn("Cantidad", typeof(Int32)));
                dt.Columns.Add(new DataColumn("Costo", typeof(Decimal)));
                dt.Columns.Add(new DataColumn("Total", typeof(Decimal)));
                dt.Columns.Add(new DataColumn("Subtotal", typeof(Decimal)));
                dt.Columns.Add(new DataColumn("Iva", typeof(String)));
                dt.Columns.Add(new DataColumn("id", typeof(Int32)));
                dt.PrimaryKey = new DataColumn[] { dt.Columns["id"] };

            }
            else
            {
                dt = Session["datos"] as DataTable;
            }

            DataRow drNewRow = dt.NewRow();
            drNewRow["Clave"] = this.txtVentaNombre.Text;
            drNewRow["IdProducto"] = ddlProducto.SelectedItem.Value;
            drNewRow["Producto"] = ddlProducto.SelectedItem.Text;
            drNewRow["Descripcion"] = this.TxtVentaDescripcion.Text;
            drNewRow["Cantidad"] = txtVentaCantidad.Text;
            drNewRow["Costo"] = txtVentaCosto.Text;
            if (drNewRow["Subtotal"] == null || drNewRow["Subtotal"].ToString() == "")
            {
                drNewRow["Total"] = (Convert.ToDecimal(txtVentaCosto.Text) * Convert.ToDecimal(txtVentaCantidad.Text)).ToString();
            }
            else
            {
                drNewRow["Total"] = (Convert.ToDecimal(drNewRow["Subtotal"].ToString()) * Convert.ToDecimal(txtVentaCantidad.Text)).ToString();
            }
            drNewRow["Subtotal"] = (Convert.ToDecimal(txtVentaCosto.Text) * Convert.ToDecimal(txtVentaCantidad.Text)).ToString();
            drNewRow["Iva"] = "16 %";
            if (drNewRow["id"] == null || drNewRow["id"].ToString() == "")
            {
                drNewRow["id"] = 1;
            }
            else
            {
                drNewRow["id"] = (1 + Convert.ToInt32(drNewRow["id"].ToString())).ToString();
            }

            dt.Rows.Add(drNewRow);
            Session["datos"] = dt;
            GVListaProductos.DataSource = dt;
            GVListaProductos.DataBind();
            GVListaProductos.KeyFieldName = "id";
        }

        /// <summary>
        /// Limpia los campos del popOut Ventas
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnLimpiain_Click(object sender, EventArgs e)
        {
            ddlProducto.SelectedIndex = 0;
            txtVentaNombre.Text = "";
            TxtFechaVenta.Text = "";
            TxtVentaDescripcion.Text = "";
            txtVentaCosto.Text = "0";
            txtVentaCantidad.Text = "0";//producto.Tables[0].Rows[0]["existencia"].ToString();
            txtTotalVenta.Text = "0";
        }

        /// <summary>
        /// ELimina el producto de la popOut de a venta
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GVListaProductos_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            object id = e.KeyValue;
            DataTable dt = Session["datos"] as DataTable;
            int idColumn = Convert.ToInt32(dt.Rows[0]["id"].ToString());
            LinkButton opLinkButton = (LinkButton)e.CommandSource;
            if (id != null || id.ToString() != "")
            {
                if (opLinkButton.Text == "Eliminar Producto")
                {
                    for (int i = 0; i < dt.Rows.Count; i++)
                    {
                        if (Convert.ToInt32(dt.Rows[i]["id"].ToString()) == idColumn)
                        {
                            dt.Rows[i].Delete();
                            GVListaProductos.DataSource = dt;
                            GVListaProductos.DataBind();
                        }
                    }
                }
            }
        }

        /// <summary>
        /// Guarda en la Base de datos la venta del producto.
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnRealizarVenta_Click(object sender, EventArgs e)
        {
            Int32 informacion = 0;
            N_Venta objV = new N_Venta();
            N_VentaProducto objVP = new N_VentaProducto();
            DataTable dt = Session["datos"] as DataTable;
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Int32 idVenta = 0;
                informacion = objV.AddVentas(Convert.ToInt32(DateTime.Now.ToShortDateString().Replace("/", "")), dt.Rows[i]["Total"].ToString(),  Convert.ToInt32(Session["Id_Usuario"].ToString()),ref idVenta);
                if (informacion == 1)
                {
                    informacion = objVP.AddVentaProducto(idVenta, Convert.ToInt32(dt.Rows[i]["IdProducto"].ToString()), Convert.ToInt32(dt.Rows[i]["Cantidad"].ToString()));
                    popUpMensajeAplicacion(1, "Información guardada con éxito; =)");
                    Session["idVenta"] = idVenta.ToString();
                    Session["datosTemp"] = Session["datos"];
                }
                else
                {
                    popUpMensajeAplicacion(2, "Se presentó un problema al guardar la información, Por Favor revisa e intenta de nuevo; =(");
                }

            }
            DataTable tempTable = new DataTable();
            GVListaProductos.DataSource = tempTable;
            GVListaProductos.DataBind();
            ddlProducto.SelectedIndex = 0;
            txtVentaNombre.Text = "";
            TxtFechaVenta.Text = "";
            TxtVentaDescripcion.Text = "";
            txtVentaCosto.Text = "0";
            txtVentaCantidad.Text = "0";//producto.Tables[0].Rows[0]["existencia"].ToString();
            txtTotalVenta.Text = "0";
            Session["datos"] = null;
        }

        /// <summary>
        /// Calcula el total de los Productos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GVListaProductos_CustomUnboundColumnData(object sender, DevExpress.Web.ASPxGridViewColumnDataEventArgs e)
        {
            if (e.Column.FieldName == "Total")
            {
                decimal price = (decimal)e.GetListSourceFieldValue("Costo");
                int quantity = Convert.ToInt32(e.GetListSourceFieldValue("Cantidad"));
                e.Value = price * quantity;
            }
            if (e.Column.FieldName == "IVA")
            {
                e.Value = "IVA 16 %";
            }
        }

        /// <summary>
        /// Imprime Ticket de Venta
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnImprimir_Click(object sender, EventArgs e)
        {
            TicketInventario obj = new TicketInventario();
            obj.imprimirTiket(Session["idVenta"].ToString(), Session["Nombre"].ToString(), Session["datosTemp"] as DataTable);
        }
    }
}
