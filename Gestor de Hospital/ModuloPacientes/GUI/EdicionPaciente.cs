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
            CargarEstadoCivil();
            CargarDepartamentos();
            CargarMunicipios();
        }

        private void CargarEstadoCivil()
        {
            DataRow fila;
            DataTable estados = new DataTable();
            estados.Columns.Add("Estado");
            estados.Columns.Add("Valor");
            fila = estados.NewRow();
            fila["Estado"] = "Soltero";
            fila["Valor"] = "1";
            estados.Rows.Add(fila);
            fila = estados.NewRow();
            fila["Estado"] = "Casado";
            fila["Valor"] = "2";
            estados.Rows.Add(fila);

            cbEstadoCivil.DataSource = estados;
            cbEstadoCivil.ValueMember = "Valor";
            cbEstadoCivil.DisplayMember = "Estado";

        }

        private void CargarDepartamentos()
        {
            cbDepartamentos.DataSource = SessionManager.DatosCargados.Instancia.Departamentos;
            cbDepartamentos.DisplayMember = "departamento";
            cbDepartamentos.ValueMember = "idDepartamento";
        }

        private void CargarMunicipios()
        {
            DataView dv = new DataView(SessionManager.DatosCargados.Instancia.Munipicipios);
            dv.RowFilter = "idDepartamento = " + (cbDepartamentos.SelectedIndex + 1);
            cbMunicipios.DataSource = dv.ToTable();
            cbMunicipios.DisplayMember = "municipio";
            cbMunicipios.ValueMember = "idMunicipio";
        }

        private void CargarTipoSangre()
        {
            DataTable dt = SessionManager.DatosCargados.Instancia.Tipos_sangre;
            cbTipoSangre.DataSource = dt;
            cbTipoSangre.DisplayMember = "tipo";
            cbTipoSangre.ValueMember = "idTipoSangre";

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

        private void cbDepartamentos_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cbDepartamentos.Items.Count > 0)
            {
                CargarMunicipios();
            }
        }
    }
}
