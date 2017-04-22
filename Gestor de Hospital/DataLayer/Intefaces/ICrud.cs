using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Intefaces
{
    public interface ICrud<T>
    {
        int Insert(T obj);
        int Update(T obj);
        int Delete(T obj);
        DataSet Select(T obj);
    }
}
