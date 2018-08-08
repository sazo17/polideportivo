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
        public String id;
        public String nombreR;
        public String Desc;
        public String idd;
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
        private void dg_mostrar_arbitros_SelectedCellsChanged(object sender, SelectedCellsChangedEventArgs e)
        {
            DataRowView dv = (DataRowView)dg_mostrar_arbitros.SelectedItem;
            if (dv != null)
            {
                id = dv.Row.ItemArray[0].ToString();
                nombreR = dv.Row.ItemArray[1].ToString();
                Desc = dv.Row.ItemArray[2].ToString();
                idd = dv.Row.ItemArray[3].ToString();
            }
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            
    
            String nom=txt_deporte.Text.ToString();
            if (nom=="FUTBOL")
            {
                DataRowView dv = (DataRowView)dg_mostrar_arbitros.SelectedItem;
                if (dv != null)
                {
                    id = dv.Row.ItemArray[0].ToString();
                    nombreR = dv.Row.ItemArray[1].ToString();
                    Desc = dv.Row.ItemArray[2].ToString();
                    try
                    {

                        conexion_mysql.start_bd();
                        MySqlCommand DropR = conexion_mysql.con_mysql.CreateCommand();
                        DropR.Connection = conexion_mysql.con_mysql;
                        DropR.CommandText = "UPDATE REGLAS_FUTBOL SET idreglas_futbol=@idregla, nombre_reglas_futbol=@nomregla, descripcion_reglas_futbol=@des " +
                            " WHERE (idreglas_futbol=@idregla)";

                        DropR.Parameters.AddWithValue("@idregla", id);
                        DropR.Parameters.AddWithValue("@nomregla", nombreR);
                        DropR.Parameters.AddWithValue("@des", Desc);

                        DropR.ExecuteNonQuery();




                        MessageBox.Show("regla modificado exitosamente", "regla", MessageBoxButton.OK);
                        this.Close();
                        conexion_mysql.terminal_bd();

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.ToString());
                    }
                }
                else
                {
                    MessageBox.Show("SELECCIONE EL DATO A MODIFICAR Y CAMBIELO");
                }
            }
            
            
            if (nom== "BASKETBALL")
            {
                DataRowView dv = (DataRowView)dg_mostrar_arbitros.SelectedItem;
                if (dv != null)
                {
                    id = dv.Row.ItemArray[0].ToString();
                    nombreR = dv.Row.ItemArray[1].ToString();
                    Desc = dv.Row.ItemArray[2].ToString();
                    try
                    {

                        conexion_mysql.start_bd();
                        MySqlCommand DropR = conexion_mysql.con_mysql.CreateCommand();
                        DropR.Connection = conexion_mysql.con_mysql;
                        DropR.CommandText = "UPDATE REGLAS_BASKET SET idreglas_basket=@idregla, nombre_reglas_basket=@nomregla, descripcion_reglas_basket=@des" +
                            " WHERE (idreglas_basket=@idregla)";

                        DropR.Parameters.AddWithValue("@idregla", id);
                        DropR.Parameters.AddWithValue("@nomregla", nombreR);
                        DropR.Parameters.AddWithValue("@des", Desc);

                        DropR.ExecuteNonQuery();




                        MessageBox.Show("regla modificado exitosamente", "regla", MessageBoxButton.OK);
                        this.Close();
                        conexion_mysql.terminal_bd();

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.ToString());
                    }
                }
                else
                {
                    MessageBox.Show("SELECCIONE EL DATO A MODIFICAR Y CAMBIELO");
                }
                
            }

          if(nom== "BASEBALL")
            {
                DataRowView dv = (DataRowView)dg_mostrar_arbitros.SelectedItem;
                if (dv != null)
                {
                    id = dv.Row.ItemArray[0].ToString();
                    nombreR = dv.Row.ItemArray[1].ToString();
                    Desc = dv.Row.ItemArray[2].ToString();
                    try
                    {

                        conexion_mysql.start_bd();
                        MySqlCommand DropR = conexion_mysql.con_mysql.CreateCommand();
                        DropR.Connection = conexion_mysql.con_mysql;
                        DropR.CommandText = "UPDATE REGLAS_BEISBOL SET idreglas_beisbol=@idregla, nombre_reglas_beisbol=@nomregla, descripcion_reglas_beisbol=@des " +
                            " WHERE (idreglas_beisbol=@idregla)";

                        DropR.Parameters.AddWithValue("@idregla", id);
                        DropR.Parameters.AddWithValue("@nomregla", nombreR);
                        DropR.Parameters.AddWithValue("@des", Desc);

                        DropR.ExecuteNonQuery();




                        MessageBox.Show("regla modificado exitosamente", "regla", MessageBoxButton.OK);
                        this.Close();
                        conexion_mysql.terminal_bd();

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.ToString());
                    }
                }
                else
                {
                    MessageBox.Show("SELECCIONE EL DATO A MODIFICAR Y CAMBIELO");
                }
            }
            if (nom== "VOLLEYBALL")
            {
                DataRowView dv = (DataRowView)dg_mostrar_arbitros.SelectedItem;
                if (dv != null)
                {
                    id = dv.Row.ItemArray[0].ToString();
                    nombreR = dv.Row.ItemArray[1].ToString();
                    Desc = dv.Row.ItemArray[2].ToString();
                    try
                    {

                        conexion_mysql.start_bd();
                        MySqlCommand DropR = conexion_mysql.con_mysql.CreateCommand();
                        DropR.Connection = conexion_mysql.con_mysql;
                        DropR.CommandText = "UPDATE REGLAS_VOLEIBOL SET idreglas_voleibol=@idregla, nombre_reglas_voleibol=@nomregla, descipcion_reglas_voleibol=@des " +
                            " WHERE (idreglas_voleibol=@idregla)";

                        DropR.Parameters.AddWithValue("@idregla", id);
                        DropR.Parameters.AddWithValue("@nomregla", nombreR);
                        DropR.Parameters.AddWithValue("@des", Desc);

                        DropR.ExecuteNonQuery();




                        MessageBox.Show("regla modificado exitosamente", "regla", MessageBoxButton.OK);
                        this.Close();
                        conexion_mysql.terminal_bd();

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.ToString());
                    }
                }
                else
                {
                    MessageBox.Show("SELECCIONE EL DATO A MODIFICAR Y CAMBIELO");
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
