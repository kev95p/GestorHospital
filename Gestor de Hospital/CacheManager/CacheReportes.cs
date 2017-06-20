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
        public static DataTable PACIENTES_REPORTE(string fechainicial,string fechafinal)
        {
            try
            {
                DataTable datos = new DataTable();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select concat(p.Nombres,' ',p.Apellidos) as Nombre_Completo,p.FechaRegistro,p.DUI  
                                from vistapacientes p;";
                cb.CommandText = query;
                datos = cb.Select().Tables[0];
                return datos;
            }
            catch
            {
                return new DataTable();
            }
        }

        public static DataTable ENFERMEDADES_REPORTE(string idenfermedad)
        {
            try
            {
                DataTable datos = new DataTable();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select concat(primerNombre,' ',segundoNombre,' ',primerApellido,' ',segundoApellido) as Nombre, enfermedades.nombre as Enfermedad
                                ,date_format(pacientes.fechaRegistro,'%d-%m-%Y') as Registro,pacientes.sexo as Sexo
                                from pacientes_enfermedades inner join pacientes on pacientes_enfermedades.idPaciente = pacientes.idPaciente 
                                inner join enfermedades on enfermedades.idenfermedad = pacientes_enfermedades.idEnfermedad where enfermedades.idenfermedad = " + idenfermedad+" ;";
                cb.CommandText = query;
                datos = cb.Select().Tables[0];
                return datos;
            }
            catch
            {
                return new DataTable();
            }
        }
    }
}
