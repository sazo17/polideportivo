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
    /// Interaction logic for MenuWindow.xaml
    /// </summary>
    public partial class MenuWindow : Window
    {
        public MenuWindow()
        {
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            MainWindow login = new MainWindow();
            login.Show();
            this.Close();
        }

        private void btn_torneos_Click(object sender, RoutedEventArgs e)
        {
            TorneosWindow torneo = new TorneosWindow();
            torneo.Show();
          
        }

        private void btn_equipos_Click(object sender, RoutedEventArgs e)
        {
            EquiposWindow equipos = new EquiposWindow();
            equipos.Show();
          
        }

        private void btn_calendarios_Click(object sender, RoutedEventArgs e)
        {
            CalendariosWindow calendarios = new CalendariosWindow();
            calendarios.Show();
           
        }

        private void btn_ajustes_Click(object sender, RoutedEventArgs e)
        {
            AjustesWindow ajustes = new AjustesWindow();
            ajustes.Show();
          
        }

        private void btn_deportes_Click(object sender, RoutedEventArgs e)
        {
            DeportesWindow deportes = new DeportesWindow();
            deportes.Show();
        }

        private void btn_estadisticas_Click(object sender, RoutedEventArgs e)
        {
            EstadisticasWindow estadisticas = new EstadisticasWindow();
            estadisticas.Show();
        }

        private void btn_informacion_Click(object sender, RoutedEventArgs e)
        {
            InformacionWindow informacion = new InformacionWindow();
            informacion.Show();
        }

        private void btn_ayuda_Copy1_Click(object sender, RoutedEventArgs e)
        {
            AyudaWindow ayuda = new AyudaWindow();
            ayuda.Show();
        }
    }
}
