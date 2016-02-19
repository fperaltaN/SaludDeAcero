/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: CRUD de Pago
'' =============================================*/
using CapaDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Negocio
{
    public class N_Pago
    {
        #region variables privadas
        private int transSucess = 0;
        private string getPago = "sel_pago";
        private string getPagoXId = "sel_byId_pago";
        private string addPago = "add_pago";
        private string updPago = "upd_pago";
        private string delPago = "del_pago";
        #endregion

        /// <summary>
        /// Obtiene todos los Pago de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getPagoGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getPago, "TblPago", datos);
            return datos;
        }

         /// <summary>
        /// Obtiene  la información de un Pago
        /// </summary>
        /// <param name="idPago"></param>
        /// <returns></returns>
        public DataSet getPagoById(int idSocio)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_Socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
               transSucess = obj.getDataFromSP(getPagoXId, param, "TblPago", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// Agregalos Pago en la base de datos
        /// </summary>
        /// <param name="id_paquete"></param>
        /// <param name="id_socio"></param>
        /// <param name="id_empleado"></param>
        /// <param name="importe"></param>
        /// <param name="idPago"></param>
        /// <returns></returns>
        public int addPagos(int id_paquete, int id_socio, int id_empleado, double importe,ref int idPago)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[4];
                param[0] = new SqlParameter("@id_paquete", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_paquete);
                param[1] = new SqlParameter("@id_socio", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_socio);
                param[2] = new SqlParameter("@ID_USUARIO", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_empleado);
                param[3] = new SqlParameter("@importe", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, importe);
                transSucess = obj.getDataFromSP(addPago, param, "TblPago", datos);
                idPago = Convert.ToInt32(datos.Tables[0].Rows[0]["id_pago"].ToString());
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }

        /// <summary>
        /// Actualiza la información de un Pago
        /// </summary>
        /// <param name="id_paquete"></param>
        /// <param name="id_socio"></param>
        /// <param name="id_empleado"></param>
        /// <param name="importe"></param>
        /// <param name="activo"></param>
        /// <returns></returns>
        public int updtPagos(int id_paquete, int id_socio, int id_empleado, double importe , int activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[5];
                param[0] = new SqlParameter("@id_paquete", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_paquete);
                param[1] = new SqlParameter("@id_socio", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_socio);
                param[2] = new SqlParameter("@ID_USUARIO", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_empleado);
                param[3] = new SqlParameter("@importe", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, importe);
                param[4] = new SqlParameter("@activo", SqlDbType.Bit, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updPago, param, "TblPago", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }

        /// <summary>
        /// Elimina de la Base de Datos
        /// </summary>
        /// <param name="idPago"></param>
        /// <returns></returns>
        public int DelPago(Int32 idPago)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@id_Pago", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idPago);//tenia idPago??
                transSucess = obj.getDataFromSP(delPago, param, "TblPago", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }
    }
}
