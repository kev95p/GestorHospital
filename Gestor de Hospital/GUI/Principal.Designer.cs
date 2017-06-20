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
            this.toolStripStatusLabel6 = new System.Windows.Forms.ToolStripStatusLabel();
            this.lblEmpleado = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel8 = new System.Windows.Forms.ToolStripStatusLabel();
            this.toolStripStatusLabel9 = new System.Windows.Forms.ToolStripStatusLabel();
            this.lblRol = new System.Windows.Forms.ToolStripStatusLabel();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.administracionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionesBasicasToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionRolesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionUsuariosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionDeHospitalToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.medicamentosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.enfermedadesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.empleadosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripSeparator1 = new System.Windows.Forms.ToolStripSeparator();
            this.cerrarSesionToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionPacientesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.pacientesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.verToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.reportesSobrePacientesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.reportesEnfermedadesToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.gestionIngresadosToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.buscarIngresadoToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.bwCheckConnection = new System.ComponentModel.BackgroundWorker();
            this.Intervalo = new System.Windows.Forms.Timer(this.components);
            this.statusStrip1.SuspendLayout();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // statusStrip1
            // 
            this.statusStrip1.AutoSize = false;
            this.statusStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.statusStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripStatusLabel1,
            this.lblStateImage,
            this.toolStripStatusLabel2,
            this.toolStripStatusLabel3,
            this.lblUsuario,
            this.toolStripStatusLabel5,
            this.toolStripStatusLabel4,
            this.lblmaquina,
            this.toolStripStatusLabel7,
            this.toolStripStatusLabel6,
            this.lblEmpleado,
            this.toolStripStatusLabel8,
            this.toolStripStatusLabel9,
            this.lblRol});
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
            this.lblStateImage.Size = new System.Drawing.Size(24, 25);
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
            this.toolStripStatusLabel3.Size = new System.Drawing.Size(80, 25);
            this.toolStripStatusLabel3.Text = "Usuario:";
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
            this.toolStripStatusLabel4.Size = new System.Drawing.Size(155, 25);
            this.toolStripStatusLabel4.Text = "Estacion  de Trabajo:";
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
            // toolStripStatusLabel6
            // 
            this.toolStripStatusLabel6.Name = "toolStripStatusLabel6";
            this.toolStripStatusLabel6.Size = new System.Drawing.Size(60, 25);
            this.toolStripStatusLabel6.Text = "Empleado";
            // 
            // lblEmpleado
            // 
            this.lblEmpleado.Name = "lblEmpleado";
            this.lblEmpleado.Size = new System.Drawing.Size(43, 25);
            this.lblEmpleado.Text = "Admin";
            // 
            // toolStripStatusLabel8
            // 
            this.toolStripStatusLabel8.Name = "toolStripStatusLabel8";
            this.toolStripStatusLabel8.Size = new System.Drawing.Size(10, 25);
            this.toolStripStatusLabel8.Text = "|";
            // 
            // toolStripStatusLabel9
            // 
            this.toolStripStatusLabel9.Name = "toolStripStatusLabel9";
            this.toolStripStatusLabel9.Size = new System.Drawing.Size(27, 25);
            this.toolStripStatusLabel9.Text = "Rol:";
            // 
            // lblRol
            // 
            this.lblRol.Name = "lblRol";
            this.lblRol.Size = new System.Drawing.Size(49, 25);
            this.lblRol.Text = "nombre";
            // 
            // menuStrip1
            // 
            this.menuStrip1.Font = new System.Drawing.Font("Segoe UI Semibold", 9.75F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(24, 24);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.administracionToolStripMenuItem,
            this.gestionPacientesToolStripMenuItem,
            this.gestionIngresadosToolStripMenuItem,
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
            this.gestionDeHospitalToolStripMenuItem,
            this.empleadosToolStripMenuItem,
            this.toolStripSeparator1,
            this.cerrarSesionToolStripMenuItem});
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
            this.gestionesBasicasToolStripMenuItem.Size = new System.Drawing.Size(195, 22);
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
            // gestionDeHospitalToolStripMenuItem
            // 
            this.gestionDeHospitalToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.medicamentosToolStripMenuItem,
            this.enfermedadesToolStripMenuItem});
            this.gestionDeHospitalToolStripMenuItem.Name = "gestionDeHospitalToolStripMenuItem";
            this.gestionDeHospitalToolStripMenuItem.Size = new System.Drawing.Size(195, 22);
            this.gestionDeHospitalToolStripMenuItem.Text = "Gestion de Hospital";
            // 
            // medicamentosToolStripMenuItem
            // 
            this.medicamentosToolStripMenuItem.Name = "medicamentosToolStripMenuItem";
            this.medicamentosToolStripMenuItem.Size = new System.Drawing.Size(165, 22);
            this.medicamentosToolStripMenuItem.Text = "Medicamentos";
            this.medicamentosToolStripMenuItem.Click += new System.EventHandler(this.medicamentosToolStripMenuItem_Click);
            // 
            // enfermedadesToolStripMenuItem
            // 
            this.enfermedadesToolStripMenuItem.Name = "enfermedadesToolStripMenuItem";
            this.enfermedadesToolStripMenuItem.Size = new System.Drawing.Size(165, 22);
            this.enfermedadesToolStripMenuItem.Text = "Enfermedades";
            this.enfermedadesToolStripMenuItem.Click += new System.EventHandler(this.enfermedadesToolStripMenuItem_Click);
            // 
            // empleadosToolStripMenuItem
            // 
            this.empleadosToolStripMenuItem.Name = "empleadosToolStripMenuItem";
            this.empleadosToolStripMenuItem.Size = new System.Drawing.Size(195, 22);
            this.empleadosToolStripMenuItem.Text = "Empleados";
            this.empleadosToolStripMenuItem.Click += new System.EventHandler(this.EmpleadosToolStripMenuItem_Click);
            // 
            // toolStripSeparator1
            // 
            this.toolStripSeparator1.Name = "toolStripSeparator1";
            this.toolStripSeparator1.Size = new System.Drawing.Size(192, 6);
            // 
            // cerrarSesionToolStripMenuItem
            // 
            this.cerrarSesionToolStripMenuItem.Name = "cerrarSesionToolStripMenuItem";
            this.cerrarSesionToolStripMenuItem.Size = new System.Drawing.Size(195, 22);
            this.cerrarSesionToolStripMenuItem.Text = "Cerrar Sesion";
            this.cerrarSesionToolStripMenuItem.Click += new System.EventHandler(this.cerrarSesionToolStripMenuItem_Click);
            // 
            // gestionPacientesToolStripMenuItem
            // 
            this.gestionPacientesToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.pacientesToolStripMenuItem});
            this.gestionPacientesToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("gestionPacientesToolStripMenuItem.Image")));
            this.gestionPacientesToolStripMenuItem.Name = "gestionPacientesToolStripMenuItem";
            this.gestionPacientesToolStripMenuItem.Size = new System.Drawing.Size(151, 28);
            this.gestionPacientesToolStripMenuItem.Text = "Gestion Pacientes";
            // 
            // pacientesToolStripMenuItem
            // 
            this.pacientesToolStripMenuItem.Name = "pacientesToolStripMenuItem";
            this.pacientesToolStripMenuItem.Size = new System.Drawing.Size(133, 22);
            this.pacientesToolStripMenuItem.Text = "Pacientes";
            this.pacientesToolStripMenuItem.Click += new System.EventHandler(this.pacientesToolStripMenuItem_Click_1);
            // 
            // verToolStripMenuItem
            // 
            this.verToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.reportesSobrePacientesToolStripMenuItem,
            this.reportesEnfermedadesToolStripMenuItem});
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
            this.reportesSobrePacientesToolStripMenuItem.Click += new System.EventHandler(this.reportesSobrePacientesToolStripMenuItem_Click);
            // 
            // reportesEnfermedadesToolStripMenuItem
            // 
            this.reportesEnfermedadesToolStripMenuItem.Name = "reportesEnfermedadesToolStripMenuItem";
            this.reportesEnfermedadesToolStripMenuItem.Size = new System.Drawing.Size(230, 22);
            this.reportesEnfermedadesToolStripMenuItem.Text = "Reportes Enfermedades";
            this.reportesEnfermedadesToolStripMenuItem.Click += new System.EventHandler(this.reportesEnfermedadesToolStripMenuItem_Click);
            // 
            // gestionIngresadosToolStripMenuItem
            // 
            this.gestionIngresadosToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.buscarIngresadoToolStripMenuItem});
            this.gestionIngresadosToolStripMenuItem.Image = ((System.Drawing.Image)(resources.GetObject("gestionIngresadosToolStripMenuItem.Image")));
            this.gestionIngresadosToolStripMenuItem.Name = "gestionIngresadosToolStripMenuItem";
            this.gestionIngresadosToolStripMenuItem.Size = new System.Drawing.Size(161, 28);
            this.gestionIngresadosToolStripMenuItem.Text = "Gestion Ingresados";
            // 
            // buscarIngresadoToolStripMenuItem
            // 
            this.buscarIngresadoToolStripMenuItem.Name = "buscarIngresadoToolStripMenuItem";
            this.buscarIngresadoToolStripMenuItem.Size = new System.Drawing.Size(181, 22);
            this.buscarIngresadoToolStripMenuItem.Text = "Buscar Ingresado";
            this.buscarIngresadoToolStripMenuItem.Click += new System.EventHandler(this.buscarIngresadoToolStripMenuItem_Click);
            // 
            // Intervalo
            // 
            this.Intervalo.Interval = 1000;
            this.Intervalo.Tick += new System.EventHandler(this.Intervalo_Tick);
            // 
            // Principal
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(1140, 565);
            this.Controls.Add(this.statusStrip1);
            this.Controls.Add(this.menuStrip1);
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
        private System.Windows.Forms.ToolStripMenuItem pacientesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem reportesSobrePacientesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gestionIngresadosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem buscarIngresadoToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem cerrarSesionToolStripMenuItem;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel6;
        private System.Windows.Forms.ToolStripStatusLabel lblEmpleado;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel8;
        private System.Windows.Forms.ToolStripStatusLabel toolStripStatusLabel9;
        private System.Windows.Forms.ToolStripStatusLabel lblRol;
        private System.Windows.Forms.ToolStripMenuItem reportesEnfermedadesToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem gestionDeHospitalToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem medicamentosToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem enfermedadesToolStripMenuItem;
    }
}