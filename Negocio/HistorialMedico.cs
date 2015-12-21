/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 21.12.2015
'' Descripcion General: CRUD de HistorialMedico
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
    public class N_HistorialMedico
    {
        #region variables privadas
        private int transSucess = 0;
        private string getHMSocio= "sel_historial_medico";
        private string getHMSocioXId = "sel_byId_historial_medico";
        private string addHMSocio = "add_historial_medico";
        private string updHMSocio = "upd_historial_medico";
        private string delHMSocio = "del_historial_medico";
        #endregion

        /// <summary>
        /// Obtiene todos los Historiales medicos de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getHistorialMedicoGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getHMSocio, "TblHistorialMedico", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene  la información del historial medico de un socio
        /// </summary>
        /// <param name="idSocio"></param>
        /// <returns></returns>
        public DataSet getHistorialMedicoById(Int32 idSocio)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                transSucess = obj.getDataFromSP(getHMSocioXId, param, "TblHistorialMedico", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// Agrega el historial medico de un socio
        /// </summary>
        /// <param name="nombre"></param>
        /// <param name="descripcion"></param>
        /// <param name="costo"></param>
        /// <param name="id_empleado"></param>
        /// <returns></returns>
        public int addHistorialMedico(Int32 idSocio, string descripcion)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id_socio", SqlDbType.Int, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                param[1] = new SqlParameter("@descripcion", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, descripcion);
               
                transSucess = obj.getDataFromSP(addHMSocio, param, "TblHistorialMedico", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }

        /// <summary>
        /// Actualiza el historial medico de un socio
        /// </summary>
        /// <param name="idSocio"></param>
        /// <param name="descripcion"></param>
        /// <param name="activo"></param>
        /// <returns></returns>
        public int updtHistorialMedico(Int32 idSocio, string descripcion, Int32 activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[3];
                param[0] = new SqlParameter("@id_socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                param[1] = new SqlParameter("@descripcion", SqlDbType.VarChar, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, descripcion);
                param[2] = new SqlParameter("@activo", SqlDbType.Bit, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updHMSocio, param, "TblHistorialMedico", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }
    }
}
