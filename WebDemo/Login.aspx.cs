using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebDemo
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			
		}

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
			string userName = txtUserName.Text;
			string email = txtEmail.Text;
			string passportNo = txtPassNo.Text;


			Session["UserName"] = userName;
			Response.Redirect("Products.aspx");

		}
	}
}