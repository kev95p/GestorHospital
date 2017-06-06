using DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CacheManager
{
    public static class Cache
    {
        public static DataSet OBTENER_USUARIO(string usuario, string clave)
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"SELECT usuario
                FROM usuarios WHERE password=md5('" + clave + "') AND usuario = '" + usuario + "'";
                cb.CommandText = query;
                datos = cb.Select();
                return datos;

            }
            catch
            {
                return new DataSet();
            }
        }

        public static DataSet OBTENER_USUARIOS()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select * from vistausuarios";
                cb.CommandText = query;
                datos = cb.Select();
                return datos;
            }
            catch
            {
                return new DataSet();
            }
        }

        public static DataSet OBTENER_ROLES()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                var query = "SELECT idRol,Rol FROM roles";
                cb.CommandText = query;
                datos = cb.Select();
                return datos;
            }
            catch
            {

                return new DataSet();
            }
        }

        public static DataSet OBTENER_EMPLEADOS()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select * from vistaempleados";
                cb.CommandText = query;
                datos = cb.Select();
                return datos;
            }
            catch
            {
                return new DataSet();
            }
        }

        public static DataSet OBTENER_DEPARTAMENTOS()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select * from departamentos";
                cb.CommandText = query;
                datos = cb.Select();
                return datos;
            }
            catch
            {
                return new DataSet();
            }

        }

        public static DataSet OBTENER_MUNICIPIOS()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select * from municipios";
                cb.CommandText = query;
                datos = cb.Select();
                return datos;
            }
            catch
            {
                return new DataSet();
            }

        }

        public static DataSet OBTENER_TIPO_SANGRE()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select * from sangretipos";
                cb.CommandText = query;
                datos = cb.Select();
                return datos;
            }
            catch
            {
                return new DataSet();
            }
        }


        public static DataSet OBTENER_MEDICAMENTOS()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"SELECT * FROM hospital.medicamentos";
                cb.CommandText = query;
                datos = cb.Select();
                return datos;
            }
            catch
            {
                return new DataSet();
            }
        }

    }
}
