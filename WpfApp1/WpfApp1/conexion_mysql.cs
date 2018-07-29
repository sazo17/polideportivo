using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

//------------------
using System.Data;
using MySql.Data.MySqlClient;


namespace WpfApp1
{
    class conexion_mysql
    {
        public static MySqlConnection con_mysql = null;       // variable de conexion
        public const String servidor = "localhost";    // ubicacion|ip del servidor
        public const String base_datos = "p_polideportivo";     // id|nombre de la base de datos
        public const String usuario = "root";              // usuario dentro de la base de datos
        public const String pass = "";                 // contrasenia del usuario




        public static void inicia_bd()
        {
            try
            {
                MySqlConnectionStringBuilder constructor = new MySqlConnectionStringBuilder();
                constructor.Server = servidor;
                constructor.UserID = usuario;
                constructor.Password = pass;
                constructor.Database = base_datos;
                constructor.SslMode = MySqlSslMode.None;                    // evitar la conexion por medio de SSL
                String conexion_estable = constructor.ToString();           // se obtiene el contenido del constructor a una cadena
                constructor = null;                                         // se limpia el constructor
                // Console.WriteLine(conexion_estable);
                con_mysql = new MySqlConnection(conexion_estable);          // Se realiza una conexion estable con la base de datos.

                con_mysql.Open();
                Console.Write("Conexion realizada Exitosamente");
            }
            catch (Exception ex) {

                Console.WriteLine(ex);
            }
        }
        public void start_bd()
        {
            con_mysql.Open();       // inicia una conexion a la base de datos. 
        }
        public void terminal_bd()
        {
            con_mysql.Close();      // cierra la conexion a la base de datos.
        }
        public void prueba(string a, int b)
        {
            // prueba unicamente con fines de test de la conexion. Puede ser borrada
            string query = "insert into campos (campo, idTipos_Deporte) values ('" + a + "', '" + b + "')";

            MySqlCommand cmd = new MySqlCommand(query, con_mysql);
            cmd.ExecuteNonQuery();
            Console.WriteLine("listo");
        }
    }
}
