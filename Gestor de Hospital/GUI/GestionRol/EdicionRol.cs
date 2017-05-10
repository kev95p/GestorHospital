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

namespace GUI.GestionRol
{
    public partial class EdicionRol : Form
    {
        public EdicionRol()
        {
            InitializeComponent();
        }

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            if (Validar())
            {
                Procesar();
            }
            else
            {
                SystemSounds.Beep.Play();
            }
        }

        private void Procesar()
        {
            CRUDManager.Entidades.Rol rol = new CRUDManager.Entidades.Rol();
            rol.IdRol = txtID.Text;
            rol.NombreRol = txtRol.Text;

            if(txtID.Text == String.Empty)
            {
                if (rol.Insertar())
                {
                    MessageBox.Show("Rol agregado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Close();
                }
                else
                {
                    MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
            }
            else
            {
                if (rol.Actualizar())
                {
                    MessageBox.Show("Rol modificado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Close();
                }
                else
                {
                    MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
            }
        }

        private bool Validar()
        {
            bool valido = true;
            errorRol.Clear();

            if (txtRol.TextLength == 0)
            {
                errorRol.SetError(txtRol, "Este campo es obligatorio");
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
