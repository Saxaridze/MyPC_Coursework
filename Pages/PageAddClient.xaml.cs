using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
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
    /// Логика взаимодействия для PageAddClient.xaml
    /// </summary>
    public partial class PageAddClient : Page
    {
        private Client currentClient = new Client();
        bool isEdited = false;
        private Client Client { get; set; }

        public PageAddClient(Client client)
        {
            InitializeComponent();
            Client = client;
            currentClient = client;
            isEdited = true;
            DataContext = currentClient;
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            //сообщения об вводимых значениях
            if (string.IsNullOrWhiteSpace(currentClient.LastName))
                errors.AppendLine("Укажите Фамилию");
            if (string.IsNullOrWhiteSpace(currentClient.FirstName))
                errors.AppendLine("Укажите Имя");
            if (string.IsNullOrWhiteSpace(currentClient.Patronymic))
                errors.AppendLine("Укажите Отчество");
            if (string.IsNullOrWhiteSpace(currentClient.ContactData))
                errors.AppendLine("Укажите Контакт");
            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }
            if (isEdited)
            {
                //добавление данных в БД таблицу Client
                currentClient.ID = MyPCEntities2.GetContext().Clients.ToArray()[MyPCEntities2.GetContext().Clients.ToArray().Length - 1].ID;
                MyPCEntities2.GetContext().Clients.Add(currentClient);
            }
            try
            {
                //сообщение об добавленных данных
                MyPCEntities2.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена!");
                Meneger.MainFraim.GoBack();
            }
            catch (DbUpdateException dbu)
            {
                //сообщение об ошибке
                MessageBox.Show("Ошибка метода SaveChanges\n" + dbu.Message.ToString());
                var exception = HandleDbUpdateException(dbu);
                throw exception;
            }
        }
        private Exception HandleDbUpdateException(DbUpdateException dbu)
        {
            var builder = new StringBuilder("A DbUpdateException was caught while saving changes. ");

            try
            {
                foreach (var result in dbu.Entries)
                {
                    builder.AppendFormat("Type: {0} was part of the problem. ", result.Entity.GetType().Name);
                }
            }
            catch (Exception e)
            {
                builder.Append("Error parsing DbUpdateException: " + e.ToString());
            }

            string message = builder.ToString();
            return new Exception(message, dbu);
        }
    }
}
