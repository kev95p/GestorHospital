using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
    public class Citas : OperacionesCrud
    
    {
        private string idCita;

        public string IdCita
        {
            get { return idCita; }
            set { idCita = value; }
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
        private string estado;

        public string Estado
        {
            get { return estado; }
            set { estado = value; }
        }
        private string fechaCita;

        public string FechaCita
        {
            get { return fechaCita; }
            set { fechaCita = value; }
        }
        private string motivos;

        public string Motivos
        {
            get { return motivos; }
            set { motivos = value; }
        }

        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("INSERT INTO hospital.citas (idPaciente, idMedico, estado, fechaCita, motivos) VALUES (");
            query.Append("'" + IdPaciente + "', '" + IdMedico + "' ,'" + Estado + "','" + FechaCita + "' ,'" + Motivos + "');");
            cb.CommandText = query.ToString();

            return (Insert(cb) > 0);
        }

        public bool Cancelar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("UPDATE citas SET estado = 'Cancelada' where  IdCita="+idCita+";" );
            cb.CommandText = query.ToString();
            return (Update(cb) > 0);
        }

        public bool Completar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("UPDATE citas SET estado = 'Completada' where  IdCita=" + idCita + ";");
            cb.CommandText = query.ToString();
            return (Update(cb) > 0);
        }




    }
}
