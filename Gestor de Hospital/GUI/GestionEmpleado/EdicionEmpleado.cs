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
    public partial class EdicionEmpleado : Form
    {
        private bool modificar;
        private DataGridViewRow fila;

        public bool Modificar
        {
            get
            {
                return modificar;
            }

            set
            {
                modificar = value;
            }
        }

        public DataGridViewRow Fila
        {
            get
            {
                return fila;
            }

            set
            {
                fila = value;
            }
        }

        public EdicionEmpleado()
        {
            InitializeComponent();
           
        }

        private void CargarUsuarios()
        {
            DataTable dt = Operaciones.OBTENER_USUARIOS().Tables[0];
            dt = new DataView(dt).ToTable(false, "ID", "usuario", "rol");
            dgvUsuarios.DataSource = dt;
            ColumnaWidth();
        }

        private void ColumnaWidth()
        {
            foreach (DataGridViewColumn c in dgvUsuarios.Columns)
            {
                if(c.Name == "ID")
                {
                    c.Width = 30;
                }
                c.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;

            }
        }

        private void ChkAsignarUsuario_CheckStateChanged(object sender, EventArgs e)
        {
            if(chkAsignarUsuario.CheckState == CheckState.Checked)
            {

                dgvUsuarios.Enabled = true;
                CargarUsuarios();
            
            }
            else if(chkAsignarUsuario.CheckState == CheckState.Unchecked)
            {
                DataTable dt = (DataTable)dgvUsuarios.DataSource;
                dt.Clear();
                dgvUsuarios.Enabled = false;
                

            }
        }

        private void ProcesarEmpleado()
        {
            if (Modificar)
            {
                DataLayer.Entidades.Empleado em = new DataLayer.Entidades.Empleado();
                em.Primer_Nombre = txtPrimerNombre.Text;
                em.Segundo_Nombre = txtSegundoNombre.Text;
                em.Primer_Apellido = txtPrimerApellido.Text;
                em.Segundo_Apellido = txtSegundoApellido.Text;
                em.DUI = txtDUI.Text;
                if(chkAsignarUsuario.CheckState == CheckState.Checked)
                {
                    em.IdUsuario = dgvUsuarios.CurrentRow.Cells["ID"].Value.ToString();
                }
                else
                {
                    em.IdUsuario = "null";
                }
                
                bool resultado = em.Actualizar();

                if (resultado) MessageBox.Show("Empleado Modificado Correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                if(!resultado) MessageBox.Show("Error al Modificar", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
            else
            {
                DataLayer.Entidades.Empleado em = new DataLayer.Entidades.Empleado();
                em.Primer_Nombre = txtPrimerNombre.Text;
                em.Segundo_Nombre = txtSegundoNombre.Text;
                em.Primer_Apellido = txtPrimerApellido.Text;
                em.Segundo_Apellido = txtSegundoApellido.Text;
                em.DUI = txtDUI.Text;
                if (chkAsignarUsuario.CheckState == CheckState.Checked)
                {
                    em.IdUsuario = dgvUsuarios.CurrentRow.Cells["ID"].Value.ToString();
                }
                else
                {
                    em.IdUsuario = "null";
                }
                bool resultado = em.Insertar();

                if (resultado) MessageBox.Show("Empleado Agregado Correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                if (!resultado) MessageBox.Show("Error al Agregar", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

            Close();
        }

        private void EdicionEmpleado_Load(object sender, EventArgs e)
        {
            CargarUsuarios();
            if (Modificar) {
                
            }
            
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            ProcesarEmpleado();
        }

    }
}
