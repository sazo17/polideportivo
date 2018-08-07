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
    /// Interaction logic for DeportesWindow.xaml
    /// </summary>
    
    public partial class DeportesWindow : Window
    {
        public String variable ;
        public DeportesWindow()
        {

            InitializeComponent();
            conexion_mysql.inicia_bd();
            String query_fut= "SELECT nombre_reglas_futbol AS REGLAS ,descripcion_reglas_futbol AS DESCRIPCION from REGLAS_FUTBOL";
            MySqlCommand cm = new MySqlCommand(query_fut,conexion_mysql.con_mysql);
            MySqlDataAdapter datos = new MySqlDataAdapter(cm);
            DataTable tabla = new DataTable();
            datos.Fill(tabla);
            DATA_FUT.ItemsSource = tabla.DefaultView;

            String query_bas = "SELECT nombre_reglas_BASKET AS REGLAS ,descripcion_reglas_BASKET AS DESCRIPCION from REGLAS_BASKET";
            MySqlCommand cmba = new MySqlCommand(query_bas, conexion_mysql.con_mysql);
            MySqlDataAdapter datosb = new MySqlDataAdapter(cmba);
            DataTable tablab = new DataTable();
            datosb.Fill(tablab);
            DATA_BASKET.ItemsSource = tablab.DefaultView;

            String query_bei = "SELECT nombre_reglas_beisbol AS REGLAS ,descripcion_reglas_beisbol AS DESCRIPCION from REGLAS_BEISBOL";
            MySqlCommand cmbe = new MySqlCommand(query_bei, conexion_mysql.con_mysql);
            MySqlDataAdapter datosbe = new MySqlDataAdapter(cmbe);
            DataTable tablabe = new DataTable();
            datosbe.Fill(tablabe);
            DATA_BEISBOL.ItemsSource = tablabe.DefaultView;

            String query_voi = "SELECT nombre_reglas_voleibol AS  REGLAS,descipcion_reglas_voleibol AS DESCRIPCION from REGLAS_VOLEIBOL";
            MySqlCommand cmv = new MySqlCommand(query_voi, conexion_mysql.con_mysql);
            MySqlDataAdapter datosv = new MySqlDataAdapter(cmv);
            DataTable tablav = new DataTable();
            datosv.Fill(tablav);
            DATA_VOLE.ItemsSource = tablav.DefaultView;
            conexion_mysql.terminal_bd();
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
            variable = "FUTBOL";
            VerReglasWindow ver_reglas = new VerReglasWindow();
            ver_reglas.txt_deporte.Text = variable.ToString();
            conexion_mysql.inicia_bd();

            String query_fut = "SELECT idreglas_futbol as ID,nombre_reglas_futbol AS REGLAS ,descripcion_reglas_futbol AS DESCRIPCION,DEPORTE_idDeporte AS ID_DEPORTE from REGLAS_FUTBOL";
            MySqlCommand cm = new MySqlCommand(query_fut, conexion_mysql.con_mysql);
            MySqlDataAdapter datos = new MySqlDataAdapter(cm);
            DataTable tabla = new DataTable();
            datos.Fill(tabla);
            ver_reglas.dg_mostrar_arbitros.ItemsSource = tabla.DefaultView;
            ver_reglas.Show();
            conexion_mysql.terminal_bd();
        }

        private void btn_ver_reglas_basketball_Click(object sender, RoutedEventArgs e)
        {
            variable = "BASKETBALL";
            VerReglasWindow ver_reglas = new VerReglasWindow();
            ver_reglas.txt_deporte.Text = variable.ToString();
            conexion_mysql.inicia_bd();

            String query_bas = "SELECT idreglas_basket as ID,nombre_reglas_basket AS REGLAS ,descripcion_reglas_basket AS DESCRIPCION,DEPORTE_idDeporte AS ID_DEPORTE from REGLAS_BASKET";
            MySqlCommand cmba = new MySqlCommand(query_bas, conexion_mysql.con_mysql);
            MySqlDataAdapter datosb = new MySqlDataAdapter(cmba);
            DataTable tablab = new DataTable();
            datosb.Fill(tablab);
            ver_reglas.dg_mostrar_arbitros.ItemsSource = tablab.DefaultView;
            ver_reglas.Show();
            conexion_mysql.terminal_bd();
        }

        private void btn_ver_reglas_baseball_Click(object sender, RoutedEventArgs e)
        {
            variable = "BASEBALL";
            VerReglasWindow ver_reglas = new VerReglasWindow();
            ver_reglas.txt_deporte.Text = variable.ToString();
            conexion_mysql.inicia_bd();


            String query_bei = "SELECT idreglas_beisbol as ID,nombre_reglas_beisbol AS REGLAS ,descripcion_reglas_beisbol AS DESCRIPCION,DEPORTE_idDeporte AS ID_DEPORTE from REGLAS_BEISBOL";
            MySqlCommand cmbe = new MySqlCommand(query_bei, conexion_mysql.con_mysql);
            MySqlDataAdapter datosbe = new MySqlDataAdapter(cmbe);
            DataTable tablabe = new DataTable();
            datosbe.Fill(tablabe);
            ver_reglas.dg_mostrar_arbitros.ItemsSource = tablabe.DefaultView;
            ver_reglas.Show();

            conexion_mysql.terminal_bd();
        }

        private void btn_ver_reglas_volleyball_Click(object sender, RoutedEventArgs e)
        {
            variable = "VOLLEYBALL";
            VerReglasWindow ver_reglas = new VerReglasWindow();
            ver_reglas.txt_deporte.Text = variable.ToString();
            conexion_mysql.inicia_bd();

            String query_voi = "SELECT idreglas_voleibol as ID,nombre_reglas_voleibol AS REGLAS ,descipcion_reglas_voleibol AS DESCRIPCION,DEPORTE_idDeporte AS ID_DEPORTE from REGLAS_VOLEIBOL";
            MySqlCommand cmv = new MySqlCommand(query_voi, conexion_mysql.con_mysql);
            MySqlDataAdapter datosv = new MySqlDataAdapter(cmv);
            DataTable tablav = new DataTable();
            datosv.Fill(tablav);
            ver_reglas.dg_mostrar_arbitros.ItemsSource = tablav.DefaultView;
            ver_reglas.Show();

            
            conexion_mysql.terminal_bd();
        }

        private void ComboBoxItem_Selected(object sender, RoutedEventArgs e)
        {

        }

        private void btn_agregar_regla_Click(object sender, RoutedEventArgs e)
        {
            String nombre = txt_nombre.Text;
            String regla = txt_regla.Text;
            int id_deporte=1;
            int id_deporteF = 2;
            int id_deporteB = 3;
            int id_deporteV = 4;

            conexion_mysql.inicia_bd();
            MySqlCommand cmd = conexion_mysql.con_mysql.CreateCommand();
           
            
            if (nombre == ""||regla=="")
            {
                MessageBox.Show("No puede dejar los campos vacios");
            }else
            {
                if (basket.IsSelected == true)
                {
                    cmd.CommandText = "ingresar_reglas_basket";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("nombreb", nombre).Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.AddWithValue("descripcionb", regla).Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.AddWithValue("deporteb", id_deporte).Direction = System.Data.ParameterDirection.Input;
                    cmd.ExecuteNonQuery();
                    MessageBox.Show("Se agrego regla exitosamente");
                }
                if (futbol.IsSelected == true) {
                    cmd.CommandText = "ingresar_reglas_futbol";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("nombre", nombre).Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.AddWithValue("descripcion", regla).Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.AddWithValue("deporte", id_deporteF).Direction = System.Data.ParameterDirection.Input;
                    cmd.ExecuteNonQuery();
                    
                    MessageBox.Show("Se agrego regla exitosamente");
                }
                if (beibol.IsSelected == true)
                {
                    cmd.CommandText = "ingresar_reglas_beisbol";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("nombrebe", nombre).Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.AddWithValue("descripcionbe", regla).Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.AddWithValue("deportebe", id_deporteB).Direction = System.Data.ParameterDirection.Input;
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Se agrego regla exitosamente");
                }
                if (volei.IsSelected == true)
                {
                    cmd.CommandText = "ingresar_reglas_voli";
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("nombrev", nombre).Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.AddWithValue("descripcionv", regla).Direction = System.Data.ParameterDirection.Input;
                    cmd.Parameters.AddWithValue("deportev", id_deporteV).Direction = System.Data.ParameterDirection.Input;
                    cmd.ExecuteNonQuery();

                    MessageBox.Show("Se agrego regla exitosamente");
                }
            }

            conexion_mysql.terminal_bd();
        }

        private void ComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }

        private void ComboBoxItem_Selected_1(object sender, RoutedEventArgs e)
        {

        }

        private void futbol1_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}
