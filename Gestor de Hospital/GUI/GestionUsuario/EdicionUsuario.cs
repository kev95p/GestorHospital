using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Media;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI.GestionUsuario
{
    public partial class EdicionUsuario : Form
    {
        private bool modificar;
        private DataGridViewRow fila;

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

        public EdicionUsuario()
        {
            InitializeComponent();
            modificar = false;
        }

        public EdicionUsuario(bool Modificar)
        {
            InitializeComponent();
            modificar = true;
        }

        private void LlenarRoles()
        {
            cbRol.DataSource = CacheManager.Cache.OBTENER_ROLES().Tables[0];
            cbRol.DisplayMember = "Rol";
            cbRol.ValueMember = "idRol";
        }

        private void AgregarUsuario_Load(object sender, EventArgs e)
        {
            LlenarRoles();
            if (modificar)
            {
                this.Text = "Modificar Usuario";
                txtIdUsuario.Text = Fila.Cells["ID"].Value.ToString();
                txtUsuario.Text = Fila.Cells["usuario"].Value.ToString();
                cbRol.SelectedIndex = cbRol.FindStringExact(Fila.Cells["rol"].Value.ToString());
                txtClave.Text = "********";
                txtClaveComprobacion.Text = "********";


            }
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            
            if (Validar())
            {
                CRUDManager.Entidades.Usuario user = new CRUDManager.Entidades.Usuario();
                user.IdUsuario = txtIdUsuario.Text;
                user.NombreUsuario = txtUsuario.Text;
                user.Password = txtClave.Text;
                user.IdRol = cbRol.SelectedValue.ToString();
                user.IdEmpleado = "null";

                if (modificar)
                {
                    if (user.Actualizar())
                    {
                        MessageBox.Show("Usuario modificado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Close();
                    }
                    else
                    {
                        MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        
                    }
                        
                        
                }
                else
                {
                    if (user.Insertar())
                    {
                        MessageBox.Show("Usuario agregado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Close();
                    }
                    else
                    {
                        MessageBox.Show("Error Inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                    }
                }
                
                
            }
            else
            {
                SystemSounds.Beep.Play();
            }
            
        }

        private bool Validar()
        {
            bool valido = true;
            errorUsuario.Clear();

           if(txtUsuario.TextLength == 0)
            {
                errorUsuario.SetError(txtUsuario, "Este campo es obligatorio");
                valido = false;
            }
           if(txtClave.TextLength == 0)
            {
                errorUsuario.SetError(txtClave, "Este campo es obligatorio");
                valido = false;
            }
            if (txtClaveComprobacion.TextLength==0)
            {
                errorUsuario.SetError(txtClaveComprobacion, "Este campo es obligatorio");
                valido = false;
            }
            return valido;
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
