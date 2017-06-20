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
    public partial class CitasDetalles : Form
    {
        public string idpaciente; 
        public CitasDetalles()
        {
            InitializeComponent();
        }

        private void  CargarCitas()
        {
            dgvCitas.AutoGenerateColumns = false;
            dgvCitas.DataSource = CacheManager.CachePaciente.CITAS(idpaciente);
        }

        private void CitasDetalles_Load(object sender, EventArgs e)
        {
            CargarCitas();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            EdicionCitas frm = new EdicionCitas();
            frm.idPaciente = idpaciente;
            frm.ShowDialog();
            CargarCitas();
        }

        private void btnQuitar_Click(object sender, EventArgs e)
        {
            if (dgvCitas.RowCount > 0)
            {
                CRUDManager.Entidades.Citas c = new CRUDManager.Entidades.Citas();
                c.IdCita = dgvCitas.CurrentRow.Cells["idCita"].Value.ToString();
                if (c.Cancelar())
                {
                    MessageBox.Show("Cita Cancelada", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    CargarCitas();
                }
            }
            
        }

        private void btnCompletar_Click(object sender, EventArgs e)
        {

        }

        private void btnCompletar_Click_1(object sender, EventArgs e)
        {
            if (dgvCitas.RowCount > 0)
            {
                CRUDManager.Entidades.Citas c = new CRUDManager.Entidades.Citas();
                c.IdCita = dgvCitas.CurrentRow.Cells["idCita"].Value.ToString();
                if (c.Completar())
                {
                    MessageBox.Show("Cita Completada", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    CargarCitas();
                }
            }
        }
    }
}
