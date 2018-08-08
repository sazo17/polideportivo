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
    /// Interaction logic for AgregarEntrenadorWindow.xaml
    /// </summary>
    public partial class AgregarEntrenadorWindow : Window
    {
        public AgregarEntrenadorWindow()
        {
            InitializeComponent();

            conexion_mysql.inicia_bd();

            //cantidad jugadores
            MySqlCommand cmd = conexion_mysql.con_mysql.CreateCommand();
            cmd.CommandText = "SELECT cantidad_jugadores_deporte from deporte";
            MySqlDataReader r = cmd.ExecuteReader();
            while (r.Read())
            {
                cbo_cjugadores.Items.Add(r.GetString(0));
            }
            conexion_mysql.terminal_bd();
            conexion_mysql.inicia_bd();
           
        }

        private void btn_modificar_Click(object sender, RoutedEventArgs e)
        {

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

        private void btn_agregar_entrenador_Click(object sender, RoutedEventArgs e)
        {
            String nomentre = txt_nombre.Text;
            String apeentre = txt_apellido.Text;
            String edadentre = txt_edad.Text;
            String telefonoentre = txt_tel.Text;
            String cjugadorentre = cbo_cjugadores.SelectedItem.ToString();
            String usuarioentre = txt_username.Text;
            String contraseñaentre = passbx_password.Password.ToString();
            String confirmacionentre = passbx_confirmar_password.Password.ToString();
            String direccionentre = txt_direccion.Text;
            String correoentre = txt_email.Text;


            if (nomentre == "" || apeentre == "" || edadentre == "" || telefonoentre == "" || usuarioentre == "" ||
                cjugadorentre == "" || contraseñaentre == "" || direccionentre == "" || correoentre == "" || confirmacionentre == "")
            {
                MessageBox.Show("Debe llenar todos los campos");
            }   

            else
            {
                if (contraseñaentre != confirmacionentre)
                {
                    MessageBox.Show("Contraseñas no coinciden!", "ERROR");
                }
                else
                {
                    if (chk_aceptar_terminos.IsEnabled == false)
                    {
                        MessageBox.Show("Acepte los terminos y condiciones", "ERROR");
                    }
                    else
                    {
                        try
                        {
                            MySqlCommand cmd = new MySqlCommand();
                            cmd.Connection = conexion_mysql.con_mysql;
                            cmd.CommandText = "p_entrenadores";
                            cmd.CommandType = System.Data.CommandType.StoredProcedure;
                            //nombre
                            cmd.Parameters.AddWithValue("i_nombre", nomentre).Direction = System.Data.ParameterDirection.Input;
                            //apellido
                            cmd.Parameters.AddWithValue("i_apellidos", apeentre).Direction = System.Data.ParameterDirection.Input;
                            //edad
                            cmd.Parameters.AddWithValue("i_edad", edadentre).Direction = System.Data.ParameterDirection.Input;
                            //direccion
                            cmd.Parameters.AddWithValue("i_direccion", direccionentre).Direction = System.Data.ParameterDirection.Input;
                            //telefono
                            cmd.Parameters.AddWithValue("i_telefono", telefonoentre).Direction = System.Data.ParameterDirection.Input;
                            //mail
                            cmd.Parameters.AddWithValue("i_mail", correoentre).Direction = System.Data.ParameterDirection.Input;
                            int cj = 0;
                            cj = cbo_cjugadores.SelectedIndex;
                            cj++;
                            cmd.Parameters.AddWithValue("i_deporte", cj).Direction = System.Data.ParameterDirection.Input;
                            //usuario
                            cmd.Parameters.AddWithValue("i_user", usuarioentre).Direction = System.Data.ParameterDirection.Input;
                            //contraseña
                            cmd.Parameters.AddWithValue("i_pass", contraseñaentre).Direction = System.Data.ParameterDirection.Input;
                            //estado (PREDEFINIDO 0)
                            cmd.Parameters.AddWithValue("i_estado", "1").Direction = System.Data.ParameterDirection.Input;
                            //tipo de usuario (PREDEFINIDO I)
                            cmd.Parameters.AddWithValue("i_tipo", "2").Direction = System.Data.ParameterDirection.Input;
                            //PARAMETROS DE SALIDA
                            //bit
                            String bit = "";
                            cmd.Parameters.AddWithValue("o_bit", 0).Direction = System.Data.ParameterDirection.Output;
                            cmd.ExecuteNonQuery();
                            bit = cmd.Parameters["o_bit"].Value.ToString();
                            // MessageBox.Show(bit);
                            if (bit.Equals("1"))
                            {
                                MessageBox.Show("Entrenador registrado");
                             
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show(ex.ToString());
                        }
                    }
                }
            }
        }

   
    }
}
    
