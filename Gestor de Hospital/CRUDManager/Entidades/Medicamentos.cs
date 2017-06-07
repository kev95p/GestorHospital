using DataLayer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
   public class Medicamentos : OperacionesCrud
    {
        //Atributos
        private string _idMedicamento;
        private string _nombre;
        private string _concentracion;
        private string _presentacion;
        private string _via;

       
        //Propiedades
        public string IdMedicamento
        {
            get
            {
                return _idMedicamento;
            }

            set
            {
                _idMedicamento = value;
            }

        }

        public string Nombre
        {
            get
            {
                return _nombre;
            }

            set
            {
                _nombre = value;
            }
        }

        public string Concentracion
        {
            get
            {
                return _concentracion;
            }

            set
            {
                _concentracion = value;
            }
        }

        public string Presentacion
        {
            get
            {
                return _presentacion;
            }

            set
            {
                _presentacion = value;
            }
        }

        public string Via
        {
            get
            {
                return _via;
            }

            set
            {
                _via = value;
            }
        }


        //Metodos
        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("INSERT INTO hospital.medicamentos ( nombre, concentracion, presentacion, via ) VALUES ( ");
            query.Append(" '" + Nombre + "', '" + Concentracion + "', '" + Presentacion + "', '" + Via + "')");
            cb.CommandText = query.ToString();

            int rowAffected = Insert(cb);
            return (rowAffected > 0);
        }


        public bool Actualizar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("UPDATE hospital.medicamentos SET ");
            query.Append("nombre = '" + Nombre + "', concentracion = '" + Concentracion + "', presentacion = '" + Presentacion + "', via = '" + Via + "' ");
            query.Append("WHERE idMedicamento = " + IdMedicamento + ";");
            cb.CommandText = query.ToString();

            int rowAffected = Update(cb);
            return (rowAffected > 0);
        }

        public bool Eliminar()
        {
            CommandBuilder cb = new CommandBuilder();
            StringBuilder query = new StringBuilder();
            query.Append("DELETE FROM hospital.medicamentos ");
            query.Append("WHERE idMedicamento = '" + IdMedicamento + "';");
            cb.CommandText = query.ToString();

            int rowAffected = Delete(cb);
            return (rowAffected > 0);
        }


    }
}
