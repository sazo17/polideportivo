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
            try
            {

                string a = "Este camp0";
                int b = 1;
                cnm.prueba(a,b);
                cnm.terminal_bd();
            }
            catch (Exception ex)
            {
                MessageBox.Show("error");
            }


            MenuWindow my_menu = new MenuWindow();
            my_menu.Show();
            this.Close();
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

        private void lbl_registrarse_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            RegistroWindow registro = new RegistroWindow();
            registro.Show();
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
