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
    public partial class CitasDetalles : Form
    {
        public string idpaciente; 
        public CitasDetalles()
        {
            InitializeComponent();
        }

        private void  CargarCitas()
        {
            dgvCitas.AutoGenerateColumns = false;
            dgvCitas.DataSource = CacheManager.CachePaciente.CITAS(idpaciente);
        }

        private void CitasDetalles_Load(object sender, EventArgs e)
        {
            CargarCitas();
        }

        private void btnAgregar_Click(object sender, EventArgs e)
        {
            EdicionCitas frm = new EdicionCitas();
            frm.idPaciente = idpaciente;
            frm.ShowDialog();
        }
    }
}
