using WpfApp1.Models;
using System.Text;
using System.Linq;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        DBContext db = new DBContext();

        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            string login = txtLogin.Text.Trim();
            string password = txtPassword.Password.Trim();

            using (var db = new DBContext()) 
            {
                // Ищем пользователя в базе
                var user = db.Users.FirstOrDefault(u => u.Login == login && u.Password == password);

                if (user != null)
                {
                    // Передаем роль (ID) и ФИО в главное окно товаров
                    ProductsWindow productsWin = new ProductsWindow(user.IdRole, user.Fio);
                    productsWin.Show();
                    this.Close();
                }
                else
                {
                    lblError.Text = "Неверный логин или пароль!";
                    lblError.Visibility = Visibility.Visible;
                }
            }
        }

        private void btnGuest_Click(object sender, RoutedEventArgs e)
        {
            // Роль 0 (Гость) и имя "Гость"
            ProductsWindow productsWin = new ProductsWindow(0, "Гость");
            productsWin.Show();
            this.Close();
        }
    }
}