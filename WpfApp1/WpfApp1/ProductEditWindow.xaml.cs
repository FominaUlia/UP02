using Microsoft.Win32;
using System.IO;
using System;
using System.Collections.Generic;
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

namespace WpfApp1
{
    /// <summary>
    /// Логика взаимодействия для ProductEditWindow.xaml
    /// </summary>
    public partial class ProductEditWindow : Window
    {
        DBContext db = new DBContext();
        private Nomenclature editingProduct = null;
        private string selectedPhotoPath = null;

        public ProductEditWindow(Nomenclature product = null)
        {
            InitializeComponent();
            editingProduct = product;

            if (editingProduct != null)
            {
                txtArticle.Text = editingProduct.ArticleNumber;
                txtArticle.IsReadOnly = true; // Артикул (ID) только для чтения при редактировании
                txtName.Text = editingProduct.ProductName;
                txtPrice.Text = editingProduct.Price.ToString();
                txtQty.Text = editingProduct.QuantityInStock.ToString();
                txtDiscount.Text = editingProduct.CurrentDiscount.ToString();

                // Загрузка фото, если есть
                if (!string.IsNullOrEmpty(editingProduct.Photo) && File.Exists(editingProduct.Photo))
                {
                    imgPhoto.Source = new BitmapImage(new Uri(editingProduct.Photo, UriKind.RelativeOrAbsolute));
                    selectedPhotoPath = editingProduct.Photo;
                }
            }
            else
            {
                // Автогенерация артикула (или ID) для нового товара
                using (var db = new DBContext())
                {
                    int nextId = db.Nomenclatures.Any() ? db.Nomenclatures.Max(n => n.IdNomenclature) + 1 : 1;
                    txtArticle.Text = "ART-" + nextId;
                    txtArticle.IsReadOnly = true;
                }
            }
        }

        private void btnLoadPhoto_Click(object sender, RoutedEventArgs e)
        {
            OpenFileDialog ofd = new OpenFileDialog { Filter = "Images|*.jpg;*.jpeg;*.png" };
            if (ofd.ShowDialog() == true)
            {
                BitmapImage bmp = new BitmapImage(new Uri(ofd.FileName));
                if (bmp.PixelWidth > 300 || bmp.PixelHeight > 200)
                {
                    MessageBox.Show("Размер фото не должен превышать 300x200 пикселей!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                    return;
                }

                selectedPhotoPath = ofd.FileName;
                imgPhoto.Source = bmp;
            }
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            // Валидация
            if (!decimal.TryParse(txtPrice.Text, out decimal price) || price < 0)
            {
                MessageBox.Show("Цена должна быть положительным числом.");
                return;
            }
            if (!int.TryParse(txtQty.Text, out int qty) || qty < 0)
            {
                MessageBox.Show("Количество не может быть отрицательным.");
                return;
            }

            using (var db = new DBContext())
            {
                if (editingProduct == null)
                {
                    // ДОБАВЛЕНИЕ
                    var newProduct = new Nomenclature
                    {
                        ArticleNumber = txtArticle.Text,
                        ProductName = txtName.Text,
                        Price = price,
                        QuantityInStock = qty,
                        CurrentDiscount = int.Parse(txtDiscount.Text),
                        Photo = selectedPhotoPath,
                        IdMeasure = 1,
                        IdCategoryProduct = 1,
                        IdProvider = 1,
                        IdManufacturer = 1 // Заглушки для внешних ключей
                    };
                    db.Nomenclatures.Add(newProduct);
                }
                else
                {
                    // РЕДАКТИРОВАНИЕ
                    var prod = db.Nomenclatures.Find(editingProduct.IdNomenclature);
                    if (prod != null)
                    {
                        prod.ProductName = txtName.Text;
                        prod.Price = price;
                        prod.QuantityInStock = qty;
                        prod.CurrentDiscount = int.Parse(txtDiscount.Text);
                        prod.Photo = selectedPhotoPath;
                    }
                }

                db.SaveChanges();
            }

            this.DialogResult = true;
            this.Close();
        }
    }
}
