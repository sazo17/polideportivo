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
    /// Interaction logic for EstadisticasFutbolWindow.xaml
    /// </summary>
    public partial class EstadisticasFutbolWindow : Window
    {
        public EstadisticasFutbolWindow()
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

        private void btn_agregar_gol1_Click(object sender, RoutedEventArgs e)
        {
            AgregarGolFutbolWindow agregar_gol = new AgregarGolFutbolWindow();
            agregar_gol.Show();
        }

        private void btn_agregar_gol2_Click(object sender, RoutedEventArgs e)
        {
            AgregarGolFutbolWindow agregar_gol = new AgregarGolFutbolWindow();
            agregar_gol.Show();
        }

        private void btn_agregar_falta1_Click(object sender, RoutedEventArgs e)
        {
            AgregarFaltaFutbolWindow agregar_falta = new AgregarFaltaFutbolWindow();
            agregar_falta.Show();
        }

        private void btn_agregar_falta2_Click(object sender, RoutedEventArgs e)
        {
            AgregarFaltaFutbolWindow agregar_falta = new AgregarFaltaFutbolWindow();
            agregar_falta.Show();
        }

        private void btn_quitar_falta1_Click(object sender, RoutedEventArgs e)
        {
            QuitarFaltaWindow quitar_falta = new QuitarFaltaWindow();
            quitar_falta.Show();
        }

        private void btn_quitar_falta2_Click(object sender, RoutedEventArgs e)
        {
            QuitarFaltaWindow quitar_falta = new QuitarFaltaWindow();
            quitar_falta.Show();
        }

        private void btn_quitar_gol1_Click(object sender, RoutedEventArgs e)
        {
            QuitarGolFutbolWindow quitar_gol = new QuitarGolFutbolWindow();
            quitar_gol.Show();
        }

        private void btn_quitar_gol2_Click(object sender, RoutedEventArgs e)
        {
            QuitarGolFutbolWindow quitar_gol = new QuitarGolFutbolWindow();
            quitar_gol.Show();
        }
    }
}
