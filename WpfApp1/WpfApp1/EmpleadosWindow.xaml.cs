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

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for EmpleadosWindow.xaml
    /// </summary>
    public partial class EmpleadosWindow : Window
    {
        public EmpleadosWindow()
        {
            InitializeComponent();
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

        private void btn_agregar_empleados_Click(object sender, RoutedEventArgs e)
        {
            AgregarEmpleadoWindow agregar_empleado = new AgregarEmpleadoWindow();
            agregar_empleado.Show();
        }

        private void btn_modificar_empleados_Click(object sender, RoutedEventArgs e)
        {
            VerEmpleadoWindow ver_empleado = new VerEmpleadoWindow();
            ver_empleado.Show();
        }
    }
}

