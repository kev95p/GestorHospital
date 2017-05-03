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
        int primera = 0;
        public bool Modificar { get; set; }
        public int ID_Empleado { get; set; }

        public EdicionEmpleado()
        {
            InitializeComponent();
           
        }

        private void CargarUsuarios()
        {
            DataTable dt = Operaciones.OBTENER_USUARIOS_SIN_ASIGNAR().Tables[0];
            dt = new DataView(dt).ToTable(false, "ID", "usuario", "rol");
            dgvUsuarios.DataSource = dt;
            ColumnaWidth();
        }

        private void CargarDepartamentos()
        {
            DataTable dt = Operaciones.OBTENER_DEPARTAMENTOS().Tables[0];
            cbDepartamento.DataSource = dt;
            cbDepartamento.DisplayMember = "departamento";
            cbDepartamento.ValueMember = "idDepartamento";

        }

        private void CargarMunicipios()
        {
            DataTable dt = Operaciones.OBTENER_MUNICIPIOS().Tables[0];
            cbMunicipio.DataSource = dt.Select("idDepartamento = " + cbDepartamento.SelectedValue).CopyToDataTable();
            cbMunicipio.DisplayMember = "municipio";
            cbMunicipio.ValueMember = "idMunicipio";
        }

        private void CargarDatos()
        {
            DataTable dt = Operaciones.OBTENER_EMPLEADO(ID_Empleado).Tables[0];
            DataTable dtdir = Operaciones.OBTENER_DIRECCION(Convert.ToInt32(dt.Rows[0]["idDireccion"])).Tables[0];
            txtID.Text = dt.Rows[0]["idEmpleado"].ToString();
            txtPrimerNombre.Text = dt.Rows[0]["primer_nombre"].ToString();
            txtSegundoNombre.Text = dt.Rows[0]["segundo_nombre"].ToString();
            txtPrimerApellido.Text = dt.Rows[0]["primer_apellido"].ToString();
            txtSegundoApellido.Text = dt.Rows[0]["segundo_apellido"].ToString();
            txtDUI.Text = dt.Rows[0]["DUI"].ToString();
            txtDireccion.Text = dtdir.Rows[0]["direccion"].ToString();
            cbDepartamento.SelectedValue = (Int32)dtdir.Rows[0]["idDepartamento"];
            cbMunicipio.SelectedValue = (Int32)dtdir.Rows[0]["idMunicipio"];
            
            

            if (dt.Rows[0]["idUsuario"].ToString() == String.Empty)
            {
                chkAsignarUsuario.CheckState = CheckState.Unchecked;
            }
            else
            {
                foreach (DataGridViewRow item in dgvUsuarios.Rows)
                {
                    if (Convert.ToInt32(item.Cells["ID"].Value) == Convert.ToInt32(dt.Rows[0]["idUsuario"]))
                    {
                        item.Cells["ID"].Selected = true;
                    }
                    else
                    {
                        item.Cells["ID"].Selected = false;
                    }
                    
                }
            }
            
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

        private void ProcesarEmpleado()
        {
            if (Modificar)
            {
                DataLayer.Entidades.Empleado em = new DataLayer.Entidades.Empleado();
                DataLayer.Entidades.Direccion dir = new DataLayer.Entidades.Direccion();
                em.IdEmpleado = txtID.Text;
                em.Primer_Nombre = txtPrimerNombre.Text;
                em.Segundo_Nombre = txtSegundoNombre.Text;
                em.Primer_Apellido = txtPrimerApellido.Text;
                em.Segundo_Apellido = txtSegundoApellido.Text;
                em.DUI = txtDUI.Text;
                dir.DireccionDescripcion = txtDireccion.Text;
                dir.IdMunicipio = Convert.ToInt32(cbMunicipio.SelectedValue);
                em.Direccion = dir;

                if (chkAsignarUsuario.CheckState == CheckState.Checked)
                {
                    em.IdUsuario = Convert.ToInt32(dgvUsuarios.CurrentRow.Cells["ID"].Value);
                }
                else
                {
                    em.IdUsuario = null;
                }
                
                bool resultado = em.Actualizar();

                if (resultado) MessageBox.Show("Empleado Modificado Correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                if(!resultado) MessageBox.Show("Error al Modificar", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
            else
            {
                DataLayer.Entidades.Empleado em = new DataLayer.Entidades.Empleado();
                DataLayer.Entidades.Direccion dir = new DataLayer.Entidades.Direccion();

                em.Primer_Nombre = txtPrimerNombre.Text;
                em.Segundo_Nombre = txtSegundoNombre.Text;
                em.Primer_Apellido = txtPrimerApellido.Text;
                em.Segundo_Apellido = txtSegundoApellido.Text;
                em.DUI = txtDUI.Text;
                dir.DireccionDescripcion = txtDireccion.Text;
                dir.IdMunicipio = Convert.ToInt32(cbMunicipio.SelectedValue);
                em.Direccion = dir;


                if (chkAsignarUsuario.CheckState == CheckState.Checked)
                {
                    em.IdUsuario =Convert.ToInt32(dgvUsuarios.CurrentRow.Cells["ID"].Value);
                }
                else
                {
                    em.IdUsuario =null;
                }
                bool resultado = em.Insertar();

                if (resultado) MessageBox.Show("Empleado Agregado Correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                if (!resultado) MessageBox.Show("Error al Agregar", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            Close();
        }

        #region Eventos

        private void EdicionEmpleado_Load(object sender, EventArgs e)
        {
            CargarUsuarios();
            CargarDepartamentos();
            CargarMunicipios();
            if (Modificar) CargarDatos();

        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            ProcesarEmpleado();
        }

        private void cbDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (primera < 2)
            {

            }
            else
            {
                CargarMunicipios();
                Console.WriteLine("entro");
            }
            primera++;
        }

        private void ChkAsignarUsuario_CheckStateChanged(object sender, EventArgs e)
        {
            if (chkAsignarUsuario.CheckState == CheckState.Checked)
            {

                dgvUsuarios.Enabled = true;
                CargarUsuarios();

            }
            else if (chkAsignarUsuario.CheckState == CheckState.Unchecked)
            {
                DataTable dt = (DataTable)dgvUsuarios.DataSource;
                dt.Clear();
                dgvUsuarios.Enabled = false;


            }
        }
        #endregion

        
    }
}
