﻿using System;
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

        public string NombreUsuario { get => _NombreUsuario; set => _NombreUsuario = value; }
        public string IdRol { get => _idRol; set => _idRol = value; }
        public string Password { get => _Password; set => _Password = value; }
        public string IdUsuario { get => _idUsuario; set => _idUsuario = value; }

        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("INSERT INTO usuarios(usuario,password,idrol) VALUES(");
            query.Append("'" + _NombreUsuario + "',md5('" + _Password + "')," + _idRol + ");");
            cb.CommandText = query.ToString();

            int rowAffected = Insert(cb);
            return (rowAffected > 0);
        }

        public bool Actualizar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("UPDATE usuarios SET ");
            query.Append("usuario = '"+_NombreUsuario+"', password = md5('"+_Password+"') ");
            query.Append("WHERE idUsuario = " + _idUsuario + ";");
            cb.CommandText = query.ToString();

            int rowAffected = Update(cb);
            return (rowAffected > 0);
        }

        public bool Eliminar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("DELETE FROM usuarios ");
            query.Append("WHERE usuario = '" + _NombreUsuario + "';");
            cb.CommandText = query.ToString();

            int rowAffected = Delete(cb);
            return (rowAffected > 0);
        }

    }
}