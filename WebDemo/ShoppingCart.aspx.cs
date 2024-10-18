using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebDemo.WCFService;
using ccdll;
using System.Net;
using System.Runtime.InteropServices;
namespace WebDemo
{
    public partial class ShoppingCart : System.Web.UI.Page
    {
        public int c = 0;
        string connectionString = "Data Source=(localdb)\\localDB1;Initial Catalog=Shop;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            
            // PanelPayment.Visible = false;
            if (!IsPostBack)
            {
                
                UpdateCart();
            }
            SignInCtrl.SignInClicked += SignInControl1_SignInClicked;
            SignInCtrl.GuestClicked += SignInControl1_GuestClicked;
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
                decimal totalPrice = dcart.Sum(p => p.iQoh * p.iPrice); //  iPrice is the price of the product
                lblTotalPrice.Text = $"Total Price: {totalPrice:C}"; // Display the total price in  label

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

        private List<CartItem> GetCartItems()
        {
            // Retrieve items from session or other storage; return as a list of CartItem objects
            
            if (Session["CartItems"] != null)
            {
                return (List<CartItem>)Session["CartItems"];
            }
            return new List<CartItem>(); // Return empty list if no items
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
            SignInCtrl.Visible = true;
            //PanelPincheck.Visible = false;

        }

        private void SignInControl1_SignInClicked(object sender, EventArgs e)
        {
            lblWelcome.Text = $"Welcome {SignInCtrl.UserName}";
            //PanelPayment.Visible = true; // Display the payment panel
            PanelPincheck.Visible = true;
        }

        private void SignInControl1_GuestClicked(object sender, EventArgs e)
        {
            lblWelcome.Text = "Welcome Guest";
            PanelPincheck.Visible = true; // Display the payment panel
        }

        

        protected void btnPincheck_Click1(object sender, EventArgs e)
        {
            string pin = txtPincode.Text;

            // Call a method to check delivery details for the entered pincode
            string deliveryMessage = CheckDeliveryDetails(pin);
            if (deliveryMessage == "Delivery not available at this location.")
            {
                PanelDeliveryDetails.Visible = false;
            }

            else
            {
                PanelDeliveryDetails.Visible=true;
                PanelDeliveryDetails.Focus();
                //UpdatePanel2.Visible = true;
            }

            // Display the delivery details message in the label
            lbldelivery.Text = deliveryMessage;
            lbldelivery.Visible = true;


        }

        private string CheckDeliveryDetails(string pincode)
        {
            string message = "Delivery not available at this location."; // Default message

            string query = "SELECT City, DeliveryDays FROM Deliverydetails WHERE Pincode = @Pincode";
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Pincode", pincode);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string city = reader["City"].ToString();
                    int deliveryDays = Convert.ToInt32(reader["DeliveryDays"]);
                    message = $"Delivery available to {city} within {deliveryDays} days.";
                }
            }

            return message;
        }


        private List<Deliverydetails> GetDeliveryDetailsFromDatabase()
        {
            List<Deliverydetails> deliveryData = new List<Deliverydetails>();

            string connectionString = "Data Source=(localdb)\\localDB1;Initial Catalog=Shop;Integrated Security=True";
            string query = "SELECT Pincode, City, DeliveryDays FROM Deliverydetails";

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                SqlCommand cmd = new SqlCommand(query, conn);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    deliveryData.Add(new Deliverydetails
                    {
                        Pincode = reader["Pincode"].ToString(),
                        City = reader["City"].ToString(),
                        DeliveryDays = Convert.ToInt32(reader["DeliveryDays"])
                    });
                }
            }

            return deliveryData;
        }

        protected void btnPayment_Click(object sender, EventArgs e)
        {
           // UpdatePanelCc.Visible = true;
            lblMsg.Visible = true;
            lblMsg.Text = "Your order is sucessful";
        }

        protected void dropdownPaymentMethod_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (dropdownPaymentMethod.SelectedIndex == 1)
            {
                btnPayment.Enabled = false;
                UpdatePanelCc.Visible = true;
            }
            else
            {
                UpdatePanelCc.Visible=false;
            }
                
        }

        protected void btnSaveCard_Click(object sender, EventArgs e)
        {
            DateTime expiry = DateTime.Parse(txtcardexpiry.Text);
            if (expiry < DateTime.Now)
            {
                lblcardcompany.Text = $"Your {lblcardcompany.Text} card is Expired ";
                btnSaveCard.Enabled = false;
            }
            else
            {
                UpdatePanelCc.Visible = false;
                lblMsg.Text = "Card saved kindly continue for payment : )";
                btnPayment.Enabled = true;
            }
           
            
        }

        protected void txtcardNumber_TextChanged(object sender, EventArgs e)
        {
            string cardnum = txtcardNumber.Text;

            CardCheck cardcc = new CardCheck(cardnum);

            // Use the GetCardCompany method to get the card company name
            string cardcompany = cardcc.GetCardCompany(cardnum);

            // Display the card company name in the label
            lblcardcompany.Text = cardcompany;

        }

        protected void txtcardexpiry_TextChanged(object sender, EventArgs e)
        {
            txtcardNumber_TextChanged(sender, e);
            btnSaveCard.Enabled = true;


        }
    }
}
