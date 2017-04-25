using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GUI
{
    public partial class Splash : Form
    {
        public Splash()
        {
            InitializeComponent();
        }

        private void Splash_Load(object sender, EventArgs e)
        {
            TiempoEspera.Start();
        }

        private void TiempoEspera_Tick(object sender, EventArgs e)
        {
            TiempoEspera.Stop();
            this.Close();
        }
    }
}
