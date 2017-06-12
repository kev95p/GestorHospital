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

namespace GUI.GestionEnfermedades
{
    public partial class EdicionEnfermedades : Form
    {
        public EdicionEnfermedades()
        {
            InitializeComponent();
        }


        private void EdicionEnfermedades_Load(object sender, EventArgs e)
        {
            CargarTipoEnfermedades();
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


  

        private void CargarTipoEnfermedades()
        {
            DataRow fila;
            DataTable tipos = new DataTable();
            tipos.Columns.Add("Tipo");
            tipos.Columns.Add("Valor");

            fila = tipos.NewRow();
            fila["Tipo"] = "Infecciosa";
            fila["Valor"] = "1";
            tipos.Rows.Add(fila);

            fila = tipos.NewRow();
            fila["Tipo"] = "Congenita";
            fila["Valor"] = "2";
            tipos.Rows.Add(fila);

            fila = tipos.NewRow();
            fila["Tipo"] = "Hereditaria";
            fila["Valor"] = "3";
            tipos.Rows.Add(fila);

            fila = tipos.NewRow();
            fila["Tipo"] = "Neurodegenerativa";
            fila["Valor"] = "4";
            tipos.Rows.Add(fila);

            fila = tipos.NewRow();
            fila["Tipo"] = "Mental";
            fila["Valor"] = "5";
            tipos.Rows.Add(fila);

            fila = tipos.NewRow();
            fila["Tipo"] = "Metabolica";
            fila["Valor"] = "6";
            tipos.Rows.Add(fila);

            cbxTipo.DataSource = tipos;
            cbxTipo.ValueMember = "Valor";
            cbxTipo.DisplayMember = "Tipo";

        }

        private void Procesar()
        {
            CRUDManager.Entidades.Enfermedades enfermedades = new CRUDManager.Entidades.Enfermedades();
            enfermedades.Idenfemedades = txbID.Text;
            enfermedades.Nombre = txbNombre.Text;
            enfermedades.Tipo = cbxTipo.SelectedValue.ToString();

            if (txbID.Text == String.Empty)
            {
                if (enfermedades.Insertar())
                {
                    MessageBox.Show("Enfermedad agregada correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Close();
                }
                else
                {
                    MessageBox.Show("Error inesperado al Agregar", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
            }
            else
            {
                if (enfermedades.Actualizar())
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
            errorEnfermedades.Clear();

            if (txbNombre.TextLength == 0)
            {
                errorEnfermedades.SetError(txbNombre, "Este campo es obligatorio");
                valido = false;
            }

            if (cbxTipo == null)
            {
                errorEnfermedades.SetError(cbxTipo, "Este campo es obligatorio");
                valido = false;
            }


            return valido;
        }



        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void cbxTipo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
