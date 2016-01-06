/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: CRUD de Empleados
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
    public class N_Empleados
    {
        #region variables privadas
        private int transSucess = 0;
        private string valNumEmpleados = "ValidaNumEmpleado";
        private string valEmpleados = "ValidaEmpleado";
        private string getEmpleados = "sel_empleado";
        private string getEmpleadoXId = "sel_byId_empleado"; 
        private string addEmpleado = "add_empleado";
        private string updEmpleado = "upd_empleado";
        private string delEmpleado = "del_empleado";
        #endregion

        /// <summary>
        /// Obtiene todos los empleados de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getEmpleadosGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getEmpleados, "TblEmpleado", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene  la información de un empleado
        /// </summary>
        /// <param name="idEmpleado"></param>
        /// <returns></returns>
        public DataSet getEmpleadoById(int idEmpleado)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idEmpleado);
               transSucess = obj.getDataFromSP(getEmpleadoXId, param, "TblEmpleado", datos);
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
        /// <param name="NumEmpleado"></param>
        /// <returns></returns>
        public string valNumEmpleado(int NumEmpleado)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            string mensaje = "";
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@num_empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, NumEmpleado);
                transSucess = obj.getDataFromSP(valNumEmpleados, param, "TblEmpleado", datos);
            }
            catch (Exception ex)
            {
                mensaje = "Este numero de Empleado ya existe, Favor de modificarlo;";
            }
            return mensaje;
        }

        /// <summary>
        ///  Valida que el nombre de un empleado no se repita
        /// </summary>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name=""></param>
        /// <returns></returns>
        public string valEmpleado(string nombre, string ap_paterno, string ap_materno)
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
                transSucess = obj.getDataFromSP(valEmpleados, param, "TblEmpleado", datos);
            }
            catch (Exception ex)
            {
                mensaje = "Al paracer este Empleado esta duplicado revisa la información;Si estas seguro de agregarlo Has clic en continuar!!!;";
            }
            return mensaje;
        }

        /// <summary>
        /// Agregalos empleado en la base de datos
        /// </summary>
        /// <param name="idEmpleado"></param>
        /// <param name="num_empleado"></param>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name="direccion"></param>
        /// <param name="id_perfil"></param>
        /// <returns></returns>
        public int addEmpleados(string num_empleado, string nombre, string ap_paterno, string ap_materno, string telefono, string direccion, int id_perfil)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[7];
                param[0] = new SqlParameter("@num_empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_empleado);
                param[1] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[2] = new SqlParameter("@ap_paterno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_paterno);
                param[3] = new SqlParameter("@ap_materno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_materno);
                param[4] = new SqlParameter("@telefono", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, telefono);
                param[5] = new SqlParameter("@direccion", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, direccion);
                param[6] = new SqlParameter("@id_perfil", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_perfil);
                transSucess = obj.getDataFromSP(addEmpleado, param, "TblEmpleado", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }

        /// <summary>
        /// Actualiza la información de un empleado
        /// </summary>
        /// <param name="idEmpleado"></param>
        /// <param name="num_empleado"></param>
        /// <param name="nombre"></param>
        /// <param name="ap_paterno"></param>
        /// <param name="ap_materno"></param>
        /// <param name="direccion"></param>
        /// <param name="activo"></param>
        /// <param name="id_perfil"></param>
        /// <returns></returns>
        public int updtEmpleados(Int32 idEmpleado, string num_empleado, string nombre, string ap_paterno, string ap_materno, string telefono, string direccion, bool activo, int id_perfil)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[10];
                param[0] = new SqlParameter("@id_empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idEmpleado);
                param[1] = new SqlParameter("@num_empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_empleado);
                param[2] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[3] = new SqlParameter("@ap_paterno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_paterno);
                param[4] = new SqlParameter("@ap_materno", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, ap_materno);
                param[5] = new SqlParameter("@telefono", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, telefono);
                param[6] = new SqlParameter("@direccion", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, direccion);
                param[7] = new SqlParameter("@id_perfil", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_perfil);
                param[8] = new SqlParameter("@fecha_baja", SqlDbType.DateTime, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, DateTime.Now);
                param[9] = new SqlParameter("@activo", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updEmpleado, param, "TblEmpleado", datos);
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
        /// <param name="idempleado"></param>
        /// <returns></returns>
        public int DelEmpleado(Int32 idempleado)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@id_empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idempleado);//tenia idEmpleado??
                transSucess = obj.getDataFromSP(delEmpleado, param, "TblEmpleado", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }
    }
}
