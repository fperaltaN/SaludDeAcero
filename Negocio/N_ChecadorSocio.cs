/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: CRUD de ChecadorSocio
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
    public class N_ChecadorSocio
    {
        #region variables privadas
        private int transSucess = 0;
        private string getChecadorSocio = "sel_ChecadorSocioSocio";
        private string getChecadorSocioXId = "sel_byId_ChecadorSocio";
        private string addChecadorSocio = "add_ChecadorSocio";
        private string updChecadorSocio = "upd_ChecadorSocio";
        private string delChecadorSocio = "del_ChecadorSocio";
        #endregion

        /// <summary>
        /// Obtiene todos los ChecadorSocio de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getChecadorSocioGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getChecadorSocio, "TblChecadorSocio", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene  la información de un ChecadorSocio
        /// </summary>
        /// <param name="idChecadorSocio"></param>
        /// <returns></returns>
        public DataSet getChecadorSocioById(int idChecadorSocio)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_Socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idChecadorSocio);
                transSucess = obj.getDataFromSP(getChecadorSocioXId, param, "TblChecadorSocio", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// Agregalos ChecadorSocio en la base de datos
        /// </summary>
        /// <param name="idChecadorSocio"></param>
        /// <param name="num_ChecadorSocio"></param>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name="direccion"></param>
        /// <param name="id_perfil"></param>
        /// <returns></returns>
        public int addChecadorSocios(string num_socio)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@num_empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_socio);
                transSucess = obj.getDataFromSP(addChecadorSocio, param, "TblChecadorSocio", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }

        /// <summary>
        /// Actualiza la información de un ChecadorSocio
        /// </summary>
        /// <param name="idChecadorSocio"></param>
        /// <param name="num_ChecadorSocio"></param>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name="direccion"></param>
        /// <param name="activo"></param>
        /// <param name="id_perfil"></param>
        /// <returns></returns>
        public int updtChecadorSocios(Int32 idChecadorSocio, string num_ChecadorSocio, string nombre, string ap_paterno, string ap_materno, string telefono, string direccion, bool activo, int id_perfil)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[9];
                param[0] = new SqlParameter("@id_ChecadorSocio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idChecadorSocio);
                param[1] = new SqlParameter("@num_ChecadorSocio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_ChecadorSocio);
                param[2] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[3] = new SqlParameter("@ap_paterno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_paterno);
                param[4] = new SqlParameter("@ap_materno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_materno);
                param[4] = new SqlParameter("@telefono", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, telefono);
                param[5] = new SqlParameter("@direccion", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, direccion);
                param[6] = new SqlParameter("@id_perfil", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_perfil);
                param[7] = new SqlParameter("@fecha_baja", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, DateTime.Now);
                param[8] = new SqlParameter("@activo", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updChecadorSocio, param, "TblChecadorSocio", datos);
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
        /// <param name="idChecadorSocio"></param>
        /// <returns></returns>
        public int DelChecadorSocio(Int32 idChecadorSocio)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@id_ChecadorSocio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idChecadorSocio);//tenia idChecadorSocio??
                transSucess = obj.getDataFromSP(delChecadorSocio, param, "TblChecadorSocio", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }
    }
}
