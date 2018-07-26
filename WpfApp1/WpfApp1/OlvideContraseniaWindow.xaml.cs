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
    /// Interaction logic for OlvideContraseniaWindow.xaml
    /// </summary>
    public partial class OlvideContraseniaWindow : Window
    {
        public OlvideContraseniaWindow()
        {
            InitializeComponent();
        }

        private void btn_email_Click(object sender, RoutedEventArgs e)
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
    }
}
