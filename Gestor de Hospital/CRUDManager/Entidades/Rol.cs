using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
    public class Rol : OperacionesCrud
    {
        private string idRol;
        private string nombreRol;

        public string IdRol
        {
            get
            {
                return idRol;
            }

            set
            {
                idRol = value;
            }
        }

        public string NombreRol
        {
            get
            {
                return nombreRol;
            }

            set
            {
                nombreRol = value;
            }
        }

        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("INSERT INTO roles(Rol) VALUES(");
            query.Append("'" + nombreRol + "');");
            cb.CommandText = query.ToString();
            return (Insert(cb)>0);
        }

        public bool Actualizar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("UPDATE roles SET ");
            query.Append("Rol = '" + nombreRol + "' ");
            query.Append("WHERE idRol = " + idRol + " ;");
            cb.CommandText = query.ToString();
            return (Update(cb) > 0);
        }

        public bool Eliminar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("DELETE FROM roles WHERE ");
            query.Append("idRol = "+IdRol+" ;");
            cb.CommandText = query.ToString();
            return (Delete(cb) > 0);
        }
    }
}
