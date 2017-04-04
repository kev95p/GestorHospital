﻿using DataLayer;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace MainForms
{
    public partial class Login : Form
    {

        public bool verificado = false;

        private void Autenticar()
        {
            DataTable datos = Operaciones.OBTENER_USUARIO(this.txtUsuario.Text, this.txtContrasena.Text);
            if (datos.Rows.Count > 0)
            {
                verificado = true;
            }
        }

        public Login()
        {
            InitializeComponent();
        }

        private void btnEntrar_Click(object sender, EventArgs e)
        {
            Autenticar();
            Close();
            
        }
    }
}
