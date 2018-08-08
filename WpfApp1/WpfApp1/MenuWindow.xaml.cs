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
    /// Interaction logic for MenuWindow.xaml
    /// </summary>
    public partial class MenuWindow : Window
    {
        private String idUser = "";
        private String Usertype = "";
        public MenuWindow(String idUsuario, String tipoUser)
        {
            InitializeComponent();
            idUser = idUsuario;
            Usertype = tipoUser;
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
            conexion_mysql.start_bd();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion_mysql.con_mysql;
            cmd.CommandText = "UPDATE usuarios SET estado_usuarios=1 WHERE idUsuarios=" + idUser;
            cmd.ExecuteNonQuery();
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

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            conexion_mysql.start_bd();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion_mysql.con_mysql;
            cmd.CommandText = "UPDATE usuarios SET estado_usuarios=1 WHERE idUsuarios=" + idUser;
            cmd.ExecuteNonQuery();
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
            TablaPosicionesWindow tabla_posiciones = new TablaPosicionesWindow();
            tabla_posiciones.Show();
           
        }

        private void btn_ajustes_Click(object sender, RoutedEventArgs e)
        {
            AjustesWindow ajustes = new AjustesWindow();
            ajustes.Show();
          
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
   

        private void btn_buscar_jugadores_Click(object sender, RoutedEventArgs e)
        {
            BuscarJugadoresWindow buscar_jugadores = new BuscarJugadoresWindow();
            buscar_jugadores.Show();
        }

        private void btn_campos_Click(object sender, RoutedEventArgs e)
        {
            CamposWindow campos = new CamposWindow();
            campos.Show();
        }

        private void btn_empledos_Click(object sender, RoutedEventArgs e)
        {
            EmpleadosWindow empleados = new EmpleadosWindow();
            empleados.Show();
        }

        private void btn_arbitros_Click(object sender, RoutedEventArgs e)
        {
            ArbitrosWindow arbitros = new ArbitrosWindow();
            arbitros.Show();
        }

        private void btn_jugadores_Click(object sender, RoutedEventArgs e)
        {
            JugadoresWindow jugadores = new JugadoresWindow();
            jugadores.Show();
        }

        private void btn_entrenadores_Click(object sender, RoutedEventArgs e)
        {
            EntrenadorWindow entrenadores = new EntrenadorWindow();
            entrenadores.Show();
        }

        private void btn_deportes_Click(object sender, RoutedEventArgs e)
        {
            DeportesWindow deportes = new DeportesWindow();
            deportes.Show();
        }

        
    }
}
