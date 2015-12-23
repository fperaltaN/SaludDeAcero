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
        /// <param name="idPago"></param>
        /// <param name="num_Pago"></param>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name="direccion"></param>
        /// <param name="id_perfil"></param>
        /// <returns></returns>
        public int addPagos(string num_Pago, string nombre, string ap_paterno, string ap_materno, string telefono, string direccion, int id_perfil)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[7];
                param[0] = new SqlParameter("@num_Pago", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_Pago);
                param[1] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[2] = new SqlParameter("@ap_paterno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_paterno);
                param[3] = new SqlParameter("@ap_materno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_materno);
                param[4] = new SqlParameter("@telefono", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, telefono);
                param[5] = new SqlParameter("@direccion", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, direccion);
                param[6] = new SqlParameter("@id_perfil", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_perfil);
                transSucess = obj.getDataFromSP(addPago, param, "TblPago", datos);
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
        /// <param name="idPago"></param>
        /// <param name="num_Pago"></param>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name="direccion"></param>
        /// <param name="activo"></param>
        /// <param name="id_perfil"></param>
        /// <returns></returns>
        public int updtPagos(Int32 idPago, string num_Pago, string nombre, string ap_paterno, string ap_materno, string telefono, string direccion, bool activo, int id_perfil)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[9];
                param[0] = new SqlParameter("@id_Pago", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idPago);
                param[1] = new SqlParameter("@num_Pago", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_Pago);
                param[2] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[3] = new SqlParameter("@ap_paterno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_paterno);
                param[4] = new SqlParameter("@ap_materno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_materno);
                param[4] = new SqlParameter("@telefono", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, telefono);
                param[5] = new SqlParameter("@direccion", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, direccion);
                param[6] = new SqlParameter("@id_perfil", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_perfil);
                param[7] = new SqlParameter("@fecha_baja", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, DateTime.Now);
                param[8] = new SqlParameter("@activo", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
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
