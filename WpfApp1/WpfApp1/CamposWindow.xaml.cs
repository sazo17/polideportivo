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
    /// Interaction logic for CamposWindow.xaml
    /// </summary>
    public partial class CamposWindow : Window
    {
        public string[,] campos_data = new string[5, 4];
        public int seleccion = 0;
        public CamposWindow()
        {
            InitializeComponent();            
            int x=0, y = 0;

            conexion_mysql.start_bd();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = conexion_mysql.con_mysql;
            cmd.CommandText = "SELECT campo_campos, fotorafia_campos, ancho_campos, largo_campos FROM campos";
            MySqlDataReader r = cmd.ExecuteReader();

            for(x=0; x<5; x++)
            {
                r.Read();
                for(y=0; y<4; y++)
                {
                    campos_data[x, y] = r.GetString(y);
                }
            }

            ImageBrush imagen = new ImageBrush();
            imagen.ImageSource = new BitmapImage(new Uri(@"./polideportivo_images/campos/"+campos_data[0,1], UriKind.Relative));
            rectangle_campo.Fill = imagen;
            txt_nombre.Text = campos_data[0, 0];
            txt_ancho.Text = campos_data[0, 2];
            txt_largo.Text = campos_data[0, 3];

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

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        public void CambioImagenSig()
        {
            seleccion++;
            if (seleccion == 5)
            {
                seleccion = 0;
            }
            
            ImageBrush imagen = new ImageBrush();
            imagen.ImageSource = new BitmapImage(new Uri(@"./polideportivo_images/campos/" + campos_data[seleccion, 1], UriKind.Relative));
            rectangle_campo.Fill = imagen;
            txt_nombre.Text = campos_data[seleccion, 0];
            txt_ancho.Text = campos_data[seleccion, 2];
            txt_largo.Text = campos_data[seleccion, 3];

        }

        public void CambioImagenAnt()
        {
            seleccion--;
            if (seleccion < 0)
            {
                seleccion = 4;
            }

            ImageBrush imagen = new ImageBrush();
            imagen.ImageSource = new BitmapImage(new Uri(@"./polideportivo_images/campos/" + campos_data[seleccion, 1], UriKind.Relative));
            rectangle_campo.Fill = imagen;
            txt_nombre.Text = campos_data[seleccion, 0];
            txt_ancho.Text = campos_data[seleccion, 2];
            txt_largo.Text = campos_data[seleccion, 3];

        }

        private void lbl_siguiente_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            CambioImagenSig();
        }

        private void lbl_anterior_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            CambioImagenAnt();
        }
    }
}
