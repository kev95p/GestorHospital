using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SessionManager
{
    public sealed class DatosCargados
    {
        private static DatosCargados instancia;
        private DataTable departamentos;
        private DataTable munipicipios;
        private DataTable roles;
        private static readonly object padlock = new object();

        public DataTable Departamentos
        {
            get
            {
                return departamentos;
            }

        }
        public DataTable Munipicipios
        {
            get
            {
                return munipicipios;
            }

        }
        public DataTable Roles
        {
            get
            {
                return roles;
            }

            set
            {
                roles = value;
            }
        }

        public static DatosCargados Instancia
        {
            get
            {
                lock (padlock)
                {
                    if (instancia == null)
                    {
                        instancia = new DatosCargados();
                    }
                    return instancia;
                }
            }
        }



        DatosCargados()
        {
            departamentos = CacheManager.Cache.OBTENER_DEPARTAMENTOS().Tables[0];
            munipicipios = CacheManager.Cache.OBTENER_MUNICIPIOS().Tables[0];
            roles = CacheManager.Cache.OBTENER_ROLES().Tables[0];
        }
    }
}
