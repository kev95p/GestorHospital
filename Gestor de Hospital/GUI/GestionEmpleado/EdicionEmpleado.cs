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
        private string idEmpleado = String.Empty;
        DataRow fila;
        
        public string IdEmpleado
        {
            get
            {
                return idEmpleado;
            }

            set
            {
                idEmpleado = value;
            }
        }

        public EdicionEmpleado()
        {
            InitializeComponent();
            CargarDepartamentos();
            CargarMunicipios();
            CargarRoles();
            CargarEspecialidades();
            VerificarAsignarUsuario();
        }

        private void CargarRoles()
        {
            cbRol.DataSource = SessionManager.DatosCargados.Instancia.Roles;
            cbRol.ValueMember = "idRol";
            cbRol.DisplayMember = "rol";
        }

        private void CargarDepartamentos()
        {
            cbDepartamento.DataSource = SessionManager.DatosCargados.Instancia.Departamentos;
            cbDepartamento.DisplayMember = "departamento";
            cbDepartamento.ValueMember = "idDepartamento";
        }

        private void CargarMunicipios()
        {
            DataView dv = new DataView(SessionManager.DatosCargados.Instancia.Munipicipios);
            dv.RowFilter = "idDepartamento = " + (cbDepartamento.SelectedIndex+1);
            cbMunicipios.DataSource = dv.ToTable();
            cbMunicipios.DisplayMember = "municipio";
            cbMunicipios.ValueMember = "idMunicipio";
        }

        private void CargarEspecialidades()
        {
            DataTable datos = SessionManager.DatosCargados.Instancia.Especialidades;
            cbEspecialidades.DataSource = datos;
            cbEspecialidades.DisplayMember = "Especialidad";
            cbEspecialidades.ValueMember = "idEspecialidad";
        }

        private void VerificarAsignarUsuario()
        {
            if (chkAsignarUsuario.CheckState == CheckState.Unchecked)
            {
                txtUsuario.Enabled = false;
                cbRol.Enabled = false;
                txtPassword.Enabled = false;
            }
            else if(chkAsignarUsuario.CheckState == CheckState.Checked)
            {
                txtUsuario.Enabled = true;
                cbRol.Enabled = true;
                txtPassword.Enabled = true;
            }
        }

        private void Procesar()
        {
            CRUDManager.Entidades.Empleado em = new CRUDManager.Entidades.Empleado();
            em.AsignarUsuario = (chkAsignarUsuario.CheckState == CheckState.Checked);
            em.IdEmpleado = idEmpleado;
            em.Primer_Nombre = txtPrimerNombre.Text;
            em.Segundo_Nombre = txtSegundoNombre.Text;
            em.Primer_Apellido = txtPrimerApellido.Text;
            em.Segundo_Apellido = txtSegundoApellido.Text;
            em.Telefono = txtTelefono.Text;
            em.DUI = txtDui.Text;
            em.Email = txtEmail.Text;
            em.Residencia = txtResidencia.Text;
            em.IdMunicipio = cbMunicipios.SelectedValue.ToString();
            em.Usuario.NombreUsuario = txtUsuario.Text;
            em.Usuario.Password = txtPassword.Text;
            em.Usuario.IdRol = cbRol.SelectedValue.ToString();
            em.Especialidad = cbEspecialidades.SelectedValue.ToString();

            if (ValidarDatos())
            {

                if (idEmpleado == String.Empty)
                {
                    if (em.Insertar())
                    {
                        MessageBox.Show("Empleado agregado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Close();
                    }
                    else
                    {
                        MessageBox.Show("Error Inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    }
                }
                else
                {
                    if (em.Actualizar())
                    {
                        MessageBox.Show("Empleado modificado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Close();
                    }
                    else
                    {
                        MessageBox.Show("Error Inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    }

                }

            }
        }



        private Boolean ValidarDatos()
        {
            Boolean Validado = true;
            Notificador.Clear();

            if (txtPrimerNombre.TextLength == 0)
            {
                Notificador.SetError(txtPrimerNombre, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtSegundoNombre.TextLength == 0)
            {
                Notificador.SetError(txtSegundoNombre, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtPrimerApellido.TextLength == 0)
            {
                Notificador.SetError(txtPrimerApellido, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtSegundoApellido.TextLength == 0)
            {
                Notificador.SetError(txtSegundoApellido, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtTelefono.TextLength == 0)
            {
                Notificador.SetError(txtTelefono, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtEmail.TextLength == 0)
            {
                Notificador.SetError(txtEmail, "Este campo no puede quedar vacio.");
                Validado = false;
            }

            if (txtDui.MaskCompleted == false || txtDui.TextLength == 0)
            {
                Notificador.SetError(txtDui, "Este campo no puede quedar vacio.");
                Validado = false;
            }

            if (txtResidencia.TextLength == 0)
            {
                Notificador.SetError(txtResidencia, "Este campo no puede quedar vacio.");
                Validado = false;
            }

            if (chkAsignarUsuario.Checked == true)
            {
                if (txtUsuario.TextLength == 0)
                {
                    Notificador.SetError(txtUsuario, "Este campo no puede quedar vacio.");
                    Validado = false;
                }
                if (txtPassword.TextLength == 0)
                {
                    Notificador.SetError(txtPassword, "Este campo no puede quedar vacio.");
                    Validado = false;
                }
            }
            return Validado;
        }




        private void btnAgregar_Click(object sender, EventArgs e)
        {
            Procesar();
        }

        private void cbDepartamento_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(cbDepartamento.Items.Count > 0)
            {
                CargarMunicipios();
            }
                    
        }

        private void chkAsignarUsuario_CheckStateChanged(object sender, EventArgs e)
        {
            VerificarAsignarUsuario();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();    
        }

        private void txtTelefono_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsNumber(e.KeyChar)) && (e.KeyChar != (char)Keys.Back))
            {
                MessageBox.Show("Solo se permiten numeros", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                e.Handled = true;
                return;
            }
        }
    }
}
