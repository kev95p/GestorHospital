using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public sealed class Conexion
    {
        private MySqlConnection connection = new MySqlConnection();
        private static Conexion instance = null;
        private static readonly object padlock = new object();

        Conexion()
        {
            connection.ConnectionString = "Server=localhost;Database=Hospital;Uid=root;Pwd=admin;";
            
        }

        public void Connect()
        {
            if(connection.State == System.Data.ConnectionState.Closed)
            {
                connection.Open();
            }
        }

        public void Disconnect()
        {
 
                if (connection.State == System.Data.ConnectionState.Open)
                {
                    connection.Close();
                }

        }

        public static Conexion getInstance
        {
            get
            {
                lock (padlock)
                {
                    if (instance == null)
                    {
                        instance = new Conexion();
                    }
                    return instance;
                }
            }
        }


    }
}
