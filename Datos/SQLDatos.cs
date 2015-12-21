/*''=============================================
'' Autor:	Faleg A. Peralta
'' Modificado por: 
'' Fecha de Modificación: 25.09.2015
'' Descripcion General: Valida el Inicio de Session
'' =============================================*/
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaDatos
{
    public class SQLDatos
    {
        private string connString;
        public SqlConnection conn;
        private SqlTransaction SqlTrans;
        #region Metodos de Conexion
        public SQLDatos()
        {
            try
            {
                connString = ConfigurationManager.ConnectionStrings["SaludDeAceroConection"].ToString();
            }
            catch (Exception)
            {
                connString = ConfigurationManager.ConnectionStrings["SaludDeAcerConnectionString"].ToString();
            }
            
        }

        public SqlConnection CrearConexion()
        {
            conn = new SqlConnection(connString);
            conn.Open();
            return conn;
        }

        public void CerrarConexion(SqlConnection conn)
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
                conn.Dispose();
                conn = null;
            }
        }

        public void CerrarConexion()
        {
            if (conn.State == ConnectionState.Open)
            {
                conn.Close();
                conn.Dispose();
                conn = null;
            }
        }
        #endregion

        public int getDataFromSP(string stored, SqlParameter[] param, string tabla, DataSet datos)
        {
            SqlCommand Cmd;
            SqlDataAdapter Da;
            DataSet Ds;
            Ds = datos;
            Da = new SqlDataAdapter();
            int resultado = 0;
            conn = CrearConexion();
            Cmd = conn.CreateCommand();
            Cmd.CommandType = CommandType.StoredProcedure;
            Cmd.CommandText = stored;
            this.AsignarParametros(Cmd, param);
            try
            {
                Da.SelectCommand = Cmd;
                Ds.Tables.Add(new DataTable(tabla));
                resultado = Da.Fill(Ds, tabla);
            }
            catch (Exception e)
            {
                resultado = 0;
                throw e;
            }
            return resultado;
        }

        public int getDataFromSP(string stored, string tabla, DataSet datos)
        {
            SqlCommand cmdConsulta;
            int resultado = 0;
            conn = this.CrearConexion();
            try
            {
                cmdConsulta = conn.CreateCommand();
                cmdConsulta.CommandType = CommandType.Text;
                cmdConsulta.CommandText = stored;
                resultado = this.LlenarDS(cmdConsulta, datos, tabla);
                this.CerrarConexion(conn);
            }
            catch (Exception err)
            {
                throw err;
            }
            finally
            {
                if (conn.State == ConnectionState.Open)
                    conn.Close();
            }
            return resultado;
        }

        public int LlenarDS(SqlCommand cmd, DataSet data, string tableName)
        {
            SqlDataAdapter daConsulta;
            int result;

            daConsulta = new SqlDataAdapter();
            daConsulta.SelectCommand = cmd;

            if (data != null)
            {
                if (!data.Tables.Contains(tableName))
                    data.Tables.Add(new DataTable(tableName));

                return daConsulta.Fill(data, tableName);
            }
            else
            {
                result = daConsulta.Fill(data);
                if (data.Tables.Count > 0)
                    data.Tables[0].TableName = tableName;

                return result;
            }
        }

        public void AsignarParametros(SqlCommand cmd, SqlParameter[] parametros)
        {
            if (parametros != null)
            {
                foreach (SqlParameter parametro in parametros)
                {
                    cmd.Parameters.Add(parametro);
                }
            }
        }

        public void executeSP(string stored, SqlParameter[] Par)
        {
            SqlCommand cmd;
            conn = CrearConexion();
            try
            {
                cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = stored;
                cmd.Transaction = SqlTrans;
                this.AsignarParametros(cmd, Par);
                cmd.ExecuteScalar().ToString();
            }
            catch (Exception e)
            {
                e.StackTrace.ToString();
            }
            finally
            {
                CerrarConexion(conn);
            }
        }

        public object executeSPOutPut(string stored, SqlParameter[] Par)
        {
            SqlCommand cmd;
            Object resp = null;
            conn = CrearConexion();
            try
            {
                cmd = conn.CreateCommand();
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.CommandText = stored;
                cmd.Transaction = SqlTrans;
                this.AsignarParametros(cmd, Par);
                cmd.ExecuteNonQuery();

                foreach (IDbDataParameter par in cmd.Parameters)
                    if (par.Direction == ParameterDirection.InputOutput || par.Direction == ParameterDirection.Output)
                        resp = par.Value;
                return resp;
            }
            catch (Exception e)
            {
                e.StackTrace.ToString();
                return resp;
            }
            finally
            {
                CerrarConexion(conn);
            }
        }

        public void CommitTrans()
        {
            SqlTrans.Commit();
        }

        public void RollbackTrans()
        {
            SqlTrans.Rollback();
        }
    }
}
