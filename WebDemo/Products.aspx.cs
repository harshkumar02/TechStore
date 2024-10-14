using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebDemo
{
	public partial class Products : System.Web.UI.Page
	{
		// Connection string
		string connectionString = ConfigurationManager.ConnectionStrings["ShopDB"].ConnectionString;
		


		protected void Page_Load(object sender, EventArgs e)
		{
			lblWelcome.Text = "Welcome " + Session["UserName"].ToString();
			if (!IsPostBack)
			{
				LoadProducts();
			}

		}
		private void LoadProducts()
		{
			using (SqlConnection con = new SqlConnection(connectionString))
			{
				SqlCommand cmd = new SqlCommand("SELECT iProdID, cPName FROM Product", con);
				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();

				da.Fill(dt);
				ddlProducts.DataSource = dt;
				ddlProducts.DataTextField = "cPName";     // Name of the product
				ddlProducts.DataValueField = "iProdID";   // Product ID
				ddlProducts.DataBind();
			}
			// Insert a default "Select Product" item at the top
			ddlProducts.Items.Insert(0, new ListItem("--Select a Product--", "0"));
		}

		protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
		{
			int quantity;
			bool isValid = int.TryParse(txtQuantity.Text, out quantity);

			if (!isValid || quantity < 1)
			{
				args.IsValid = false;  // Validation failed
			}
			else
			{
				args.IsValid = true;   // Validation passed
			}
		}

		protected void ddlProducts_SelectedIndexChanged(object sender, EventArgs e)
		{
			int selectedProductId = Convert.ToInt32(ddlProducts.SelectedValue);

			if (selectedProductId > 0)
			{
				DisplayProductDetails(selectedProductId);
			}
		}
		private void DisplayProductDetails(int productId)
		{
			using (SqlConnection con = new SqlConnection(connectionString))
			{
				SqlCommand cmd = new SqlCommand("SELECT vImagePath, iPrice FROM Product WHERE iProdID = @iProdID", con);
				cmd.Parameters.AddWithValue("@iProdID", productId);

				SqlDataAdapter da = new SqlDataAdapter(cmd);
				DataTable dt = new DataTable();

				// Fill the DataTable with the result
				da.Fill(dt);

				// Check if we have at least one row in the result set
				if (dt.Rows.Count > 0)
				{
					imgProduct.ImageUrl = dt.Rows[0]["vImagePath"].ToString();
					lblPrice.Text = "Price: Rs " + dt.Rows[0]["iPrice"].ToString();
				}
			}
		}

		protected void Button1_Click(object sender, EventArgs e)
		{
			if (Page.IsValid)
			{
				string selectedProduct = ddlProducts.SelectedItem.Text;
				string quantity = txtQuantity.Text;

				// Redirect to Orders page, passing the product name and quantity
				Response.Redirect("Order.aspx?ProductName=" + selectedProduct + "&Quantity=" + quantity);
			}
		}
	}
}