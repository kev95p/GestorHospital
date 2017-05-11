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
    public partial class EdicionPaciente : Form
    {
        public EdicionPaciente()
        {
            InitializeComponent();
        }

        private void btTomarFoto_Click(object sender, EventArgs e)
        {
            CamaraForm frm = new CamaraForm();
            frm.ShowDialog();
            pbxImagen.Image = frm.pbxImagen.Image;
        }

        private void btnSeleccionarFoto_Click(object sender, EventArgs e)
        {
            OpenFileDialog dlg = new OpenFileDialog();
            dlg.Title = "Seleccionar Imagen";
            dlg.Filter = "png files (*.png)|*.png";
            if(dlg.ShowDialog() == DialogResult.OK){
                pbxImagen.Image = new Bitmap(dlg.FileName);
            }
        }

        
    }
}
