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
    /// Interaction logic for DeportesWindow.xaml
    /// </summary>
    public partial class DeportesWindow : Window
    {
        public DeportesWindow()
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

        private void btn_ver_reglas_futbol_Click(object sender, RoutedEventArgs e)
        {
            VerReglasWindow ver_reglas = new VerReglasWindow();
            ver_reglas.Show();
        }

        private void btn_ver_reglas_basketball_Click(object sender, RoutedEventArgs e)
        {
            VerReglasWindow ver_reglas = new VerReglasWindow();
            ver_reglas.Show();
        }

        private void btn_ver_reglas_baseball_Click(object sender, RoutedEventArgs e)
        {
            VerReglasWindow ver_reglas = new VerReglasWindow();
            ver_reglas.Show();
        }

        private void btn_ver_reglas_volleyball_Click(object sender, RoutedEventArgs e)
        {
            VerReglasWindow ver_reglas = new VerReglasWindow();
            ver_reglas.Show();
        }

        private void ComboBoxItem_Selected(object sender, RoutedEventArgs e)
        {

        }

        private void btn_agregar_regla_Click(object sender, RoutedEventArgs e)
        {
            String nombre = txt_nombre.ToString();
            String regla = txt_regla.ToString();
            int id_deporte;

            conexion_mysql.inicia_bd();
            MySqlCommand cmd = conexion_mysql.con_mysql.CreateCommand();
            cmd.CommandText = "r_basket";
            cmd.CommandType = System.Data.CommandType.StoredProcedure;


            if (basket.IsSelected == true)
            {
                cmd.Parameters.AddWithValue("idreglas_basket", "0").Direction = System.Data.ParameterDirection.Input;
                cmd.Parameters.AddWithValue("idreglas_basket", "0").Direction = System.Data.ParameterDirection.Input;
                cmd.Parameters.AddWithValue("idreglas_basket", "0").Direction = System.Data.ParameterDirection.Input;
                cmd.Parameters.AddWithValue("idreglas_basket", "0").Direction = System.Data.ParameterDirection.Input;
            }
            
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
