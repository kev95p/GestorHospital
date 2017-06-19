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
            if (!frm.existe)
            {
                MessageBox.Show("Error no se encuentra camara!!", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }else
            {
                frm.ShowDialog();
                pbxImagen.Image = rescalarImagen(frm.pbxImagen.Image, new Size(frm.pbxImagen.Image.Size.Width / 4, frm.pbxImagen.Image.Size.Height / 4));
            }
          
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

            if (ValidarDatos())
            {
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


        private Boolean ValidarDatos()
        {
            Boolean Validado = true;
            Notificador.Clear();
            if (txtPrimerNombre.TextLength == 0)
            {
                Notificador.SetError(txtPrimerNombre, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtSegundoNombre.TextLength == 0)
            {
                Notificador.SetError(txtSegundoNombre, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtPrimerApellido.TextLength == 0)
            {
                Notificador.SetError(txtPrimerApellido, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtSegundoApellido.TextLength == 0)
            {
                Notificador.SetError(txtSegundoApellido, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (DUI.MaskCompleted == false || DUI.TextLength == 0)
            {
                Notificador.SetError(DUI, "Este campo no puede quedar vacio.");
                Validado = false;
            }

            if (rbMasculino.Checked == false && rbFemenino.Checked == false)
            {
                Notificador.SetError(rbFemenino, "Este campo no puede quedar vacio.");
                Validado = false;
            }

            if (txtOcupacion.TextLength == 0)
            {
                Notificador.SetError(txtOcupacion, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtResidencia.TextLength == 0)
            {
                Notificador.SetError(txtResidencia, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtEmail.TextLength == 0)
            {
                Notificador.SetError(txtEmail, "Este campo no puede quedar vacio.");
                Validado = false;
            }

            if (txtTelefono.TextLength == 0)
            {
                Notificador.SetError(txtTelefono, "Este campo no puede quedar vacio.");
                Validado = false;
            }

            if (txtPersonaEmergencia.TextLength == 0)
            {
                Notificador.SetError(txtPersonaEmergencia, "Este campo no puede quedar vacio.");
                Validado = false;
            }

            if (txtTelefonoEmergencia.TextLength == 0)
            {
                Notificador.SetError(txtTelefonoEmergencia, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtEstatura.TextLength == 0)
            {
                Notificador.SetError(txtEstatura, "Este campo no puede quedar vacio.");
                Validado = false;
            }
            if (txtPeso.TextLength == 0)
            {
                Notificador.SetError(txtPeso, "Este campo no puede quedar vacio.");
                Validado = false;
            }

            return Validado;
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

        private void txtTelefono_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsNumber(e.KeyChar)) && (e.KeyChar != (char)Keys.Back))
            {
                MessageBox.Show("Solo se permiten numeros", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                e.Handled = true;
                return;
            }
        }

        private void txtTelefonoEmergencia_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsNumber(e.KeyChar)) && (e.KeyChar != (char)Keys.Back))
            {
                MessageBox.Show("Solo se permiten numeros", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                e.Handled = true;
                return;
            }
        }

        private void txtEstatura_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!(char.IsNumber(e.KeyChar)) && (e.KeyChar != (char)Keys.Back) && (e.KeyChar != (char)46))
            {
                MessageBox.Show("Solo se permiten numeros", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                e.Handled = true;
                return;
            }
        }
    }
}
