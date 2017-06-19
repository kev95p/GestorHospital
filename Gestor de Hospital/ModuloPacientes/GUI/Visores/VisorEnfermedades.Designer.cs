namespace ModuloPacientes.GUI.Visores
{
    partial class VisorEnfermedades
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
            this.crwEnfermedades = new CrystalDecisions.Windows.Forms.CrystalReportViewer();
            this.cbEnfermedades = new System.Windows.Forms.ComboBox();
            this.label1 = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).BeginInit();
            this.splitContainer1.Panel1.SuspendLayout();
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
            // splitContainer1.Panel1
            // 
            this.splitContainer1.Panel1.Controls.Add(this.button1);
            this.splitContainer1.Panel1.Controls.Add(this.label1);
            this.splitContainer1.Panel1.Controls.Add(this.cbEnfermedades);
            this.splitContainer1.Panel1.Paint += new System.Windows.Forms.PaintEventHandler(this.splitContainer1_Panel1_Paint);
            // 
            // splitContainer1.Panel2
            // 
            this.splitContainer1.Panel2.Controls.Add(this.crwEnfermedades);
            this.splitContainer1.Size = new System.Drawing.Size(1192, 568);
            this.splitContainer1.SplitterDistance = 297;
            this.splitContainer1.TabIndex = 0;
            // 
            // crwEnfermedades
            // 
            this.crwEnfermedades.ActiveViewIndex = -1;
            this.crwEnfermedades.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.crwEnfermedades.Cursor = System.Windows.Forms.Cursors.Default;
            this.crwEnfermedades.Dock = System.Windows.Forms.DockStyle.Fill;
            this.crwEnfermedades.Location = new System.Drawing.Point(0, 0);
            this.crwEnfermedades.Name = "crwEnfermedades";
            this.crwEnfermedades.Size = new System.Drawing.Size(891, 568);
            this.crwEnfermedades.TabIndex = 0;
            // 
            // cbEnfermedades
            // 
            this.cbEnfermedades.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbEnfermedades.FormattingEnabled = true;
            this.cbEnfermedades.Location = new System.Drawing.Point(39, 162);
            this.cbEnfermedades.Name = "cbEnfermedades";
            this.cbEnfermedades.Size = new System.Drawing.Size(148, 21);
            this.cbEnfermedades.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(39, 143);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = "Enfermedades";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(42, 210);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(75, 23);
            this.button1.TabIndex = 2;
            this.button1.Text = "Generar";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // VisorEnfermedades
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1192, 568);
            this.Controls.Add(this.splitContainer1);
            this.Name = "VisorEnfermedades";
            this.Text = "VisorEnfermedades";
            this.Load += new System.EventHandler(this.VisorEnfermedades_Load);
            this.splitContainer1.Panel1.ResumeLayout(false);
            this.splitContainer1.Panel1.PerformLayout();
            this.splitContainer1.Panel2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.splitContainer1)).EndInit();
            this.splitContainer1.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.SplitContainer splitContainer1;
        private CrystalDecisions.Windows.Forms.CrystalReportViewer crwEnfermedades;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox cbEnfermedades;
        private System.Windows.Forms.Button button1;
    }
}