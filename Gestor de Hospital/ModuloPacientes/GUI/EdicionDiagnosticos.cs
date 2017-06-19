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
    public partial class EdicionDiagnosticos : Form
    {
        public string IDPaciente;
        public EdicionDiagnosticos()
        {
            InitializeComponent();
        }

        private void EdicionDiagnosticos_Load(object sender, EventArgs e)
        {
            CargarMedicos();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void CargarMedicos()
        {
            cbxMedico.DataSource = CacheManager.CachePaciente.TODOS_MEDICOS();
            cbxMedico.ValueMember = "ID";
            cbxMedico.DisplayMember = "Nombre";
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            CRUDManager.Entidades.Diagnosticos diagnosticos = new CRUDManager.Entidades.Diagnosticos();
            diagnosticos.IdMedico = cbxMedico.SelectedValue.ToString();
            diagnosticos.Diagnostico = txtDiagnostico.Text;
            diagnosticos.IdPaciente = IDPaciente;
            diagnosticos.FechaCreacion = SessionManager.FechaHelper.FormatearFecha(dtpFechaDiagnostico.Text);
            


            if (ValidarDatos())
            {
                if (diagnosticos.Insertar())
                {
                    MessageBox.Show("Diagnostico agregada correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Close();
                }
                else
                {
                    MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
            }
        }


        private Boolean ValidarDatos()
        {
            Boolean Validado = true;
            Notificador.Clear();
            
            if (txtDiagnostico.TextLength == 0)
            {
                Notificador.SetError(txtDiagnostico, "Este campo no puede quedar vacio.");
                Validado = false;
            }

            return Validado;
        }
    }
}
