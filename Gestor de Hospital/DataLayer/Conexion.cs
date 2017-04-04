using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public sealed class Conexion
    {
        private MySqlConnection connection = new MySqlConnection();
        private MySqlDataAdapter adapter;

        private static Conexion instancia = null;
        private static readonly object padlock = new object();

        Conexion()
        {
            connection.ConnectionString = "Server=localhost;Database=hospital;Uid=root;Pwd=admin;";
            
        }

        private void Connect()
        {
            if(connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
        }

        private void Disconnect()
        {
 
                if (connection.State == System.Data.ConnectionState.Open)
                {
                    connection.Close();
                }

        }

        public static Conexion getInstancia
        {
            get
            {
                lock (padlock)
                {
                    if (instancia == null)
                    {
                        instancia = new Conexion();
                    }
                    return instancia;
                }
            }
        }

        public DataSet Consulta(string sentencia)
        {
            this.Connect();
            adapter = new MySqlDataAdapter(new MySqlCommand(sentencia));
            MySqlCommandBuilder cmb = new MySqlCommandBuilder(adapter);
            DataSet dt = new DataSet();

            adapter.Fill(dt);
            return dt;
        }
    }
}
