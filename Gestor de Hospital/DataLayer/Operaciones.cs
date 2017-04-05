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
    }
}
