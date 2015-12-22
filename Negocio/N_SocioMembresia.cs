/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 21.12.2015
'' Descripcion General: CRUD de SocioMembresia
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
    public class N_SocioMembresia
    {
        #region variables privadas
        private int transSucess = 0;
        private string getSocioM = "sel_socio_membresia";
        private string getSocioMXId = "sel_byId_socio_membresia";
        private string getSocioMPXId = "sel_byId_socio_membresia_paquete";
        private string addSocioM = "add_socio_membresia";
        private string updSocioM = "upd_socio_membresia";
        private string delSocioM = "del_socio_membresia";
        #endregion

        /// <summary>
        /// Obtiene todos los Historiales medicos de la BD
        /// </summary>
        /// <returns></returns>
        public DataSet getSocioMembresiaGrid()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(getSocioM, "TblSocioMembresia", datos);
            return datos;
        }

        /// <summary>
        /// Obtiene  la información del historial medico de un socio
        /// </summary>
        /// <param name="idSocio"></param>
        /// <returns></returns>
        public DataSet getSocioMembresiaById(Int32 idSocio, Int32 idPaquete)
        {
            DataSet datos = new DataSet();
            try
            {                
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id_socio", SqlDbType.Int, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                param[1] = new SqlParameter("@id_paquete", SqlDbType.Int, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idPaquete);
                transSucess = obj.getDataFromSP(getSocioMXId, param, "TblSocioMembresia", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// Obtiene  la información del historial medico de un socio
        /// </summary>
        /// <param name="idSocio"></param>
        /// <returns></returns>
        public DataSet getSocioMembresiaPaqueteById(Int32 idSocio)
        {
            DataSet datos = new DataSet();
            try
            {
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[1];
                param[0] = new SqlParameter("@id_socio", SqlDbType.Int, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
               transSucess = obj.getDataFromSP(getSocioMPXId, param, "TblSocioMembresia", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return datos;
        }

        /// <summary>
        /// Agregala membresia de un socio
        /// </summary>
        /// <param name="idSocio"></param>
        /// <param name="idPaquete"></param>
        /// <returns></returns>
        public int addSocioMembresia(Int32 idSocio, Int32 idPaquete)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id_socio", SqlDbType.Int, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                param[1] = new SqlParameter("@id_paquete", SqlDbType.Int, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idPaquete);

                transSucess = obj.getDataFromSP(addSocioM, param, "TblSocioMembresia", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }

        /// <summary>
        /// Actualiza el historial medico de un socio
        /// </summary>
        /// <param name="idSocio"></param>
        /// <param name="descripcion"></param>
        /// <param name="activo"></param>
        /// <returns></returns>
        public int updtSocioMembresia(Int32 idSocio, Int32 idPaquete, Int32 activo)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[3];
                param[0] = new SqlParameter("@id_socio", SqlDbType.Int, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                param[1] = new SqlParameter("@id_paquete", SqlDbType.Int, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idPaquete);
                param[2] = new SqlParameter("@activo", SqlDbType.Bit, 250, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                transSucess = obj.getDataFromSP(updSocioM, param, "TblSocioMembresia", datos);
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
        public int DelSocioMembresia(Int32 idSocio, Int32 idPaquete)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[2];
                param[0] = new SqlParameter("@id_socio", SqlDbType.Int, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idSocio);
                param[1] = new SqlParameter("@id_paquete", SqlDbType.Int, 100, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idPaquete);
                transSucess = obj.getDataFromSP(delSocioM, param, "TblSocioMembresia", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }
            return transSucess;
        }
    }
}

