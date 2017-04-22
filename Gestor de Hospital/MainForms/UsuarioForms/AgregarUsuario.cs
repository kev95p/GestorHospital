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

namespace MainForms.UsuarioForms
{
    public partial class AgregarUsuario : Form
    {
        private bool modificar;
        private DataGridViewRow fila;
        public DataGridViewRow Fila { get => fila; set => fila = value; }

        public AgregarUsuario()
        {
            InitializeComponent();
            modificar = false;
        }

        public AgregarUsuario(bool Modificar)
        {
            InitializeComponent();
            modificar = true;
        }

        private void LlenarRoles()
        {
            cbRol.DataSource = Operaciones.OBTENER_ROLES().Tables[0];
            cbRol.DisplayMember = "Rol";
            cbRol.ValueMember = "idRol";
        }

        private void AgregarUsuario_Load(object sender, EventArgs e)
        {
            LlenarRoles();
            if (modificar)
            {
                this.Text = "Modificar Usuario";
                txtUsuario.Text = fila.Cells["usuario"].Value.ToString();
                cbRol.SelectedText = fila.Cells["rol"].Value.ToString();

            }
        }
    }
}
