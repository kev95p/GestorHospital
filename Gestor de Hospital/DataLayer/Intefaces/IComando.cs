using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Intefaces
{
    public interface IComando
    {
        string CommandText { get; set; }
        string StoredProcerudeName { get; set; }
        List<MySqlParameter> SqlParams { get; set; }
        int Execute();
        DataSet Select();
    }
}
