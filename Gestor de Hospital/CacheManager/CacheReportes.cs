using DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CacheManager
{
    public static class CacheReportes
    {
        public static DataSet PACIENTES_REPORTE(string fechainicial,string fechafinal)
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select concat(p.Nombres,' ',p.Apellidos) as Nombre_Completo,p.FechaRegistro,p.DUI  from vistapacientes p";
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
