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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MyPC.Pages
{
    /// <summary>
    /// Логика взаимодействия для PageLogin.xaml
    /// </summary>
    public partial class PageLogin : Page
    {
        static string login = "admin";
        static string password = "1234";
        public PageLogin()
        {
            InitializeComponent();
            
        }
        
            private void BtnVxod_Click(object sender, RoutedEventArgs e)
        {
            if (TxtLogin.Text == login && TxtPassword.Password == password)
            {
                MessageBox.Show("Добро пожаловать, Администратор");
                Meneger.MainFraim.Navigate(new PageMain());
            }
            else
                MessageBox.Show("Не получилось аутентифицировать пользователя. Введены некорректные имя аккаунта или пароль");
        }

        private void BtnOtmena_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}
