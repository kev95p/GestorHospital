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

        public static DataTable TODOS_MEDICOS()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select ID,concat(Nombres,' ',Apellidos) as Nombre from vistaempleados where vistaempleados.idrol = 2;";
                cb.CommandText = query;
                datos = cb.Select();
                return datos.Tables[0];
            }
            catch
            {
                return new DataTable();
            }
        } 

        public static DataTable CONSULTAS(string idpaciente)
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select concat(empleados.primer_nombre,' ',empleados.primer_apellido) as Medico,date_format(consultas.FechaConsulta,'%d-%m-%Y') as FechaConsulta 
                                from consultas join empleados on consultas.idMedico = empleados.idEmpleado where consultas.idPaciente = "+idpaciente+";";
                cb.CommandText = query;
                datos = cb.Select();
                return datos.Tables[0];
            }
            catch
            {
                return new DataTable();
            }
        }

        public static DataTable DIAGNOSTICOS(string idpaciente)
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select concat(empleados.primer_nombre,' ', empleados.primer_apellido) as Medico, diagnostico,  
                                 date_format(diagnosticos.fechaCreacion,'%d-%m-%Y') as FechaCrecion
                                 from diagnosticos join empleados on diagnosticos.idMedico = empleados.idEmpleado
                                 where diagnosticos.idPaciente = " + idpaciente + ";";
                cb.CommandText = query;
                datos = cb.Select();
                return datos.Tables[0];
            }
            catch
            {
                return new DataTable();
            }
        }

        public static DataTable CITAS(string idpaciente)
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select idCita,concat(empleados.primer_nombre,' ',empleados.primer_apellido) as Medico,date_format(citas.fechaCita,'%d-%m-%Y') as Fecha,citas.motivos,citas.estado from citas join empleados on citas.idMedico = empleados.idEmpleado
                                    where citas.idPaciente = "+idpaciente+";";
                cb.CommandText = query;
                datos = cb.Select();
                return datos.Tables[0];
            }
            catch
            {
                return new DataTable();
            }
        }

        
        

        public static DataTable RECETAS(string idpaciente)
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select recetas_medicas.idReceta,concat(empleados.primer_nombre,' ',empleados.segundo_apellido) as Medico, DATE_FORMAT(recetas_medicas.FechaCreacion,'%d-%m-%y') as Fecha
                                ,recetas_medicas.Descripcion,recetas_medicas.Estado from recetas_medicas join empleados on recetas_medicas.idMedico = empleados.idEmpleado
                                where recetas_medicas.idPaciente = "+idpaciente+";";
                cb.CommandText = query;
                datos = cb.Select();
                return datos.Tables[0];
            }
            catch
            {
                return new DataTable();
            }
        }

        public static DataTable MEDICAMENTOS_RECETAS()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select * from vistarecetas";
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
