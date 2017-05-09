using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
    public class Direccion
    {
        private int _idDireccion;
        private string _direccion;
        private int _idMunicipio;

        public int IdDireccion
        {
            get
            {
                return _idDireccion;
            }

            set
            {
                _idDireccion = value;
            }
        }

        public string DireccionDescripcion
        {
            get
            {
                return _direccion;
            }

            set
            {
                _direccion = value;
            }
        }

        public int IdMunicipio
        {
            get
            {
                return _idMunicipio;
            }

            set
            {
                _idMunicipio = value;
            }
        }
    }
}
