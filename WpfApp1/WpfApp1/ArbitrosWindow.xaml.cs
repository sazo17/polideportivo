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
    /// </summary>_

    public partial class ArbitrosWindow : Window
    {
        public String id_arbitro;
        public ArbitrosWindow()
        {
            InitializeComponent();
            conexion_mysql.start_bd();

            String query_datagrid= "SELECT idArbitro, nombre_arbitro, apellido_arbitro, edad_arbitro, direccion_arbitro, telefono_arbitro, email_arbitro FROM arbitro";

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

        private void dg_arbitros_SelectedCellsChanged(object sender, SelectedCellsChangedEventArgs e)
        {
            DataRowView dv = (DataRowView)dg_arbitros.SelectedItem;
            if (dv != null)
            {
                id_arbitro = dv.Row.ItemArray[0].ToString();
            }

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
            
            if (dg_arbitros.SelectedItem == null)
            {
                MessageBox.Show("Seleccione un arbitro", "Arbitros");
            }else
            {
                VerArbitroWindow ver_arbitro = new VerArbitroWindow(id_arbitro);
                ver_arbitro.Show();
                this.Close();
                

            }
            
        }

        private void btn_eliminar_arbitro_Click(object sender, RoutedEventArgs e)
        {
            if (dg_arbitros.SelectedItem == null)
            {
                MessageBox.Show("Seleccione un arbitro", "ERROR");

            }else
            {
                try
                {
                    //OBTENIENDO ID PARA ELIMINAR
                    conexion_mysql.terminal_bd();
                    conexion_mysql.start_bd();
                    MySqlCommand eliminar = conexion_mysql.con_mysql.CreateCommand();
                    eliminar.Connection = conexion_mysql.con_mysql;
                    eliminar.CommandText = "SELECT idArbitro, idTipo_Arbitro, idUsuarios from arbitro where (idArbitro = @idArbitro)";
                    eliminar.Parameters.AddWithValue("@idArbitro", id_arbitro);
                    MySqlDataReader r = eliminar.ExecuteReader();

                    r.Read();
                    int idArbitro = r.GetInt16(0);
                    int tipoArbitro = r.GetInt16(1);
                    int idUsuario = r.GetInt16(2);

                    //ELIMINANDO ARBITRO
                    conexion_mysql.terminal_bd();
                    conexion_mysql.start_bd();
                    MySqlCommand dropArbitro = conexion_mysql.con_mysql.CreateCommand();
                    dropArbitro.Connection = conexion_mysql.con_mysql;
                    dropArbitro.CommandText = "delete from arbitro where (idArbitro = @idArbitro) and (idTipo_Arbitro=@tipo)";
                    dropArbitro.Parameters.AddWithValue("@idArbitro", idArbitro);
                    dropArbitro.Parameters.AddWithValue("@tipo", tipoArbitro);
                    MySqlDataReader dropArb = dropArbitro.ExecuteReader();

                    //ELIMINANDO USUARIO
                    conexion_mysql.terminal_bd();
                    conexion_mysql.start_bd();
                    MySqlCommand dropUsuario = conexion_mysql.con_mysql.CreateCommand();
                    dropUsuario.Connection = conexion_mysql.con_mysql;
                    dropUsuario.CommandText = "delete from usuarios where (idUsuarios = @idUsuario)";
                    dropUsuario.Parameters.AddWithValue("@idUsuario", idUsuario);
                    MySqlDataReader dropUser = dropUsuario.ExecuteReader();

                    MessageBox.Show("Arbitro eliminado exitosamente", "Arbitros", MessageBoxButton.OK);
                    this.Close();

                    ArbitrosWindow a = new ArbitrosWindow();
                    a.Show();

                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.ToString());
                }

            }
            
        }
    }
}

