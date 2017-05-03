using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Entidades
{
    public class Empleado : OperacionesCrud
    {
        private string _IdEmpleado;
        private string _primer_Nombre;
        private string _segundo_Nombre;
        private string _primer_Apellido;
        private string _segundo_Apellido;
        private string _DUI;
        private Direccion direccion;
        private int? _IdUsuario;

        #region Propiedades

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

        public int? IdUsuario
        {
            get
            {
                return _IdUsuario;
            }

            set
            {
                _IdUsuario = value;
            }
        }

        public Direccion Direccion
        {
            get
            {
                return direccion;
            }

            set
            {
                direccion = value;
            }
        }
        #endregion


        private List<MySqlParameter> ParametrosInsertar()
        {
            List<MySqlParameter> parametros = new List<MySqlParameter>
            {
                new MySqlParameter("pPrimer_nombre", MySqlDbType.VarChar) { Value = Primer_Nombre },
                new MySqlParameter("pSegundo_nombre", MySqlDbType.VarChar) { Value = Segundo_Nombre },
                new MySqlParameter("pPrimer_apellido", MySqlDbType.VarChar) { Value = Primer_Apellido },
                new MySqlParameter("pSegundo_apellido", MySqlDbType.VarChar) { Value = Segundo_Apellido },
                new MySqlParameter("pDUI", MySqlDbType.VarChar) { Value = DUI },
                new MySqlParameter("pIdUsuario", MySqlDbType.Int32) { Value = IdUsuario },
                new MySqlParameter("pMunicipio", MySqlDbType.Int32) { Value = direccion.IdMunicipio },
                new MySqlParameter("pDireccion", MySqlDbType.VarChar) { Value = direccion.DireccionDescripcion }
            };
            return parametros;

        }

        private List<MySqlParameter> ParametrosActualizar()
        {
            List<MySqlParameter> parametros = new List<MySqlParameter>
            {
                new MySqlParameter("pIdEmpleado", MySqlDbType.Int32) { Value = IdEmpleado },
                new MySqlParameter("pPrimer_nombre", MySqlDbType.VarChar) { Value = Primer_Nombre },
                new MySqlParameter("pSegundo_nombre", MySqlDbType.VarChar) { Value = Segundo_Nombre },
                new MySqlParameter("pPrimer_apellido", MySqlDbType.VarChar) { Value = Primer_Apellido },
                new MySqlParameter("pSegundo_apellido", MySqlDbType.VarChar) { Value = Segundo_Apellido },
                new MySqlParameter("pDUI", MySqlDbType.VarChar) { Value = DUI },
                new MySqlParameter("pIdUsuario", MySqlDbType.Int32) { Value = IdUsuario },
                new MySqlParameter("pMunicipio", MySqlDbType.Int32) { Value = direccion.IdMunicipio },
                new MySqlParameter("pDireccion", MySqlDbType.VarChar) { Value = direccion.DireccionDescripcion }
            };
            return parametros;

        }

        public bool Insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            cb.StoredProcerudeName = "Insertar_Empleado;";
            cb.SqlParams = ParametrosInsertar();
            return (cb.Execute() > 0);
            
        }

        public bool Actualizar()
        {
            CommandBuilder cb = new CommandBuilder();
            cb.StoredProcerudeName = "Actualizar_Empleado";
            cb.SqlParams = ParametrosActualizar();
            return (cb.Execute() > 0);
        }

        public bool Eliminar()
        {
            CommandBuilder cb = new CommandBuilder();
            cb.StoredProcerudeName = "Eliminar_Empleado";
            cb.SqlParams = new List<MySqlParameter>
            {
                new MySqlParameter("pIdEmpleado", MySqlDbType.Int32) { Value = IdEmpleado }
            };

            int rowAffected = cb.Execute();
            return (rowAffected > 0);
        }
    }
}
