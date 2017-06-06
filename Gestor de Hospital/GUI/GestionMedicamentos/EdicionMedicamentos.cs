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

namespace GUI.GestionMedicamentos
{
    public partial class EdicionMedicamentos : Form
    {
        public EdicionMedicamentos()
        {
            InitializeComponent();
        }


        private void btnGuardar_Click(object sender, EventArgs e)
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
            CRUDManager.Entidades.Medicamentos medicamentos = new CRUDManager.Entidades.Medicamentos();
            medicamentos.IdMedicamento = txbIDMedicamento.Text;
            medicamentos.Nombre = txbNombreMedicamento.Text;
            medicamentos.Concentracion = txbConcentracion.Text;
            medicamentos.Presentacion = txbPresentacion.Text;
            medicamentos.Via = txtVia.Text;

            if (txbIDMedicamento.Text == String.Empty)
            {
                if (medicamentos.Insertar())
                {
                    MessageBox.Show("Medicamento agregado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Close();
                }
                else
                {
                    MessageBox.Show("Error inesperado al Agregar", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
            }
            else
            {
                if (medicamentos.Actualizar())
                {
                    MessageBox.Show("Medicamento modificado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
            errorMedicamentos.Clear();

            if (txbNombreMedicamento.TextLength == 0)
            {
                errorMedicamentos.SetError(txbNombreMedicamento, "Este campo es obligatorio");
                valido = false;
            }

            if (txbConcentracion.TextLength == 0)
            {
                errorMedicamentos.SetError(txbConcentracion, "Este campo es obligatorio");
                valido = false;
            }

            if (txbPresentacion.TextLength == 0)
            {
                errorMedicamentos.SetError(txbPresentacion, "Este campo es obligatorio");
                valido = false;
            }

            if (txtVia.TextLength == 0)
            {
                errorMedicamentos.SetError(txtVia, "Este campo es obligatorio");
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
