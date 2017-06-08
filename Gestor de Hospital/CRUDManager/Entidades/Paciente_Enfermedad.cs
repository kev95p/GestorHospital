using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
    public class Paciente_Enfermedad : OperacionesCrud
    {
        string idPaciente_Enfermedad;
        string idPaciente;
        string idEnfermedad;
        string estado;
        string fechaDiagnostico;

        public string IdPaciente_Enfermedad
        {
            get
            {
                return idPaciente_Enfermedad;
            }

            set
            {
                idPaciente_Enfermedad = value;
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

        public string IdEnfermedad
        {
            get
            {
                return idEnfermedad;
            }

            set
            {
                idEnfermedad = value;
            }
        }

        public string Estado
        {
            get
            {
                return estado;
            }

            set
            {
                estado = value;
            }
        }

        public string FechaDiagnostico
        {
            get
            {
                return fechaDiagnostico;
            }

            set
            {
                fechaDiagnostico = value;
            }
        }

        public bool insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("insert into pacientes_enfermedades(pacientes_enfermedades.idPaciente,pacientes_enfermedades.idEnfermedad,pacientes_enfermedades.fechaDiagnostico,pacientes_enfermedades.estado) ");
            query.Append("value(" + IdPaciente + "," + idEnfermedad + ",'" + FechaDiagnostico + "'," + estado + ");");
            cb.CommandText = query.ToString();

            int rowAffected = Insert(cb);
            return (rowAffected > 0);
        }

        public bool actualizar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("update pacientes_enfermedades set pacientes_enfermedades.idPaciente = "+idPaciente+" ,pacientes_enfermedades.idEnfermedad = "+idEnfermedad+" ,pacientes_enfermedades.fechaDiagnostico = '"+fechaDiagnostico+ "' ,pacientes_enfermedades.estado = " + estado+" ");
            query.Append("where pacientes_enfermedades.idPacienteEnfermedad = " + idPaciente_Enfermedad + " ; ");
            cb.CommandText = query.ToString();

            int rowAffected = Insert(cb);
            return (rowAffected > 0);
        }

    }
}
