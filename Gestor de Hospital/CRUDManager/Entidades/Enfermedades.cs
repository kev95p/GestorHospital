using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
    public class Enfermedades : OperacionesCrud
    {
        //Atributos
        private string idenfemedades;
        private string nombre;
        private string tipo;

        //Propiedades
        public string Idenfemedades
        {
            get
            {
                return idenfemedades;
            }

            set
            {
                idenfemedades = value;
            }
        }

        public string Nombre
        {
            get
            {
                return nombre;
            }

            set
            {
                nombre = value;
            }
        }

        public string Tipo
        {
            get
            {
                return tipo;
            }

            set
            {
                tipo = value;
            }
        }



        //Metodos
        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("INSERT INTO hospital.enfermedades (nombre, tipo ) VALUES ( ");
            query.Append(" '" + Nombre + "', '" + Tipo + "' )");
            cb.CommandText = query.ToString();

            int rowAffected = Insert(cb);
            return (rowAffected > 0);
        }


        public bool Actualizar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("UPDATE hospital.enfermedades SET ");
            query.Append("nombre = '" + Nombre + "', tipo = '" + Tipo + "' ");
            query.Append("WHERE idenfermedades = " + Idenfemedades + ";");
            cb.CommandText = query.ToString();

            int rowAffected = Update(cb);
            return (rowAffected > 0);
        }

        public bool Eliminar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("DELETE FROM hospital.enfermedades ");
            query.Append("WHERE idenfermedades = '" + Idenfemedades + "';");
            cb.CommandText = query.ToString();

            int rowAffected = Delete(cb);
            return (rowAffected > 0);
        }


    }
}
