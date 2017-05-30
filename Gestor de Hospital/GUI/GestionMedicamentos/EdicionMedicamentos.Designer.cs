namespace GUI.GestionMedicamentos
{
    partial class EdicionMedicamentos
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
            this.btnCancelar = new System.Windows.Forms.Button();
            this.label1 = new System.Windows.Forms.Label();
            this.txbIDMedicamento = new System.Windows.Forms.TextBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.cbxVia = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.txbPresentacion = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.txbConcentracion = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.txbNombreMedicamento = new System.Windows.Forms.TextBox();
            this.label2 = new System.Windows.Forms.Label();
            this.btnGuardar = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // btnCancelar
            // 
            this.btnCancelar.Location = new System.Drawing.Point(53, 217);
            this.btnCancelar.Name = "btnCancelar";
            this.btnCancelar.Size = new System.Drawing.Size(75, 23);
            this.btnCancelar.TabIndex = 0;
            this.btnCancelar.Text = "Cancelar";
            this.btnCancelar.UseVisualStyleBackColor = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(60, 32);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(21, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "ID ";
            // 
            // txbIDMedicamento
            // 
            this.txbIDMedicamento.Location = new System.Drawing.Point(88, 29);
            this.txbIDMedicamento.Name = "txbIDMedicamento";
            this.txbIDMedicamento.ReadOnly = true;
            this.txbIDMedicamento.Size = new System.Drawing.Size(63, 20);
            this.txbIDMedicamento.TabIndex = 2;
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.cbxVia);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.txbPresentacion);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.txbConcentracion);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.txbNombreMedicamento);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Controls.Add(this.txbIDMedicamento);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(26, 27);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(238, 175);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Datos del Medicamentos";
            // 
            // cbxVia
            // 
            this.cbxVia.FormattingEnabled = true;
            this.cbxVia.Location = new System.Drawing.Point(88, 133);
            this.cbxVia.Name = "cbxVia";
            this.cbxVia.Size = new System.Drawing.Size(131, 21);
            this.cbxVia.TabIndex = 10;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(60, 136);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(22, 13);
            this.label5.TabIndex = 9;
            this.label5.Text = "Via";
            // 
            // txbPresentacion
            // 
            this.txbPresentacion.Location = new System.Drawing.Point(88, 107);
            this.txbPresentacion.Name = "txbPresentacion";
            this.txbPresentacion.Size = new System.Drawing.Size(131, 20);
            this.txbPresentacion.TabIndex = 8;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(13, 110);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(69, 13);
            this.label4.TabIndex = 7;
            this.label4.Text = "Presentación";
            // 
            // txbConcentracion
            // 
            this.txbConcentracion.Location = new System.Drawing.Point(88, 81);
            this.txbConcentracion.Name = "txbConcentracion";
            this.txbConcentracion.Size = new System.Drawing.Size(131, 20);
            this.txbConcentracion.TabIndex = 6;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(6, 84);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(76, 13);
            this.label3.TabIndex = 5;
            this.label3.Text = "Concentración";
            // 
            // txbNombreMedicamento
            // 
            this.txbNombreMedicamento.Location = new System.Drawing.Point(88, 55);
            this.txbNombreMedicamento.Name = "txbNombreMedicamento";
            this.txbNombreMedicamento.Size = new System.Drawing.Size(131, 20);
            this.txbNombreMedicamento.TabIndex = 4;
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(37, 58);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(44, 13);
            this.label2.TabIndex = 3;
            this.label2.Text = "Nombre";
            // 
            // btnGuardar
            // 
            this.btnGuardar.Location = new System.Drawing.Point(160, 217);
            this.btnGuardar.Name = "btnGuardar";
            this.btnGuardar.Size = new System.Drawing.Size(75, 23);
            this.btnGuardar.TabIndex = 4;
            this.btnGuardar.Text = "Guardar";
            this.btnGuardar.UseVisualStyleBackColor = true;
            // 
            // EdicionMedicamentos
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(288, 261);
            this.Controls.Add(this.btnGuardar);
            this.Controls.Add(this.btnCancelar);
            this.Controls.Add(this.groupBox1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedToolWindow;
            this.Name = "EdicionMedicamentos";
            this.Text = "Edicion de Medicamentos";
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnCancelar;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.TextBox txbIDMedicamento;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox cbxVia;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.TextBox txbPresentacion;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox txbConcentracion;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox txbNombreMedicamento;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnGuardar;
    }
}