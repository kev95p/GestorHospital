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
    public partial class EdicionIngresarPaciente : Form
    {
        public EdicionIngresarPaciente()
        {
            InitializeComponent();
        }

        private void label2_Click(object sender, EventArgs e) { }
        private void dateTimePicker1_ValueChanged(object sender, EventArgs e) { }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }


        private Boolean ValidarDatos()
        {
            Boolean Validado = true;
            Notificador.Clear();
            if (txtMotivos.TextLength == 0)
            {
                Notificador.SetError(txtMotivos, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtNHabitacion.TextLength == 0)
            {
                Notificador.SetError(txtNHabitacion, "Este campo no puede quedar vacio.");
                Validado = false;
            }

            return Validado;
        }


        private void CargarMedicos()
        {
            cbxDoctor.DataSource = CacheManager.CachePaciente.TODOS_MEDICOS();
            cbxDoctor.ValueMember = "ID";
            cbxDoctor.DisplayMember = "Nombre";
        }


        private void EdicionIngresarPaciente_Load(object sender, EventArgs e)
        {
            CargarMedicos();
        }


        

    }
}
