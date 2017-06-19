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
    public partial class EdicionCitas : Form
    {
        public EdicionCitas()
        {
            InitializeComponent();
        }

        public string idPaciente;

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void EdicionCitas_Load(object sender, EventArgs e)
        {
            CargarEstadoCita();
            CargarMedicos();
        }

        private void CargarEstadoCita()
        {
            DataRow fila;
            DataTable Estados = new DataTable();
            Estados.Columns.Add("Estado");
            Estados.Columns.Add("Valor");

            fila = Estados.NewRow();
            fila["Estado"] = "Pendiente";
            fila["Valor"] = "1";
            Estados.Rows.Add(fila);

            fila = Estados.NewRow();
            fila["Estado"] = "Completada";
            fila["Valor"] = "2";
            Estados.Rows.Add(fila);

            fila = Estados.NewRow();
            fila["Estado"] = "Cancelada";
            fila["Valor"] = "3";
            Estados.Rows.Add(fila);

            cbxEstado.DataSource = Estados;
            cbxEstado.ValueMember = "Valor";
            cbxEstado.DisplayMember = "Estado";
        }

        private void CargarMedicos()
        {
            cbxMedico.DataSource = CacheManager.CachePaciente.TODOS_MEDICOS();
            cbxMedico.ValueMember = "ID";
            cbxMedico.DisplayMember = "Nombre";
        }

        private void btnGuardar_Click(object sender, EventArgs e)
        {
            CRUDManager.Entidades.Citas citas = new CRUDManager.Entidades.Citas();

            citas.IdMedico = cbxMedico.SelectedValue.ToString();
            citas.IdPaciente = idPaciente;
            citas.FechaCita = SessionManager.FechaHelper.FormatearFecha(dtpFechaCitas.Text);
            citas.Estado = cbxEstado.SelectedValue.ToString();
            citas.Motivos = txtMotivos.Text;



            if (ValidarDatos())
            {
                if (citas.Insertar())
                {
                    MessageBox.Show("Cita agregada correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
            if (txtMotivos.TextLength == 0)
            {
                Notificador.SetError(txtMotivos, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            return Validado;
        }


    }
}
