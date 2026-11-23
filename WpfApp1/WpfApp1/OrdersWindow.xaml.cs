using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Linq;
using WpfApp1.Models;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для OrdersWindow.xaml
    /// </summary>
    public partial class OrdersWindow : Window
    {
        DBContext db = new DBContext();

        private int currentRole;

        public OrdersWindow(int roleId)
        {
            InitializeComponent();
            currentRole = roleId;
            SetupPermissions();
            LoadOrders();
        }

        private void SetupPermissions()
        {
            // Если это НЕ администратор (1), скрываем кнопки добавления и удаления
            if (currentRole != 1)
            {
                btnAddOrder.Visibility = Visibility.Collapsed;
                btnDeleteOrder.Visibility = Visibility.Collapsed;
            }
        }

        private void LoadOrders()
        {
            using (var db = new DBContext())
            {
                // Загружаем все заказы. Если нужно, можно добавить сортировку по номеру.
                var ordersList = db.Orders.OrderBy(o => o.OrderNumber).ToList();
                dgOrders.ItemsSource = ordersList;
            }
        }

        private void btnAddOrder_Click(object sender, RoutedEventArgs e)
        {
            using (var db = new DBContext())
            {
                try
                {
                    int nextNumber = db.Orders.Any() ? db.Orders.Max(o => o.OrderNumber) + 1 : 1;

                    var newOrder = new Order
                    {
                        OrderNumber = nextNumber,
                        OrderItemNumber = "А112Т4, 1",
                        OrderDate = DateOnly.FromDateTime(DateTime.Now),
                        DeliveryDate = DateOnly.FromDateTime(DateTime.Now.AddDays(3)),
                        IdPickupPoint = 1,           
                        IdUser = 1,                 
                        IdReceiving = 123,          
                        IdStatus = 1                   
                    };

                    db.Orders.Add(newOrder);
                    db.SaveChanges();

                    MessageBox.Show("Заказ успешно добавлен!", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                    LoadOrders(); 
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Ошибка при добавлении: " + ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }

        private void btnDeleteOrder_Click(object sender, RoutedEventArgs e)
        {
            // Проверяем, выбран ли заказ в таблице
            if (dgOrders.SelectedItem is Order selectedOrder)
            {
                // Запрашиваем подтверждение
                var result = MessageBox.Show($"Вы уверены, что хотите удалить заказ №{selectedOrder.OrderNumber}?",
                                             "Подтверждение удаления", MessageBoxButton.YesNo, MessageBoxImage.Question);

                if (result == MessageBoxResult.Yes)
                {
                    using (var db = new DBContext())
                    {
                        try
                        {
                            // Находим заказ по ID (первичному ключу) и удаляем
                            var orderToDelete = db.Orders.Find(selectedOrder.OrderNumber);
                            if (orderToDelete != null)
                            {
                                db.Orders.Remove(orderToDelete);
                                db.SaveChanges();
                                MessageBox.Show("Заказ удален.", "Успех", MessageBoxButton.OK, MessageBoxImage.Information);
                                LoadOrders(); // Обновляем таблицу
                            }
                        }
                        catch (Exception ex)
                        {
                            MessageBox.Show("Ошибка при удалении: " + ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        }
                    }
                }
            }
            else
            {
                MessageBox.Show("Пожалуйста, выберите заказ из списка для удаления.", "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }
    }
}
