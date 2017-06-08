namespace GUI
{
    partial class Principal
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Principal));
            this.statusStrip1 = new System.Windows.Forms.StatusStrip();
            this.toolStripStatusLabel1 = new System.Windows.Forms.ToolStripStatusLabel();
            this.lblStateImage = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel2 = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel3 = new System.Windows.Forms.ToolStripStatusLabel();
            this.lblUsuario = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel5 = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel4 = new System.Windows.Forms.ToolStripStatusLabel();
            this.lblmaquina = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel7 = new System.Windows.Forms.ToolStripStatusLabel();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.administracionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionesBasicasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionRolesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionUsuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.empleadosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.preferenciasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionPacientesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.pacientesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.consultasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.citasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.verToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.reportesSobrePacientesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.bwCheckConnection = new System.ComponentModel.BackgroundWorker();
            this.Intervalo = new System.Windows.Forms.Timer(this.components);
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.statusStrip1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // statusStrip1
            // 
            this.statusStrip1.AutoSize = false;
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1,
            this.lblStateImage,
            this.toolStripStatusLabel2,
            this.toolStripStatusLabel3,
            this.lblUsuario,
            this.toolStripStatusLabel5,
            this.toolStripStatusLabel4,
            this.lblmaquina,
            this.toolStripStatusLabel7});
            this.statusStrip1.Location = new System.Drawing.Point(0, 535);
            this.statusStrip1.Name = "statusStrip1";
            this.statusStrip1.Size = new System.Drawing.Size(1140, 30);
            this.statusStrip1.TabIndex = 1;
            this.statusStrip1.Text = "statusStrip1";
            this.statusStrip1.ItemClicked += new System.Windows.Forms.ToolStripItemClickedEventHandler(this.statusStrip1_ItemClicked);
            // 
            // toolStripStatusLabel1
            // 
            this.toolStripStatusLabel1.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.toolStripStatusLabel1.Name = "toolStripStatusLabel1";
            this.toolStripStatusLabel1.Size = new System.Drawing.Size(48, 25);
            this.toolStripStatusLabel1.Text = "Estado";
            // 
            // lblStateImage
            // 
            this.lblStateImage.DisplayStyle = System.Windows.Forms.ToolStripItemDisplayStyle.Image;
            this.lblStateImage.ForeColor = System.Drawing.Color.Coral;
            this.lblStateImage.Image = global::GUI.Properties.Resources.connected;
            this.lblStateImage.Name = "lblStateImage";
            this.lblStateImage.Size = new System.Drawing.Size(16, 25);
            this.lblStateImage.Text = "toolStripStatusLabel1";
            // 
            // toolStripStatusLabel2
            // 
            this.toolStripStatusLabel2.Name = "toolStripStatusLabel2";
            this.toolStripStatusLabel2.Size = new System.Drawing.Size(10, 25);
            this.toolStripStatusLabel2.Text = "|";
            // 
            // toolStripStatusLabel3
            // 
            this.toolStripStatusLabel3.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.toolStripStatusLabel3.Image = ((System.Drawing.Image)(resources.GetObject("toolStripStatusLabel3.Image")));
            this.toolStripStatusLabel3.Name = "toolStripStatusLabel3";
            this.toolStripStatusLabel3.Size = new System.Drawing.Size(73, 25);
            this.toolStripStatusLabel3.Text = "Usuario ";
            // 
            // lblUsuario
            // 
            this.lblUsuario.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblUsuario.Name = "lblUsuario";
            this.lblUsuario.Size = new System.Drawing.Size(54, 25);
            this.lblUsuario.Text = "nombre";
            this.lblUsuario.Click += new System.EventHandler(this.lblUsuario_Click);
            // 
            // toolStripStatusLabel5
            // 
            this.toolStripStatusLabel5.Name = "toolStripStatusLabel5";
            this.toolStripStatusLabel5.Size = new System.Drawing.Size(10, 25);
            this.toolStripStatusLabel5.Text = "|";
            // 
            // toolStripStatusLabel4
            // 
            this.toolStripStatusLabel4.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.toolStripStatusLabel4.Image = ((System.Drawing.Image)(resources.GetObject("toolStripStatusLabel4.Image")));
            this.toolStripStatusLabel4.ImageScaling = System.Windows.Forms.ToolStripItemImageScaling.None;
            this.toolStripStatusLabel4.Name = "toolStripStatusLabel4";
            this.toolStripStatusLabel4.Size = new System.Drawing.Size(152, 25);
            this.toolStripStatusLabel4.Text = "Estacion  de Trabajo";
            this.toolStripStatusLabel4.Click += new System.EventHandler(this.toolStripStatusLabel4_Click_1);
            // 
            // lblmaquina
            // 
            this.lblmaquina.Font = new System.Drawing.Font("Segoe UI", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblmaquina.Name = "lblmaquina";
            this.lblmaquina.Size = new System.Drawing.Size(58, 25);
            this.lblmaquina.Text = "maquina";
            this.lblmaquina.Click += new System.EventHandler(this.toolStripStatusLabel4_Click);
            // 
            // toolStripStatusLabel7
            // 
            this.toolStripStatusLabel7.Name = "toolStripStatusLabel7";
            this.toolStripStatusLabel7.Size = new System.Drawing.Size(10, 25);
            this.toolStripStatusLabel7.Text = "|";
            // 
            // menuStrip1
            // 
            this.menuStrip1.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.administracionToolStripMenuItem,
            this.gestionPacientesToolStripMenuItem,
            this.verToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1140, 32);
            this.menuStrip1.TabIndex = 2;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // administracionToolStripMenuItem
            // 
            this.administracionToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.gestionesBasicasToolStripMenuItem,
            this.empleadosToolStripMenuItem,
            this.toolStripSeparator1,
            this.preferenciasToolStripMenuItem});
            this.administracionToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("administracionToolStripMenuItem.Image")));
            this.administracionToolStripMenuItem.Name = "administracionToolStripMenuItem";
            this.administracionToolStripMenuItem.Size = new System.Drawing.Size(135, 28);
            this.administracionToolStripMenuItem.Text = "Administracion";
            // 
            // gestionesBasicasToolStripMenuItem
            // 
            this.gestionesBasicasToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.gestionRolesToolStripMenuItem,
            this.gestionUsuariosToolStripMenuItem});
            this.gestionesBasicasToolStripMenuItem.Name = "gestionesBasicasToolStripMenuItem";
            this.gestionesBasicasToolStripMenuItem.Size = new System.Drawing.Size(182, 22);
            this.gestionesBasicasToolStripMenuItem.Text = "Gestiones Basicas";
            // 
            // gestionRolesToolStripMenuItem
            // 
            this.gestionRolesToolStripMenuItem.Name = "gestionRolesToolStripMenuItem";
            this.gestionRolesToolStripMenuItem.Size = new System.Drawing.Size(178, 22);
            this.gestionRolesToolStripMenuItem.Text = "Gestion Roles";
            this.gestionRolesToolStripMenuItem.Click += new System.EventHandler(this.gestionRolesToolStripMenuItem_Click);
            // 
            // gestionUsuariosToolStripMenuItem
            // 
            this.gestionUsuariosToolStripMenuItem.Name = "gestionUsuariosToolStripMenuItem";
            this.gestionUsuariosToolStripMenuItem.Size = new System.Drawing.Size(178, 22);
            this.gestionUsuariosToolStripMenuItem.Text = "Gestion Usuarios";
            this.gestionUsuariosToolStripMenuItem.Click += new System.EventHandler(this.gestionUsuariosToolStripMenuItem_Click);
            // 
            // empleadosToolStripMenuItem
            // 
            this.empleadosToolStripMenuItem.Name = "empleadosToolStripMenuItem";
            this.empleadosToolStripMenuItem.Size = new System.Drawing.Size(182, 22);
            this.empleadosToolStripMenuItem.Text = "Empleados";
            this.empleadosToolStripMenuItem.Click += new System.EventHandler(this.EmpleadosToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(179, 6);
            // 
            // preferenciasToolStripMenuItem
            // 
            this.preferenciasToolStripMenuItem.Name = "preferenciasToolStripMenuItem";
            this.preferenciasToolStripMenuItem.Size = new System.Drawing.Size(182, 22);
            this.preferenciasToolStripMenuItem.Text = "Preferencias";
            // 
            // gestionPacientesToolStripMenuItem
            // 
            this.gestionPacientesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.pacientesToolStripMenuItem,
            this.consultasToolStripMenuItem,
            this.citasToolStripMenuItem});
            this.gestionPacientesToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("gestionPacientesToolStripMenuItem.Image")));
            this.gestionPacientesToolStripMenuItem.Name = "gestionPacientesToolStripMenuItem";
            this.gestionPacientesToolStripMenuItem.Size = new System.Drawing.Size(151, 28);
            this.gestionPacientesToolStripMenuItem.Text = "Gestion Pacientes";
            // 
            // pacientesToolStripMenuItem
            // 
            this.pacientesToolStripMenuItem.Name = "pacientesToolStripMenuItem";
            this.pacientesToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.pacientesToolStripMenuItem.Text = "Pacientes";
            this.pacientesToolStripMenuItem.Click += new System.EventHandler(this.pacientesToolStripMenuItem_Click_1);
            // 
            // consultasToolStripMenuItem
            // 
            this.consultasToolStripMenuItem.Name = "consultasToolStripMenuItem";
            this.consultasToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.consultasToolStripMenuItem.Text = "Consultas";
            // 
            // citasToolStripMenuItem
            // 
            this.citasToolStripMenuItem.Name = "citasToolStripMenuItem";
            this.citasToolStripMenuItem.Size = new System.Drawing.Size(152, 22);
            this.citasToolStripMenuItem.Text = "Citas";
            // 
            // verToolStripMenuItem
            // 
            this.verToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.reportesSobrePacientesToolStripMenuItem});
            this.verToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("verToolStripMenuItem.Image")));
            this.verToolStripMenuItem.Name = "verToolStripMenuItem";
            this.verToolStripMenuItem.Size = new System.Drawing.Size(98, 28);
            this.verToolStripMenuItem.Text = "Reportes";
            // 
            // reportesSobrePacientesToolStripMenuItem
            // 
            this.reportesSobrePacientesToolStripMenuItem.Name = "reportesSobrePacientesToolStripMenuItem";
            this.reportesSobrePacientesToolStripMenuItem.Size = new System.Drawing.Size(230, 22);
            this.reportesSobrePacientesToolStripMenuItem.Text = "Reportes Sobre Pacientes";
            // 
            // Intervalo
            // 
            this.Intervalo.Interval = 1000;
            this.Intervalo.Tick += new System.EventHandler(this.Intervalo_Tick);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(0, 0);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(1140, 565);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox1.TabIndex = 4;
            this.pictureBox1.TabStop = false;
            // 
            // Principal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1140, 565);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.menuStrip1);
            this.Controls.Add(this.pictureBox1);
            this.DoubleBuffered = true;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.IsMdiContainer = true;
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Principal";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Sistema de Gestion de Hospital";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.Principal_Load);
            this.statusStrip1.ResumeLayout(false);
            this.statusStrip1.PerformLayout();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.StatusStrip statusStrip1;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem administracionToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem verToolStripMenuItem;
        private volatile System.Windows.Forms.ToolStripStatusLabel lblStateImage;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel1;
        private System.ComponentModel.BackgroundWorker bwCheckConnection;
        private System.Windows.Forms.ToolStripSeparator toolStripSeparator1;
        private System.Windows.Forms.ToolStripMenuItem preferenciasToolStripMenuItem;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel2;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel3;
        private System.Windows.Forms.ToolStripStatusLabel lblUsuario;
        private System.Windows.Forms.ToolStripMenuItem empleadosToolStripMenuItem;
        private System.Windows.Forms.Timer Intervalo;
        private System.Windows.Forms.ToolStripMenuItem gestionesBasicasToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gestionRolesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gestionUsuariosToolStripMenuItem;
        private System.Windows.Forms.ToolStripStatusLabel lblmaquina;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel5;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel7;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel4;
        private System.Windows.Forms.ToolStripMenuItem gestionPacientesToolStripMenuItem;
        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.ToolStripMenuItem pacientesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem consultasToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem citasToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem reportesSobrePacientesToolStripMenuItem;
    }
}