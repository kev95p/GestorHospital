﻿using DataLayer.Properties;
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
        private string server = Resources.ipserver;
        private static Conexion instance = null;
        private static readonly object padlock = new object();

        Conexion()
        {
            connection.ConnectionString = "Server="+Server+";Database=hospital;Uid=root;Pwd=admin;";
            
        }

        private void Connect()
        {
            try
            {
                if (connection.State == System.Data.ConnectionState.Closed)
                {
                    connection.Open();
                }
            }
            catch (MySqlException ex)
            {

                Console.WriteLine(ex.ToString());
            }

        }

        private void Disconnect()
        {

            try
            {
                if (connection.State == System.Data.ConnectionState.Open)
                {
                    connection.Close();
                }
            }
            catch (MySqlException ex)
            {

                Console.WriteLine(ex.ToString());
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

        public string Server { get => server; set => server = value; }

        public DataTable Consulta(string sentencia)
        {
            Connect();
            adapter = new MySqlDataAdapter(sentencia , connection);
            MySqlCommandBuilder cmb = new MySqlCommandBuilder(adapter);
            DataTable dt = new DataTable();
            adapter.Fill(dt);
            Disconnect();
            return dt;
        }
    }
}
