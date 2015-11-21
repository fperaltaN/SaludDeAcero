using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Negocio;

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
               // btnModificarProducto.Visible = false;
                //btnVenderProducto.Visible = false;
                
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
            Limpia();
            Txttotal.Enabled = false;
            btnActualizar.Visible = false;
            btnGuardar.Visible = true;
        }
        // btn cancela agregar del producto
        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            //pop borrar
            this.PopupControlInvetarioEntrada.ShowOnPageLoad = false;
            Limpia();
        }

        protected void btnModificarProducto_Click(object sender, EventArgs e)
        {
           this.PopupControlInvetarioEntrada.ShowOnPageLoad = true;
           btnGuardar.Visible = false;
           btnActualizar.Visible = true;
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
                informacion = obj.AddProducto(txtNombre.Text, TxtDescripcion.Text,  Txtcosto.Text, Convert.ToInt32(Txtcantidad.Text));
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert(' Producto Agregado correctamente');", true);
            PopupControlInvetarioEntrada.ShowOnPageLoad = false;
        }
        public bool Valida()
        {

            if (TxteNombre.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto de Agregar el Nombre del producto, El producto No fue agregado al Sitema');", true);
                return false;
            }

            if (TxtDescripcion.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto Agregar una descripcion del producto, El producto No fue agregado al Sitema');", true);
                return false;
            }


            if (TxteCosto.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto Agregar costo , El product del producto o No fue agregado al Sitema');", true);
                return false;
            }
            if (Txtcantidad.Text == "")
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert('Falto Agregar la cantidad del producto, El producto No fue agregado al Sitema');", true);
                return false;
            }



            return  true;
        }
        // carga y los muestra en el Grid
        protected void cargaUsuarios()
        {
            DataSet datos = objE.getProductosGrid();
            ASPxGridView1.DataSource = datos;
            ASPxGridView1.DataBind();
            ASPxGridView1.KeyFieldName = "id_producto";
        }
        // selecciona los datos en el grid
        protected void ASPxGridView1_RowCommand(object sender, DevExpress.Web.ASPxGridViewRowCommandEventArgs e)
        {
            object id = e.KeyValue;
            Session["Row"] = id;
            LinkButton opLinkButton = (LinkButton)e.CommandSource;
            if (opLinkButton.Text == "Seleccionar")
            {
                btnModificarProducto.Visible = true;
                DataSet datosEmpleados = objE.getProductosGrid();
                setDatosEmpleado(datosEmpleados);
                //btnActualizar.Visible = true;
             }

            txtNombre.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "nombre").ToString();
           TxteNombre.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "nombre").ToString();
            
            TxtDescripcion.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "descripcion").ToString();
            TxteDescripcion.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "descripcion").ToString();

            Txtcosto.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "costo").ToString();
            TxteCosto.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "costo").ToString();

            Txtcantidad.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "existencia").ToString();
            TxteCantidad.Text = ASPxGridView1.GetRowValuesByKeyValue(e.KeyValue, "existencia").ToString();


          
        }

        protected void setDatosEmpleado(DataSet empleado)
        {
            //  txtNombre.Text = e.KeyValue.ToString();

            //txtNombre.Text = GridViewRegistroEmpleados.GetRowValuesByKeyValue(e.KeyValue, "nombre").ToString();
            //txtNombre.Text = empleado.Tables[0].Rows[0]["nombre"].ToString();

        }
        
        //manda llamar a carga usuario
        protected void ASPxGridView1_Load(object sender, EventArgs e)
        {
            cargaUsuarios();
        }

        protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridViewTableRowEventArgs e)
        {
            object id = e.KeyValue;
            if (id != null && Session["Row"] != null)
            {
                if (Session["Row"].ToString() == id.ToString())
                    e.Row.BackColor = System.Drawing.Color.LightGray;
            }
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            if (Valida())
            {
                Int32 informacion = 0;
                N_Inventario obj = new N_Inventario();
                informacion = obj.updtInventario(Convert.ToInt32(Session["Row"].ToString()),  txtNombre.Text, TxtDescripcion.Text, Txtcosto.Text, Txtcantidad.Text);
             } 
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert(' El producto fue modificado correctamente');", true);
            Limpia();
            this.PopupControlInvetarioEntrada.ShowOnPageLoad = false;
        }

        protected void btnEliminarProducto_Click(object sender, EventArgs e)
        {
            this.popEliminarProducto.ShowOnPageLoad = true;
            btnActualizar.Visible = false;
            btnGuardar.Visible = false;
        }

        protected void BtnEliminar_Click(object sender, EventArgs e)
        {
            if (Valida())
            {
                Int32 informacion = 0;
                N_Inventario ob = new N_Inventario();
                informacion = ob.DelProducto(Convert.ToInt32(Session["Row"].ToString()));
            }
            ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns", "alert(' El produto fue eliminado correctamente');", true);
            LimpiaBorrar();           
            this.popEliminarProducto.ShowOnPageLoad = false;

        }


        //Metodo que limpia los txt del pop Agrega Producto

        public void Limpia()
        {
            txtNombre.Text = "";
            Txtcantidad.Text = "";
            Txtcosto.Text = "";
            TxtDescripcion.Text = "";
            Txttotal.Text = "";

        }
        //Metodo Limpia txt del Pop Borrar Producto
        public void LimpiaBorrar()
        {
            TxteCantidad.Text = "";
            TxteCosto.Text = "";
            TxteDescripcion.Text = "";
            TxteNombre.Text = "";
             
        }

        protected void BtnCancelarEliminacion_Click(object sender, EventArgs e)
        {

            this.popEliminarProducto.ShowOnPageLoad = false;
            LimpiaBorrar();
        }

        protected void btnVentasProducto_Click(object sender, EventArgs e)
        {
            this.popVenta.ShowOnPageLoad = true;
        }


    }
}