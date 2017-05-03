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

        public static DataSet OBTENER_EMPLEADO(int idEmpleado)
        {
            try
            {
                OperacionesCrud oc = new OperacionesCrud();
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"SELECT idEmpleado,primer_nombre,segundo_nombre,
                primer_apellido,segundo_apellido,idUsuario,DUI,idDireccion 
                from empleados where idEmpleado = "+idEmpleado+";";
                cb.CommandText = query;
                datos = oc.Select(cb);
                return datos;
            }
            catch
            {
                return new DataSet();
            }
        }

        public static DataSet OBTENER_DIRECCION(int idDireccion)
        {
            try
            {
                OperacionesCrud oc = new OperacionesCrud();
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"SELECT direccion,direcciones.idMunicipio,municipios.idDepartamento from direcciones,municipios 
                                where direcciones.idMunicipio = municipios.idMunicipio and idDireccion = "+idDireccion+" ;";
                cb.CommandText = query;
                datos = oc.Select(cb);
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
                OperacionesCrud oc = new OperacionesCrud();
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select * from vistaempleados";
                cb.CommandText = query;
                datos = oc.Select(cb);
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
                OperacionesCrud oc = new OperacionesCrud();
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select * from departamentos";
                cb.CommandText = query;
                datos = oc.Select(cb);
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
                OperacionesCrud oc = new OperacionesCrud();
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"select * from municipios";
                cb.CommandText = query;
                datos = oc.Select(cb);
                return datos;
            }
            catch
            {
                return new DataSet();
            }

        }

        public static DataSet OBTENER_USUARIOS_SIN_ASIGNAR()
        {
            try
            {
                OperacionesCrud oc = new OperacionesCrud();
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
                string query = @"SELECT ID,usuario,rol
                                FROM vistausuarios left join empleados on vistausuarios.ID = empleados.idUsuario 
                                WHERE idEmpleado is null ;";
                cb.CommandText = query;
                datos = oc.Select(cb);
                return datos;
            }
            catch
            {
                return new DataSet();
            }

        }
        public static DataSet CONSULTA(string query)
        {
            try
            {
                OperacionesCrud oc = new OperacionesCrud();
                DataSet datos = new DataSet();
                CommandBuilder cb = new CommandBuilder();
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
