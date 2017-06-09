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
    public partial class DetallePacientes : Form
    {
        public DetallePacientes()
        {
            InitializeComponent();
        }
        //nooooooooooooooooooooooooo
        private void groupBox1_Enter(object sender, EventArgs e) { }


        private void CargarDetallePacientesIngresados()
        {
            dgvDetallePaciente.AutoGenerateColumns = false;
            dgvDetallePaciente.DataSource = CacheManager.Cache.OBTENER_DETALLE_PACIENTES_INGRESADOS().Tables[0];

        } 

        private void DetallePacientes_Load(object sender, EventArgs e)
        {
            CargarDetallePacientesIngresados();
        }

        

        
    }
}
