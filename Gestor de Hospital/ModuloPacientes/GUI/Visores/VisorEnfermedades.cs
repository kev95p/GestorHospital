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
    public partial class VisorEnfermedades : Form
    {
        public VisorEnfermedades()
        {
            InitializeComponent();
        }

        private void splitContainer1_Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void VisorEnfermedades_Load(object sender, EventArgs e)
        {
            cbEnfermedades.DataSource = CacheManager.Cache.OBTENER_ENFERMEDADES().Tables[0];
            cbEnfermedades.DisplayMember = "nombre";
            cbEnfermedades.ValueMember = "idenfermedad";
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Reportes.Rep.Enfermedades en = new Reportes.Rep.Enfermedades();
            en.SetDataSource(CacheManager.CacheReportes.ENFERMEDADES_REPORTE(cbEnfermedades.SelectedValue.ToString()));
            crwEnfermedades.ReportSource = en;
        }
    }
}
