using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.GestionMedicamentos
{
    public partial class MedicamentosVista : Form
    {
        public MedicamentosVista()
        {
            InitializeComponent();
        }

        private void CargarMedicamentos()
        {
            dgvMedicamentos.AutoGenerateColumns = false;
            dgvMedicamentos.DataSource = CacheManager.Cache.OBTENER_MEDICAMENTOS().Tables[0];
        }

        private void MedicamentosVista_Load(object sender, EventArgs e)
        {
            CargarMedicamentos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            EdicionMedicamentos frm = new EdicionMedicamentos();
            frm.ShowDialog();
            CargarMedicamentos();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show(this, "Esta Seguro que quiere modificar este Medicamento", "Advertencia", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) == DialogResult.OK)
            {
                EdicionMedicamentos frm = new EdicionMedicamentos();
                frm.txbIDMedicamento.Text = dgvMedicamentos.CurrentRow.Cells["idMedicamento"].Value.ToString();
                frm.txbNombreMedicamento.Text = dgvMedicamentos.CurrentRow.Cells["nombre"].Value.ToString();
                frm.txbConcentracion.Text = dgvMedicamentos.CurrentRow.Cells["concentracion"].Value.ToString();
                frm.txbPresentacion.Text = dgvMedicamentos.CurrentRow.Cells["presentacion"].Value.ToString();
                frm.txtVia.Text = dgvMedicamentos.CurrentRow.Cells["via"].Value.ToString();

                frm.ShowDialog();
                CargarMedicamentos();
            }
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show(this, "Esta Seguro que quiere eliminar este Medicamento", "Advertencia", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) == DialogResult.OK)
            {
                CRUDManager.Entidades.Medicamentos medicamentos = new CRUDManager.Entidades.Medicamentos();
                medicamentos.IdMedicamento = dgvMedicamentos.CurrentRow.Cells["idMedicamento"].Value.ToString();

                if (medicamentos.Eliminar())
                {
                    MessageBox.Show("Medicamento eliminado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    CargarMedicamentos();
                }
                else
                {
                    MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
        }
    }
}
