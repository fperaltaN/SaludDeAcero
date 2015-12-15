/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: CRUD de Checador
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
    public class N_Checador
    {
        #region variables privadas
        private int transSucess = 0;
        private string getChecador = "sel_Checador";
        private string getChecadorXId = "sel_byId_Checador";
        private string addChecador = "add_Checador";
        private string updChecador = "upd_Checador";
        private string delChecador = "del_Checador";
        #endregion

        /// <summary>
        /// Obtiene todos los Checador de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getChecadorGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getChecador, "TblChecador", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene  la información de un Checador
        /// </summary>
        /// <param name="idChecador"></param>
        /// <returns></returns>
        public DataSet getChecadorById(int idChecador)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_Checador", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idChecador);
                transSucess = obj.getDataFromSP(getChecadorXId, param, "TblChecador", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// Agregalos Checador en la base de datos
        /// </summary>
        /// <param name="idChecador"></param>
        /// <param name="num_Checador"></param>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name="direccion"></param>
        /// <param name="id_perfil"></param>
        /// <returns></returns>
        public int addChecadors(string num_Checador, string nombre, string ap_paterno, string ap_materno, string telefono, string direccion, int id_perfil)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[7];
                param[0] = new SqlParameter("@num_Checador", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_Checador);
                param[1] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[2] = new SqlParameter("@ap_paterno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_paterno);
                param[3] = new SqlParameter("@ap_materno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_materno);
                param[4] = new SqlParameter("@telefono", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, telefono);
                param[5] = new SqlParameter("@direccion", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, direccion);
                param[6] = new SqlParameter("@id_perfil", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_perfil);
                transSucess = obj.getDataFromSP(addChecador, param, "TblChecador", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }

        /// <summary>
        /// Actualiza la información de un Checador
        /// </summary>
        /// <param name="idChecador"></param>
        /// <param name="num_Checador"></param>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name="direccion"></param>
        /// <param name="activo"></param>
        /// <param name="id_perfil"></param>
        /// <returns></returns>
        public int updtChecadors(Int32 idChecador, string num_Checador, string nombre, string ap_paterno, string ap_materno, string telefono, string direccion, bool activo, int id_perfil)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[9];
                param[0] = new SqlParameter("@id_Checador", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idChecador);
                param[1] = new SqlParameter("@num_Checador", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_Checador);
                param[2] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[3] = new SqlParameter("@ap_paterno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_paterno);
                param[4] = new SqlParameter("@ap_materno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_materno);
                param[4] = new SqlParameter("@telefono", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, telefono);
                param[5] = new SqlParameter("@direccion", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, direccion);
                param[6] = new SqlParameter("@id_perfil", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_perfil);
                param[7] = new SqlParameter("@fecha_baja", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, DateTime.Now);
                param[8] = new SqlParameter("@activo", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updChecador, param, "TblChecador", datos);
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
        /// <param name="idChecador"></param>
        /// <returns></returns>
        public int DelChecador(Int32 idChecador)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@id_Checador", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idChecador);//tenia idChecador??
                transSucess = obj.getDataFromSP(delChecador, param, "TblChecador", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }
    }
}
