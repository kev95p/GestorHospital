using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
   public class Diagnosticos : OperacionesCrud
    {
        private string idDiagnostico;
        private string idPaciente;
        private string idMedico;
        private string fechaCreacion;
        private string diagnostico;

        public string IdDiagnostico
        {
            get
            {
                return idDiagnostico;
            }

            set
            {
                idDiagnostico = value;
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

        public string FechaCreacion
        {
            get
            {
                return fechaCreacion;
            }

            set
            {
                fechaCreacion = value;
            }
        }

        public string Diagnostico
        {
            get
            {
                return diagnostico;
            }

            set
            {
                diagnostico = value;
            }
        }

        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("INSERT INTO hospital.diagnosticos (idPaciente, idMedico, fechaCreacion, diagnostico) VALUES(");
            query.Append("'" + IdPaciente + "', '" + IdMedico + "' ,'" + FechaCreacion + "' , '" + Diagnostico +  "');");
            cb.CommandText = query.ToString();

            return (Insert(cb) > 0);
        }
    }
}
