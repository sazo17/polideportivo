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
    /// Interaction logic for VerEntrenadorWindow.xaml
    /// </summary>
    /// 

    public partial class VerEntrenadorWindow : Window
    {

        public String identre;
        public int idUsuario;
        public VerEntrenadorWindow(String id_entrenador)
        {
            InitializeComponent();
            identre = id_entrenador;
            
            try
            {
                //COMBOBOX CANTIDAD JUGADORES
                conexion_mysql.terminal_bd();
                conexion_mysql.start_bd();
                MySqlCommand TipoCjugadores = conexion_mysql.con_mysql.CreateCommand();
                TipoCjugadores.Connection = conexion_mysql.con_mysql;
                TipoCjugadores.CommandText = "SELECT cantidad_jugadores_deporte FROM deporte;";
                MySqlDataReader r1 = TipoCjugadores.ExecuteReader();
                while (r1.Read())
                {
                    cbo_cjugadores.Items.Add(r1.GetString(0));
                }
                conexion_mysql.terminal_bd();
                conexion_mysql.start_bd();
                MySqlCommand Entrenador = conexion_mysql.con_mysql.CreateCommand();
                Entrenador.Connection = conexion_mysql.con_mysql;
                Entrenador.CommandText = "Select * from entrenadores where idEntrenador = @identrenadores";
                Entrenador.Parameters.AddWithValue("@identrenadores", id_entrenador);
                MySqlDataReader r3 = Entrenador.ExecuteReader();

                r3.Read();
                txt_nombre.Text = r3.GetString(1);
                txt_apellido.Text = r3.GetString(2);
                txt_edad.Text = r3.GetUInt32(3).ToString();
                txt_direccion.Text = r3.GetString(4);
                txt_telefono1.Text = r3.GetString(5);
                txt_email.Text = r3.GetString(6);
                cbo_cjugadores.SelectedIndex = r3.GetInt32(7) - 1;
                idUsuario = r3.GetInt32(8);
                string name = txt_nombre.Text;

                //LLENANDO TEXTBOX USUARIO
                conexion_mysql.terminal_bd();
                conexion_mysql.start_bd();
                MySqlCommand Usuario = conexion_mysql.con_mysql.CreateCommand();
                Usuario.Connection = conexion_mysql.con_mysql;
                Usuario.CommandText = "Select * from usuarios where idUsuarios = @idUsuarios";
                Usuario.Parameters.AddWithValue("@idUsuarios", idUsuario);
                MySqlDataReader r4 = Usuario.ExecuteReader();

                r4.Read();
                txt_username.Text = r4.GetString(1);
                passbx_password.Password = r4.GetString(2);

                
                //LLENANDO NOMBRE DE EQUIPO
                conexion_mysql.terminal_bd();
                conexion_mysql.start_bd();
                MySqlCommand EQUIPO = conexion_mysql.con_mysql.CreateCommand();
                EQUIPO.Connection = conexion_mysql.con_mysql;
                EQUIPO.CommandText = "select nombre_equipo from equipos where identrenador = " + identre+"";
                MySqlDataReader r5 = EQUIPO.ExecuteReader();

                r5.Read();
                txt_equipo_actual.Text = r5.GetString(0);


           

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

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void txt_equipo_actual_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void btn_guardar_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult aceptar = MessageBox.Show("Esta seguro de Modificar el Entrenador?", "Modificar Entrenador", MessageBoxButton.YesNo);
            if (aceptar == MessageBoxResult.Yes)
            {
                String nombre = txt_nombre.Text;
                String apellido = txt_apellido.Text;
                String edad = txt_edad.Text;
                String usuario = txt_username.Text;
                String contraseña = passbx_password.Password.ToString();
                String confirmacion = passbx_confirmar_password.Password.ToString();
                String telefono = txt_telefono1.Text;
                String direccion = txt_direccion.Text;
                String correo = txt_email.Text;
                String cjugadores = cbo_cjugadores.SelectedIndex.ToString();

                if (nombre == "" || apellido == "" || edad == "" || usuario == "" || contraseña == "" ||  confirmacion == "" ||
                    telefono == "" || direccion == "" || correo == "" || cjugadores == "")
                {
                    MessageBox.Show("Debe llenar todos los campos!");
                }
                else
                {
                    if (contraseña != confirmacion)
                    {
                        MessageBox.Show("Contraseñas no coinciden!", "ERROR");
                    }
                    else
                    {
                        try
                        {
                            //ELIMINANDO REGISTRO DE ARBITRO PARA INGRESARLO DE NUEVO
                            conexion_mysql.terminal_bd();
                            conexion_mysql.start_bd();
                            MySqlCommand DropArbitro = conexion_mysql.con_mysql.CreateCommand();
                            DropArbitro.Connection = conexion_mysql.con_mysql;
                            DropArbitro.CommandText = "UPDATE entrenadores SET identrenador=@identrenadores, nombre_entrenadores=@nombre, " +
                                   "apellido_entrenadores=@apellido, edad_entrenadores=@edad, dirección_entrenadores=@direccion, " +
                                   "telefono_entrenadores=@telefono, email_entrenadores=@email," +
                                   /*"idDeporte=@Deporte" +*/
                                   " WHERE identrenador = @identrenadores;";

                            /*"UPDATE entrenadores SET identrenador="+identre+", nombre_entrenadores=" + nombre+", " +
                                    "apellido_entrenadores="+apellido+", edad_entrenadores="+edad+", dirección_entrenadores="+direccion+", " +
                                    "telefono_entrenadores="+telefono+", email_entrenadores="+correo+"," +
                                    "idDeporte="+cjugadores+"" +
                                    " WHERE identrenador = "+identre+";";*/
                            DropArbitro.Parameters.AddWithValue("@identrenadores", identre);
                               DropArbitro.Parameters.AddWithValue("@nombre", nombre);
                               DropArbitro.Parameters.AddWithValue("@apellido", apellido);
                               DropArbitro.Parameters.AddWithValue("@edad", edad);
                               DropArbitro.Parameters.AddWithValue("@direccion", direccion);
                               DropArbitro.Parameters.AddWithValue("@telefono", telefono);
                               DropArbitro.Parameters.AddWithValue("@email", correo);
                              // DropArbitro.Parameters.AddWithValue("@Deporte", cjugadores + 1);
                             

                            DropArbitro.ExecuteNonQuery();


                            //ELIMINANDO REGISTRO DE USUARIO DEL ARBITRO
                            conexion_mysql.terminal_bd();
                            conexion_mysql.start_bd();
                            MySqlCommand DropUsuario = conexion_mysql.con_mysql.CreateCommand();
                            DropUsuario.Connection = conexion_mysql.con_mysql;
                            DropUsuario.CommandText = "UPDATE usuarios SET user_usuarios=@usuario, pass_usuarios=@contraseña" +
                                " WHERE (idUsuarios = @idUsuario);";
                            DropUsuario.Parameters.AddWithValue("@usuario", usuario);
                            DropUsuario.Parameters.AddWithValue("@contraseña", contraseña);
                            DropUsuario.Parameters.AddWithValue("@idUsuario", idUsuario);
                            DropUsuario.ExecuteNonQuery();

                            MessageBox.Show("Arbitro modificado exitosamente", "Entrenador", MessageBoxButton.OK);
                            this.Close();
                            ArbitrosWindow a = new ArbitrosWindow();
                            a.Show();

                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.ToString());
                        }
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
