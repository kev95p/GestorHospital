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
        public static DataSet OBTENER_USUARIOS(string usuario,string clave)
        {
            
            try
            {
                DataSet datos = new DataSet();
                Conexion con = Conexion.getInstancia;
                string sentencia = @"SELECT usuario
                FROM usuarios WHERE password = md5('" + clave + @"')
                AND usuario = '"+usuario+"'";
                datos = con.Consulta(sentencia);
                return datos;
            }
            catch
            {
                return new DataSet();
            }

        }

    }
}
