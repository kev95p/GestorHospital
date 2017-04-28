using GUI.Properties;
using SessionManager;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI
{
    public partial class Principal : Form
    {
        public Principal()
        {
            InitializeComponent();
        }

        private void Principal_Load(object sender, EventArgs e)
        {
            bwCheckConnection.DoWork += new DoWorkEventHandler(work);
            bwCheckConnection.RunWorkerAsync();

            //cargar usuarios label
            lblUsuario.Text = SessionManager.SessionManager.GetInstance.Usuario;
            
        }

        private void work(object sender,DoWorkEventArgs e)
        {
            Ping Pings = new Ping();
            int timeout = 200;
            BackgroundWorker worker = sender as BackgroundWorker;
            int delay = 1000;
            while (!worker.CancellationPending)
            {
                try
                {
                    
                    switch(Pings.Send("127.0.0.1", timeout).Status)
                    {
                        case IPStatus.Success:
                            lblStateImage.Image = Resources.connected;
                            break;
                        case IPStatus.TimedOut:
                            lblStateImage.Image = Resources.disconnected;
                            break;
                    }
                }
                catch (PingException ex)
                {

                    lblStateImage.Image = Resources.disconnected;
                }

                Thread.Sleep(delay);
            }
            e.Cancel = true;
        }

        private void UsuariosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GestionUsuario.UsuariosVista frm = new GestionUsuario.UsuariosVista();         
            frm.ShowDialog();
        }

        private void EmpleadosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GestionEmpleado.EmpleadosVista frm = new GestionEmpleado.EmpleadosVista();
            frm.ShowDialog();
        }
    }
}
