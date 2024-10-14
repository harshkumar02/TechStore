using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebDemo
{
	public partial class Order : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			// Display order details when the page loads.
			if (!IsPostBack)
			{
				DisplayOrderDetails();
			}
		}
		public void DisplayOrderDetails()
		{
			string productName = Request.QueryString["ProductName"];
			
			ViewState["ProductName"] = productName;
			lblOrder.Text = "Thank you for placing an order for " + ViewState["ProductName"] + Session["UserName"].ToString();


		}

		protected void btnReview_Click(object sender, EventArgs e)
        {
			pnlReview.Visible = true;
			lblReview.Text = "Please enter your review. " + ViewState["ProductName"];
			

		}

		protected void btnSubmitReview_Click(object sender, EventArgs e)
		{
			string reviewText = txtReview.Text;
			if (!string.IsNullOrEmpty(reviewText))
			{
				// Hide panel and show thank-you label
				pnlReview.Visible = false;
				lblSubmit.Visible = true;
			}
			else
			{
				// show error message if the review text is empty
				lblReview.Text = "Please enter your review." + ViewState["ProductName"];
			}
		}
	}
}