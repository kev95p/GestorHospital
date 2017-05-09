using DataLayer.Intefaces;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CRUDManager
{
    public class OperacionesCrud : ICrud<IComando>
    {
        public int Insert(IComando obj)
        {
            
            return obj.Execute();
        }

        public int Update(IComando obj)
        {
            return obj.Execute();
        }

        public int Delete(IComando obj)
        {
            return obj.Execute();
        }

        public DataSet Select(IComando obj)
        {
            return obj.Select();
        }
    }
}
