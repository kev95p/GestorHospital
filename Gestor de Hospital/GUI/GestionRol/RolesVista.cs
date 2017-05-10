using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.GestionRol
{
    public partial class RolesVista : Form
    {
        public RolesVista()
        {
            InitializeComponent();
        }

        private void CargarRoles()
        {
            dgvRoles.AutoGenerateColumns = false;
            dgvRoles.DataSource = CacheManager.Cache.OBTENER_ROLES().Tables[0];
        }

        private void RolesVista_Load(object sender, EventArgs e)
        {
            CargarRoles();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            EdicionRol frm = new EdicionRol();
            frm.ShowDialog();
            CargarRoles();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show(this, "Esta Seguro que quiere modificar este rol", "Advertencia", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) == DialogResult.OK)
            {
                EdicionRol frm = new EdicionRol();
                frm.txtID.Text = dgvRoles.CurrentRow.Cells["ID"].Value.ToString();
                frm.txtRol.Text = dgvRoles.CurrentRow.Cells["Rol"].Value.ToString();
                frm.ShowDialog();
                CargarRoles();
            }

        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show(this, "Esta Seguro que quiere eliminar este rol, si lo elimina todos los usuarios con este rol seran Eliminados.", "Advertencia", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) == DialogResult.OK)
            {
                CRUDManager.Entidades.Rol rol = new CRUDManager.Entidades.Rol();
                rol.IdRol = dgvRoles.CurrentRow.Cells["ID"].Value.ToString();

                if (rol.Eliminar())
                {
                    MessageBox.Show("Rol eliminado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    CargarRoles();
                }
                else
                {
                    MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                
            }
        }
    }
}
