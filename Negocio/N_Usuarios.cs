/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: Valida el Inicio de Session
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
    public class N_Usuarios
    {
        #region variables privadas
        private int transSucess = 0;
        private string getUsuarios = "sel_usuario";
        private string getUsuarioXId = "sel_byId_usuario";
        private string addUsuarios = "add_usuario";
        private string updUsuarios = "add_empleado";
        #endregion

        /// <summary>
        /// Obtiene todos los Usuarios de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getUsuariosGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getUsuarios, "TblUsuarios", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene  la información de un Usuario
        /// </summary>
        /// <param name="idEmpleado"></param>
        /// <returns></returns>
        public DataSet getUsuariosById(Int32 idEmpleado)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {                
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_usuario", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idEmpleado);
                transSucess = obj.getDataFromSP(getUsuarioXId, param, "TblUsuario", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// Agregalos Usuarios en la base de datos
        /// </summary>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name="id_area"></param>
        /// <param name="usuario"></param>
        /// <param name="password"></param>
        /// <param name="id_perfil"></param>
        /// <param name="creador"></param>
        /// <returns></returns>
        public int addEmpleados(string nombre, string ap_paterno, string ap_materno, string id_area, string usuario, string password, Int32 id_perfil,string creador)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[9];
                param[0] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[1] = new SqlParameter("@ap_paterno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_paterno);
                param[2] = new SqlParameter("@ap_materno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_materno);
                param[3] = new SqlParameter("@id_area", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_area);
                param[4] = new SqlParameter("@usuario", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, usuario);
                param[5] = new SqlParameter("@password", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, password);
                param[6] = new SqlParameter("@id_perfil", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_perfil);
                param[7] = new SqlParameter("@creado_por", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, creador);
                param[8] = new SqlParameter("@actualizado_por", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, creador);
                transSucess = obj.getDataFromSP(addUsuarios, param, "TblUsuarios", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }

        /// <summary>
        /// Actualiza la información de un usuarios
        /// </summary>
        /// <param name="id_usuario"></param>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name="id_area"></param>
        /// <param name="usuario"></param>
        /// <param name="password"></param>
        /// <param name="id_perfil"></param>
        /// <param name="activo"></param>
        /// <param name="creador"></param>
        /// <returns></returns>
        public int updtEmpleados(int id_usuario,  string nombre, string ap_paterno, string ap_materno, string id_area, string usuario, string password, Int32 id_perfil, bool activo,string creador)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[10];
                param[0] = new SqlParameter("@id_usuario", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_usuario);
                param[1] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[2] = new SqlParameter("@ap_paterno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_paterno);
                param[3] = new SqlParameter("@ap_materno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_materno);
                param[4] = new SqlParameter("@id_area", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_area);
                param[5] = new SqlParameter("@usuario", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, usuario);
                param[6] = new SqlParameter("@password", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, password);
                param[7] = new SqlParameter("@id_perfil", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_perfil);
                param[8] = new SqlParameter("@activo", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                param[9] = new SqlParameter("@actualizado_por", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, creador);
                transSucess = obj.getDataFromSP(updUsuarios, param, "TblUsuarios", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }
    }
}
