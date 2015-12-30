/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: CRUD de Paquete
'' =============================================*/
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using CapaDatos;

namespace Negocio
{
    public class N_Paquete
    {
        #region variables privadas
        private int transSucess = 0;
        private string getPaquete = "sel_paquete";
        private string getPaqueteXId = "sel_byId_paquete";
        private string addPaquete = "add_paquete";
        private string updPaquete = "upd_paquete";
        private string spAllPaquete = "[sel_Allpaquete]";
        #endregion

        /// <summary>
        /// Obtiene todos los perfiles y regresa un dataSet
        /// </summary>
        /// <returns></returns>
        public DataSet getAllPaquetes()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(spAllPaquete, "TblPaquetes", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene todos los Paquete de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getPaqueteGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getPaquete, "TblPaquete", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene  la información de un Paquete
        /// </summary>
        /// <param name="idPaquete"></param>
        /// <returns></returns>
        public DataSet getPaqueteById(Int32 idPaquete)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_Paquete", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idPaquete);
                transSucess = obj.getDataFromSP(getPaqueteXId, param, "TblPaquete", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// Agregalos Paquete en la base de datos
        /// </summary>
        /// <param name="nombre"></param>
        /// <param name="descripcion"></param>
        /// <param name="costo"></param>
        /// <param name="id_empleado"></param>
        /// <returns></returns>
        public int addPaquetes(string nombre, string descripcion, string costo, string diasPaquete, string id_empleado)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[5];
                param[0] = new SqlParameter("@nombre", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[1] = new SqlParameter("@descripcion", SqlDbType.VarChar, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, descripcion);
                param[2] = new SqlParameter("@costo", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, costo);
                param[3] = new SqlParameter("@diasPaquete", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, diasPaquete);
                param[4] = new SqlParameter("@id_empleado", SqlDbType.Int, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_empleado);
                transSucess = obj.getDataFromSP(addPaquete, param, "TblPaquete", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }

        /// <summary>
        /// Actualiza la información de un Paquete
        /// </summary>
        /// <param name="@id_paquete"></param>
        /// <param name="nombre"></param>
        /// <param name="descripcion"></param>
        /// <param name="costo"></param>
        /// <param name="id_empleado"></param>
        /// <param name="activo"></param>
        /// <returns></returns>
        public int updtPaquete(int idpaquete, string nombre, string descripcion, string costo, string diasPaquete, string id_empleado,bool activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[7];
                param[0] = new SqlParameter("@id_paquete", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idpaquete);
                param[1] = new SqlParameter("@nombre", SqlDbType.VarChar, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[2] = new SqlParameter("@descripcion", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, descripcion);
                param[3] = new SqlParameter("@costo", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, costo.Replace(",","."));
                param[4] = new SqlParameter("@diasPaquete", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, diasPaquete);
                param[5] = new SqlParameter("@id_empleado", SqlDbType.Int, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_empleado);
                param[6] = new SqlParameter("@activo", SqlDbType.VarChar, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
               transSucess = obj.getDataFromSP(updPaquete, param, "TblPaquete", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }
    }
}
