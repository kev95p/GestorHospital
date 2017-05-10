
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.GestionUsuario
{
    public partial class UsuariosVista : Form
    {
        public UsuariosVista()
        {
            InitializeComponent();
        }

        private void  CargarUsuarios()
        {
            dgvUsuarios.AutoGenerateColumns = false;
            dgvUsuarios.DataSource = CacheManager.Cache.OBTENER_USUARIOS().Tables[0];
            lblFilas.Text = dgvUsuarios.RowCount.ToString();
        }

        private void UsuariosVista_Load(object sender, EventArgs e)
        {
            CargarUsuarios();
           
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            EdicionUsuario frm = new EdicionUsuario();
            frm.ShowDialog();
            CargarUsuarios();
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show(this,"Esta seguro que quiere modificar este usuario","Advertencia",MessageBoxButtons.OKCancel,MessageBoxIcon.Exclamation) == DialogResult.OK)
            {
                EdicionUsuario frm = new EdicionUsuario(true);
                frm.Fila = dgvUsuarios.CurrentRow;
                frm.ShowDialog();
                CargarUsuarios();
            }

        }

        private void toolStripButton3_Click(object sender, EventArgs e)
        {
            if(MessageBox.Show(this, "Esta Seguro que quiere eliminar este usuario", "Advertencia", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) == DialogResult.OK)
            {
                CRUDManager.Entidades.Usuario user = new CRUDManager.Entidades.Usuario()
                {
                    NombreUsuario = dgvUsuarios.CurrentRow.Cells["usuario"].Value.ToString()
                };
                user.Eliminar();
                CargarUsuarios();
            }
                
        }
    }
}
