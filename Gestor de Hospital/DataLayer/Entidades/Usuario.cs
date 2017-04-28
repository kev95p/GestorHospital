using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Entidades
{
    public class Usuario : OperacionesCrud
    {
        private string _idUsuario;
        private string _NombreUsuario;
        private string _idRol;
        private string _Password;

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
        #endregion

        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("INSERT INTO usuarios(usuario,password,idrol) VALUES(");
            query.Append("'" + NombreUsuario + "',md5('" + Password + "')," + IdRol + ");");
            cb.CommandText = query.ToString();

            int rowAffected = Insert(cb);
            return (rowAffected > 0);
        }

        public bool Actualizar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("UPDATE usuarios SET ");
            query.Append("usuario = '"+NombreUsuario+"', password = md5('"+Password+"') ");
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
