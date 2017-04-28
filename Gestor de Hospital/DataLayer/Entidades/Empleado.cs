using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Entidades
{
    public class Empleado : OperacionesCrud
    {
        private string _IdEmpleado;
        private string _primer_Nombre;
        private string _segundo_Nombre;
        private string _primer_Apellido;
        private string _segundo_Apellido;
        private string _DUI;
        private string _IdDireccion;
        private string _IdUsuario;

        #region Propiedades

        public string IdEmpleado
        {
            get
            {
                return _IdEmpleado;
            }

            set
            {
                _IdEmpleado = value;
            }
        }

        public string Primer_Nombre
        {
            get
            {
                return _primer_Nombre;
            }

            set
            {
                _primer_Nombre = value;
            }
        }

        public string Segundo_Nombre
        {
            get
            {
                return _segundo_Nombre;
            }

            set
            {
                _segundo_Nombre = value;
            }
        }

        public string Primer_Apellido
        {
            get
            {
                return _primer_Apellido;
            }

            set
            {
                _primer_Apellido = value;
            }
        }

        public string Segundo_Apellido
        {
            get
            {
                return _segundo_Apellido;
            }

            set
            {
                _segundo_Apellido = value;
            }
        }

        public string DUI
        {
            get
            {
                return _DUI;
            }

            set
            {
                _DUI = value;
            }
        }

        public string IdDireccion
        {
            get
            {
                return _IdDireccion;
            }

            set
            {
                _IdDireccion = value;
            }
        }

        public string IdUsuario
        {
            get
            {
                return _IdUsuario;
            }

            set
            {
                _IdUsuario = value;
            }
        }
#endregion 

        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("INSERT INTO empleados(primer_nombre,segundo_nombre,primer_apellido,segundo_apellido,DUI,idDireccion,idUsuario) VALUES(");
            query.Append("'" + Primer_Nombre + "','" + Segundo_Nombre + "','"+Primer_Apellido+"','"+Segundo_Apellido+"','" + DUI + "',"+IdDireccion+",");
            if(IdUsuario == String.Empty)
            {
                query.Append("null);");
            }
            else
            {
                query.Append(IdUsuario+");");
            }
            cb.CommandText = query.ToString();

            int rowAffected = Insert(cb);
            return (rowAffected > 0);
        }

        public bool Actualizar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("UPDATE empleados SET ");
            query.Append("primer_nombre = '" + Primer_Nombre + "', segundo_nombre = '" + Segundo_Nombre + "' , ");
            query.Append("primer_apellido = '" + Primer_Apellido + "', segundo_apellido = '"+Segundo_Apellido+"' , DUI = '" + DUI + "', idDireccion = " + IdDireccion + " , ");
            if (IdUsuario == String.Empty)
            {
                query.Append("idUsuario = null");
            }
            else
            {
                query.Append("idUsuario = "+IdUsuario+" ");
            }
            query.Append("WHERE idUsuario = " + IdEmpleado + ";");
            cb.CommandText = query.ToString();

            int rowAffected = Update(cb);
            return (rowAffected > 0);
        }

        public bool Eliminar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("DELETE FROM empleados ");
            query.Append("WHERE usuario = '" + IdEmpleado + "';");
            cb.CommandText = query.ToString();

            int rowAffected = Delete(cb);
            return (rowAffected > 0);
        }
    }
}
