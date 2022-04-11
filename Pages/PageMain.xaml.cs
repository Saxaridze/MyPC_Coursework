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
using System.Windows.Navigation;
using System.Windows.Shapes;
using MyPC.BD_MyPC;
using MyPC.Class;
using MyPC.Pages;

namespace MyPC.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageMain.xaml
    /// </summary>
    public partial class PageMain : Page
    {
        public PageMain()
        {
            InitializeComponent();
        }
        public List<Repair> repairs;
        private void BtnRepair_Click(object sender, RoutedEventArgs e)
        {
            Meneger.MainFraim.Navigate(new PageRepair());
        }

        private void BtnClient_Click(object sender, RoutedEventArgs e)
        {
            Meneger.MainFraim.Navigate(new PageClient());
        }

        private void BtnStatistics_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnDirectory_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
