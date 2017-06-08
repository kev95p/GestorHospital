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
    public partial class EnfermedadesDetalles : Form
    {
        string idpaciente = "";
        public EnfermedadesDetalles(string idpaciente)
        {
            InitializeComponent();
            this.idpaciente = idpaciente;
            CargarEnfermedades();
        }

        public void CargarEnfermedades()
        {
            dgvEnfermedades.AutoGenerateColumns = false;
            dgvEnfermedades.DataSource = CacheManager.CachePaciente.ENFERMEDADES(idpaciente);
            
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            EnfermedadesDetallesEdicion frm = new EnfermedadesDetallesEdicion();
            frm.idPaciente = idpaciente;
            frm.ShowDialog();
            CargarEnfermedades();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            EnfermedadesDetallesEdicion frm = new EnfermedadesDetallesEdicion();
            frm.modificar = true;
            frm.idPaciente = idpaciente;
            frm.idPacienteEnfermedad = dgvEnfermedades.CurrentRow.Cells["id"].Value.ToString();
            frm.dtpDiagnostico.Text = dgvEnfermedades.CurrentRow.Cells["FechaDiagnostico"].Value.ToString();
            frm.cbEstado.SelectedIndex = frm.cbEstado.FindStringExact(dgvEnfermedades.CurrentRow.Cells["Estado"].Value.ToString());
            frm.ShowDialog();
            CargarEnfermedades();
        }
    }
}
