using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
    public class RecetasMedicas : OperacionesCrud
    {
        private string idReceta;

        public string IdReceta
        {
            get { return idReceta; }
            set { idReceta = value; }
        }
        private string Descripcion;

        public string Descripcion1
        {
            get { return Descripcion; }
            set { Descripcion = value; }
        }
        private string FechaCreacion;

        public string FechaCreacion1
        {
            get { return FechaCreacion; }
            set { FechaCreacion = value; }
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
        private string Estado;

        public string Estado1
        {
            get { return Estado; }
            set { Estado = value; }
        }


        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("INSERT INTO hospital.recetas_medicas (Descripcion, FechaCreacion, idPaciente, idMedico, Estado) VALUES (");
            query.Append("'" + Descripcion1 + "', '" + FechaCreacion1 + "' ,'" + IdPaciente + "','" + IdMedico + "' ,'" + Estado1 + "');");
            cb.CommandText = query.ToString();

            return (Insert(cb) > 0);
        }


    }
}
