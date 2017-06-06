using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using DataLayer;
using System.IO;
using System.Drawing.Imaging;

namespace CRUDManager.Entidades
{
    public class ImagenPerfil : OperacionesCrud
    {
        string idImagenPerfil;
        Image imagen;
        string tipo;

        public string IdImagenPerfil
        {
            get
            {
                return idImagenPerfil;
            }

            set
            {
                idImagenPerfil = value;
            }
        }

        public Image Imagen
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

        public string Tipo
        {
            get
            {
                return tipo;
            }

            set
            {
                tipo = value;
            }
        }

        public byte[] Blob()
        {
            MemoryStream ms = new MemoryStream();
            imagen.Save(ms, ImageFormat.Png);
            return ms.ToArray();
        }


    }
}
