/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 21.12.2015
'' Descripcion General: CRUD de HistorialFisico
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
    public class N_HistorialFisico
    {
        #region variables privadas
        private int transSucess = 0;
        private string getHFSocio = "sel_historial_fisico";
        private string getHFSocioXId = "sel_byId_historial_fisico";
        private string addHFSocio = "add_historial_fisico";
        private string updHFSocio = "upd_historial_fisico";
        private string delHFSocio = "del_historial_fisico";
        #endregion

        /// <summary>
        /// Obtiene todos los Historiales medicos de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getHistorialFisicoGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getHFSocio, "TblHistorialMedico", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene  la información del historial medico de un socio
        /// </summary>
        /// <param name="idSocio"></param>
        /// <returns></returns>
        public DataSet getHistorialFisicoById(Int32 idSocio)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                transSucess = obj.getDataFromSP(getHFSocioXId, param, "TblHistorialFisico", datos);
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
        public int addHistorialFisico(Int32 idSocio, string descripcion)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id_socio", SqlDbType.Int, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                param[1] = new SqlParameter("@descripcion", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, descripcion);

                transSucess = obj.getDataFromSP(addHFSocio, param, "TblHistorialFisico", datos);
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
        public int updtHistorialFisico(Int32 idSocio, string descripcion, Int32 activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[3];
                param[0] = new SqlParameter("@id_socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                param[1] = new SqlParameter("@descripcion", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, descripcion);
                param[2] = new SqlParameter("@activo", SqlDbType.Bit, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updHFSocio, param, "TblHistorialFisico", datos);
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
        /// <param name="idSocio"></param>
        /// <returns></returns>
        public int DelHistorialFisico(int idSocio)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@id_Socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);//tenia idSocio??
                transSucess = obj.getDataFromSP(delHFSocio, param, "TblHistorialMedico", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }
    }
}
