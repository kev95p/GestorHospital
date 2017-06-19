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
                string query = @"select usuarios.usuario,roles.Rol,concat(empleados.primer_nombre,' ',empleados.segundo_nombre) as Nombre,empleados.idEmpleado 
                                from usuarios join roles on usuarios.idrol = roles.idRol left join empleados on empleados.idEmpleado = usuarios.idEmpleado
                                WHERE password=md5('" + clave + "') AND usuario = '" + usuario + "'";
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

        public static DataSet OBTENER_PACIENTES()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select * from vistapacientes";
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
                string query = @"SELECT * FROM hospital.medicamentos;";
                cb.CommandText = query;
                datos = cb.Select();
                return datos;
            }
            catch
            {
                return new DataSet();
            }
        }

        public static DataSet OBTENER_ESPECIALIDADES()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"SELECT * FROM hospital.especialidades;";
                cb.CommandText = query;
                datos = cb.Select();
                return datos;
            }
            catch
            {
                return new DataSet();
            }
        }

        public static DataSet OBTENER_ENFERMEDADES()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"SELECT * FROM hospital.enfermedades;";
                cb.CommandText = query;
                datos = cb.Select();
                return datos;
            }
            catch
            {
                return new DataSet();
            }
        }

        public static DataSet OBTENER_DETALLE_PACIENTES_INGRESADOS()
        {
            try
            {
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"SELECT * FROM hospital.vistapacientesingresados;";
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
