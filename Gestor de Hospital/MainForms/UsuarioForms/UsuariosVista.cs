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

namespace MainForms.UsuarioForms
{
    public partial class UsuariosVista : Form
    {
        public UsuariosVista()
        {
            InitializeComponent();
            
        }

        private void UsuariosVista_Load(object sender, EventArgs e)
        {
            dgvUsuarios.RowHeadersVisible = false;
            dgvUsuarios.DataSource = Operaciones.OBTENER_USUARIOS().Tables[0];
            ColumnaWidth();
           
        }

        private void ColumnaWidth()
        {
            foreach(DataGridViewColumn c in dgvUsuarios.Columns)
            {
                c.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            }
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            AgregarUsuario frm = new AgregarUsuario();
            frm.ShowDialog();
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            AgregarUsuario frm = new AgregarUsuario(true);
            frm.Fila = dgvUsuarios.CurrentRow;
            frm.ShowDialog();
        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show("Esta Seguro que quiere eliminar este usuario", "Advertencia", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) == DialogResult.OK)
            {
                dgvUsuarios.Rows.RemoveAt(dgvUsuarios.CurrentRow.Index);
            }
                
        }
    }
}
