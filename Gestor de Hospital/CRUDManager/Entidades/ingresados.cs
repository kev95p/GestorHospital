using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
   public class ingresados : OperacionesCrud
    {
        private string idIngresado;
        private string idPaciente;
        private string idMedico;
        private string FechaIngreso;
        private string Motivos;
        private string numeroHabitacion;
        private string FechaAlta;

        public string IdIngresado
        {
            get
            {
                return idIngresado;
            }

            set
            {
                idIngresado = value;
            }
        }

        public string IdPaciente
        {
            get
            {
                return idPaciente;
            }

            set
            {
                idPaciente = value;
            }
        }

        public string IdMedico
        {
            get
            {
                return idMedico;
            }

            set
            {
                idMedico = value;
            }
        }

        public string FechaIngreso1
        {
            get
            {
                return FechaIngreso;
            }

            set
            {
                FechaIngreso = value;
            }
        }

        public string Motivos1
        {
            get
            {
                return Motivos;
            }

            set
            {
                Motivos = value;
            }
        }

        public string NumeroHabitacion
        {
            get
            {
                return numeroHabitacion;
            }

            set
            {
                numeroHabitacion = value;
            }
        }

        public string FechaAlta1
        {
            get
            {
                return FechaAlta;
            }

            set
            {
                FechaAlta = value;
            }
        }


        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("INSERT INTO hospital.ingresados (idPaciente, idMedico, FechaIngreso, Motivos, numeroHabitacion ) VALUES(");
            query.Append("" + IdPaciente + ", " + IdMedico + " ,'" + FechaIngreso1 + "' , '" + Motivos1 + "','" + NumeroHabitacion + "');");
            cb.CommandText = query.ToString();

            return (Insert(cb) > 0);
        }

        public bool Actualizar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("UPDATE hospital.ingresados SET ");
            query.Append("FechaAlta = '" + FechaAlta1 + "' ");
            query.Append("WHERE idIngresado = " + IdIngresado + ";");
            cb.CommandText = query.ToString();

            int rowAffected = Update(cb);
            return (rowAffected > 0);
        }

        public bool Eliminar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("delete from ingresados where idIngresado = "+idIngresado+";");
            cb.CommandText = query.ToString();

            int rowAffected = Update(cb);
            return (rowAffected > 0);
        }


    }
}
