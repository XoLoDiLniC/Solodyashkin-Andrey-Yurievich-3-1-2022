﻿using System;
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

namespace RCD
{
    /// <summary>
    /// Interaction logic for User.xaml
    /// </summary>
    public partial class User : Page
    {
        private int iduse;
        public User(int id)
        {
            InitializeComponent();
            iduse = id;
           
            if (Entities1.GetContext().Orders.FirstOrDefault(p => p.id_user == iduse) != null)
            {
                ListOrd.ItemsSource = Entities1.GetContext().Orders.Where(p => p.id_user == iduse).ToList(); 
            }
           
        }

        private void btnLog_click(object sender, RoutedEventArgs e)
        {
            
            Manager.MainFrame.Navigate(new Orders(null , iduse));
        }

        private void close_Click(object sender, RoutedEventArgs e)
        {
            Order order = Entities1.GetContext().Orders.Where(p => p.id_user == iduse).FirstOrDefault();

            Entities1.GetContext().Orders.Remove(order);
            Entities1.GetContext().SaveChanges();
            MessageBox.Show("Вы удалили");
            ListOrd.ItemsSource = Entities1.GetContext().Orders.Where(p => p.id_user == iduse).ToList();
        }

        private void Red_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Orders((sender as Button).DataContext as Order, iduse));
        }
    }
}
