using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using MySql.Data.MySqlClient;

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for AgregarEquipoWindow.xaml
    /// </summary>
    public partial class AgregarEquipoWindow : Window
    {
        public AgregarEquipoWindow()
        {
            InitializeComponent();
            conexion_mysql.start_bd();

            //tipo de deporte
            MySqlCommand cmd = conexion_mysql.con_mysql.CreateCommand();
            cmd.CommandText = "SELECT nombre_entrenadores from entrenadores";
            MySqlDataReader r = cmd.ExecuteReader();
            while (r.Read())
            {
                cbo_entrenador.Items.Add(r.GetString(0));
            }
            conexion_mysql.terminal_bd();
            conexion_mysql.start_bd();
            //tipo arbitro
            MySqlCommand cmd2 = conexion_mysql.con_mysql.CreateCommand();
            cmd2.CommandText = "SELECT local_color_uniforme FROM uniforme;";
            MySqlDataReader r2 = cmd2.ExecuteReader();
            while (r2.Read())
            {
                cbo_color_uniforme_local.Items.Add(r2.GetString(0));
            }
            conexion_mysql.terminal_bd();
            conexion_mysql.start_bd ();

        }

        private void btn_cerrar_MouseEnter(object sender, MouseEventArgs e)
        {
            btn_cerrar.Content = "x";
        }

        private void btn_cerrar_MouseLeave(object sender, MouseEventArgs e)
        {
            btn_cerrar.Content = "";
        }

        private void btn_cerrar_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btn_minimizar_Click(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void btn_minimizar_MouseEnter(object sender, MouseEventArgs e)
        {
            btn_minimizar.Content = "_";
        }

        private void btn_minimizar_MouseLeave(object sender, MouseEventArgs e)
        {
            btn_minimizar.Content = "";
        }

        private void btn_regresar_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btn_cambiar_entrenador_Click(object sender, RoutedEventArgs e)
        {
            MostrarEntrenadoresWindow mostrar_entrenador = new MostrarEntrenadoresWindow();
            mostrar_entrenador.Show();
        }

        private void btn_guardar_Click(object sender, RoutedEventArgs e)
        {
            String nombre = txt_nombre.Text;
            String cjugadores = txt_cantidad_jugadores.Text;
            String color = cbo_color_uniforme_local.SelectedItem.ToString();
            String entre = cbo_entrenador.SelectedItem.ToString();

            if (nombre == "" || cjugadores == "" || color == "" || entre == "" )
            {
                MessageBox.Show("Debe llenar todos los datos");
            }
            else
            {
                try
                {
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = conexion_mysql.con_mysql;
                    cmd.CommandText = "ingresar_equipo";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                
                    cmd.Parameters.AddWithValue("nomeq", nombre).Direction = System.Data.ParameterDirection.Input;
                   
                    cmd.Parameters.AddWithValue("num_juga", cjugadores).Direction = System.Data.ParameterDirection.Input;

                    int entrenador = 0;
                    entrenador = cbo_entrenador.SelectedIndex;
                    entrenador++;
                    cmd.Parameters.AddWithValue("identre", entrenador).Direction = System.Data.ParameterDirection.Input;

                    int uni = 0;
                    uni =cbo_color_uniforme_local.SelectedIndex;
                    uni++;
                    cmd.Parameters.AddWithValue("unifor", uni).Direction = System.Data.ParameterDirection.Input;
            
                    int validar = cmd.ExecuteNonQuery();
              
                    if (validar>=1)
                    {
                        MessageBox.Show("Arbitro registrado exitosamente", "Registro");
                     
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
            }
        }
    }
}
