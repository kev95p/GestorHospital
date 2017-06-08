using DataLayer;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CacheManager
{
    public static class CachePaciente
    {
        public static DataTable ENFERMEDADES(string idpaciente)
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select enfermedadespacientes.id,enfermedadespacientes.nombre,enfermedadespacientes.tipo,enfermedadespacientes.fechaDiagnostico,
                                enfermedadespacientes.estado from enfermedadespacientes where idPaciente = "+idpaciente+";";
                cb.CommandText = query;
                datos = cb.Select();
                return datos.Tables[0];
            }
            catch
            {
                return new DataTable();
            }
        }
    }
}
