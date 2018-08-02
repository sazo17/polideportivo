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
    /// Interaction logic for VerEquipoWindow.xaml
    /// </summary>
    public partial class VerEquipoWindow : Window
    {
        public VerEquipoWindow()
        {
            InitializeComponent();
        }

        private void btn_modificar_Click(object sender, RoutedEventArgs e)
        {

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

        private void btn_ver_entrenador_Click(object sender, RoutedEventArgs e)
        {
            VerEntrenadorWindow ver_entrenador = new VerEntrenadorWindow();
            ver_entrenador.Show();
        }

        private void btn_agregar_jugador_Click(object sender, RoutedEventArgs e)
        {
            MostrarJugadoresWindow mostrar_jugadores = new MostrarJugadoresWindow();
            mostrar_jugadores.Show();
        }

        private void btn_ver_jugador_Click(object sender, RoutedEventArgs e)
        {
            VerJugadorWindow ver_jugador = new VerJugadorWindow();
            ver_jugador.Show();
        }

        private void btn_cambiar_entrenador_Click(object sender, RoutedEventArgs e)
        {
            MostrarEntrenadoresWindow mostrar_entrenador = new MostrarEntrenadoresWindow();
            mostrar_entrenador.Show();
        }
    }
}
