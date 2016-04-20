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
        private string getChecadorXNumero = "sel_byNumero_Checador";
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
                param[0] = new SqlParameter("@id_Empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idChecador);
                transSucess = obj.getDataFromSP(getChecadorXId, param, "TblChecador", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// Obtiene  la información de un Socio
        /// </summary>
        /// <param name="num_empleado"></param>
        /// <returns></returns>
        public DataSet getChecadorByNumero(Int32 num_empleado)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@num_empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_empleado);
                transSucess = obj.getDataFromSP(getChecadorXNumero, param, "TblChecador", datos);
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
        /// <param name="num_Checador"></param>
        /// <returns></returns>
        public int addChecadors(string num_empleado)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@num_empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_empleado);
                transSucess = obj.getDataFromSP(addChecador, param, "TblChecador", datos);
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
        /// <param name="id_entrada_salida"></param>
        /// <param name="id_empleado"></param>
        /// <param name="entrada"></param>
        /// <param name="salida"></param>
        /// <param name="activo"></param>
        /// <returns></returns>
        public int updtChecadors(string id_entrada_salida, string id_empleado, string entrada, string salida, string activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[5];
                param[0] = new SqlParameter("@id_entrada_salida", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Convert.ToInt32(id_entrada_salida));
                param[1] = new SqlParameter("@id_empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Convert.ToInt32(id_empleado));
                param[2] = new SqlParameter("@entrada", SqlDbType.DateTime, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, entrada);
                param[3] = new SqlParameter("@salida", SqlDbType.DateTime, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, salida);
                param[4] = new SqlParameter("@activo", SqlDbType.Int, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Convert.ToBoolean(activo));
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
