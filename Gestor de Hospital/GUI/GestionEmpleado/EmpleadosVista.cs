using DataLayer;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.GestionEmpleado
{
    public partial class EmpleadosVista : Form
    {
        public EmpleadosVista()
        {
            InitializeComponent();
            
        }

        private void CargarEmpleados()
        {
            dgvEmpleados.DataSource = Operaciones.OBTENER_EMPLEADOS().Tables[0];
        }

        private void ColumnaWidth()
        {
            foreach (DataGridViewColumn c in dgvEmpleados.Columns)
            {
                c.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                
            }
        }

        private void EmpleadosVista_Load(object sender, EventArgs e)
        {
            CargarEmpleados();
            ColumnaWidth();
            
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            EdicionEmpleado frm = new EdicionEmpleado();
            frm.ShowDialog();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            EdicionEmpleado frm = new EdicionEmpleado();
            frm.Modificar = true;
            frm.ShowDialog();
        }
    }
}
