using DataLayer;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager.Entidades
{
    public class Paciente : OperacionesCrud
    {
        int idPaciente;
        string primerNombre;
        string segundoNombre;
        string primerApellido;
        string segundoApellido;
        string sexo;
        string fechaNac;
        string dui;
        string email;
        string telefono;
        string residencia;
        string tiposangre;
        string estatura;
        string idMunicipio;
        string estado_civil;
        string peso;
        string ocupacion;
        string telefono_emergencia;
        string persona_emergencia;
        ImagenPerfil imagen;

        public int IdPaciente
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

        public string PrimerNombre
        {
            get
            {
                return primerNombre;
            }

            set
            {
                primerNombre = value;
            }
        }

        public string SegundoNombre
        {
            get
            {
                return segundoNombre;
            }

            set
            {
                segundoNombre = value;
            }
        }

        public string PrimerApellido
        {
            get
            {
                return primerApellido;
            }

            set
            {
                primerApellido = value;
            }
        }

        public string SegundoApellido
        {
            get
            {
                return segundoApellido;
            }

            set
            {
                segundoApellido = value;
            }
        }

        public string Sexo
        {
            get
            {
                return sexo;
            }

            set
            {
                sexo = value;
            }
        }

        public string FechaNac
        {
            get
            {
                return fechaNac;
            }

            set
            {
                fechaNac = value;
            }
        }

        public string Dui
        {
            get
            {
                return dui;
            }

            set
            {
                dui = value;
            }
        }

        public string Email
        {
            get
            {
                return email;
            }

            set
            {
                email = value;
            }
        }

        public string Telefono
        {
            get
            {
                return telefono;
            }

            set
            {
                telefono = value;
            }
        }

        public string Residencia
        {
            get
            {
                return residencia;
            }

            set
            {
                residencia = value;
            }
        }

        public string Tiposangre
        {
            get
            {
                return tiposangre;
            }

            set
            {
                tiposangre = value;
            }
        }

        public string Estatura
        {
            get
            {
                return estatura;
            }

            set
            {
                estatura = value;
            }
        }

        public string IdMunicipio
        {
            get
            {
                return idMunicipio;
            }

            set
            {
                idMunicipio = value;
            }
        }

        public string Estado_civil
        {
            get
            {
                return estado_civil;
            }

            set
            {
                estado_civil = value;
            }
        }

        public string Peso
        {
            get
            {
                return peso;
            }

            set
            {
                peso = value;
            }
        }

        public string Ocupacion
        {
            get
            {
                return ocupacion;
            }

            set
            {
                ocupacion = value;
            }
        }

        public string Telefono_emergencia
        {
            get
            {
                return telefono_emergencia;
            }

            set
            {
                telefono_emergencia = value;
            }
        }

        public string Persona_emergencia
        {
            get
            {
                return persona_emergencia;
            }

            set
            {
                persona_emergencia = value;
            }
        }

        public ImagenPerfil Imagen
        {
            get
            {
                return imagen;
            }

            set
            {
                imagen = value;
            }
        }


        public bool insertar()
        {
            CommandBuilder cb = new CommandBuilder();
            cb.SqlParams = new List<MySqlParameter> {
                new MySqlParameter("pPrimerNombre",primerNombre),
                new MySqlParameter("pSegundoNombre",segundoNombre),
                new MySqlParameter("pPrimerApellido",primerApellido),
                new MySqlParameter("pSegundoApellido",segundoApellido),
                new MySqlParameter("pSexo",sexo),
                new MySqlParameter("pFechaNac",fechaNac),
                new MySqlParameter("pDui",dui),
                new MySqlParameter("pEmail",email),
                new MySqlParameter("pTelefono",telefono),
                new MySqlParameter("pResidencia",residencia),
                new MySqlParameter("pTipoSangre",tiposangre),
                new MySqlParameter("pEstatura",estatura),
                new MySqlParameter("pMunicipio",idMunicipio),
                new MySqlParameter("pEstado_Civil",estado_civil),
                new MySqlParameter("pPeso",peso),
                new MySqlParameter("pOcupacion",ocupacion),
                new MySqlParameter("pTelefono_Emergencia",telefono_emergencia),
                new MySqlParameter("pPersona_Emergencia",persona_emergencia),
                new MySqlParameter("pImagen",imagen.Blob())
            };
            cb.StoredProcerudeName = "Insertar_Paciente";

            int rowAffected = Insert(cb);
            return (rowAffected > 0);
        }

        public bool actualizar()
        {
            CommandBuilder cb = new CommandBuilder();
            cb.SqlParams = new List<MySqlParameter> {
                new MySqlParameter("pIdPaciente",IdPaciente),
                new MySqlParameter("pPrimerNombre",primerNombre),
                new MySqlParameter("pSegundoNombre",segundoNombre),
                new MySqlParameter("pPrimerApellido",primerApellido),
                new MySqlParameter("pSegundoApellido",segundoApellido),
                new MySqlParameter("pSexo",sexo),
                new MySqlParameter("pFechaNac",fechaNac),
                new MySqlParameter("pDui",dui),
                new MySqlParameter("pEmail",email),
                new MySqlParameter("pTelefono",telefono),
                new MySqlParameter("pResidencia",residencia),
                new MySqlParameter("pTipoSangre",tiposangre),
                new MySqlParameter("pEstatura",estatura),
                new MySqlParameter("pMunicipio",idMunicipio),
                new MySqlParameter("pEstado_Civil",estado_civil),
                new MySqlParameter("pPeso",peso),
                new MySqlParameter("pOcupacion",ocupacion),
                new MySqlParameter("pTelefono_Emergencia",telefono_emergencia),
                new MySqlParameter("pPersona_Emergencia",persona_emergencia),
                new MySqlParameter("pImagen",imagen.Blob())
            };
            cb.StoredProcerudeName = "Actualizar_Paciente";

            int rowAffected = Update(cb);
            return (rowAffected > 0);
        }

        public bool eliminar()
        {
            CommandBuilder cb = new CommandBuilder();
            cb.SqlParams = new List<MySqlParameter> {
                new MySqlParameter("pIdPaciente",IdPaciente),
            };
            cb.StoredProcerudeName = "Eliminar_Paciente";

            int rowAffected = Insert(cb);
            return (rowAffected > 0);
        }

    }
}
