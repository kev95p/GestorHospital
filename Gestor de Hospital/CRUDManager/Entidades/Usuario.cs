using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
    public class Usuario : OperacionesCrud
    {
        private string _idUsuario;
        private string _NombreUsuario;
        private string _idRol;
        private string _Password;
        private string _idEmpleado;

        #region Propiedades
        public string IdUsuario
        {
            get
            {
                return _idUsuario;
            }

            set
            {
                _idUsuario = value;
            }
        }

        public string NombreUsuario
        {
            get
            {
                return _NombreUsuario;
            }

            set
            {
                _NombreUsuario = value;
            }
        }

        public string IdRol
        {
            get
            {
                return _idRol;
            }

            set
            {
                _idRol = value;
            }
        }

        public string Password
        {
            get
            {
                return _Password;
            }

            set
            {
                _Password = value;
            }
        }

        public string IdEmpleado
        {
            get
            {
                return _idEmpleado;
            }

            set
            {
                _idEmpleado = value;
            }
        }
        #endregion

        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("INSERT INTO usuarios(usuario,password,idrol,idEmpleado) VALUES(");
            query.Append("'" + NombreUsuario + "',md5('" + Password + "')," + IdRol + "");
            query.Append("," + _idEmpleado + ");");
            cb.CommandText = query.ToString();

            int rowAffected = Insert(cb);
            return (rowAffected > 0);
        }

        public bool Actualizar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("UPDATE usuarios SET ");
            query.Append("usuario = '"+NombreUsuario+"', password = md5('"+Password+"') , idrol = "+IdRol+" , idEmpleado = "+IdEmpleado+" ");
            query.Append("WHERE idUsuario = " + IdUsuario + ";");
            cb.CommandText = query.ToString();

            int rowAffected = Update(cb);
            return (rowAffected > 0);
        }

        public bool Eliminar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("DELETE FROM usuarios ");
            query.Append("WHERE usuario = '" + NombreUsuario + "';");
            cb.CommandText = query.ToString();

            int rowAffected = Delete(cb);
            return (rowAffected > 0);
        }

    }
}
