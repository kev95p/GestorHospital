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

        private void button1_Click(object sender, EventArgs e)
        {
            ModuloPacientes.Reportes.Rep.Pacientes p = new Reportes.Rep.Pacientes();
            p.SetDataSource(CacheManager.CacheReportes.PACIENTES_REPORTE(SessionManager.FechaHelper.FormatearFecha(dtpInicial.Text), SessionManager.FechaHelper.FormatearFecha(dtpInicial.Text)));
           
            crvPacientes.ReportSource = p;
        }
    }
}
