/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: CRUD de Pago
'' =============================================*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CapaDatos;

namespace Negocio
{
    class N_VentaProducto
    {
        private int transSucess = 0;

        private string addVentaProducto = "add_venta_producto";
        private string getVentaProducto = "sel_venta_producto";
        private string getVentaProductoXId = "sel_byId_venta_producto";
        private string updVentaproducto = "upd_venta_producto";
        private string delVentaProducto = "del_venta_producto";
        private string spAllVentaProduto = "sel_Allventaproducto";

        /// <summary>
        /// Obtiene todos los perfiles y regresa un dataSet
        /// </summary>
        /// <returns></returns>
        public DataSet getAllVentaProductos()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(spAllVentaProduto, "TblVentaProducto", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene todos los empleados de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getVentaProductosGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getVentaProducto, "TblVentaProducto", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene la informacion de una venta especifica
        /// </summary>
        /// <param name="idVenta"></param>
        /// <param name="idProductos"></param>
        /// <returns></returns>
        public DataSet getVentaProductosById(int idVenta,int idProducto)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[2];
            try
            {
                param[0] = new SqlParameter("@id_venta", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idVenta);
                param[1] = new SqlParameter("@id_producto", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idProducto);
                transSucess = obj.getDataFromSP(getVentaProductoXId, param, "TblVentaProducto", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// agrega los ventas a la bd
        /// </summary>
        /// <param name="idVenta"></param>
        /// <param name="idProducto"></param>
        /// <param name="cantidad"></param>
        /// <returns></returns>
        public int AddVentaProducto(int idVenta, string idProducto, int cantidad)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[3];
                param[0] = new SqlParameter("@id_venta", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idVenta);
                param[1] = new SqlParameter("@id_producto", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idProducto);
                param[2] = new SqlParameter("@cantidad", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, cantidad);
                transSucess = obj.getDataFromSP(addVentaProducto, param, "TblVentaProducto", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }


        /// <summary>
        /// Actualiza la información de una venta
        /// </summary>
        /// <param name="venta"></param>
        /// <param name="id_producto"></param>
        /// <param name="cantidad"></param>
        /// <param name="activo"></param>
        /// <returns></returns>
        public int updtInventario(int venta,int id_producto, int cantidad,int activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[4];
                param[0] = new SqlParameter("@id_venta", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ven);
                param[1] = new SqlParameter("@id_producto", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_producto);
                param[2] = new SqlParameter("@cantidad", SqlDbType.VarChar, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, cantidad);
                param[3] = new SqlParameter("@activo", SqlDbType.VarChar, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updVentaproducto, param, "TblVentaProducto", datos);

            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }

        /// <summary>
        ///  Elimina el venta de la bd
        /// </summary>
        /// <param name="idVenta"></param>
        /// <param name="idProducto"></param>
        /// <returns></returns>
        public int DelVentaProducto(int idVenta,int idProducto)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[2];
            try
            {
                param[0] = new SqlParameter("@id_venta", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idVenta);
                param[1] = new SqlParameter("@id_producto", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idProducto);
                transSucess = obj.getDataFromSP(delVentaProducto, param, "TblVentaProducto", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }


    }
}
