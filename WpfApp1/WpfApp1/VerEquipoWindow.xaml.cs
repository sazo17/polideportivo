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
    /// Interaction logic for VerEquipoWindow.xaml
    /// </summary>
    public partial class VerEquipoWindow : Window
    {

        public String idequipo;
        public int idint;
        public VerEquipoWindow( String idqu)
        {
            InitializeComponent();
            idequipo = idqu;
           
            try
            {
                //COMBOBOX ENTRENADOR
                conexion_mysql.terminal_bd();
                conexion_mysql.start_bd();
                MySqlCommand nombrearbitro = conexion_mysql.con_mysql.CreateCommand();
                nombrearbitro.Connection = conexion_mysql.con_mysql;
                nombrearbitro.CommandText = "SELECT nombre_entrenadores FROM entrenadores;";
                MySqlDataReader r1 = nombrearbitro.ExecuteReader();
                while (r1.Read())
                {
                    cbo_entrenador.Items.Add(r1.GetString(0));
                }
                //COMBOBOX UNIFORME
                conexion_mysql.terminal_bd();
                conexion_mysql.start_bd();
                MySqlCommand coloruniforme = conexion_mysql.con_mysql.CreateCommand();
                coloruniforme.Connection = conexion_mysql.con_mysql;
                coloruniforme.CommandText = "SELECT local_color_uniforme FROM uniforme;";
                MySqlDataReader r3 = coloruniforme.ExecuteReader();
                while (r3.Read())
                {
                    cbo_uniforme.Items.Add(r3.GetString(0));
                }
                conexion_mysql.terminal_bd();
                conexion_mysql.start_bd();
                MySqlCommand Entrenador = conexion_mysql.con_mysql.CreateCommand();
                Entrenador.Connection = conexion_mysql.con_mysql;
                Entrenador.CommandText = "Select * from equipos where idequipos = @idequipo";
                Entrenador.Parameters.AddWithValue("@idequipo", idequipo);
                MySqlDataReader r2 = Entrenador.ExecuteReader();

                r2.Read();
                txt_nombre.Text = r2.GetString(1);
                text_cjugadores.Text = r2.GetString(2);
                cbo_entrenador.SelectedIndex = r2.GetInt32(3) - 1;                
                cbo_uniforme.SelectedIndex = r2.GetInt32(4) - 1;
  
            }

            catch (Exception ex)
            {
                MessageBox.Show(ex.ToString());
            }

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

      

        private void btn_agregar_jugador_Click(object sender, RoutedEventArgs e)
        {
            MostrarJugadoresWindow mostrar_jugadores = new MostrarJugadoresWindow();
            mostrar_jugadores.Show();
        }

        private void btn_ver_jugador_Click(object sender, RoutedEventArgs e)
        {
            VerJugadorWindow ver_jugador = new VerJugadorWindow();
            ver_jugador.Show();
        }

        private void btn_cambiar_entrenador_Click(object sender, RoutedEventArgs e)
        {
            MostrarEntrenadoresWindow mostrar_entrenador = new MostrarEntrenadoresWindow();
            mostrar_entrenador.Show();
        }

        private void btn_modificar_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult aceptar = MessageBox.Show("Esta seguro de Modificar el Equipo?", "Modificar Equipo", MessageBoxButton.YesNo);
            if (aceptar == MessageBoxResult.Yes)
            {
                String nombre = txt_nombre.Text;
                String cjugadores = text_cjugadores.Text;
                int uniforme = cbo_uniforme.SelectedIndex;
                uniforme++;
                int entrenador = cbo_entrenador.SelectedIndex;
                entrenador++;

                if (nombre == "" || cjugadores == "")
                {
                    MessageBox.Show("Debe llenar todos los campos");
                }
                else
                {
                    try
                    {
                        idint = Int32.Parse(idequipo);
                        //ACTUALIZANDO EQUIPO
                        conexion_mysql.terminal_bd();
                        conexion_mysql.start_bd();
                        MySqlCommand EQUIPO = conexion_mysql.con_mysql.CreateCommand();
                        EQUIPO.Connection = conexion_mysql.con_mysql;
                        EQUIPO.CommandText = "UPDATE equipos SET idequipos= @idEquipos, nombre_equipo=@nombre, cantidad_jugadores_equipo=@cantJ, identrenador =@idEnt,"+
                            "uniforme_idUniforme=@uniforme WHERE idequipos= @idWhere";
                        EQUIPO.Parameters.AddWithValue("@idEquipos", idint);
                        EQUIPO.Parameters.AddWithValue("@nombre", nombre);
                        EQUIPO.Parameters.AddWithValue("@cantJ", cjugadores);
                        EQUIPO.Parameters.AddWithValue("@idEnt", entrenador);
                        EQUIPO.Parameters.AddWithValue("@uniforme", uniforme);
                        EQUIPO.Parameters.AddWithValue("@idWhere", idint);
                        int revisar = EQUIPO.ExecuteNonQuery();

                        if (revisar >=1)
                        {
                            MessageBox.Show("Equipo modificado exitosamente", "Equipo", MessageBoxButton.OK);
                        }
                        else
                        {
                            MessageBox.Show("ERROR", "Equipo", MessageBoxButton.OK); 
                        }
                       
                        
                         }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.ToString());
                    }

                }

            }
            else
            {
                this.Close();
            }

        }
    }
}

