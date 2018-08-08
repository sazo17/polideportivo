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
    /// Interaction logic for AgregarJugadorWindow.xaml
    /// </summary>
    public partial class AgregarJugadorWindow : Window
    {
        public AgregarJugadorWindow()
        {
            InitializeComponent();
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

        private void btn_agregar_Click(object sender, RoutedEventArgs e)
        {
            String nombre = txt_nombre.Text;
            String apellido = txt_apellido.Text;
            String edad = txt_edad.Text;
            String telefono = txt_telefono1.Text;
            String sexo = cbo_sexo.SelectedItem.ToString();
            String deporte = cbo_deporte.SelectedItem.ToString();
            String username = txt_username.Text;
            String password = passbx_password.Password;
            String confirmar_password = passbx_confirmar_password.Password;
            String direccion = txt_direccion.Text;
            String tipo = "";
            String estado = "";
            String id = "";
            if (password == confirmar_password && password != "")
            {
                try
                {
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = conexion_mysql.con_mysql;
                    cmd.CommandText = "p_jugadores";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.Add(new MySqlParameter("nombre_jugadores", MySqlDbType.VarChar));
                    cmd.Parameters["nombre_jugadores"].Value = nombre;
                    cmd.Parameters["nombre_jugadores"].Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.Add(new MySqlParameter("apellido_jugadores", MySqlDbType.VarChar));
                    cmd.Parameters["apellido_jugadores"].Value = apellido;
                    cmd.Parameters["apellido_jugadores"].Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.Add(new MySqlParameter("edad_jugadores", MySqlDbType.Int32));
                    cmd.Parameters["edad_jugadores"].Value = edad;
                    cmd.Parameters["edad_jugadores"].Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.Add(new MySqlParameter("telefono_jugadores", MySqlDbType.VarChar));
                    cmd.Parameters["telefono_jugadores"].Value = telefono;
                    cmd.Parameters["telefono_jugadores"].Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.Add(new MySqlParameter("sexo_jugadores", MySqlDbType.VarChar));
                    cmd.Parameters["sexo_jugadores"].Value = sexo;
                    cmd.Parameters["sexo_jugadores"].Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.Add(new MySqlParameter("deporte_jugadores", MySqlDbType.VarChar));
                    cmd.Parameters["deporte_jugadores"].Value = deporte;
                    cmd.Parameters["deporte_jugadores"].Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.Add(new MySqlParameter("direccion_jugadores", MySqlDbType.VarChar));
                    cmd.Parameters["direccion_jugadores"].Value = direccion;
                    cmd.Parameters["direccion_jugadores"].Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.Add(new MySqlParameter("direccion_jugadores", MySqlDbType.VarChar));
                    cmd.Parameters["direccion_jugadores"].Value = direccion;
                    cmd.Parameters["direccion_jugadores"].Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.Add(new MySqlParameter("usuario_jugadores)", MySqlDbType.VarChar));
                    cmd.Parameters["usuario_jugadores"].Value = username;
                    cmd.Parameters["usuario_jugadores"].Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.Add(new MySqlParameter("password_jugadores)", MySqlDbType.VarChar));
                    cmd.Parameters["password_jugadores"].Value = password;
                    cmd.Parameters["password_jugadores"].Direction = System.Data.ParameterDirection.Input;
                    //parametros de salida
                    cmd.Parameters.Add(new MySqlParameter("o_tipo_usuarios", MySqlDbType.VarChar));
                    cmd.Parameters["o_tipo_usuarios"].Direction = System.Data.ParameterDirection.Output;
                    cmd.Parameters.Add(new MySqlParameter("o_estado_usuarios", MySqlDbType.VarChar));
                    cmd.Parameters["o_estado_usuarios"].Direction = System.Data.ParameterDirection.Output;
                    cmd.Parameters.Add(new MySqlParameter("o_idUsuarios", MySqlDbType.Int32));
                    cmd.Parameters["o_idUsuarios"].Direction = System.Data.ParameterDirection.Output;
                    //ejecutando
                    cmd.ExecuteNonQuery();
                    tipo = cmd.Parameters["o_tipo_usuarios"].Value.ToString();
                    estado = cmd.Parameters["o_estado_usuarios"].Value.ToString();
                    id = cmd.Parameters["o_idUsuarios"].Value.ToString();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }
                if (estado == "1")
                {
                    MessageBox.Show("Jugador creado", "Mensaje");
                    txt_nombre.Text = "";
                    txt_apellido.Text = "";
                    txt_direccion.Text = "";
                    txt_telefono1.Text = "";
                    txt_edad.Text = "";
                    txt_username.Text = "";
                    passbx_password.Password = "";
                    passbx_confirmar_password.Password = "";
                }
                else
                {

                    conexion_mysql.terminal_bd();
                }
            }
            else
            {
                MessageBox.Show("Las contraseñas no coincided, intente de nuevo", "Error");
            }
        }
    }
}
    
