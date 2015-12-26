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
    public class N_Venta
    {
        private int transSucess = 0;

        private string addVenta = "add_venta";
        private string getVenta = "sel_venta";
        private string getVentaXId = "sel_byId_venta";
        private string updVenta = "upd_venta";
        private string delVenta = "del_venta";
        private string spAllVenta= "sel_Allventaproducto";

        /// <summary>
        /// Obtiene todas las ventas y regresa un dataSet
        /// </summary>
        /// <returns></returns>
        public DataSet getAllVentas()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(spAllVenta, "TblVenta", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene todos las ventas de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getVentas()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getVenta, "TblVenta", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene la informacion de una venta especifica
        /// </summary>
        /// <param name="idVenta"></param>
        /// <param name="idProductos"></param>
        /// <returns></returns>
        public DataSet getVentaById(int idVenta, int idProducto)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@id_venta", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idVenta);
                transSucess = obj.getDataFromSP(delVenta, param, "TblVenta", datos);
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
        /// <param name="foliodiario"></param>
        /// <param name="total"></param>
        /// <param name="idEmpleado"></param>
        /// <returns></returns>
        public int AddVentas(int foliodiario, string total, int idEmpleado, ref int idVenta)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[3];
                param[0] = new SqlParameter("@folio_diario", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, foliodiario);
                param[1] = new SqlParameter("@total", SqlDbType.Decimal, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, total);
                param[2] = new SqlParameter("@id_empleado", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idEmpleado);
                transSucess = obj.getDataFromSP(addVenta, param, "TblVenta", datos);
                idVenta = Convert.ToInt32(datos.Tables[0].Rows[0]["id_venta"].ToString());
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
        public int updtVentas(int venta, int foliodiario, string total, int idEmpleado, int activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[6];
                param[0] = new SqlParameter("@id_venta", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, venta);
                param[1] = new SqlParameter("@folio_diario", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, foliodiario);
                param[2] = new SqlParameter("@fecha", SqlDbType.DateTime, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, DateTime.Now);
                param[3] = new SqlParameter("@total", SqlDbType.Decimal, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, total);
                param[4] = new SqlParameter("@id_empleado", SqlDbType.VarChar, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idEmpleado);
                param[5] = new SqlParameter("@activo", SqlDbType.VarChar, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updVenta, param, "TblVenta", datos);

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
        /// <returns></returns>
        public int DelVenta(int idVenta)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@id_venta", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idVenta);
                transSucess = obj.getDataFromSP(delVenta, param, "TblVenta", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }
    }
}
