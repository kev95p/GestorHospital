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

        private String usuario;
        

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
    }
}
