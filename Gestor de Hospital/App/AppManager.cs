using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App
{
    class AppManager : System.Windows.Forms.ApplicationContext 
    {
        private GUI.Principal principal = new GUI.Principal();
        private GUI.Login login = new GUI.Login();

        public AppManager()
        {
            if (Splash())
            {
                Login();
            }
        }

        private bool Splash()
        {
            bool flag = true;
            GUI.Splash frm = new GUI.Splash();
            frm.ShowDialog();
            return flag;
        }

        private void Login()
        {         
            MainForm = login;
            MainForm.Show();
        }

        protected override void OnMainFormClosed(object sender,EventArgs e){

            if (login.verificado)
            {
                login.verificado = false;
                MainForm = principal;
                MainForm.Show();
            }
            else
            {
               base.OnMainFormClosed(sender, e);
            }
           
        }

        
    }
}
