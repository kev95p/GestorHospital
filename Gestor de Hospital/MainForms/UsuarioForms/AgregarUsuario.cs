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
        public AgregarUsuario()
        {
            InitializeComponent();
        }

        private void LlenarRoles()
        {
            cbRol.DataSource = Operaciones.OBTENER_ROLES();
            cbRol.DisplayMember = "Rol";
        }

        private void AgregarUsuario_Load(object sender, EventArgs e)
        {
            LlenarRoles();
        }
    }
}
