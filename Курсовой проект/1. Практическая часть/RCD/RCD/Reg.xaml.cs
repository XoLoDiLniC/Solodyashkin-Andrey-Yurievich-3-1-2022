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

namespace RCD
{
    /// <summary>
    /// Interaction logic for Reg.xaml
    /// </summary>
    public partial class Reg : Window
    {
        private Userss _currentUser = new Userss();
        public Reg()
        {
            DataContext = _currentUser;
            InitializeComponent();
        }

        private void btnLog_click(object sender, RoutedEventArgs e)
        {
            bool canRegister = Entities1.GetContext().Usersses.All(p => p.Login != LoginTb.Text.Trim());
            if (canRegister)
            {
                Entities1.GetContext().Usersses.Add(_currentUser);
                Entities1.GetContext().SaveChanges();
                MessageBox.Show("Вы прошли регистрацию");
                Login login = new Login();
                login.Show();
                Close();
            }
            else
            {
                MessageBox.Show("Вы не прошли регистрацию, такой Email существует");
            }
        }
    }
}
