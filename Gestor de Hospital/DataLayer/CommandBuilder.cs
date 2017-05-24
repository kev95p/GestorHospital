using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;

namespace DataLayer
{
    public class CommandBuilder : Intefaces.IComando
    {
        private MySqlConnection conn = Conexion.getInstance.Connection;
        public string CommandText { get; set; }
        public string StoredProcerudeName { get; set; }
        public List<MySqlParameter> SqlParams { get; set ; }

        public int Execute()
        {
            try
            {
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(CommandText, conn);
                cmd.CommandType = String.IsNullOrEmpty(CommandText) ? CommandType.StoredProcedure : CommandType.Text;
                cmd.CommandText = String.IsNullOrEmpty(CommandText) ? StoredProcerudeName : CommandText;

                if (SqlParams != null)
                {
                    SqlParams.ForEach(param => cmd.Parameters.Add(param));
                }
                int rows= cmd.ExecuteNonQuery();
                conn.Close();
                return rows;

            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex.Message);
                conn.Close();
                return ex.Number * -1;
            }
        }

        public DataSet Select()
        {
            try
            {
                DataSet ds = new DataSet();
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(CommandText, conn);
                cmd.CommandType = String.IsNullOrEmpty(CommandText) ? CommandType.StoredProcedure : CommandType.Text;
                cmd.CommandText = String.IsNullOrEmpty(CommandText) ? StoredProcerudeName : CommandText;
                if (SqlParams != null)
                {
                    SqlParams.ForEach(param => cmd.Parameters.Add(param));
                }
                MySqlDataAdapter adapter = new MySqlDataAdapter(cmd);
                adapter.Fill(ds);
                conn.Close();
                return ds;
            }
            catch (MySqlException ex)
            {
                Console.WriteLine(ex.Message);
                return new DataSet();
            }
            
        }

    }
}
