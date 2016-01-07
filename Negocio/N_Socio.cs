/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: CRUD de Socios
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
    public class N_Socio
    {

        #region variables privadas
        private int transSucess = 0;
        private string valNumSocios = "ValidaNumSocio";
        private string valSocios = "ValidaSocio";
        private string getSocios = "sel_Socio";
        private string getSocioXId = "sel_byId_Socio";
        private string addSocio = "add_Socio";
        private string updSocio = "upd_Socio";
        private string delSocio = "del_Socio";
        private string selALLSocio = "sel_AllSocios";
        #endregion

        /// <summary>
        /// Obtiene todos los socios y regresa un dataSet
        /// </summary>
        /// <returns></returns>
        public DataSet getAllSocios()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(selALLSocio, "TblSocios", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene todos los Socios de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getSociosGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getSocios, "TblSocio", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene  la información de un Socio
        /// </summary>
        /// <param name="idSocio"></param>
        /// <returns></returns>
        public DataSet getSocioById(int idSocio)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_Socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                transSucess = obj.getDataFromSP(getSocioXId, param, "TblSocio", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// Valida el numero de un empleado no se repita
        /// </summary>
        /// <param name="NumSocio"></param>
        /// <returns></returns>
        public string valNumSocio(int NumSocio)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            string mensaje="";
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@num_socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, NumSocio);
                transSucess = obj.getDataFromSP(valNumSocios, param, "TblSocio", datos);
            }
            catch (Exception ex)
            {
                mensaje = "Este numero de SOCIO ya existe, Favor de modificarlo;";
            }
            return mensaje;
        }

        /// <summary>
        ///  Valida que el nombre de un socio no se repita
        /// </summary>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name=""></param>
        /// <returns></returns>
        public string valSocio(string nombre, string ap_paterno, string ap_materno)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            string mensaje = "";
            try
            {
                SqlParameter[] param = new SqlParameter[3];
                param[0] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[1] = new SqlParameter("@ap_paterno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_paterno);
                param[2] = new SqlParameter("@ap_materno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_materno);
                transSucess = obj.getDataFromSP(valSocios, param, "TblSocio", datos);
            }
            catch (Exception ex)
            {
                mensaje = "Al paracer este SOCIO esta duplicado revisa la información;Si estas seguro de agregarlo Has clic en continuar!!!;";
            }
            return mensaje;
        }

        /// <summary>
        /// Agregalos Socio en la base de datos
        /// </summary>
        /// <param name="num_Socio"></param>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name="telefono"></param>
        /// <param name="direccion"></param>
        /// <param name="fecha_nacimiento"></param>
        /// <returns></returns>
        public int addSocios(string num_Socio, string nombre, string ap_paterno, string ap_materno, string telefono, string direccion, string fecha_nacimiento, ref Int32 idSocio)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[7];
                param[0] = new SqlParameter("@num_Socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_Socio);
                param[1] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[2] = new SqlParameter("@ap_paterno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_paterno);
                param[3] = new SqlParameter("@ap_materno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_materno);
                param[4] = new SqlParameter("@direccion", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, direccion);
                param[5] = new SqlParameter("@telefono", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, telefono);
                param[6] = new SqlParameter("@fecha_nacimiento", SqlDbType.DateTime, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, fecha_nacimiento);
                transSucess = obj.getDataFromSP(addSocio, param, "TblSocio", datos);
                idSocio = Convert.ToInt32(datos.Tables[0].Rows[0]["id_socio"].ToString());
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }

        /// <summary>
        /// Actualiza la información de un Socio
        /// </summary>
        /// <param name="idSocio"></param>
        /// <param name="num_Socio"></param>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name="direccion"></param>
        /// <param name="activo"></param>
        /// <param name="id_perfil"></param>
        /// <returns></returns>
        public int updtSocios(int idSocio, string num_Socio, string nombre, string ap_paterno, string ap_materno, string telefono, string direccion, string fecha_nacimiento,Int32 activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[9];
                param[0] = new SqlParameter("@id_Socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                param[1] = new SqlParameter("@num_Socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_Socio);
                param[2] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[3] = new SqlParameter("@ap_paterno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_paterno);
                param[4] = new SqlParameter("@ap_materno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_materno);
                param[5] = new SqlParameter("@telefono", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, telefono);
                param[6] = new SqlParameter("@fecha_nacimiento", SqlDbType.DateTime, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, fecha_nacimiento);
                param[7] = new SqlParameter("@direccion", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, direccion);
                param[8] = new SqlParameter("@activo", SqlDbType.Bit, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updSocio, param, "TblSocio", datos);
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
        public int DelSocio(int idSocio)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@id_Socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);//tenia idSocio??
                transSucess = obj.getDataFromSP(delSocio, param, "TblSocio", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }
    }
}
