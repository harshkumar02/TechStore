//using System;
//using System.Web.UI;

//namespace WebDemo
//{
//    public partial class SignInControl : UserControl
//    {
//        public string UserName
//        {
//            get { return txtUserName.Text; }
//            set { txtUserName.Text = value; }
//        }

//        public event EventHandler SignInClicked;
//        public event EventHandler GuestClicked;

//        protected void Page_Load(object sender, EventArgs e)
//        {
//        }

//        protected void btnSignIn_Click(object sender, EventArgs e)
//        {
//            SignInClicked?.Invoke(this, EventArgs.Empty);
//        }

//        protected void btnGuest_Click(object sender, EventArgs e)
//        {
//            GuestClicked?.Invoke(this, EventArgs.Empty);
//        }

//        protected void btnSignIn_Click1(object sender, EventArgs e)
//        {

//        }

//        protected void btnGuest_Click1(object sender, EventArgs e)
//        {

//        }
//    }
//}


using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebDemo
{
    public partial class SignInControl : System.Web.UI.UserControl


    {
        public string UserName
        {
            get { return txtUserName.Text ; }
            set { txtUserName.Text = value; }
        }
        //  button click events
        public event EventHandler SignInClicked;
        public event EventHandler GuestClicked;
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (SignInClicked != null)
        //    {
        //        SignInClicked(this, e);
        //    }
        //}


        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            // Raise SignInClick event
            if (SignInClicked != null)
            {
                SignInClicked?.Invoke(this, EventArgs.Empty); // Pass EventArgs.Empty
            }
        }

        //protected void btnCancel_Click(object sender, EventArgs e)
        //{

        //}

        protected void btnContinueAsGuest_Click(object sender, EventArgs e)
        {
            // Raise ContinueAsGuestClick event
            if (GuestClicked != null)
            {
                GuestClicked?.Invoke(this, EventArgs.Empty);
            }
        }
    }
}
