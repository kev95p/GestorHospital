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
    public partial class RecetasDetalles : Form
    {
        public string idpaciente;
        DataTable dt;
        DataView dv;
        public RecetasDetalles()
        {
            InitializeComponent();
            dt = CacheManager.CachePaciente.MEDICAMENTOS_RECETAS();
            dv = new DataView(dt);
        }

        private void CargarRecetas()
        {
            dgvRecetas.AutoGenerateColumns = false;
            dgvRecetas.DataSource = CacheManager.CachePaciente.RECETAS(idpaciente);
        }

        private void CargarMedicamentos()
        {
            dgvMedicamentos.AutoGenerateColumns = false;
            dv.RowFilter = "id = "+dgvRecetas.CurrentRow.Cells["idReceta"].Value.ToString()+"";
            dgvMedicamentos.DataSource = dv.ToTable();
        }

        private void RecetasDetalles_Load(object sender, EventArgs e)
        {
            CargarRecetas();
        }

        private void dgvRecetas_SelectionChanged(object sender, EventArgs e)
        {
            
           CargarMedicamentos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            if (dgvRecetas.RowCount > 0)
            {
                EdicionRecetaMedica frm = new EdicionRecetaMedica();
                frm.idPAciente = idpaciente;
                frm.idReceta = dgvRecetas.CurrentRow.Cells["idReceta"].Value.ToString();
                frm.ShowDialog();
                CargarRecetas();
            }else
            {
                MessageBox.Show("No hay ningun registro", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
