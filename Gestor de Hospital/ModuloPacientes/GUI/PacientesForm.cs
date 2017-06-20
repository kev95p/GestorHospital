using CRUDManager.Entidades;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ModuloPacientes.GUI
{
    public partial class PacientesForm : Form
    {
        public string idpaciente;
        public PacientesForm()
        {
            InitializeComponent();
            CargarPacientes();

        }

        private void CargarPacientes()
        {
            dgvPacientes.AutoGenerateColumns = false;
            dgvPacientes.DataSource = CacheManager.Cache.OBTENER_PACIENTES().Tables[0];
        }

        private Image BlobToImage(byte[] bytes)
        {
            var ms = new  MemoryStream(bytes);
            Image image = Image.FromStream(ms);
            return image;
        }

        private void btnAgregar_Click_1(object sender, EventArgs e)
        {
            EdicionPaciente frm = new EdicionPaciente();
            frm.ShowDialog();
            CargarPacientes();
        }

        private void btnModificar_Click(object sender, EventArgs e)
        {
            EdicionPaciente frm = new EdicionPaciente();
            frm.modificar = true;
            frm.txtPrimerNombre.Text = dgvPacientes.CurrentRow.Cells["Nombres"].Value.ToString().Split(' ')[0];
            frm.txtSegundoNombre.Text = dgvPacientes.CurrentRow.Cells["Nombres"].Value.ToString().Split(' ')[1];
            frm.txtPrimerApellido.Text = dgvPacientes.CurrentRow.Cells["Apellidos"].Value.ToString().Split(' ')[0];
            frm.txtSegundoApellido.Text = dgvPacientes.CurrentRow.Cells["Apellidos"].Value.ToString().Split(' ')[1];
            if (dgvPacientes.CurrentRow.Cells["Sexo"].Value.ToString() == "M")
            {
                frm.rbMasculino.Checked = true;
            }
            else if (dgvPacientes.CurrentRow.Cells["Sexo"].Value.ToString() == "F")
            {
                frm.rbFemenino.Checked = true;
            }
            frm.dtpFechaNac.Text = dgvPacientes.CurrentRow.Cells["FechaNacimiento"].Value.ToString();
            frm.DUI.Text = dgvPacientes.CurrentRow.Cells["DUI"].Value.ToString();
            frm.cbEstadoCivil.SelectedIndex = frm.cbEstadoCivil.FindStringExact(dgvPacientes.CurrentRow.Cells["estado_civil"].Value.ToString());
            frm.cbDepartamentos.SelectedValue = (int)dgvPacientes.CurrentRow.Cells["idDepartamento"].Value;
            frm.cbMunicipios.SelectedValue = (int)dgvPacientes.CurrentRow.Cells["idMunicipio"].Value;
            frm.DUI.Text = dgvPacientes.CurrentRow.Cells["DUI"].Value.ToString();
            frm.txtEmail.Text = dgvPacientes.CurrentRow.Cells["email"].Value.ToString();
            frm.txtTelefono.Text = dgvPacientes.CurrentRow.Cells["telefono"].Value.ToString();
            frm.txtResidencia.Text = dgvPacientes.CurrentRow.Cells["residencia"].Value.ToString();
            frm.txtOcupacion.Text = dgvPacientes.CurrentRow.Cells["ocupacion"].Value.ToString();
            frm.txtEstatura.Text = dgvPacientes.CurrentRow.Cells["estatura"].Value.ToString();
            frm.txtPeso.Text = dgvPacientes.CurrentRow.Cells["peso"].Value.ToString();
            frm.txtPersonaEmergencia.Text = dgvPacientes.CurrentRow.Cells["persona_emergencia"].Value.ToString();
            frm.txtTelefonoEmergencia.Text = dgvPacientes.CurrentRow.Cells["telefono_emergencia"].Value.ToString();
            frm.cbTipoSangre.SelectedValue = (int)dgvPacientes.CurrentRow.Cells["idTipoSangre"].Value;
            frm.pbxImagen.Image = BlobToImage((byte[])dgvPacientes.CurrentRow.Cells["imagen"].Value);
            frm.id = (int)dgvPacientes.CurrentRow.Cells["idPaciente"].Value;
            frm.ShowDialog();
            CargarPacientes();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            Paciente paciente = new Paciente();
            paciente.IdPaciente = (int)dgvPacientes.CurrentRow.Cells["idPaciente"].Value;

            if(MessageBox.Show("Esta seguro que desea eliminar el paciente?", "Advertencia", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation) == DialogResult.OK) {

                if (paciente.eliminar())
                {
                    MessageBox.Show("Paciente eliminado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    CargarPacientes();
                }
                else
                {
                    MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }

            }

        }

        private void btnDetalles_Click(object sender, EventArgs e)
        {
            EdicionPaciente frm = new EdicionPaciente();
            frm.detalle = true;
            frm.txtPrimerNombre.Text = dgvPacientes.CurrentRow.Cells["Nombres"].Value.ToString().Split(' ')[0];
            frm.txtSegundoNombre.Text = dgvPacientes.CurrentRow.Cells["Nombres"].Value.ToString().Split(' ')[1];
            frm.txtPrimerApellido.Text = dgvPacientes.CurrentRow.Cells["Apellidos"].Value.ToString().Split(' ')[0];
            frm.txtSegundoApellido.Text = dgvPacientes.CurrentRow.Cells["Apellidos"].Value.ToString().Split(' ')[1];
            if (dgvPacientes.CurrentRow.Cells["Sexo"].Value.ToString() == "M")
            {
                frm.rbMasculino.Checked = true;
            }
            else if (dgvPacientes.CurrentRow.Cells["Sexo"].Value.ToString() == "F")
            {
                frm.rbFemenino.Checked = true;
            }
            frm.dtpFechaNac.Text = dgvPacientes.CurrentRow.Cells["FechaNacimiento"].Value.ToString();
            frm.DUI.Text = dgvPacientes.CurrentRow.Cells["DUI"].Value.ToString();
            frm.cbEstadoCivil.SelectedIndex = frm.cbEstadoCivil.FindStringExact(dgvPacientes.CurrentRow.Cells["estado_civil"].Value.ToString());
            frm.cbDepartamentos.SelectedValue = (int)dgvPacientes.CurrentRow.Cells["idDepartamento"].Value;
            frm.cbMunicipios.SelectedValue = (int)dgvPacientes.CurrentRow.Cells["idMunicipio"].Value;
            frm.DUI.Text = dgvPacientes.CurrentRow.Cells["DUI"].Value.ToString();
            frm.txtEmail.Text = dgvPacientes.CurrentRow.Cells["email"].Value.ToString();
            frm.txtTelefono.Text = dgvPacientes.CurrentRow.Cells["telefono"].Value.ToString();
            frm.txtResidencia.Text = dgvPacientes.CurrentRow.Cells["residencia"].Value.ToString();
            frm.txtOcupacion.Text = dgvPacientes.CurrentRow.Cells["ocupacion"].Value.ToString();
            frm.txtEstatura.Text = dgvPacientes.CurrentRow.Cells["estatura"].Value.ToString();
            frm.txtPeso.Text = dgvPacientes.CurrentRow.Cells["peso"].Value.ToString();
            frm.txtPersonaEmergencia.Text = dgvPacientes.CurrentRow.Cells["persona_emergencia"].Value.ToString();
            frm.txtTelefonoEmergencia.Text = dgvPacientes.CurrentRow.Cells["telefono_emergencia"].Value.ToString();
            frm.cbTipoSangre.SelectedValue = (int)dgvPacientes.CurrentRow.Cells["idTipoSangre"].Value;
            frm.pbxImagen.Image = BlobToImage((byte[])dgvPacientes.CurrentRow.Cells["imagen"].Value);
            frm.id = (int)dgvPacientes.CurrentRow.Cells["idPaciente"].Value;
            frm.ShowDialog();
            CargarPacientes();
            
        }

        private void btnEnfermedades_Click(object sender, EventArgs e)
        {
            EnfermedadesDetalles frm = new EnfermedadesDetalles(dgvPacientes.CurrentRow.Cells["idPaciente"].Value.ToString());
            frm.pbxImagen.Image = BlobToImage((byte[])dgvPacientes.CurrentRow.Cells["imagen"].Value);
            frm.txtNombres.Text = dgvPacientes.CurrentRow.Cells["Nombres"].Value.ToString();
            frm.txtApellidos.Text = dgvPacientes.CurrentRow.Cells["Apellidos"].Value.ToString();
            frm.txtEstatura.Text = dgvPacientes.CurrentRow.Cells["peso"].Value.ToString();
            frm.txtSexo.Text = dgvPacientes.CurrentRow.Cells["sexo"].Value.ToString();
            frm.txtPeso.Text = dgvPacientes.CurrentRow.Cells["peso"].Value.ToString();
            frm.ShowDialog();
            
        }

        private void toolStripButton4_Click(object sender, EventArgs e)
        {
            CitasDetalles frm = new CitasDetalles();
            frm.idpaciente = dgvPacientes.CurrentRow.Cells["idPaciente"].Value.ToString();
            frm.pbxImagen.Image = BlobToImage((byte[])dgvPacientes.CurrentRow.Cells["imagen"].Value);
            frm.txtNombres.Text = dgvPacientes.CurrentRow.Cells["Nombres"].Value.ToString();
            frm.txtApellidos.Text = dgvPacientes.CurrentRow.Cells["Apellidos"].Value.ToString();
            frm.txtEstatura.Text = dgvPacientes.CurrentRow.Cells["peso"].Value.ToString();
            frm.txtSexo.Text = dgvPacientes.CurrentRow.Cells["sexo"].Value.ToString();
            frm.txtPeso.Text = dgvPacientes.CurrentRow.Cells["peso"].Value.ToString();
            frm.ShowDialog();
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            ConsultasDetalles frm = new ConsultasDetalles();
            frm.idpaciente = dgvPacientes.CurrentRow.Cells["idPaciente"].Value.ToString();
            frm.pbxImagen.Image = BlobToImage((byte[])dgvPacientes.CurrentRow.Cells["imagen"].Value);
            frm.txtNombres.Text = dgvPacientes.CurrentRow.Cells["Nombres"].Value.ToString();
            frm.txtApellidos.Text = dgvPacientes.CurrentRow.Cells["Apellidos"].Value.ToString();
            frm.txtEstatura.Text = dgvPacientes.CurrentRow.Cells["peso"].Value.ToString();
            frm.txtSexo.Text = dgvPacientes.CurrentRow.Cells["sexo"].Value.ToString();
            frm.txtPeso.Text = dgvPacientes.CurrentRow.Cells["peso"].Value.ToString();
            frm.ShowDialog();
        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            DiagnosticosDetalles frm = new DiagnosticosDetalles();
            frm.idpaciente = dgvPacientes.CurrentRow.Cells["idPaciente"].Value.ToString();
            frm.pbxImagen.Image = BlobToImage((byte[])dgvPacientes.CurrentRow.Cells["imagen"].Value);
            frm.txtNombres.Text = dgvPacientes.CurrentRow.Cells["Nombres"].Value.ToString();
            frm.txtApellidos.Text = dgvPacientes.CurrentRow.Cells["Apellidos"].Value.ToString();
            frm.txtEstatura.Text = dgvPacientes.CurrentRow.Cells["peso"].Value.ToString();
            frm.txtSexo.Text = dgvPacientes.CurrentRow.Cells["sexo"].Value.ToString();
            frm.txtPeso.Text = dgvPacientes.CurrentRow.Cells["peso"].Value.ToString();
            frm.ShowDialog();
        }

        private void btnRecetas_Click(object sender, EventArgs e)
        {
            RecetasDetalles frm = new RecetasDetalles();
            frm.idpaciente = dgvPacientes.CurrentRow.Cells["idPaciente"].Value.ToString();
            frm.pbxImagen.Image = BlobToImage((byte[])dgvPacientes.CurrentRow.Cells["imagen"].Value);
            frm.txtNombres.Text = dgvPacientes.CurrentRow.Cells["Nombres"].Value.ToString();
            frm.txtApellidos.Text = dgvPacientes.CurrentRow.Cells["Apellidos"].Value.ToString();
            frm.txtEstatura.Text = dgvPacientes.CurrentRow.Cells["peso"].Value.ToString();
            frm.txtSexo.Text = dgvPacientes.CurrentRow.Cells["sexo"].Value.ToString();
            frm.txtPeso.Text = dgvPacientes.CurrentRow.Cells["peso"].Value.ToString();
            frm.ShowDialog();
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {
            GUI.EdicionIngresarPaciente frm = new EdicionIngresarPaciente();
            frm.idPAciente = dgvPacientes.CurrentRow.Cells["idPaciente"].Value.ToString();
            frm.ShowDialog();
        }
    }
}
