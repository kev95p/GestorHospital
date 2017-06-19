using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App
{
    class AppManager : System.Windows.Forms.ApplicationContext 
    {
        private GUI.Principal principal;
        private GUI.Login login;

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

        public void Login()
        {
            if(principal != null)
            {
                principal.cerrarsesion = false;
            }
            login = new GUI.Login();
            MainForm = login;
            MainForm.Show();
        }

        protected override void OnMainFormClosed(object sender,EventArgs e){

            if (login.verificado)
            {
                login.verificado = false;
                principal = new GUI.Principal();
                MainForm = principal;
                MainForm.Show();

            }
            else
            {
                if (principal != null)
                {
                    if (principal.cerrarsesion)
                    {
                        Login();
                    }
                    else
                    {
                        base.OnMainFormClosed(sender, e);
                    }
                }else
                {
                    base.OnMainFormClosed(sender, e);
                }

               
            }
           
        }

        
    }
}
