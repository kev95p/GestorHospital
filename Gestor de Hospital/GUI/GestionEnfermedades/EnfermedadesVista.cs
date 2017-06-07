using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.GestionEnfermedades
{
    public partial class EnfermedadesVista : Form
    {
        public EnfermedadesVista()
        {
            InitializeComponent();
        }

        //nooooooooooooo
        private void dgvEnfermedades_CellContentClick(object sender, DataGridViewCellEventArgs e) { }

        private void CargarEnfermedades()
        {
            dgvEnfermedades.AutoGenerateColumns = false;
            dgvEnfermedades.DataSource = CacheManager.Cache.OBTENER_ENFERMEDADES().Tables[0];   
        }


        private void EnfermedadesVista_Load(object sender, EventArgs e)
        {
            CargarEnfermedades();
        }


        private void btnAgregar_Click(object sender, EventArgs e)
        {
            EdicionEnfermedades frm = new EdicionEnfermedades();
            frm.ShowDialog();
            CargarEnfermedades();
        }


        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show(this, "Esta Seguro que quiere modificar este Medicamento", "Advertencia", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) == DialogResult.OK)
            {
                EdicionEnfermedades frm = new EdicionEnfermedades();
                frm.txbID.Text = dgvEnfermedades.CurrentRow.Cells["idenfemedades"].Value.ToString();
                frm.txbNombre.Text = dgvEnfermedades.CurrentRow.Cells["nombre"].Value.ToString();
                frm.cbxTipo.Text = dgvEnfermedades.CurrentRow.Cells["tipo"].Value.ToString();
                frm.ShowDialog();
                CargarEnfermedades();
            }
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show(this, "Esta Seguro que quiere eliminar esta Enfermedad", "Advertencia", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) == DialogResult.OK)
            {
                CRUDManager.Entidades.Enfermedades enfermedades = new CRUDManager.Entidades.Enfermedades();
                enfermedades.Idenfemedades = dgvEnfermedades.CurrentRow.Cells["idenfemedades"].Value.ToString();

                if (enfermedades.Eliminar())
                {
                    MessageBox.Show("Enfermedad eliminada correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    CargarEnfermedades();
                }
                else
                {
                    MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }

            }
        }



    }
}
