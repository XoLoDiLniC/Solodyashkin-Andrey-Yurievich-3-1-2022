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

namespace RCD
{
    /// <summary>
    /// Interaction logic for Orders.xaml
    /// </summary>
    public partial class Orders : Page
    {
        private int idus;
        private int idd;
        private int idt;
        private Order _currentorder = new Order();
        public Orders(Order selectedOrder, int id)
        {
            
            idus = id;
            InitializeComponent();
            TdeliveryTb.ItemsSource = REntities.GetContext().TypeDeliveries.ToList();
            TpaymentTb.ItemsSource = REntities.GetContext().Type_pay.ToList();
            if (selectedOrder != null)
            {
                _currentorder = selectedOrder;
            }
            DataContext = _currentorder;

        }

        private void btnLog_click(object sender, RoutedEventArgs e)
        {

            if (TdeliveryTb.SelectedIndex == 1)
            {
                idd = 2;
            }
            else
            {
                idd = 1;
            }

            if (TpaymentTb.SelectedIndex == 1)
            {
                idt = 2;
            }
            else
            {
                idt = 1;
            }

            if (_currentorder.Id_Order == 0)
            {
                REntities.GetContext().Orders.Add(new Order {Where1 = Where1Tb.Text , Where2 = Where2Tb.Text , id_user = idus , TypeDil = idd , TypePay = idt, What = WhatSendTb.Text});
            }
            REntities.GetContext().SaveChanges();
            MessageBox.Show("Спасибо, что выбрали нашу доставку!!!");
            Manager.MainFrame.Navigate(new User(idus));
        }
    }
}
