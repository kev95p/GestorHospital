using CRUDManager.Entidades;
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
        public bool modificar = false;
        public bool detalle = false;
        public int id = 0;
        public EdicionPaciente()
        {
            InitializeComponent();
            CargarEstadoCivil();
            CargarDepartamentos();
            CargarMunicipios();
            CargarTipoSangre();

        }

        private void DeshabilitarControles()
        {
            txtPrimerNombre.ReadOnly = true;
            txtSegundoNombre.ReadOnly = true;
            txtPrimerApellido.ReadOnly = true;
            txtSegundoApellido.ReadOnly = true;
            txtEmail.ReadOnly = true;
            txtEstatura.ReadOnly = true;
            txtOcupacion.ReadOnly = true;
            txtPersonaEmergencia.ReadOnly = true;
            txtPeso.ReadOnly = true;
            txtResidencia.ReadOnly = true;
            txtTelefono.ReadOnly = true;
            txtTelefonoEmergencia.ReadOnly = true;
            DUI.ReadOnly = true;
            cbDepartamentos.Enabled = false;
            cbEstadoCivil.Enabled = false;
            cbMunicipios.Enabled = false;
            cbTipoSangre.Enabled = false;
            dtpFechaNac.Enabled = false;
            btnSeleccionarFoto.Visible = false;
            btnTomarFoto.Visible = false;
            rbFemenino.Enabled = false;
            rbMasculino.Enabled = false;
            btnAceptar.Visible = false;
            btnCancelar.Visible = false;

        }

        public void HabilitarControles()
        {
            txtPrimerNombre.ReadOnly = false;
            txtSegundoNombre.ReadOnly = false;
            txtPrimerApellido.ReadOnly = false;
            txtSegundoApellido.ReadOnly = false;
            txtEmail.ReadOnly = false;
            txtEstatura.ReadOnly = false;
            txtOcupacion.ReadOnly = false;
            txtPersonaEmergencia.ReadOnly = false;
            txtPeso.ReadOnly = false;
            txtResidencia.ReadOnly = false;
            txtTelefono.ReadOnly = false;
            txtTelefonoEmergencia.ReadOnly = false;
            DUI.ReadOnly = false;
            cbDepartamentos.Enabled = true;
            cbEstadoCivil.Enabled = true;
            cbMunicipios.Enabled = true;
            cbTipoSangre.Enabled = true;
            dtpFechaNac.Enabled = true;
            btnSeleccionarFoto.Visible = true;
            btnTomarFoto.Visible = true;
            rbFemenino.Enabled = true;
            rbMasculino.Enabled = true;
            btnAceptar.Visible = true;
            btnCancelar.Visible = true;

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
            pbxImagen.Image = rescalarImagen(frm.pbxImagen.Image,new Size(frm.pbxImagen.Image.Size.Width/4, frm.pbxImagen.Image.Size.Height/4));
        }

        private Image rescalarImagen(Image img, Size tamaño)
        {
            return (new Bitmap(img, tamaño));
        }

        private void Procesar()
        {
            Paciente paciente = new Paciente();
            ImagenPerfil imagen = new ImagenPerfil();

            imagen.Imagen = pbxImagen.Image;
            paciente.IdPaciente = id;
            paciente.Imagen = imagen;
            paciente.PrimerNombre = txtPrimerNombre.Text;
            paciente.SegundoNombre = txtSegundoNombre.Text;
            paciente.PrimerApellido = txtPrimerApellido.Text;
            paciente.SegundoApellido = txtSegundoApellido.Text;
            if (rbMasculino.Checked)
            {
                paciente.Sexo = "1";
            }
            else if(rbFemenino.Checked)
            {
                paciente.Sexo = "2";
            }
            paciente.Telefono = txtTelefono.Text;
            paciente.Dui = DUI.Text;
            paciente.Telefono_emergencia = txtTelefonoEmergencia.Text;
            paciente.Persona_emergencia = txtPersonaEmergencia.Text;
            paciente.Peso = txtPeso.Text;
            paciente.Estatura = txtEstatura.Text;
            paciente.Estado_civil = cbEstadoCivil.SelectedValue.ToString();
            paciente.IdMunicipio = cbMunicipios.SelectedValue.ToString();
            paciente.Tiposangre = cbTipoSangre.SelectedValue.ToString();
            paciente.Residencia = txtResidencia.Text;
            paciente.Email = txtEmail.Text;
            paciente.FechaNac =SessionManager.FechaHelper.FormatearFecha(dtpFechaNac.Text);
            paciente.Ocupacion = txtOcupacion.Text;

            if (modificar == true)
            {
                
                if (paciente.actualizar())
                {
                    MessageBox.Show("Usuario modificado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Close();
                }
                else
                {
                    MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }

            }
            else
            {
                if (paciente.insertar())
                {
                    MessageBox.Show("Usuario modificado correctamente", "Aviso", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    Close();
                }
                else
                {
                    MessageBox.Show("Error inesperado", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                }
            }
            
                      
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

        private void btnAceptar_Click(object sender, EventArgs e)
        {
            Procesar();
        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void btnSalir_Click(object sender, EventArgs e)
        {
            Close();
        }

        private void EdicionPaciente_Load(object sender, EventArgs e)
        {
            if (modificar) this.Text = "Modificacion Paciente";
            if (detalle)
            {
                Text = "Detalle Paciente";

                btnSalir.Visible = true;
                btnEditar.Visible = true;
                DeshabilitarControles();
                Update();
            }
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            HabilitarControles();
            modificar = true;
            detalle = false;
            Text = "Modificacion Paciente";
            btnSalir.Visible = false;
            btnEditar.Visible = false;
            Update();
        }
    }
}
