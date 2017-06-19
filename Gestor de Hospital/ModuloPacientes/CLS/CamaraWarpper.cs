using AForge.Video;
using AForge.Video.DirectShow;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ModuloPacientes.CLS
{
    
    class CamaraWrapper
    {

        private FilterInfoCollection dispositivosVideo;
        private VideoCaptureDevice fuenteVideo;
        public bool existeDispositivo = false;
        private System.Windows.Forms.PictureBox vistaCamara;

        public PictureBox VistaCamara
        {
            get
            {
                return vistaCamara;
            }

            set
            {
                vistaCamara = value;
            }
        }

        public CamaraWrapper()
        {
            BuscarDispositivos();
        }

        private void BuscarDispositivos()
        {
            dispositivosVideo = new FilterInfoCollection(FilterCategory.VideoInputDevice);
            if (dispositivosVideo.Count != 0)
            {
                existeDispositivo = true;
            }
            else
            {
                existeDispositivo = false;
            }

        }

        private void NuevoFrame(object sender, NewFrameEventArgs e)
        {
            Image frame = (Bitmap)e.Frame.Clone();
            VistaCamara.Image = frame;
        }

        public void Iniciar()
        {
            if (existeDispositivo)
            {
                fuenteVideo = new VideoCaptureDevice(dispositivosVideo[0].MonikerString);
                fuenteVideo.NewFrame += new NewFrameEventHandler(NuevoFrame);
                fuenteVideo.Start();
                
            }
        }

        public void Detener()
        {
            if(fuenteVideo != null) { 
                if (fuenteVideo.IsRunning)
                {
                    fuenteVideo.SignalToStop();
                    fuenteVideo = null;
                }
            }

        }

        public void TomarImagen()
        {
            Bitmap bmp = new Bitmap(vistaCamara.Image);
            Detener();
            vistaCamara.Image = bmp;
        }



    }
}
