﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer
{
    public static class Operaciones
    {
        public static DataSet OBTENER_USUARIO(string usuario,string clave)
        {
            try
            {
                Conexion con = Conexion.getInstance;
                DataSet datos = new DataSet();
                string sentencia = @"SELECT usuario
                FROM usuarios WHERE clave=md5('" + clave + "') AND usuario = '" + usuario + "'";
                datos = con.Consulta(sentencia);
                return datos;

            }
            catch
            {

                return new DataSet();
            }
        }
    }
}