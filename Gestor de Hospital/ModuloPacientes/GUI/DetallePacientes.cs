﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ModuloPacientes.GUI
{
    public partial class DetallePacientes : Form
    {
        public DetallePacientes()
        {
            InitializeComponent();
        }
        //nooooooooooooooooooooooooo
        private void groupBox1_Enter(object sender, EventArgs e) { }


        private void DetallePacientes_Load(object sender, EventArgs e)
        {
            CargarPacientesIngresados();
        }


        BindingSource _PACIENTES = new BindingSource();
        private void CargarPacientesIngresados()
        {
            try
            {
                _PACIENTES.DataSource = CacheManager.Cache.OBTENER_DETALLE_PACIENTES_INGRESADOS().Tables[0];
                FiltrarNombre();
            }
            catch
            {
                MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void FiltrarNombre()
        {
            if (txtNombres.TextLength == 0) {
                _PACIENTES.RemoveFilter();
            }
            else {
                _PACIENTES.Filter = "Nombres LIKE '%" + txtNombres.Text + "%'";
            }
            dgvDetallePaciente.AutoGenerateColumns = false;
            dgvDetallePaciente.DataSource = _PACIENTES;
            lblDatosEncontrados.Text = dgvDetallePaciente.Rows.Count.ToString() + " Registros Encontrados";
        }

        private void FiltrarApellido()
        {
            if (txtApellidos.TextLength == 0)
            {
                _PACIENTES.RemoveFilter();
            }
            else
            {
                _PACIENTES.Filter = "Apellidos LIKE '%" + txtApellidos.Text + "%'";
            }
            dgvDetallePaciente.AutoGenerateColumns = false;
            dgvDetallePaciente.DataSource = _PACIENTES;
            lblDatosEncontrados.Text = dgvDetallePaciente.Rows.Count.ToString() + " Registros Encontrados";
        }

        //sdssfsa
        private void FiltrarSexoMas()
        {
            if (rbtnMasculino.Checked == false)
            {
                _PACIENTES.RemoveFilter();
            }
            else
            {
                _PACIENTES.Filter = "Sexo LIKE '%" + rbtnMasculino.Text + "%'";
            }
            dgvDetallePaciente.AutoGenerateColumns = false;
            dgvDetallePaciente.DataSource = _PACIENTES;
            lblDatosEncontrados.Text = dgvDetallePaciente.Rows.Count.ToString() + " Registros Encontrados";
        }

        private void FiltrarSexoFem()
        {
            if (rbtnFemenino.Checked == false)
                
            {
                _PACIENTES.RemoveFilter();
            }
            else
            {
                _PACIENTES.Filter = "Sexo LIKE '%" + rbtnFemenino.Text + "%'";
            }
            dgvDetallePaciente.AutoGenerateColumns = false;
            dgvDetallePaciente.DataSource = _PACIENTES;
            lblDatosEncontrados.Text = dgvDetallePaciente.Rows.Count.ToString() + " Registros Encontrados";
        }

       /*      private void FiltrarFechaIngreso()
             {
                 if (dtpFechaIngreso.Checked == false)
                 {
                     _PACIENTES.RemoveFilter();
                 }
                 else
                 {
                     _PACIENTES.Filter = "fecharegistro LIKE '%" + dtpFechaIngreso.Text + "%'";
                 }
                 dgvDetallePaciente.AutoGenerateColumns = false;
                 dgvDetallePaciente.DataSource = _PACIENTES;
                 lblDatosEncontrados.Text = dgvDetallePaciente.Rows.Count.ToString() + " Registros Encontrados";
             }
        */     


        private void txtNombres_TextChanged(object sender, EventArgs e)
        {
            FiltrarNombre();
        }

        private void txtApellidos_TextChanged(object sender, EventArgs e)
        {
            FiltrarApellido();
        }


        private void rbtnFemenino_CheckedChanged(object sender, EventArgs e)
        {
            FiltrarSexoFem();
        }

        private void rbtnMasculino_CheckedChanged(object sender, EventArgs e)
        {
            FiltrarSexoMas();
        }
    }
}
