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
    /// Interaction logic for AgregarArbitroWindow.xaml
    /// </summary>
    public partial class AgregarArbitroWindow : Window
    {
        public AgregarArbitroWindow()
        {
            InitializeComponent();
            conexion_mysql.inicia_bd();
            
            //tipo de deporte
            MySqlCommand cmd = conexion_mysql.con_mysql.CreateCommand();
            cmd.CommandText = "SELECT tipo_Tipo_Deporte from tipos_deporte";
            MySqlDataReader r = cmd.ExecuteReader();

            while (r.Read())
            {
                cbo_tipo_deporte.Items.Add(r.GetString(0));

            }
            conexion_mysql.terminal_bd();
            conexion_mysql.inicia_bd();

            //tipo arbitro
            MySqlCommand cmd2 = conexion_mysql.con_mysql.CreateCommand();
            cmd2.CommandText = "SELECT tipo_tipo_arbitro FROM tipo_arbitro;";
            MySqlDataReader r2 = cmd2.ExecuteReader();

            while (r2.Read())
            {
                cbo_tipo_de_arbitro.Items.Add(r2.GetString(0));

            }
            conexion_mysql.terminal_bd();
            conexion_mysql.inicia_bd();
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

        private void btn_agregar_arbitro_Click(object sender, RoutedEventArgs e)
        {
            String nombre = txt_nombre.Text;
            String apellido = txt_apellido.Text;
            String edad = txt_edad.Text;
            String telefono = txt_telefono1.Text;
            String usuario = txt_username.Text;
            String tipo = cbo_tipo_de_arbitro.SelectedItem.ToString();
            String deporte = cbo_tipo_deporte.SelectedItem.ToString();
            String contraseña = passbx_password.Password.ToString();
            String confirmacion = passbx_confirmar_password.Password.ToString();
            String direccion = txt_direccion.Text;
            String correo = txt_correo.Text;

            if(nombre=="" || apellido == "" || edad == "" || telefono == "" || usuario == "" || tipo == "" ||
                deporte == "" || contraseña == "" || direccion == "" || correo=="" )
            {
                MessageBox.Show("Porfavor complete todos los campos!");
            }else
            {
                if(contraseña != confirmacion)
                {
                    MessageBox.Show("Contraseñas no coinciden!", "ERROR");
                }else
                {
                    if (chk_aceptar_terminos.IsEnabled == false)
                    {
                        MessageBox.Show("Acepte los terminos y condiciones", "ERROR");
                    } else
                    {
                        try
                        {
                            MySqlCommand cmd = new MySqlCommand();
                            cmd.Connection = conexion_mysql.con_mysql;
                            cmd.CommandText = "p_arbitros";
                            cmd.CommandType = System.Data.CommandType.StoredProcedure;

                            //nombre
                            cmd.Parameters.AddWithValue("i_nombre", nombre).Direction = System.Data.ParameterDirection.Input;

                            //apellido
                            cmd.Parameters.AddWithValue("i_apellidos", apellido).Direction = System.Data.ParameterDirection.Input;

                            //edad
                            cmd.Parameters.AddWithValue("i_edad", edad).Direction = System.Data.ParameterDirection.Input;

                            //direccion
                            cmd.Parameters.AddWithValue("i_direccion", direccion).Direction = System.Data.ParameterDirection.Input;

                            //telefono
                            cmd.Parameters.AddWithValue("i_telefono", telefono).Direction = System.Data.ParameterDirection.Input;

                            //mail
                            cmd.Parameters.AddWithValue("i_mail", correo).Direction = System.Data.ParameterDirection.Input;

                            //tipo arbitro
                            cmd.Parameters.AddWithValue("i_tipoa", tipo).Direction = System.Data.ParameterDirection.Input;

                            //tipo deporte
                            int depo = 0;
                            depo=cbo_tipo_deporte.SelectedIndex;
                            depo++;
                            cmd.Parameters.AddWithValue("i_deporte", depo).Direction = System.Data.ParameterDirection.Input;

                            //usuario
                            cmd.Parameters.AddWithValue("i_user", usuario).Direction = System.Data.ParameterDirection.Input;

                            //contraseña
                            cmd.Parameters.AddWithValue("i_pass", contraseña).Direction = System.Data.ParameterDirection.Input;

                            //estado (PREDEFINIDO 0)
                            cmd.Parameters.AddWithValue("i_estado", "0").Direction = System.Data.ParameterDirection.Input;

                            //tipo de usuario (PREDEFINIDO I)
                            cmd.Parameters.AddWithValue("i_tipo", "I").Direction = System.Data.ParameterDirection.Input;

                            //PARAMETROS DE SALIDA
                            //bit
                            String bit = "";
                            cmd.Parameters.AddWithValue("o_bit",0).Direction = System.Data.ParameterDirection.Output;

                            cmd.ExecuteNonQuery();
                            bit = cmd.Parameters["o_bit"].Value.ToString();
                            if (bit.Equals("1"))
                            {
                                MessageBox.Show("Arbitro registrado exitosamente", "Registro", MessageBoxButton.OK);
                                this.Close();
                                conexion_mysql.terminal_bd();
                                ArbitrosWindow a = new ArbitrosWindow();
                                a.Show();
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
    }
}
