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

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
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
            MenuWindow my_menu = new MenuWindow();
            my_menu.Show();
            this.Hide();

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
