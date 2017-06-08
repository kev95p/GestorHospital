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
    public partial class EnfermedadesDetallesEdicion : Form
    {
        public string idPaciente = "";
        public string idPacienteEnfermedad = "";
        public bool modificar = false;
        public EnfermedadesDetallesEdicion()
        {
            InitializeComponent();
            CargarEstado();
            CargarEnfermedades();
        }

        public void CargarEstado()
        {
            DataRow fila;
            DataTable estados = new DataTable();
            estados.Columns.Add("Estado");
            estados.Columns.Add("Valor");
            fila = estados.NewRow();
            fila["Estado"] = "Tratada";
            fila["Valor"] = "1";
            estados.Rows.Add(fila);
            fila = estados.NewRow();
            fila["Estado"] = "Curada";
            fila["Valor"] = "2";
            estados.Rows.Add(fila);
            fila = estados.NewRow();
            fila["Estado"] = "Terminal";
            fila["Valor"] = "3";
            estados.Rows.Add(fila);
            cbEstado.DataSource = estados;
            cbEstado.ValueMember = "Valor";
            cbEstado.DisplayMember = "Estado";
        }

        private void CargarEnfermedades()
        {
            dgvEnfermedades.AutoGenerateColumns = false;
            dgvEnfermedades.DataSource = CacheManager.Cache.OBTENER_ENFERMEDADES().Tables[0];
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            CRUDManager.Entidades.Paciente_Enfermedad p = new CRUDManager.Entidades.Paciente_Enfermedad();
            p.IdPaciente_Enfermedad = idPacienteEnfermedad;
            p.IdPaciente = idPaciente;
            p.IdEnfermedad = dgvEnfermedades.CurrentRow.Cells["ID"].Value.ToString();
            p.Estado = cbEstado.SelectedValue.ToString();
            p.FechaDiagnostico = SessionManager.FechaHelper.FormatearFecha(dtpDiagnostico.Text);


            if (modificar)
            {
                if (p.actualizar())
                {
                    MessageBox.Show("enfermedad modificada correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Close();
                }
                else
                {
                    MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
            }
            else
            {
                if (p.insertar())
                {
                    MessageBox.Show("enfermedad agregada correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Close();
                }
                else
                {
                    MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
            }

        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }
    }
}
