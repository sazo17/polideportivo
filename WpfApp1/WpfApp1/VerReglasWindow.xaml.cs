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
    /// Interaction logic for VerReglasWindow.xaml
    /// </summary>
    public partial class VerReglasWindow : Window
    {
        public VerReglasWindow()
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

        private void Button_Click(object sender, RoutedEventArgs e)
        {

            String txt;
            String nom=txt_deporte.Text.ToString();
            
            if (nom== "FUTBOL")
            {
               
                    conexion_mysql.start_bd();
                }
            }
           
            /*if (txt=="FUTBOL") {
             * txt = txt_deporte.ToString();
            ModificarReglaWindow modificar_regla = new ModificarReglaWindow();
                MessageBox.Show("HOLA");
                nom = "FUTBOL";
                modificar_regla.txt_nombre.Text = nom.ToString();
                conexion_mysql.inicia_bd();

                String query_fut = "SELECT idreglas_futbol as ID,nombre_reglas_futbol AS REGLAS ,descripcion_reglas_futbol AS DESCRIPCION,DEPORTE_idDeporte AS ID_DEPORTE from REGLAS_FUTBOL";
                MySqlCommand cm = new MySqlCommand(query_fut, conexion_mysql.con_mysql);
                MySqlDataAdapter datos = new MySqlDataAdapter(cm);
                DataTable tabla = new DataTable();
                datos.Fill(tabla);
                modificar_regla.txt_regla.ItemsSource = tabla.DefaultView;
                modificar_regla.Show();
                conexion_mysql.terminal_bd();
            }*/


        }

        private void txt_deporte_TextChanged(object sender, TextChangedEventArgs e)
        {

        }
    }
}
