using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SessionManager
{
    public sealed class SessionManager
    {
        private static SessionManager instace= null;
        private static readonly object padlock = new object();

        private string usuario;
        private string rol;
        private string nombre;
        private string idEmpleado;
        

        SessionManager()
        {
                    
        }

        public static SessionManager GetInstance
        {
            get
            {
                lock (padlock)
                {
                    if(instace == null)
                    {
                        instace = new SessionManager();
                    }
                    return instace;
                }
            }
        }

        public string Usuario
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

        public string Rol
        {
            get
            {
                return rol;
            }

            set
            {
                rol = value;
            }
        }

        public string Nombre
        {
            get
            {
                return nombre;
            }

            set
            {
                nombre = value;
            }
        }

        public string IdEmpleado
        {
            get
            {
                return idEmpleado;
            }

            set
            {
                idEmpleado = value;
            }
        }
    }
}
