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

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for RegistroWindow.xaml
    /// </summary>
    public partial class RegistroWindow : Window
    {
        public RegistroWindow()
        {
            InitializeComponent();
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void btn_registrar_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void txt_nombre_GotFocus(object sender, RoutedEventArgs e)
        {
            string watermark = "Nombre";
            if (txt_nombre.Text == watermark ) {
                txt_nombre.Foreground = Brushes.Black;
                txt_nombre.Text = "";
            }
        }

        private void txt_nombre_LostFocus(object sender, RoutedEventArgs e)
        {
            string watermark = "Nombre";
            if (txt_nombre.Text == "")
            {
                txt_nombre.Foreground = Brushes.Gray;
                txt_nombre.Text = watermark;
            }
        }

        private void txt_apellido_LostFocus(object sender, RoutedEventArgs e)
        {
            string watermark = "Apellido";
            if (txt_apellido.Text == "")
            {
                txt_apellido.Foreground = Brushes.Gray;
                txt_apellido.Text = watermark;
            }
        }

        private void txt_apellido_GotFocus(object sender, RoutedEventArgs e)
        {
            string watermark = "Apellido";
            if (txt_apellido.Text == watermark)
            {
                txt_apellido.Foreground = Brushes.Black;
                txt_apellido.Text = "";
            }
        }

        private void txt_email_GotFocus(object sender, RoutedEventArgs e)
        {
            string watermark = "Correo Electronico";
            if (txt_email.Text == watermark)
            {
                txt_email.Foreground = Brushes.Black;
                txt_email.Text = "";
            }
        }

        private void txt_email_LostFocus(object sender, RoutedEventArgs e)
        {
            string watermark = "Correo Electronico";
            if (txt_email.Text == "")
            {
                txt_email.Foreground = Brushes.Gray;
                txt_email.Text = watermark;
            }
        }

        private void btn_cerrar_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btn_cerrar_MouseEnter(object sender, MouseEventArgs e)
        {
            btn_cerrar.Content = "x";
        }


        private void btn_cerrar_MouseLeave(object sender, MouseEventArgs e)
        {
            btn_cerrar.Content = "";
        }

        private void btn_minimizar_MouseEnter(object sender, MouseEventArgs e)
        {
            btn_minimizar.Content = "_";
        }

        private void btn_minimizar_MouseLeave(object sender, MouseEventArgs e)
        {
            btn_minimizar.Content = "";
        }

        private void btn_minimizar_Click(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }
    }
}
