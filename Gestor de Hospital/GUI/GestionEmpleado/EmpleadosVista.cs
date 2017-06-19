
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

                frm.IdEmpleado = dgvEmpleados.CurrentRow.Cells["ID"].Value.ToString();

                string[] Nombres = dgvEmpleados.CurrentRow.Cells["Nombres"].Value.ToString().Split(' ');
                string[] Apellidos = dgvEmpleados.CurrentRow.Cells["Apellidos"].Value.ToString().Split(' ');

                frm.txtPrimerNombre.Text = Nombres[0];
                frm.txtSegundoNombre.Text = Nombres[1];
                frm.txtPrimerApellido.Text = Apellidos[0];
                frm.txtSegundoApellido.Text = Apellidos[1];

                frm.txtDui.Text = dgvEmpleados.CurrentRow.Cells["DUI"].Value.ToString();
                frm.txtEmail.Text = dgvEmpleados.CurrentRow.Cells["email"].Value.ToString();
                frm.txtTelefono.Text = dgvEmpleados.CurrentRow.Cells["telefono"].Value.ToString();
                frm.txtResidencia.Text = dgvEmpleados.CurrentRow.Cells["Residencia"].Value.ToString();
                frm.cbDepartamento.SelectedValue = dgvEmpleados.CurrentRow.Cells["idDepartamento"].Value.ToString();
                frm.cbMunicipios.SelectedValue = dgvEmpleados.CurrentRow.Cells["idMunicipio"].Value.ToString();         
                     
                if (dgvEmpleados.CurrentRow.Cells["Usuario"].Value.ToString() == "No Aplica")
                {
                    frm.chkAsignarUsuario.CheckState = CheckState.Unchecked;
                }
                else
                {
                    frm.chkAsignarUsuario.CheckState = CheckState.Checked;
                    frm.txtUsuario.Text = dgvEmpleados.CurrentRow.Cells["Usuario"].Value.ToString();
                    frm.cbRol.SelectedValue = dgvEmpleados.CurrentRow.Cells["idRol"].Value.ToString();
                    frm.txtPassword.Text = "********";
                }
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
