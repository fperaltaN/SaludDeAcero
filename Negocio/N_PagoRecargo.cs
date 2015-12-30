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
    public class N_PagoRecargo
    {
        #region variables privadas
        private int transSucess = 0;
        private string getPagoR = "sel_pago_recargo";
        private string getPagoRXId = "sel_byId_pago_recargo";
        private string addPagoR = "add_pago_recargo";
        private string updPagoR = "upd_pago_recargo";
        private string delPagoR = "del_pago_recargo";
        #endregion

        /// <summary>
        /// Obtiene todos los Pago de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getPagoRecargoGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getPagoR, "TblPago", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene  la información de un Pago
        /// </summary>
        /// <param name="idPago"></param>
        /// <returns></returns>
        public DataSet getPagoRecargoById(int idPago)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_pago", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idPago);
                transSucess = obj.getDataFromSP(getPagoRXId, param, "TblPago", datos);
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
        public int addPagoRecargo(int idPago,int idRecargo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id_pago", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idPago);
                param[1] = new SqlParameter("@id_recargo", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idRecargo);
               transSucess = obj.getDataFromSP(addPagoR, param, "TblPago", datos);
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
        public int updtPagoRecargo(int id_pago_recargo, int id_Pago, int id_recargo,int activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[4];
                param[0] = new SqlParameter("@id_pago_recargo", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_pago_recargo);
                param[1] = new SqlParameter("@id_pago", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_Pago);
                param[2] = new SqlParameter("@id_recargo", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_recargo);
                param[4] = new SqlParameter("@activo", SqlDbType.Bit, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updPagoR, param, "TblPago", datos);
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
        public int DelPagoRecargo(Int32 idPago)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@id_pago_recargo", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idPago);//tenia idPago??
                transSucess = obj.getDataFromSP(delPagoR, param, "TblPago", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }
    }
}
