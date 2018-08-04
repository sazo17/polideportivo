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
using System.Windows.Navigation;
using System.Windows.Shapes;


using MySql.Data.MySqlClient;

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        conexion_mysql cnm = new conexion_mysql();

        public MainWindow()
        {
            InitializeComponent();
            conexion_mysql.inicia_bd();             // importante para iniciar la conexion a base de datos.

        }

        private void lbl_ayuda_MouseEnter(object sender, MouseEventArgs e)
        {
            lbl_ayuda.Content = "Ayuda <-";

           
            
        }

        private void lbl_ayuda_MouseLeave(object sender, MouseEventArgs e)
        {
            lbl_ayuda.Content = "Ayuda";
        }

        private void lbl_informacion_MouseEnter(object sender, MouseEventArgs e)
        {
            lbl_informacion.Content = "Información <-";

        }

        private void lbl_informacion_MouseLeave(object sender, MouseEventArgs e)
        {
            lbl_informacion.Content = "Información";
        }

        private void lbl_contacto_MouseEnter(object sender, MouseEventArgs e)
        {
            lbl_contacto.Content = "Contacto <-";
        }

        private void lbl_contacto_MouseLeave(object sender, MouseEventArgs e)
        {
            lbl_contacto.Content = "Contacto";
        }

        private void btn_login_Click(object sender, RoutedEventArgs e)
        {
            String user = txt_username.Text;
            String pass = passbx_password.Password.ToString();

            String tipo = "";
            String estado = "";
            String id = "";

            MenuWindow MenuPrincipal = new MenuWindow();

            if (user=="" || user == "Username"){
                MessageBox.Show("Usuario o contraseña incorrectos", "Error");
            }else{
                if (pass == "") {
                    MessageBox.Show("Usuario o contraseña incorrectos", "Error");
                } else {
                    try
                    {
                        MySqlCommand cmd = new MySqlCommand();
                        cmd.Connection = conexion_mysql.con_mysql;
                        cmd.CommandText = "p_login";
                        cmd.CommandType = System.Data.CommandType.StoredProcedure;

                        //parametro user
                        cmd.Parameters.Add(new MySqlParameter("user", MySqlDbType.VarChar));
                        cmd.Parameters["user"].Value = user;
                        cmd.Parameters["user"].Direction = System.Data.ParameterDirection.Input;

                        //parametro pass
                        cmd.Parameters.Add(new MySqlParameter("pass", MySqlDbType.VarChar));
                        cmd.Parameters["pass"].Value = user;
                        cmd.Parameters["pass"].Direction = System.Data.ParameterDirection.Input;

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

                    }catch(Exception ex)
                    {
                        MessageBox.Show(ex.ToString());
                    }

                   
                    if (tipo.Equals("N") && estado.Equals("0"))
                    {
                        MessageBox.Show("Usuario y contraseña inconrrectos!", "Error");
                    }else{
                        if (estado.Equals("1"))
                        {
                            MessageBox.Show("tiene una sesion abierta!");
                        }else
                        {
                            MenuPrincipal.Show();
                            this.Close();
                        }
                    }
                }
            }

           
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
        }

        private void ellipse_cerrar_MouseEnter(object sender, MouseEventArgs e)
        {
        
        }

        private void ellipse_cerrar_MouseLeave(object sender, MouseEventArgs e)
        {

        }

        private void ellipse_cerrar_GotTouchCapture(object sender, TouchEventArgs e)
        {
      
        }

        private void ellipse_cerrar_TouchEnter(object sender, TouchEventArgs e)
        {
          
        }

        private void ellipse_cerrar_GotFocus(object sender, RoutedEventArgs e)
        {
            
        }
        

        private void lbl_olvidopassword_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            OlvideContraseniaWindow olvidecontrasenia = new OlvideContraseniaWindow();
            olvidecontrasenia.Show();
        }

        private void txt_username_GotFocus(object sender, RoutedEventArgs e)
        {
            string watermark = "Username";
            if (txt_username.Text == watermark)
            {
                txt_username.Text = "";
            }


        }

        private void txt_username_LostFocus(object sender, RoutedEventArgs e)
        {
            string watermark = "Username";
            if (txt_username.Text == "")
            {
                txt_username.Text = watermark;
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
    }
}
