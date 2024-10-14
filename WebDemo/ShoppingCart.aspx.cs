using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebDemo.WCFService;

namespace WebDemo
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                UpdateCart();
            }
        }

        private void UpdateCart()
        {
            List<CreateCart> dcart = Session["cart"] as List<CreateCart>;

            if (dcart != null && dcart.Count > 0)
            {
                // Bind the cart items to the gvShowCart GridView
                gvShowCart.DataSource = dcart;
                gvShowCart.DataBind();

                // Calculate the total price of the cart
                decimal totalPrice = dcart.Sum(p => p.iQoh * p.iPrice); // Assuming iPrice is the price of the product
                lblTotalPrice.Text = $"Total Price: {totalPrice:C}"; // Display the total price in a label

                // Save the total price to the session
                Session["cartTotalPrice"] = totalPrice;
            }
            else
            {
                gvShowCart.DataSource = null;
                gvShowCart.DataBind();
                lblTotalPrice.Text = "Total Price: ₹0.00";
            }
        }


        protected void gvShowCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Retrieve the cart from session
            List<CreateCart> dcart = Session["cart"] as List<CreateCart>;
            if (dcart != null)
            {
                // Get the Product ID of the item to be deleted
                int productId = Convert.ToInt32(gvShowCart.DataKeys[e.RowIndex].Value);

                // Find the item in the cart and remove it
                CreateCart itemToRemove = dcart.Find(p => p.iProdId == productId);
                if (itemToRemove != null)
                {
                    dcart.Remove(itemToRemove);

                    // Update the session with the modified cart
                    Session["cart"] = dcart;

                    // Refresh the cart display
                    UpdateCart();
                }
            }
        }

        
        protected void gvShowCart_SelectedIndexChanged(object sender, EventArgs e)
        {
            UpdateCart();

        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {

        }
    }
}
