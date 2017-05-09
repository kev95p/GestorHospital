﻿using GUI.Properties;
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
                catch (PingException ex)
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
            Console.WriteLine("Entro");
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
    }
}