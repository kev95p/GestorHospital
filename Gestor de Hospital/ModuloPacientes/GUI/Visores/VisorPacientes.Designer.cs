namespace ModuloPacientes.GUI.Visores
{
    partial class VisorPacientes
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
            this.splitContainer1 = new System.Windows.Forms.SplitContainer();
            this.crvPacientes = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel2.SuspendLayout();
            this.splitContainer1.SuspendLayout();
            this.SuspendLayout();
            // 
            // splitContainer1
            // 
            this.splitContainer1.Dock = System.Windows.Forms.DockStyle.Fill;
            this.splitContainer1.Location = new System.Drawing.Point(0, 0);
            this.splitContainer1.Name = "splitContainer1";
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.crvPacientes);
            this.splitContainer1.Size = new System.Drawing.Size(1256, 605);
            this.splitContainer1.SplitterDistance = 25;
            this.splitContainer1.TabIndex = 1;
            // 
            // crvPacientes
            // 
            this.crvPacientes.ActiveViewIndex = -1;
            this.crvPacientes.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.crvPacientes.Cursor = System.Windows.Forms.Cursors.Default;
            this.crvPacientes.Dock = System.Windows.Forms.DockStyle.Fill;
            this.crvPacientes.Location = new System.Drawing.Point(0, 0);
            this.crvPacientes.Name = "crvPacientes";
            this.crvPacientes.Size = new System.Drawing.Size(1227, 605);
            this.crvPacientes.TabIndex = 1;
            // 
            // VisorPacientes
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1256, 605);
            this.Controls.Add(this.splitContainer1);
            this.Name = "VisorPacientes";
            this.Text = "VisorPacientes";
            this.Load += new System.EventHandler(this.VisorPacientes_Load);
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private CrystalDecisions.Windows.Forms.CrystalReportViewer crvPacientes;
    }
}