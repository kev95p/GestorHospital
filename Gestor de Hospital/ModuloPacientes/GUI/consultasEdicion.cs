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


            if (ValidarDatos())
            {
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

        }


        private Boolean ValidarDatos()
        {
            Boolean Validado = true;
            Notificador.Clear();
            if (dtpFechaConsulta.Checked == false)
            {
                Notificador.SetError(dtpFechaConsulta, "Este campo no puede quedar vacio.");
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

        private void consultasEdicion_Load(object sender, EventArgs e)
        {
            CargarMedicos();
        }

    }
}
