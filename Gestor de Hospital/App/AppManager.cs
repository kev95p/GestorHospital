using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace App
{
    class AppManager : System.Windows.Forms.ApplicationContext 
    {
        public AppManager()
        {
            if (Splash())
            {
                if (Login())
                {
                    MainForms.Principal frm = new MainForms.Principal();
                    frm.Show();
                }
            }
        }

        private bool Splash()
        {
            bool flag = true;
            MainForms.Splash frm = new MainForms.Splash();
            frm.ShowDialog();
            return flag;
        }

        private bool Login()
        {
            bool verficado = false;
            MainForms.Login frm = new MainForms.Login();
            frm.ShowDialog();
            verficado = frm.verificado;
            return verficado;
        }
    }
}
