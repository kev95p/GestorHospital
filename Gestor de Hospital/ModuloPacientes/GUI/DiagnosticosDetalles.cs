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
    public partial class DiagnosticosDetalles : Form
    {
        public string idpaciente;
        public DiagnosticosDetalles()
        {
            InitializeComponent();
        }

        private void CargarDiagnosticos()
        {
            dgvDiagnosticos.AutoGenerateColumns = false;
            dgvDiagnosticos.DataSource = CacheManager.CachePaciente.DIAGNOSTICOS(idpaciente);
        }

        private void DiagnosticosDetalles_Load(object sender, EventArgs e)
        {
            CargarDiagnosticos();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            EdicionDiagnosticos frm = new EdicionDiagnosticos();
            frm.IDPaciente = idpaciente;
            frm.ShowDialog();
            CargarDiagnosticos();
        }

        
    }
}
