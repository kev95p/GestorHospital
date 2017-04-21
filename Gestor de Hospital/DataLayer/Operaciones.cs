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
        public static DataTable OBTENER_USUARIO(string usuario,string clave)
        {
            try
            {
                Conexion con = Conexion.getInstance;
                DataTable datos = new DataTable();
                string query = @"SELECT usuario
                FROM usuarios WHERE password=md5('" + clave + "') AND usuario = '" + usuario+"'";
                datos = con.Consulta(query);
                return datos;

            }
            catch
            {

                return new DataTable();
            }
        }

        public static DataTable OBTENER_USUARIOS()
        {
            try
            {
                Conexion con = Conexion.getInstance;
                DataTable datos = new DataTable();
                string query = "select * from vistaUsuarios";
                datos = con.Consulta(query);
                return datos;
            }
            catch
            {
                return new DataTable();
            }
        }

        public static DataTable OBTENER_ROLES()
        {
            try
            {
                DataTable dt = new DataTable();
                Conexion con = Conexion.getInstance;
                var query = "SELECT idRol,Rol FROM roles";
                dt = con.Consulta(query);
                return dt;
            }
            catch
            {

                return new DataTable();
            }
        }
    }
}
