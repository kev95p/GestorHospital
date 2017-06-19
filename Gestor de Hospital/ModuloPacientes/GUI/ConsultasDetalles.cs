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
    public partial class ConsultasDetalles : Form
    {
        public string idpaciente;
        public ConsultasDetalles()
        {
            InitializeComponent();
        }

        private void CargarConsultas()
        {
            dgvConsultas.AutoGenerateColumns = false;
            dgvConsultas.DataSource = CacheManager.CachePaciente.CONSULTAS(idpaciente);
        }

        private void ConsultasDetalles_Load(object sender, EventArgs e)
        {
            CargarConsultas();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            consultasEdicion frm = new consultasEdicion();
            frm.IDPaciente = idpaciente;
            frm.ShowDialog();
            CargarConsultas();

        }
    }
}
