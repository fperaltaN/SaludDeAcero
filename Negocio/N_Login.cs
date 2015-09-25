/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 25.09.2015
'' Descripcion General: Valida el Inicio de Session
'' =============================================*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data.SqlClient;
using System.Data;
namespace CapaNegocio
{
    public class N_Login
    {
        private string stored = "Usu_Login";
        public int opSatisfactoria = 0;
        /// <summary>
        /// Verifica si el usuario existe en la Base de Datos y Si existe entra
        /// </summary>
        /// <param name="usuario"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public int entrar(String usuario, String password)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@usuario", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, usuario);
                param[1] = new SqlParameter("@password", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, password);
                opSatisfactoria = obj.getDataFromSP(stored, param, "TBL_USUARIOS", datos);
            }
            catch (Exception ex)
            {
                opSatisfactoria = 0;
            }
            return opSatisfactoria;
        }

        /// <summary>
        /// Regresa la información de un usuario en especifico
        /// </summary>
        /// <param name="usuario"></param>
        /// <param name="password"></param>
        /// <returns></returns>
        public DataSet getData(String usuario, String password)
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            SqlParameter[] param = new SqlParameter[2];
            param[0] = new SqlParameter("@usuario", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, usuario);
            param[1] = new SqlParameter("@password", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, password);
            opSatisfactoria = obj.getDataFromSP(stored, param, "TBL_USUARIOS", datos);
            return datos;
        }
    }
}
