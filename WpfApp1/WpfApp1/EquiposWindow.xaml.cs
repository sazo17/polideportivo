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
    /// Interaction logic for EquiposWindow.xaml
    /// </summary>
    public partial class EquiposWindow : Window
    {
        public String iddelequipo;
        public EquiposWindow()
        {
            InitializeComponent();

            InitializeComponent();
            conexion_mysql.start_bd();

            String query_datagrid = "SELECT idequipos, nombre_equipo FROM equipos";

            MySqlCommand cmd = new MySqlCommand(query_datagrid, conexion_mysql.con_mysql);
            DataTable tabla = new DataTable();
            MySqlDataAdapter data = new MySqlDataAdapter(cmd);
            data.Fill(tabla);
            dg_equipos.ItemsSource = tabla.DefaultView;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

            if (dg_equipos.SelectedItem == null)
            {
                MessageBox.Show("Seleccione un equipo", "equipos");
            }
            else
            {
                VerEquipoWindow verequipo = new VerEquipoWindow(iddelequipo);
                verequipo.Show();
            }
        }

        private void btn_regresar_Click(object sender, RoutedEventArgs e)
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

        private void btn_agregar_equipo_Click(object sender, RoutedEventArgs e)
        {
            AgregarEquipoWindow agregar_equipo = new AgregarEquipoWindow();
            agregar_equipo.Show();
        }

        private void dg_equipos_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataRowView dv = (DataRowView)dg_equipos.SelectedItem;
            if (dv != null)
            {
                iddelequipo = dv.Row.ItemArray[0].ToString();
            }
        }
    }
}
