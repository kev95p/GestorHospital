using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SessionManager
{
    public static class FechaHelper
    {

        public static string FormatearFecha(string fecha)
        {
            string[] partesFecha = fecha.Split('/');
            string fechaFormateada = partesFecha[2] + "-" + partesFecha[1] + "-" + partesFecha[0];
            return fechaFormateada;
        }

    }
}
