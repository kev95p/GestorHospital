using System;
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


        private void CargarDetallePacientesIngresados()
        {
            dgvDetallePaciente.AutoGenerateColumns = false;
            dgvDetallePaciente.DataSource = CacheManager.Cache.OBTENER_DETALLE_PACIENTES_INGRESADOS().Tables[0];
            lblDatosEncontrados.Text = dgvDetallePaciente.Rows.Count.ToString() + " Registros Encontrados";
        } 

        private void DetallePacientes_Load(object sender, EventArgs e)
        {
            CargarDetallePacientesIngresados();
        }

/*
        BindingSource _Pacientes = new BindingSource();
         private void FiltroPorNombre()
        {
            if (txtNombres.TextLength == 0)
            {
                _Pacientes.RemoveFilter();
            }
            else
            {
                _Pacientes.Filter = "Nombres LIKE '%" + txtNombres.Text + "%' ";

            }

            dgvDetallePaciente.AutoGenerateColumns = false;
            dgvDetallePaciente.DataSource = _Pacientes;
            lblDatosEncontrados.Text = dgvDetallePaciente.Rows.Count.ToString() + " Registros Encontrados";
        }


        private void FiltroPorApellido()
        {
            if (txtApellidos.TextLength == 0)
            {
                _Pacientes.RemoveFilter();
            }
            else
            {
                _Pacientes.Filter = "Apellidos LIKE '%" + txtApellidos.Text + "%' ";

            }

            dgvDetallePaciente.AutoGenerateColumns = false;
            dgvDetallePaciente.DataSource = _Pacientes;
            CargarDetallePacientesIngresados();
            lblDatosEncontrados.Text = dgvDetallePaciente.Rows.Count.ToString() + " Registros Encontrados";
        }

        private void txtNombres_TextChanged(object sender, EventArgs e)
        {
            FiltroPorNombre();
        }

        private void txtApellidos_TextChanged(object sender, EventArgs e)
        {
            FiltroPorApellido();
        }
        */
    }
}
