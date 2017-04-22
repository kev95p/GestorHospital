using DataLayer.Intefaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public static class Operaciones
    {
        public static DataSet OBTENER_USUARIO(string usuario,string clave)
        {
            try
            {
                OperacionesCrud oc = new OperacionesCrud();
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"SELECT usuario
                FROM usuarios WHERE password=md5('" + clave + "') AND usuario = '" + usuario+"'";
                cb.CommandText = query;
                datos = oc.Select(cb);
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
                OperacionesCrud oc = new OperacionesCrud();
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select * from vistausuarios";
                cb.CommandText = query;
                datos = oc.Select(cb);
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
                OperacionesCrud oc = new OperacionesCrud();
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                var query = "SELECT idRol,Rol FROM roles";
                cb.CommandText = query;
                datos = oc.Select(cb);
                return datos;
            }
            catch
            {

                return new DataSet();
            }
        }


    }
}
