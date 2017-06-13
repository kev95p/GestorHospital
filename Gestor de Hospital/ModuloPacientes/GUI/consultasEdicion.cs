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
    public partial class consultasEdicion : Form
    {
        public consultasEdicion()
        {
            InitializeComponent();
        }


        public string IDPaciente;

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }



        private void btnGuardar_Click(object sender, EventArgs e)
        {
            CRUDManager.Entidades.Consultas consultas = new CRUDManager.Entidades.Consultas();
            consultas.IdMedico = cbxDoctor.SelectedValue.ToString();
            consultas.IdPaciente = IDPaciente;
            consultas.FechaConsulta1 = SessionManager.FechaHelper.FormatearFecha(dtpFechaConsulta.Text);



            if (consultas.Insertar())
                {
                    MessageBox.Show("Consulta agregada correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Close();
                }
                else
                {
                    MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }

        }


        private void CargarMedicos()
        {  
            DataTable Medicos = new DataTable();
            cbxDoctor.DataSource = Medicos;
            cbxDoctor.ValueMember = "idEmpleado";
            cbxDoctor.DisplayMember = "Medico";
        }

        private void consultasEdicion_Load(object sender, EventArgs e)
        {
            CargarMedicos();
        }

    }
}
