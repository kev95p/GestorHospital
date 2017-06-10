using DataLayer;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
    public class Empleado : OperacionesCrud
    {
        private string _IdEmpleado;
        private string _primer_Nombre;
        private string _segundo_Nombre;
        private string _primer_Apellido;
        private string _segundo_Apellido;
        private string _DUI;
        private string _especialidad;
        private string _residencia;
        private string _email;
        private string _telefono;
        private string _idMunicipio;
        private Usuario usuario = new Usuario();
        bool asignarUsuario;

        public string IdEmpleado
        {
            get
            {
                return _IdEmpleado;
            }

            set
            {
                _IdEmpleado = value;
            }
        }

        public string Primer_Nombre
        {
            get
            {
                return _primer_Nombre;
            }

            set
            {
                _primer_Nombre = value;
            }
        }

        public string Segundo_Nombre
        {
            get
            {
                return _segundo_Nombre;
            }

            set
            {
                _segundo_Nombre = value;
            }
        }

        public string Primer_Apellido
        {
            get
            {
                return _primer_Apellido;
            }

            set
            {
                _primer_Apellido = value;
            }
        }

        public string Segundo_Apellido
        {
            get
            {
                return _segundo_Apellido;
            }

            set
            {
                _segundo_Apellido = value;
            }
        }

        public string DUI
        {
            get
            {
                return _DUI;
            }

            set
            {
                _DUI = value;
            }
        }

        public string Residencia
        {
            get
            {
                return _residencia;
            }

            set
            {
                _residencia = value;
            }
        }

        public string Email
        {
            get
            {
                return _email;
            }

            set
            {
                _email = value;
            }
        }

        public string Telefono
        {
            get
            {
                return _telefono;
            }

            set
            {
                _telefono = value;
            }
        }

        public string IdMunicipio
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

        public bool AsignarUsuario
        {
            get
            {
                return asignarUsuario;
            }

            set
            {
                asignarUsuario = value;
            }
        }

        public Usuario Usuario
        {
            get
            {
                return usuario;
            }

            set
            {
                usuario = value;
            }
        }

        public string Especialidad
        {
            get
            {
                return _especialidad;
            }

            set
            {
                _especialidad = value;
            }
        }

        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            cb.SqlParams = new List<MySqlParameter>
            {
                new MySqlParameter("AsignarUsuario",AsignarUsuario),
                new MySqlParameter("pPrimer_Nombre",Primer_Nombre),
                new MySqlParameter("pSegundo_Nombre", Segundo_Nombre),
                new MySqlParameter("pPrimer_Apellido",Primer_Apellido),
                new MySqlParameter("pSegundo_Apellido",Segundo_Apellido),
                new MySqlParameter("pMunicipio",IdMunicipio),
                new MySqlParameter("pDUI",DUI),
                new MySqlParameter("pEmail",Email),
                new MySqlParameter("pTelefono",Telefono),
                new MySqlParameter("pUsuario",Usuario.NombreUsuario),
                new MySqlParameter("pPassword",Usuario.Password),
                new MySqlParameter("pRol",Usuario.IdRol),
                new MySqlParameter("pResidencia",Residencia),
                new MySqlParameter("pEspecialidad",Especialidad)
            };
            cb.StoredProcerudeName = "Insertar_Empleado";
            return (Insert(cb)>0);
        }

        public bool Actualizar()
        {
            CommandBuilder cb = new CommandBuilder();
            cb.SqlParams = new List<MySqlParameter>
            {
                new MySqlParameter("pAsignarUsuario",AsignarUsuario),
                new MySqlParameter("pIdEmpleado",IdEmpleado),
                new MySqlParameter("pPrimer_Nombre",Primer_Nombre),
                new MySqlParameter("pSegundo_Nombre", Segundo_Nombre),
                new MySqlParameter("pPrimer_Apellido",Primer_Apellido),
                new MySqlParameter("pSegundo_Apellido",Segundo_Apellido),
                new MySqlParameter("pMunicipio",IdMunicipio),
                new MySqlParameter("pDUI",DUI),
                new MySqlParameter("pEmail",Email),
                new MySqlParameter("pTelefono",Telefono),
                new MySqlParameter("pUsuario",Usuario.NombreUsuario),
                new MySqlParameter("pPassword",Usuario.Password),
                new MySqlParameter("pRol",Usuario.IdRol),
                new MySqlParameter("pResidencia",Residencia),
                new MySqlParameter("pEspecialidad",Especialidad)
            };
            cb.StoredProcerudeName = "Actualizar_Empleado";
            return (Update(cb) > 0);
        }

        public bool Eliminar()
        {
            CommandBuilder cb = new CommandBuilder();
            cb.SqlParams = new List<MySqlParameter>
            {
                new MySqlParameter("pIdEmpleado",IdEmpleado)
            };
            cb.StoredProcerudeName = "Eliminar_Empleado";
            return (Delete(cb) > 0);
        }
    }
}
