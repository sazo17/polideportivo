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
    /// Interaction logic for VerCampeonatoWindow.xaml
    /// </summary>
    public partial class VerCampeonatoWindow : Window
    {
        public VerCampeonatoWindow()
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

        private void btn_jornadas_Click(object sender, RoutedEventArgs e)
        {
            JornadasWindow jornadas = new JornadasWindow();
            jornadas.Show();
        }

        private void btn_portero_menos_vencido_Click(object sender, RoutedEventArgs e)
        {
            TablaPorteroMenosVencidoFutbolWindow portero_menos_vencido = new TablaPorteroMenosVencidoFutbolWindow();
            portero_menos_vencido.Show();
        }

        private void btn_goleadores_Click(object sender, RoutedEventArgs e)
        {
            TablaGoleadoresFutbolWindow goleadores = new TablaGoleadoresFutbolWindow();
            goleadores.Show();
        }

        private void btn_tabla_de_posiciones_Click(object sender, RoutedEventArgs e)
        {
            TablaPosicionesWindow tabla_posiciones = new TablaPosicionesWindow();
            tabla_posiciones.Show();
        }

        private void btn_calendario_Click(object sender, RoutedEventArgs e)
        {
            CalendariosWindow calendario = new CalendariosWindow();
            calendario.Show();
        }


    }
}
