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
    public class N_Inventario
    {
        private int transSucess = 0;

        private string addProducto = "add_producto";
        private string getProducto = "sel_producto";
        private string getProductoXId = "sel_byId_producto";
        private string updproducto = "upd_producto";
        private string delProducto = "del_producto";
        private string spAllProduto = "sel_Allproducto";

        /// <summary>
        /// Obtiene todos los perfiles y regresa un dataSet
        /// </summary>
        /// <returns></returns>
        public DataSet getAllProductos()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(spAllProduto, "TblProducto", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene todos los empleados de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getProductosGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getProducto, "TblProducto", datos);
            return datos;
        }


        /// <summary>
        /// Obtiene  la información de un empleado y la muestra en el pop 
        /// </summary>
        /// <param name="idEmpleado"></param>
        /// <returns></returns>
        public DataSet getEmpleadoById(int idEmpleado)
        {
            DataSet datos = new DataSet();
            try
            {
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_producto", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idEmpleado);
                transSucess = obj.getDataFromSP(getProductoXId, param, "TblProducto", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// agrega los Productos a la bd
        /// </summary>
        /// <param name="nombre"></param>
        /// <param name="descripcion"></param>
        /// <param name="costo"></param>
        /// <param name="existencia"></param>
        /// <param name="clave"></param>
        /// <returns></returns>
        public int AddProducto(string nombre, string descripcion, string costo, int existencia,string clave)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[5];
                param[0] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[1] = new SqlParameter("@descripcion", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, descripcion);
                param[2] = new SqlParameter("@costo", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, costo);
                param[3] = new SqlParameter("@existencia", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, existencia);
                param[4] = new SqlParameter("@clave", SqlDbType.VarChar, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, clave);
                transSucess = obj.getDataFromSP(addProducto, param, "TblProducto", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }


        /// <summary>
        /// modifica un producto
        /// </summary>
        /// <param name="id_producto"></param>
        /// <param name="nombre"></param>
        /// <param name="descripcion"></param>
        /// <param name="costo"></param>
        /// <param name="existencia"></param>
        /// <param name="clave"></param>
        /// <param name="activo"></param>
        /// <returns></returns>
        public int updtInventario(int id_producto, string nombre, string descripcion, string costo, string existencia, string clave,int activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[7];
                param[0] = new SqlParameter("@id_producto", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_producto);
                param[1] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[2] = new SqlParameter("@descripcion", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, descripcion);
                param[3] = new SqlParameter("@costo", SqlDbType.Decimal, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, costo);
                param[4] = new SqlParameter("@existencia", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, existencia);
                param[5] = new SqlParameter("@clave", SqlDbType.VarChar, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, clave);
                param[6] = new SqlParameter("@activo", SqlDbType.VarChar, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updproducto, param, "TblProducto", datos);

            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }

        /// <summary>
        /// Elimina el producto de la bd
        /// </summary>
        /// <param name="idproducto"></param>
        /// <returns></returns>
        public int DelProducto(int idproducto)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[1];
            try
            {              
                param[0] = new SqlParameter("@id_producto", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idproducto);//tenia idEmpleado??
                transSucess = obj.getDataFromSP(delProducto, param, "TblProducto", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }


    }
}
