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
using System.Data;


namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for ArbitrosWindow.xaml
    /// </summary>
    public partial class ArbitrosWindow : Window
    {
        public ArbitrosWindow()
        {
            InitializeComponent();
            conexion_mysql.inicia_bd();

            String query_datagrid= "SELECT * FROM arbitro";

            MySqlCommand cmd = new MySqlCommand(query_datagrid, conexion_mysql.con_mysql);
            DataTable tabla = new DataTable();
            MySqlDataAdapter data = new MySqlDataAdapter(cmd);
            data.Fill(tabla);
            dg_arbitros.ItemsSource = tabla.DefaultView;
                     
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

  

        private void btn_regresar_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btn_agregar_arbitro_Click(object sender, RoutedEventArgs e)
        {
            AgregarArbitroWindow agregar_arbitro = new AgregarArbitroWindow();
            agregar_arbitro.Show();
            this.Close();
        }

        private void btn_modificar_arbitro_Click(object sender, RoutedEventArgs e)
        {
            VerArbitroWindow ver_arbitro = new VerArbitroWindow();
            ver_arbitro.Show();
        }
    }
}

