using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using System.Data;


namespace WpfApp1
{
    class conexion_mysql
    {
        
        public static MySqlConnection con_mysql = null;       // variable de conexion
        
        public static string resultado = "";


        public static String ipp, userr, passs;

        public static void inicia_bd(String ip, String user, String pass)
        {
            ipp = ip;
            userr = user;
            passs = pass;
            try
            {
                IPWindow conf = new IPWindow();
                MySqlConnectionStringBuilder constructor = new MySqlConnectionStringBuilder();
                constructor.Server = "10.1.65.31";
                constructor.UserID = "root";
                constructor.Password = "159515";
                constructor.Database = "p_polideportivo";
                constructor.SslMode = MySqlSslMode.None;                    // evitar la conexion por medio de SSL
                String conexion_estable = constructor.ToString();           // se obtiene el contenido del constructor a una cadena
                constructor = null;                                         // se limpia el constructor
                con_mysql = new MySqlConnection(conexion_estable);          // Se realiza una conexion estable con la base de datos.

                con_mysql.Open();
                Console.Write("Conexion realizada Exitosamente");           //Conexion a la base de datos realizada
            }
            catch (Exception ex) {

                Console.WriteLine(ex);
            }
        }
        public static void start_bd()
        {
            con_mysql.Open();       // inicia una conexion a la base de datos. 
        }
        public static void terminal_bd()
        {
            con_mysql.Close();      // cierra la conexion a la base de datos.
        }

    }
}
