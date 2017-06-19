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
    public partial class CamaraForm : Form
    {
        CLS.CamaraWrapper camara;
        public bool existe = false;
        public CamaraForm()
        {
            InitializeComponent();
            camara = new CLS.CamaraWrapper();
            existe = camara.existeDispositivo;
            camara.VistaCamara = pbxImagen;
            
            
        }

        private void btnTomarFoto_Click(object sender, EventArgs e)
        {
            camara.TomarImagen();
        }


        private void CamaraForm_FormClosed(object sender, FormClosedEventArgs e)
        {
            camara.Detener();
        }

        private void CamaraForm_Load(object sender, EventArgs e)
        {
            camara.Iniciar();
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void pbxImagen_Click(object sender, EventArgs e)
        {

        }
    }
}
