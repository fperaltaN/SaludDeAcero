using CapaDatos;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio.NegocioCatalogos
{
    public class N_Empleados
    {
        #region variables privadas
        private int transSucess = 0;
        private string getEmpleados = "Cat_getEmpleados";
        private string upsCanales = "Cat_upsEmpleados";
        #endregion


        public DataSet getEmpleadosGrid(int status)
        {
            SQLDatos obj = new SQLDatos();
            DataSet datos = new DataSet();
            int opSatisfactoria = 0;
            SqlParameter[] param = new SqlParameter[1];
            param[0] = new SqlParameter("@STATUS", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, status);
            opSatisfactoria = obj.getDataFromSP(getEmpleados, param, "TBL_CANALES", datos);

            return datos;
        }

        public int upsertEmpleados(int idEmpleado, string nombre, bool activo, int idUsuario, string usuario)
        {
            try
            {
                DataSet datos = new DataSet();
                SQLDatos obj = new SQLDatos();
                SqlParameter[] param = new SqlParameter[5];
                param[0] = new SqlParameter("@ID_EMPLEADO", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idEmpleado);
                param[1] = new SqlParameter("@NAME", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, nombre);
                param[2] = new SqlParameter("@ACTIVO", SqlDbType.Bit, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, activo);
                param[3] = new SqlParameter("@ID_USUARIO", SqlDbType.Int, 10, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, idUsuario);
                param[4] = new SqlParameter("@USUARIO", SqlDbType.VarChar, 50, ParameterDirection.Input, false, 0, 0, "", DataRowVersion.Current, usuario);
                transSucess = obj.getDataFromSP(upsCanales, param, "CAT_EMPLEADOS", datos);
            }
            catch (Exception ex)
            {
                transSucess = 1;
            }

            return transSucess;
        }
    }
}
