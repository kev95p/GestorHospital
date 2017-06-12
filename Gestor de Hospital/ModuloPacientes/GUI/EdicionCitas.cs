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

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void EdicionCitas_Load(object sender, EventArgs e)
        {
            CargarEstadoCita();
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

    }
}
