using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using WebDemo.WCFService;
using System.Web.UI.WebControls.WebParts;

namespace WebDemo
{
    public partial class Shop : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                WCFService.ProductClient prodClient = new WCFService.ProductClient();
                var categories = prodClient.GetProductsData(Convert.ToInt32(Request.QueryString["cid"]));
                lstProduct.DataSource = categories;
                lstProduct.DataBind();

            }
        }

        protected void lstProduct_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            int NewProdId = Convert.ToInt32(b.CommandArgument); //CommandArgument to get ProductID
            List<CreateCart> dcart = (List<CreateCart>)Session["cart"];

            ProductClient pc = new ProductClient();
            CreateCart cart = new CreateCart();
            cart = pc.GetCreateCart(NewProdId);

            //if (dcart == null)
            //{
            //	dcart = new List<CreateCart>();
            //}

            //if (prod != null)

            if (dcart.Count == 0)
            {
                dcart.Add(cart);
            }
            else
            {
                // if cart is not empty whether product is already there in the cart, update quantity
                CreateCart pd = dcart.Find(p => p.iProdId == NewProdId);
                if (pd != null)
                {
                    //product found, so update quantity
                    pd.iQoh += 1;

                }
                else
                {
                    //cart has product but not found, so add new product to cart
                    dcart.Add(cart);
                }
            }
            // save the updated cart back into the session
            Session["cart"] = dcart;

            // Redirect to  Shopping Cart page
            Response.Redirect("ShoppingCart.aspx");
        }
    }
}