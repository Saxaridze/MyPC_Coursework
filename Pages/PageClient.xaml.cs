using MyPC.BD_MyPC;
using MyPC.Class;
using MyPC.Pages;
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
using System.Windows.Navigation;


namespace MyPC.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageClient.xaml
    /// </summary>
    public partial class PageClient : Page
    {
        MyPCEntities2 context;
        string currentLetter = "";
        public int countPages;
        public int currentPage;
        public int countRecord = 10;
        public PageClient()
        {
            InitializeComponent();
            ShowLetters();
            context = new MyPCEntities2();
            DataClient.ItemsSource = context.Clients.Take(countRecord).ToList();
            countPages = context.Clients.Count() / 10;
            currentPage = 1;
            CurrentPage.Text = currentPage + " из " + countPages;
            ShowTable();
        }
        public void ShowTable()
        {
            if (TxtName.Text == null && TxtContactData.Text == null)
                return;

            List<Client> clients = context.Clients.ToList();

            if (cmbSelectCount.SelectedIndex == 3)
            {
                clients = context.Clients.ToList();
                countPages = 1;
            }
            if (TxtName.Text != "")
            {
                clients = clients.Where(x => x.FirstName.ToLower().Contains(TxtName.Text.ToLower())
                                                || x.LastName.ToLower().Contains(TxtName.Text.ToLower())
                                                || x.Patronymic.ToLower().Contains(TxtName.Text.ToLower())).ToList();
            }
            if (TxtContactData.Text != "")
            {
                clients = clients.Where(x => x.ContactData.Contains(TxtContactData.Text)).ToList();
            }

            if (currentLetter.Count() == 1)
            {
                clients = clients.Where(x => x.LastName.Contains(currentLetter)).ToList();
            }
            clients = clients.Skip(currentPage * countRecord - countRecord).Take(countRecord).ToList();
            countPages = context.Clients.Count() / countRecord;
            setEnableButtons();
            CurrentPage.Text = currentPage + " из " + countPages;
            DataClient.ItemsSource = clients;
        }
        public void ShowLetters()
        {
            for (char i = 'А'; i <= 'Я'; i++)
            {
                TextBlock letter = new TextBlock
                {
                    Text = i.ToString(),
                    FontWeight = FontWeights.Bold,
                    Foreground = Brushes.White,
                    Margin = new Thickness(10, 0, 0, 0)
                };
                letter.MouseLeftButtonDown += TextBlock_MouseLeftButtonDown;
                StackLetters.Children.Add(letter);
            }
        }

        private void BtnDeleteClient_Click(object sender, RoutedEventArgs e)
        {
            var f1 = DataClient.SelectedItems.Cast<Client>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {f1.Count()} элементов?", "Внимание", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
            {
                try
                {
                    MyPCEntities2.GetContext().Clients.RemoveRange(f1);
                    MyPCEntities2.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");

                    DataClient.ItemsSource = MyPCEntities2.GetContext().Clients.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void BtnAddClient_Click(object sender, RoutedEventArgs e)
        {
            Meneger.MainFraim.Navigate(new PageAddClient(new Client()));

        }

        private void BtnEditClient_Click(object sender, RoutedEventArgs e)
        {
            Meneger.MainFraim.Navigate(new PageAddClient((sender as Button).DataContext as Client));
        }

        private void TextBlock_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            var label = (TextBlock)sender;
            currentLetter = label.Text;
            foreach (TextBlock letter in StackLetters.Children)
            {
                letter.Foreground = Brushes.White;
            }
            label.Foreground = Brushes.Gold;
            ShowTable();
        }
        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                MyPCEntities2.GetContext().ChangeTracker.Entries().ToList().ForEach(p => p.Reload());
                DataClient.ItemsSource = MyPCEntities2.GetContext().Clients.ToList();
            }
        }

        private void TxtContactData_TextChanged(object sender, TextChangedEventArgs e)
        {
            ShowTable();
        }

        private void TxtName_TextChanged(object sender, TextChangedEventArgs e)
        {
            ShowTable();
        }

        private void showRecord_Click(object sender, RoutedEventArgs e)
        {
            setEnableButtons();
            ShowTable();
        }

        private void cmbSelectCount_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            currentPage = 1;
            MyPCEntities2 context1 = new MyPCEntities2();

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
                    countRecord = context1.Clients.Count();
                    countPages = 1;
                    break;
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
