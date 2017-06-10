using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI
{
    public partial class Login : Form
    {

        public bool verificado = false;
        private DataTable datos;

        private void Autenticar()
        {
            try
            {
                datos = CacheManager.Cache.OBTENER_USUARIO(txtUsuario.Text, txtContrasena.Text).Tables[0];
                if (datos.Rows.Count > 0)
                {
                    verificado = true;
                }
            }
            catch
            {
                MessageBox.Show("Error Inesperado","Error",MessageBoxButtons.OK,MessageBoxIcon.Error);
                Close();
            }
        }

        public Login()
        {
            InitializeComponent();
            
        }

        private void btnEntrar_Click(object sender, EventArgs e)
        {
            Cursor = Cursors.AppStarting;
            Autenticar();
            if (verificado)
            {
                //guardar nombre de usuario
                SessionManager.SessionManager sesion = SessionManager.SessionManager.GetInstance;
                sesion.Usuario = datos.Rows[0][0].ToString();
                sesion.Rol = datos.Rows[0][1].ToString();
                sesion.Nombre = datos.Rows[0]["Nombre"].ToString();
                sesion.IdEmpleado = datos.Rows[0]["idEmpleado"].ToString();
                Close();
            }
            else
            {
                MessageBox.Show("El usuario o contraseña no son correctos", "Error Autenticacion", MessageBoxButtons.OK, MessageBoxIcon.Error);
                txtContrasena.Text = "";
                txtUsuario.Text = "";
                txtUsuario.Focus();
            }
            
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void Login_Load(object sender, EventArgs e)
        {
            
        }

        private void PrecargarDatos()
        {

        }
    }
}
