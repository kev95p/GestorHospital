using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
    public class Consultas : OperacionesCrud
    {
        private string idConsulta;

        public string IdConsulta
        {
            get { return idConsulta; }
            set { idConsulta = value; }
        }
        private string idPaciente;

        public string IdPaciente
        {
            get { return idPaciente; }
            set { idPaciente = value; }
        }
        private string idMedico;

        public string IdMedico
        {
            get { return idMedico; }
            set { idMedico = value; }
        }
        private string FechaConsulta;

        public string FechaConsulta1
        {
            get { return FechaConsulta; }
            set { FechaConsulta = value; }
        }



        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("INSERT INTO hospital.consultas (idPaciente, idMedico, FechaConsulta) VALUES (");
            query.Append("'" + IdPaciente + "', '" + IdMedico + "' ,'" + FechaConsulta1 + "');");
            cb.CommandText = query.ToString();

            return (Insert (cb) > 0);
        }




    }
}
