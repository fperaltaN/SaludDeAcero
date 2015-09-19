using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using CapaDatos;
using System.Data;
using System.Data.SqlClient;
namespace CapaNegocio
{
    public class N_Menu
    {
        private string stored = "Usu_GetModsByPerfil";
        private string stored2 = "Usu_GetModulos";
        public DataSet getData(int perfil)
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@perfil", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, perfil);
            opSatisfactoria = obj.getDataFromSP(stored, param, "TBL_REL_PERFIL_MODULO", datos);
            return datos;
        }

        public DataSet getModulos()
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            SqlParameter[] param = new SqlParameter[0];
            opSatisfactoria = obj.getDataFromSP(stored2, param, "TC_MODULOS", datos);
            return datos;
        }
    }
}
