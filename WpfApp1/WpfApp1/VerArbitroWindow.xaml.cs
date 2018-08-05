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
    /// Interaction logic for VerArbitroWindow.xaml
    /// </summary>
    public partial class VerArbitroWindow : Window
    {
        public String idArb = "";
        public int idUsuario, tipoArb = 0;
        public VerArbitroWindow(String id_arbitro)
        {
            InitializeComponent();
            idArb = id_arbitro;

            try
            {
                //COMBOBOX TIPO ARBITRO
                conexion_mysql.terminal_bd();
                conexion_mysql.start_bd();
                MySqlCommand TipoArbitro = conexion_mysql.con_mysql.CreateCommand();
                TipoArbitro.Connection = conexion_mysql.con_mysql;
                TipoArbitro.CommandText = "SELECT tipo_tipo_arbitro FROM tipo_arbitro;";
                MySqlDataReader r1 = TipoArbitro.ExecuteReader();
                while (r1.Read())
                {
                    cbo_tipo_de_usuario.Items.Add(r1.GetString(0));
                }

                //COMBOBOX TIPO DEPORTE
                conexion_mysql.terminal_bd();
                conexion_mysql.start_bd();
                MySqlCommand TipoDeporte = conexion_mysql.con_mysql.CreateCommand();
                TipoDeporte.Connection = conexion_mysql.con_mysql;
                TipoDeporte.CommandText = "SELECT tipo_Tipo_Deporte FROM tipos_deporte;";
                MySqlDataReader r2 = TipoDeporte.ExecuteReader();
                while (r2.Read())
                {
                    cbo_tipo_deporte.Items.Add(r2.GetString(0));
                }



                //LLENANDO TEXTBOX ARBITRO
                conexion_mysql.terminal_bd();
                conexion_mysql.start_bd();
                MySqlCommand Arbitro = conexion_mysql.con_mysql.CreateCommand();
                Arbitro.Connection = conexion_mysql.con_mysql;
                Arbitro.CommandText = "Select * from arbitro where idArbitro = @idArbitro";
                Arbitro.Parameters.AddWithValue("@idArbitro", id_arbitro);
                MySqlDataReader r3 = Arbitro.ExecuteReader();

                r3.Read();
                txt_nombre.Text = r3.GetString(1);
                txt_apellido.Text = r3.GetString(2);
                txt_edad.Text = r3.GetUInt32(3).ToString();
                txt_direccion.Text = r3.GetString(4);
                txt_telefono1.Text = r3.GetString(5);
                txt_correo.Text = r3.GetString(6);
                cbo_tipo_de_usuario.SelectedIndex = r3.GetInt32(7) - 1;
                tipoArb = cbo_tipo_de_usuario.SelectedIndex;
                idUsuario = r3.GetInt32(8);
                cbo_tipo_deporte.SelectedIndex = r3.GetInt32(9) - 1;


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
            }catch(Exception ex)
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

        private void Guardar_Click(object sender, RoutedEventArgs e)
        {
            MessageBoxResult aceptar =  MessageBox.Show("Esta seguro de Modificar el Arbitro?", "Modificar Arbitro", MessageBoxButton.YesNo);
            if (aceptar == MessageBoxResult.Yes)
            {
                String nombre = txt_nombre.Text;
                String apellido = txt_apellido.Text;
                String edad = txt_edad.Text;
                String telefono = txt_telefono1.Text;
                String usuario = txt_username.Text;
                String tipo = cbo_tipo_de_usuario.SelectedItem.ToString();
                int tipoArbitro = cbo_tipo_de_usuario.SelectedIndex;
                String deporte = cbo_tipo_deporte.SelectedItem.ToString();
                int tipoDeporte = cbo_tipo_deporte.SelectedIndex;
                String contraseña = passbx_password.Password.ToString();
                String confirmacion = passbx_confirmar_password.Password.ToString();
                String direccion = txt_direccion.Text;
                String correo = txt_correo.Text;

                if (nombre == "" || apellido == "" || edad == "" || telefono == "" || usuario == "" || tipo == "" ||
                    deporte == "" || contraseña == "" || direccion == "" || correo == "")
                {
                    MessageBox.Show("Porfavor complete todos los campos!");
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
                            DropArbitro.CommandText = "UPDATE arbitro SET idArbitro=@idArbitro, nombre_arbitro=@nombre, " +
                                "apellido_arbitro=@apellido, edad_arbitro=@edad, direccion_arbitro=@direccion, " +
                                "telefono_arbitro=@telefono, email_arbitro=@email, idTipo_Arbitro=@tipo, idDeporte=@deporte, " +
                                "idTipo_Deporte=@tipoDeporte" +
                                " WHERE (idArbitro = @idArb) and (idTipo_Arbitro = @tipo);";

                            DropArbitro.Parameters.AddWithValue("@idArbitro", idArb);
                            DropArbitro.Parameters.AddWithValue("@nombre", nombre);
                            DropArbitro.Parameters.AddWithValue("@apellido", apellido);
                            DropArbitro.Parameters.AddWithValue("@edad", edad);
                            DropArbitro.Parameters.AddWithValue("@direccion", direccion);
                            DropArbitro.Parameters.AddWithValue("@telefono", telefono);
                            DropArbitro.Parameters.AddWithValue("@email", correo);
                            DropArbitro.Parameters.AddWithValue("@tipo", tipoArbitro + 1);
                            DropArbitro.Parameters.AddWithValue("@deporte", tipoDeporte + 1);
                            DropArbitro.Parameters.AddWithValue("@tipoDeporte", tipoDeporte + 1);
                            DropArbitro.Parameters.AddWithValue("@idArb", idArb);
                            DropArbitro.Parameters.AddWithValue("@tipoArbitro", tipoArb);
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

                            MessageBox.Show("Arbitro modificado exitosamente", "Arbitro", MessageBoxButton.OK);
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

            }else
            {
                this.Close();
            }
            
        }
    }
}
