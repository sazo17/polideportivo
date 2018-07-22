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

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for TorneosWindow.xaml
    /// </summary>
    public partial class TorneosWindow : Window
    {
        public TorneosWindow()
        {
            InitializeComponent();
        }

        private void btn_liga_Click(object sender, RoutedEventArgs e)
        {
            LigaWindow liga = new LigaWindow();
            liga.Show();
        }

        private void btn_liga_con_eliminatorias_Click(object sender, RoutedEventArgs e)
        {
            LigaConEliminatoriasWindow liga_con_eliminatorias = new LigaConEliminatoriasWindow();
            liga_con_eliminatorias.Show();
        }

        private void btn_eliminatorias_Click(object sender, RoutedEventArgs e)
        {
            EliminatoriasWindow eliminatorias = new EliminatoriasWindow();
            eliminatorias.Show();
        }
    }
}
