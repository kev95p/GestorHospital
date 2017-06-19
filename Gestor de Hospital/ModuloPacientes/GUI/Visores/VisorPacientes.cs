using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ModuloPacientes.GUI.Visores
{
    public partial class VisorPacientes : Form
    {
        public VisorPacientes()
        {
            InitializeComponent();
        }

        private void VisorPacientes_Load(object sender, EventArgs e)
        {
            Reportes.Rep.Pacientes p = new Reportes.Rep.Pacientes();
            p.SetDataSource(CacheManager.CacheReportes.PACIENTES_REPORTE("",""));
            crvPacientes.ReportSource = p;
        }

        private void btnGenerar_Click(object sender, EventArgs e)
        {
        }
    }
}
