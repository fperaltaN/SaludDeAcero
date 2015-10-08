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
    public class N_Perfiles
    {
        #region variables privadas
        private int transSucess = 0;
        private string spAllPerfil = "sel_perfil";
        #endregion
        /// <summary>
        /// Obtiene todos los perfiles y regresa un dataSet
        /// </summary>
        /// <returns></returns>
        public DataSet getAllPerfil()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            opSatisfactoria = obj.getDataFromSP(spAllPerfil, "TblPerfiles", datos);
            return datos;
        }
    }
}
