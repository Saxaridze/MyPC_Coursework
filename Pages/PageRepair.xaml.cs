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
    /// Логика взаимодействия для PageRepair.xaml
    /// </summary>
    public partial class PageRepair : Page
    {
        MyPCEntities2 context;
        public int countPages;
        public int currentPage;
        public int countRecord = 10;
        public PageRepair()
        {
            InitializeComponent();
            context = new MyPCEntities2();
            DataRepair.ItemsSource = context.Repairs.Take(countRecord).ToList();
            countPages = context.Repairs.Count() / 10;
            currentPage = 1;
            CurrentPage.Text = currentPage + " из " + countPages;
            CmbMaster.ItemsSource = context.Masters.ToList();
            CmbTypeDevice.ItemsSource = context.TypeDevices.ToList();
            ShowTable();
        }
        public void ShowTable()
        {
            if (CmbMaster.SelectedItem == null && CmbTypeDevice.SelectedItem == null && TxtClient.Text == null && TxtWordOrder.Text == null && DatePicDateEvent.SelectedDate == null)
                return;
            var master = CmbMaster.SelectedItem as Master;
            var typeDevice = CmbTypeDevice.SelectedItem as TypeDevice;
            
            List<Repair> repairs = context.Repairs.ToList();

            if (cmbSelectCount.SelectedIndex == 3)
            {
                repairs = context.Repairs.ToList();
                countPages = 1;
            }
            


            repairs = repairs.Skip(currentPage * countRecord - countRecord).Take(countRecord).ToList();
            countPages = context.Repairs.Count() / countRecord;
            setEnableButtons();
            CurrentPage.Text = currentPage + " из " + countPages;
            DataRepair.ItemsSource = repairs;
        }

        private void BtnEditRepair_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnAddRepair_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnDeleteRepair_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnOrder_Click(object sender, RoutedEventArgs e)
        {

        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                MyPCEntities2.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DataRepair.ItemsSource = MyPCEntities2.GetContext().Repairs.ToList();
            }
        }

        private void cmbSelectCount_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            currentPage = 1;
            MyPCEntities2 context2 = new MyPCEntities2();

            switch (cmbSelectCount.SelectedIndex)
            {
                case 0:
                    countRecord = 10;

                    break;
                case 1:
                    countRecord = 50;

                    break;
                case 2:

                    countRecord = 200;
                    break;
                default:
                    countRecord = context2.Clients.Count();
                    countPages = 1;
                    break;
            }
        }

        private void showRecord_Click(object sender, RoutedEventArgs e)
        {

        }

        private void CmbMaster_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            currentPage = 1;
            ShowTable();
        }

        private void CmbTypeDevice_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            currentPage = 1;
            ShowTable();
        }

        private void TxtClient_TextChanged(object sender, TextChangedEventArgs e)
        {
            ShowTable();
        }

        private void TxtWordOrder_TextChanged(object sender, TextChangedEventArgs e)
        {
            ShowTable();
        }

        private void PrevPage_Click(object sender, RoutedEventArgs e)
        {
            if (currentPage > 1 && currentPage <= countPages)
            {
                currentPage--;
                ShowTable();
                NextPage.IsEnabled = true;
                if (currentPage == 1)
                {
                    PrevPage.IsEnabled = false;
                }
            }
        }

        private void NextPage_Click(object sender, RoutedEventArgs e)
        {
            if (currentPage < countPages)
            {
                currentPage++;
                ShowTable();
                PrevPage.IsEnabled = true;
                if (currentPage == countPages)
                {
                    NextPage.IsEnabled = false;
                }
            }
        }   

        private void setEnableButtons()
        {
            if (countPages == 1 || countPages == 0)
            {
                PrevPage.IsEnabled = false;
                NextPage.IsEnabled = false;
                countPages = 1;
            }
            else
            {
                PrevPage.IsEnabled = true;
                NextPage.IsEnabled = true;
            }
        }
    }
}
