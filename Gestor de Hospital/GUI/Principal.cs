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
        volatile bool conectado = false;
        public Principal()
        {
            InitializeComponent();
        }

        private void Principal_Load(object sender, EventArgs e)
        {
            bwCheckConnection.DoWork += new DoWorkEventHandler(work);
            bwCheckConnection.RunWorkerCompleted += new RunWorkerCompletedEventHandler(workComplete);
            Intervalo.Start();
            //cargar usuarios label
            lblUsuario.Text = SessionManager.SessionManager.GetInstance.Usuario;
            lblmaquina.Text = Environment.MachineName.ToString();

        }

        private void work(object sender,DoWorkEventArgs e)
        {
            Ping Pings = new Ping();
            int timeout = 200;
            BackgroundWorker worker = sender as BackgroundWorker;
                try
                {
                    

                        
                        switch (Pings.Send("192.168.1.1", timeout).Status)
                        {
                            case IPStatus.Success:
                                conectado = true;
                                break;
                            case IPStatus.TimedOut:
                                conectado = false;
                                break;
                        }
                    
                }
                catch
                {

                    conectado = false;
                }
            
        }
        
        private void workComplete(object sender,RunWorkerCompletedEventArgs e)
        {
            if (conectado)
            {
                lblStateImage.Image = Resources.connected;
            }
            else
            {
                lblStateImage.Image = Resources.disconnected;
            }
        }

        private void EmpleadosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GestionEmpleado.EmpleadosVista frm = new GestionEmpleado.EmpleadosVista();
            frm.ShowDialog();
        }

        private void pacientesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            ModuloPacientes.GUI.PacientesForm frm = new ModuloPacientes.GUI.PacientesForm();
            frm.MdiParent = this;
            frm.Show();
        }

        private void Intervalo_Tick(object sender, EventArgs e)
        {
            bwCheckConnection.RunWorkerAsync();
        }

        private void gestionRolesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GestionRol.RolesVista frm = new GestionRol.RolesVista();
            frm.ShowDialog();
        }

        private void gestionUsuariosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GestionUsuario.UsuariosVista frm = new GestionUsuario.UsuariosVista();
            frm.ShowDialog();
        }

        private void statusStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        private void toolStripStatusLabel4_Click(object sender, EventArgs e)
        {

        }

        private void lblUsuario_Click(object sender, EventArgs e)
        {

        }

        private void toolStripStatusLabel4_Click_1(object sender, EventArgs e)
        {

        }

        private void gestionDeMedicamentosToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GestionMedicamentos.MedicamentosVista frm = new GestionMedicamentos.MedicamentosVista();
            frm.ShowDialog();
        }

        private void gestionDeEnfermedadesToolStripMenuItem_Click(object sender, EventArgs e)
        {
            GestionEnfermedades.EnfermedadesVista frm = new GestionEnfermedades.EnfermedadesVista();
            frm.ShowDialog();
        }

        private void pacientesToolStripMenuItem_Click_1(object sender, EventArgs e)
        {
            ModuloPacientes.GUI.PacientesForm frm = new ModuloPacientes.GUI.PacientesForm();
            frm.ShowDialog();
        }
    }
}
