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
        private static Conexion instance = null;
        private static readonly object padlock = new object();

        Conexion()
        {
            Connection.ConnectionString = "Server=localhost;Database=hospital;Uid=root;Pwd=admin;";
            
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

        public MySqlConnection Connection
        {
            get
            {
                return connection;
            }

            set
            {
                connection = value;
            }
        }
    }
}
