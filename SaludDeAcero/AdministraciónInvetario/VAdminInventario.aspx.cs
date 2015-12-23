using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;
using System.Drawing;

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
            Response.AddHeader("Refresh", Convert.ToString((Session.Timeout * 60) + 5));
            if (Session["Usuario"] == null)
            {
                Session.Abandon();
                Response.Cookies.Add(new HttpCookie("ASP.NET_SessionId", ""));
                Response.Redirect("~/Login.aspx");
            }
            if (!IsPostBack)
            {
                cargaProductos();
                btnModificarProducto.Visible = false;
                btnEliminarProducto.Visible = false;
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
        // carga y los muestra en el Grid
        protected void cargaProducto()
        {
            DataSet datos = objE.getProductosGrid();
            grdProductos.DataSource = datos;
            grdProductos.DataBind();
            grdProductos.KeyFieldName = "id_producto";
        }
        // selecciona los datos en el grid
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
            this.popVenta.ShowOnPageLoad = false;
            this.popEliminarProducto.ShowOnPageLoad = false;
            this.popEliminarProducto.ShowOnPageLoad = false;
            this.PopupControlInvetarioEntrada.ShowOnPageLoad = false;
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
            producto = ob.getEmpleadoById(Convert.ToInt32(ddlProducto.SelectedItem.Value));
            //popup Ventas
            txtVentaNombre.Text = producto.Tables[0].Rows[0]["nombre"].ToString();
            TxtFechaVenta.Text = DateTime.Now.ToShortDateString();
            TxtVentaDescripcion.Text = producto.Tables[0].Rows[0]["descripcion"].ToString();
            txtVentaCosto.Text = producto.Tables[0].Rows[0]["costo"].ToString();
            txtVentaCantidad.Text = producto.Tables[0].Rows[0]["existencia"].ToString();
            txtTotalVenta.Text = (Convert.ToDecimal(txtVentaCosto.Text) * Convert.ToDecimal(txtVentaCantidad.Text)).ToString();
        }
    }
}
