/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 06.10.2015
'' Descripcion General: CRUD de recargo
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
    public class N_Recargo
    {
        #region variables privadas
        private int transSucess = 0;
        private string getRecargo = "sel_recargo";
        private string getRecargoXId = "sel_byId_recargo";
        private string addRecargo = "add_recargo";
        private string updRecargo = "upd_recargo";
        private string delRecargo = "del_recargo";
        #endregion

        /// <summary>
        /// Obtiene todos los recargo de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getRecargoGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getRecargo, "Tblrecargo", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene  la información de un recargo
        /// </summary>
        /// <param name="idrecargo"></param>
        /// <returns></returns>
        public DataSet getRecargoById(int idSocio)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            try
            {
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_recargo", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                transSucess = obj.getDataFromSP(getRecargoXId, param, "Tblrecargo", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// Agregalos recargo en la base de datos
        /// </summary>
        /// <param name="id_paquete"></param>
        /// <param name="id_socio"></param>
        /// <param name="liberacion"></param>
        /// <param name="importe"></param>
        /// <param name="idrecargo"></param>
        /// <returns></returns>
        public int addRecargos(int id_paquete, int id_socio, Boolean liberacion,  int importe, ref int idrecargo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[4];
                param[0] = new SqlParameter("@id_paquete", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_paquete);
                param[1] = new SqlParameter("@id_socio", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_socio);
                param[2] = new SqlParameter("@liberacion", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, liberacion);
                param[3] = new SqlParameter("@importe", SqlDbType.Decimal, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, importe);
                transSucess = obj.getDataFromSP(addRecargo, param, "Tblrecargo", datos);
                idrecargo = Convert.ToInt32(datos.Tables[0].Rows[0]["id_recargo"].ToString());
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }

        /// <summary>
        /// Actualiza la información de un recargo
        /// </summary>
        /// <param name="id_paquete"></param>
        /// <param name="id_socio"></param>
        /// <param name="id_empleado"></param>
        /// <param name="importe"></param>
        /// <param name="activo"></param>
        /// <returns></returns>
        public int updtRecargos(int idrecargo,int id_paquete, int id_socio, Boolean liberacion, int importe, int activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[6];
                param[0] = new SqlParameter("@id_recargo", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_paquete);
                param[1] = new SqlParameter("@id_paquete", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_paquete);
                param[2] = new SqlParameter("@id_socio", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, id_socio);
                param[3] = new SqlParameter("@liberacion", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, liberacion);
                param[4] = new SqlParameter("@importe", SqlDbType.Decimal, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, importe);
                param[5] = new SqlParameter("@activo", SqlDbType.Bit, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updRecargo, param, "Tblrecargo", datos);
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
        /// <param name="idrecargo"></param>
        /// <returns></returns>
        public int DelRecargo(Int32 idrecargo)
        {
            DataSet datos = new DataSet();
            SQLDatos obj = new SQLDatos();
            SqlParameter[] param = new SqlParameter[1];
            try
            {
                param[0] = new SqlParameter("@id_recargo", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idrecargo);//tenia idrecargo??
                transSucess = obj.getDataFromSP(delRecargo, param, "Tblrecargo", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }
    }
}
