﻿using System;
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
    /// Interaction logic for EntrenadorWindow.xaml
    /// </summary>
    public partial class EntrenadorWindow : Window
    {
        public String id_entrenadores;
        public EntrenadorWindow()
        {
            InitializeComponent();
            conexion_mysql.inicia_bd();
            String insertardatagrid = "select * from entrenadores";
            MySqlCommand cmd = new MySqlCommand(insertardatagrid, conexion_mysql.con_mysql);
            DataTable tabla = new DataTable();
            MySqlDataAdapter data = new MySqlDataAdapter(cmd);
            data.Fill(tabla);
            dg_entrenadores.ItemsSource = tabla.DefaultView;
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
            AgregarEntrenadorWindow entrenador = new AgregarEntrenadorWindow();
            entrenador.Show();
        }

        private void btn_modificar_entrenador_Click(object sender, RoutedEventArgs e)
        {
            if (dg_entrenadores.SelectedItem == null)
            {
                MessageBox.Show("Seleccione un entrenador", "Entrenadores");
            }
            else
            {
                VerEntrenadorWindow entrenador = new VerEntrenadorWindow(id_entrenadores);
                entrenador.Show();
                this.Close();


            }
            
        }

        private void dg_entrenadores_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataRowView dv = (DataRowView)dg_entrenadores.SelectedItem;
            if (dv != null)
            {
                id_entrenadores = dv.Row.ItemArray[0].ToString();
            }
            


            }
        }
    }

