namespace ModuloPacientes.GUI
{
    partial class DetallePacientes
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.dgvDetallePaciente = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.txtNombres = new System.Windows.Forms.TextBox();
            this.btnBuscar = new System.Windows.Forms.Button();
            this.label2 = new System.Windows.Forms.Label();
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.dtpFechaIngreso = new System.Windows.Forms.DateTimePicker();
            this.rbtnMasculino = new System.Windows.Forms.RadioButton();
            this.rbtnFemenino = new System.Windows.Forms.RadioButton();
            this.label3 = new System.Windows.Forms.Label();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.txtApellidos = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.btnLimpiar = new System.Windows.Forms.Button();
            this.Nombres = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Apellidos = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.sexo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Motivos = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Habitacion = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Medico = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.fecharegistro = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.FechaAlta = new System.Windows.Forms.DataGridViewTextBoxColumn();
            ((System.ComponentModel.ISupportInitialize)(this.dgvDetallePaciente)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // dgvDetallePaciente
            // 
            this.dgvDetallePaciente.AllowUserToAddRows = false;
            this.dgvDetallePaciente.AllowUserToDeleteRows = false;
            this.dgvDetallePaciente.AllowUserToOrderColumns = true;
            this.dgvDetallePaciente.AllowUserToResizeColumns = false;
            this.dgvDetallePaciente.AllowUserToResizeRows = false;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.InactiveBorder;
            this.dgvDetallePaciente.AlternatingRowsDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvDetallePaciente.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvDetallePaciente.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Nombres,
            this.Apellidos,
            this.sexo,
            this.Motivos,
            this.Habitacion,
            this.Medico,
            this.fecharegistro,
            this.FechaAlta});
            this.dgvDetallePaciente.Location = new System.Drawing.Point(12, 130);
            this.dgvDetallePaciente.MultiSelect = false;
            this.dgvDetallePaciente.Name = "dgvDetallePaciente";
            this.dgvDetallePaciente.RowHeadersVisible = false;
            this.dgvDetallePaciente.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvDetallePaciente.Size = new System.Drawing.Size(775, 251);
            this.dgvDetallePaciente.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(46, 23);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(49, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Nombres";
            // 
            // txtNombres
            // 
            this.txtNombres.Location = new System.Drawing.Point(101, 19);
            this.txtNombres.Name = "txtNombres";
            this.txtNombres.Size = new System.Drawing.Size(213, 20);
            this.txtNombres.TabIndex = 2;
            // 
            // btnBuscar
            // 
            this.btnBuscar.Location = new System.Drawing.Point(712, 65);
            this.btnBuscar.Name = "btnBuscar";
            this.btnBuscar.Size = new System.Drawing.Size(75, 23);
            this.btnBuscar.TabIndex = 3;
            this.btnBuscar.Text = "Buscar";
            this.btnBuscar.UseVisualStyleBackColor = true;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(375, 23);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(75, 13);
            this.label2.TabIndex = 4;
            this.label2.Text = "Fecha Ingreso";
            // 
            // statusStrip1
            // 
            this.statusStrip1.Location = new System.Drawing.Point(0, 390);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(799, 22);
            this.statusStrip1.TabIndex = 6;
            this.statusStrip1.Text = "statusStrip1";
            // 
            // dtpFechaIngreso
            // 
            this.dtpFechaIngreso.Format = System.Windows.Forms.DateTimePickerFormat.Short;
            this.dtpFechaIngreso.Location = new System.Drawing.Point(466, 19);
            this.dtpFechaIngreso.Name = "dtpFechaIngreso";
            this.dtpFechaIngreso.Size = new System.Drawing.Size(133, 20);
            this.dtpFechaIngreso.TabIndex = 5;
            this.dtpFechaIngreso.Value = new System.DateTime(2017, 6, 8, 0, 0, 0, 0);
            // 
            // rbtnMasculino
            // 
            this.rbtnMasculino.AutoSize = true;
            this.rbtnMasculino.Location = new System.Drawing.Point(422, 48);
            this.rbtnMasculino.Name = "rbtnMasculino";
            this.rbtnMasculino.Size = new System.Drawing.Size(34, 17);
            this.rbtnMasculino.TabIndex = 7;
            this.rbtnMasculino.TabStop = true;
            this.rbtnMasculino.Text = "M";
            this.rbtnMasculino.UseVisualStyleBackColor = true;
            // 
            // rbtnFemenino
            // 
            this.rbtnFemenino.AutoSize = true;
            this.rbtnFemenino.Location = new System.Drawing.Point(501, 48);
            this.rbtnFemenino.Name = "rbtnFemenino";
            this.rbtnFemenino.Size = new System.Drawing.Size(31, 17);
            this.rbtnFemenino.TabIndex = 8;
            this.rbtnFemenino.TabStop = true;
            this.rbtnFemenino.Text = "F";
            this.rbtnFemenino.UseVisualStyleBackColor = true;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(375, 52);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(31, 13);
            this.label3.TabIndex = 9;
            this.label3.Text = "Sexo";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.rbtnMasculino);
            this.groupBox1.Controls.Add(this.rbtnFemenino);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.txtApellidos);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.txtNombres);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Controls.Add(this.dtpFechaIngreso);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Location = new System.Drawing.Point(33, 13);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(650, 100);
            this.groupBox1.TabIndex = 10;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Datos ";
            this.groupBox1.Enter += new System.EventHandler(this.groupBox1_Enter);
            // 
            // txtApellidos
            // 
            this.txtApellidos.Location = new System.Drawing.Point(101, 49);
            this.txtApellidos.Name = "txtApellidos";
            this.txtApellidos.Size = new System.Drawing.Size(213, 20);
            this.txtApellidos.TabIndex = 12;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(46, 52);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(49, 13);
            this.label4.TabIndex = 11;
            this.label4.Text = "Apellidos";
            // 
            // btnLimpiar
            // 
            this.btnLimpiar.Location = new System.Drawing.Point(712, 30);
            this.btnLimpiar.Name = "btnLimpiar";
            this.btnLimpiar.Size = new System.Drawing.Size(75, 23);
            this.btnLimpiar.TabIndex = 11;
            this.btnLimpiar.Text = "Limpiar";
            this.btnLimpiar.UseVisualStyleBackColor = true;
            // 
            // Nombres
            // 
            this.Nombres.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Nombres.DataPropertyName = "Nombres";
            this.Nombres.HeaderText = "Nombres";
            this.Nombres.Name = "Nombres";
            // 
            // Apellidos
            // 
            this.Apellidos.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Apellidos.DataPropertyName = "Apellidos";
            this.Apellidos.HeaderText = "Apellidos";
            this.Apellidos.Name = "Apellidos";
            // 
            // sexo
            // 
            this.sexo.DataPropertyName = "sexo";
            this.sexo.HeaderText = "Sexo";
            this.sexo.Name = "sexo";
            this.sexo.Width = 35;
            // 
            // Motivos
            // 
            this.Motivos.DataPropertyName = "Motivos";
            this.Motivos.HeaderText = "Motivos";
            this.Motivos.Name = "Motivos";
            // 
            // Habitacion
            // 
            this.Habitacion.DataPropertyName = "Habitacion";
            this.Habitacion.HeaderText = "Habitación";
            this.Habitacion.Name = "Habitacion";
            this.Habitacion.Width = 63;
            // 
            // Medico
            // 
            this.Medico.AutoSizeMode = System.Windows.Forms.DataGridViewAutoSizeColumnMode.Fill;
            this.Medico.DataPropertyName = "Medico";
            this.Medico.HeaderText = "Médico";
            this.Medico.Name = "Medico";
            // 
            // fecharegistro
            // 
            this.fecharegistro.DataPropertyName = "fecharegistro";
            this.fecharegistro.HeaderText = "Fecha Ingreso";
            this.fecharegistro.Name = "fecharegistro";
            // 
            // FechaAlta
            // 
            this.FechaAlta.DataPropertyName = "FechaAlta";
            this.FechaAlta.HeaderText = "Fecha Alta";
            this.FechaAlta.Name = "FechaAlta";
            this.FechaAlta.Width = 90;
            // 
            // DetallePacientes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(799, 412);
            this.Controls.Add(this.btnLimpiar);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.btnBuscar);
            this.Controls.Add(this.dgvDetallePaciente);
            this.Controls.Add(this.groupBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "DetallePacientes";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterParent;
            this.Text = "Pacientes";
            this.Load += new System.EventHandler(this.DetallePacientes_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvDetallePaciente)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dgvDetallePaciente;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txtNombres;
        private System.Windows.Forms.Button btnBuscar;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.DateTimePicker dtpFechaIngreso;
        private System.Windows.Forms.RadioButton rbtnMasculino;
        private System.Windows.Forms.RadioButton rbtnFemenino;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox txtApellidos;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btnLimpiar;
        private System.Windows.Forms.DataGridViewTextBoxColumn Nombres;
        private System.Windows.Forms.DataGridViewTextBoxColumn Apellidos;
        private System.Windows.Forms.DataGridViewTextBoxColumn sexo;
        private System.Windows.Forms.DataGridViewTextBoxColumn Motivos;
        private System.Windows.Forms.DataGridViewTextBoxColumn Habitacion;
        private System.Windows.Forms.DataGridViewTextBoxColumn Medico;
        private System.Windows.Forms.DataGridViewTextBoxColumn fecharegistro;
        private System.Windows.Forms.DataGridViewTextBoxColumn FechaAlta;
    }
}