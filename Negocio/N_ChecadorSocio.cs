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
        private string getChecadorSocioXNumero = "sel_byNumero_ChecadorSocio";
        private string getVerificaVisitas = "VerificaVisitas";
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
        /// Obtiene  la información de un Socio
        /// </summary>
        /// <param name="num_socio"></param>
        /// <returns></returns>
        public DataSet getChecadorSocioByNumero(Int32 num_socio)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@num_empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_socio);
                transSucess = obj.getDataFromSP(getChecadorSocioXNumero, param, "TblChecadorSocio", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// Obtiene  la información de las  visitas de un Socio
        /// </summary>
        /// <param name="num_socio"></param>
        /// <returns></returns>
        public string VerificaVisitas(Int32 num_socio)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@num_empleado", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, num_socio);
                transSucess = obj.getDataFromSP(getVerificaVisitas, param, "TblChecadorSocio", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos.Tables[0].Rows[0]["DiasRestantes"].ToString();
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
        /// <param name="id_entrada_salida"></param>
        /// <param name="id_socio"></param>
        /// <param name="entrada"></param>
        /// <param name="salida"></param>
        /// <param name="activo"></param>
        /// <returns></returns>
        public int updtChecadorSocios(string id_entrada_salida, string id_socio, string entrada, string salida, string activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[5];
                param[0] = new SqlParameter("@id_entrada_salida", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Convert.ToInt32(id_entrada_salida));
                param[1] = new SqlParameter("@id_socio", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Convert.ToInt32(id_socio));
                param[2] = new SqlParameter("@entrada", SqlDbType.DateTime, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, entrada);
                param[3] = new SqlParameter("@salida", SqlDbType.DateTime, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, salida);
                param[4] = new SqlParameter("@activo", SqlDbType.Int, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, Convert.ToBoolean(activo));
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
