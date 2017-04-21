using MainForms.Properties;
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

namespace MainForms
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
                    
                    switch(Pings.Send("192.168.1.1", timeout).Status)
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
            UsuarioForms.UsuariosVista frm = new UsuarioForms.UsuariosVista();
            
            frm.ShowDialog();
        }
    }
}
