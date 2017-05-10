
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
            dgvEmpleados.AutoGenerateColumns = false;
            dgvEmpleados.DataSource = CacheManager.Cache.OBTENER_EMPLEADOS().Tables[0];
            lblFilas.Text = dgvEmpleados.RowCount.ToString();           
        }

        #region Eventos
        private void EmpleadosVista_Load(object sender, EventArgs e)
        {
            CargarEmpleados();
            
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            EdicionEmpleado frm = new EdicionEmpleado();
            frm.ShowDialog();
            CargarEmpleados();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show(this, "Esta seguro que quiere modificar este empleado", "Advertencia", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) == DialogResult.OK)
            {
                EdicionEmpleado frm = new EdicionEmpleado();
                frm.Modificar = true;
                frm.ID_Empleado = (Int32)dgvEmpleados.CurrentRow.Cells["ID"].Value;
                frm.ShowDialog();
                CargarEmpleados();
            }
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show(this, "Esta Seguro que quiere eliminar este empleado", "Advertencia", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) == DialogResult.OK)
            {
                CRUDManager.Entidades.Empleado em = new CRUDManager.Entidades.Empleado();
                em.IdEmpleado = dgvEmpleados.CurrentRow.Cells["ID"].Value.ToString();
                if (em.Eliminar())
                {
                    MessageBox.Show("Empleado Eliminado Correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                }
                else
                {
                    MessageBox.Show("Error al Eliminar Empleado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                CargarEmpleados();
                
            }
        }
#endregion

    }
}
