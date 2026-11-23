using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using WpfApp1.Models;
using SixLabors.ImageSharp;
using SixLabors.ImageSharp.PixelFormats;
using System.IO;
using Path = System.IO.Path;

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для ProductsWindow.xaml
    /// </summary>
    public partial class ProductsWindow : Window
    {
        DBContext db = new DBContext();

        private int currentRole;
        private string currentUser;

        public ProductsWindow(int roleId, string fio)
        {
            InitializeComponent();
            currentRole = roleId;
            currentUser = fio;
            lblUser.Text = fio;
            LoadProducts();
            SetupPermissions();
        }

        private void SetupPermissions()
        {
            if (currentRole == 1) // Админ
            {
                pnlFilters.Visibility = Visibility.Visible;
                btnAdd.Visibility = Visibility.Visible;
                btnDelete.Visibility = Visibility.Visible;
                btnOrders.Visibility = Visibility.Visible;
            }
            else if (currentRole == 2) // Менеджер
            {
                pnlFilters.Visibility = Visibility.Visible;
                btnAdd.Visibility = Visibility.Collapsed;
                btnDelete.Visibility = Visibility.Collapsed;
                btnOrders.Visibility = Visibility.Visible;
            }
            // Гость и Клиент ничего не видят, кроме таблицы
        }

        private void LoadProducts()
        {
            using (var db = new DBContext())
            {
                // Загружаем с Include (чтобы подтянулись названия категорий и производителей)
                var query = db.Nomenclatures
                    .Include(n => n.IdCategoryProductNavigation)
                    .Include(n => n.IdManufacturerNavigation)
                    .Include(n => n.IdProviderNavigation)
                    .Include(n => n.IdMeasureNavigation)
                    .AsQueryable();

                // Поиск
                if (!string.IsNullOrWhiteSpace(txtSearch.Text))
                    query = query.Where(n => n.ProductName.Contains(txtSearch.Text));

                // Фильтр по скидке
                if (cbFilter.SelectedIndex == 1) query = query.Where(n => n.CurrentDiscount <= 12.99);
                else if (cbFilter.SelectedIndex == 2) query = query.Where(n => n.CurrentDiscount >= 13 && n.CurrentDiscount <= 16.99);
                else if (cbFilter.SelectedIndex == 3) query = query.Where(n => n.CurrentDiscount >= 17);

                // Сортировка
                if (cbSort.SelectedIndex == 0) query = query.OrderBy(n => n.Price);
                else if (cbSort.SelectedIndex == 1) query = query.OrderByDescending(n => n.Price);
                else if (cbSort.SelectedIndex == 2) query = query.OrderBy(n => n.QuantityInStock);
                else if (cbSort.SelectedIndex == 3) query = query.OrderByDescending(n => n.QuantityInStock);

                // Формируем список для отображения
                var items = query.ToList().Select(n => new ProductViewModel
                {
                    ArticleNumber = n.ArticleNumber,
                    ProductName = n.ProductName,
                    CategoryName = n.IdCategoryProductNavigation?.ProductCategory1,
                    Description = n.Description,
                    ManufacturerName = n.IdManufacturerNavigation?.Manufacture1,
                    ProviderName = n.IdProviderNavigation?.Provider1,
                    OldPrice = n.Price,
                    CurrentDiscount = n.CurrentDiscount,
                    MeasureName = n.IdMeasureNavigation?.Measure1,
                    QuantityInStock = n.QuantityInStock,
                    PhotoPath = n.Photo
                }).ToList();


                // Привязываем к ItemsControl
                icProducts.ItemsSource = items;
            }
        }

        // Поиск и фильтры
        private void txtSearch_TextChanged(object sender, TextChangedEventArgs e) => LoadProducts();
        private void cbSort_SelectionChanged(object sender, SelectionChangedEventArgs e) => LoadProducts();
        private void cbFilter_SelectionChanged(object sender, SelectionChangedEventArgs e) => LoadProducts();

        // Кнопка удаления
        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            // Вместо dgProducts.SelectedItem теперь используем icProducts.SelectedItem
            if (icProducts.SelectedItem is ProductViewModel selected)
            {
                using (var db = new DBContext())
                {
                    // Проверка: есть ли товар в заказах (ищем по артикулу)
                    bool inOrder = db.Orders.Any(o => o.OrderItemNumber.Contains(selected.ArticleNumber));
                    if (inOrder)
                    {
                        MessageBox.Show("Товар нельзя удалить, он есть в заказе.", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                        return;
                    }

                    if (MessageBox.Show("Удалить товар?", "Подтверждение", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                    {
                        // Находим товар в базе по артикулу и удаляем
                        var toDelete = db.Nomenclatures.FirstOrDefault(n => n.ArticleNumber == selected.ArticleNumber);
                        if (toDelete != null)
                        {
                            db.Nomenclatures.Remove(toDelete);
                            db.SaveChanges();
                        }
                        LoadProducts(); // Обновляем список
                    }
                }
            }
            else
            {
                MessageBox.Show("Выберите товар для удаления!", "Внимание", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            ProductEditWindow editWin = new ProductEditWindow();
            if (editWin.ShowDialog() == true) LoadProducts();
        }

        // Кнопка заказов
        private void btnOrders_Click(object sender, RoutedEventArgs e)
        {
            OrdersWindow ordersWin = new OrdersWindow(currentRole);
            ordersWin.ShowDialog();
        }

        // Выход
        private void btnLogout_Click(object sender, RoutedEventArgs e)
        {
            MainWindow loginWin = new MainWindow();
            loginWin.Show();
            this.Close();
        }

        private void dgProducts_LoadingRow(object sender, DataGridRowEventArgs e)
        {
            var item = e.Row.Item as ProductViewModel;
            if (item == null) return;

            // По умолчанию фон белый
            e.Row.Background = Brushes.White;

            // 1. Если скидка > 25% -> бирюзовый фон 
            if (item.CurrentDiscount > 25)
            {
                // RGB: 35, 225, 239
                e.Row.Background = new SolidColorBrush(System.Windows.Media.Color.FromRgb(35, 225, 239));
            }

            // 2. Если товара нет на складе -> серый фон 
            if (item.QuantityInStock == 0)
            {
                e.Row.Background = Brushes.LightGray;
            }
        }
        private void ProductCard_Click(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            // Запоминаем выбранный элемент
            if (sender is FrameworkElement element && element.DataContext is ProductViewModel prod)
            {
                icProducts.SelectedItem = prod;
            }
        }

        public class ProductViewModel
        {
            public string ArticleNumber { get; set; }
            public string ProductName { get; set; }
            public string CategoryName { get; set; }
            public string Description { get; set; }
            public string ManufacturerName { get; set; }
            public string ProviderName { get; set; }
            public decimal OldPrice { get; set; }
            public decimal FinalPrice => OldPrice - (OldPrice * CurrentDiscount / 100);
            public bool HasDiscount => CurrentDiscount > 0;
            public int CurrentDiscount { get; set; }
            public string MeasureName { get; set; }
            public int QuantityInStock { get; set; }
            public string PhotoPath { get; set; }
            public bool IsBigDiscount => CurrentDiscount > 25;

            public BitmapImage ProductImage
            {
                get
                {
                    string imgDir = Path.Combine(AppDomain.CurrentDomain.BaseDirectory, "Images");
                    string fullPath = string.IsNullOrWhiteSpace(PhotoPath)
                        ? ""
                        : Path.Combine(imgDir, PhotoPath.Trim());

                    if (string.IsNullOrEmpty(fullPath) || !File.Exists(fullPath))
                    {
                        fullPath = Path.Combine(imgDir, "picture.png");
                    }

                    if (!File.Exists(fullPath)) return null;

                    try
                    {
                        // Загружаем изображение через ImageSharp (поддерживает WebP, JPG, PNG и др.)
                        using (var image = SixLabors.ImageSharp.Image.Load<Rgba32>(fullPath))
                        using (var ms = new MemoryStream())
                        {
                            SixLabors.ImageSharp.ImageExtensions.SaveAsPng(image, ms);
                            ms.Position = 0;

                            BitmapImage bitmap = new BitmapImage();
                            bitmap.BeginInit();
                            bitmap.CacheOption = BitmapCacheOption.OnLoad;
                            bitmap.StreamSource = ms;
                            bitmap.EndInit();
                            bitmap.Freeze();
                            return bitmap;
                        }
                    }
                    catch
                    {
                        return null;
                    }
                }
            }

        }



    }
}
