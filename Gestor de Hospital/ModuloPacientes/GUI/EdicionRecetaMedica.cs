using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ModuloPacientes.GUI
{
    public partial class EdicionRecetaMedica : Form
    {
        public EdicionRecetaMedica()
        {
            InitializeComponent();
        }


        public string idPAciente;

       //obvia esto :V
        private void label1_Click(object sender, EventArgs e) { }
        private void textBox1_TextChanged(object sender, EventArgs e) { }
        private void label3_Click(object sender, EventArgs e) { }
        private void textBox3_TextChanged(object sender, EventArgs e) { }


        private void EdicionRecetaMedica_Load(object sender, EventArgs e) {
            CargarEstadoReceta();
            CargarMedicos();
        }

        private void CargarEstadoReceta()
        {
            DataRow fila;
            DataTable Estados = new DataTable();
            Estados.Columns.Add("Estado");
            Estados.Columns.Add("Valor");

            fila = Estados.NewRow();
            fila["Estado"] = "Usando";
            fila["Valor"] = "1";
            Estados.Rows.Add(fila);

            fila = Estados.NewRow();
            fila["Estado"] = "Desuso";
            fila["Valor"] = "2";
            Estados.Rows.Add(fila);

            cbxEstado.DataSource = Estados;
            cbxEstado.ValueMember = "Valor";
            cbxEstado.DisplayMember = "Estado";

        }


        private void CargarMedicos()
        {
            DataTable Medicos = new DataTable();
            cbxMedico.DataSource = Medicos;
            cbxMedico.ValueMember = "idEmpleado";
            cbxMedico.DisplayMember = "Medico";
        }



        private void btnGuardar_Click(object sender, EventArgs e)
        {
            CRUDManager.Entidades.RecetasMedicas reme = new CRUDManager.Entidades.RecetasMedicas();
            
            reme.IdMedico = cbxMedico.SelectedValue.ToString();
            reme.IdPaciente = idPAciente;
            reme.FechaCreacion1 = SessionManager.FechaHelper.FormatearFecha(dtpFechaReceta.Text);
            reme.Descripcion1 = txtDescripcion.Text;
            reme.Estado1 = cbxEstado.SelectedValue.ToString();



            if (reme.Insertar())
            {
                MessageBox.Show("Receta agregada correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                Close();
            }
            else
            {
                MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
        }


        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        
    }
}
