using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
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
    /// Interaction logic for MostrarArbitrosWindow.xaml
    /// </summary>
    public partial class MostrarArbitrosWindow : Window
    {
        public MostrarArbitrosWindow()
        {
            InitializeComponent();
            conexion_mysql.inicia_bd();

            String query_datagrid = "SELECT nombre_arbitro, apellido_arbitro, telefono_arbitro FROM arbitro";

            MySqlCommand cmd = new MySqlCommand(query_datagrid, conexion_mysql.con_mysql);
            DataTable tabla = new DataTable();
            MySqlDataAdapter data = new MySqlDataAdapter(cmd);
            data.Fill(tabla);
            dg_mostrar_arbitros.ItemsSource = tabla.DefaultView;
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
    }
}
