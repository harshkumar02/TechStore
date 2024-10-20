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
using System.Web.Services;
using System.Data;

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
                
                //string script = "toastr.success('Item added to cart.');";
                //ScriptManager.RegisterStartupScript(this, GetType(), "toastrMessage", script, true);


            }

            

            
        }

    

        protected void lstProduct_SelectedIndexChanged(object sender, EventArgs e)
        {

        }


        protected void btnAdd_Click(object sender, EventArgs e)
        {
            Button b = (Button)sender;
            int NewProdId = Convert.ToInt32(b.CommandArgument); 
            List<CreateCart> dcart = (List<CreateCart>)Session["cart"];

            ProductClient pc = new ProductClient();
            CreateCart cart = new CreateCart();
            cart = pc.GetCreateCart(NewProdId);

            //if (cart == null)
            //{
            //    cart = new List<int>();
            //    Session["cart"] = cart;
            //}
            //cart.Add(productId);
            //string script = "toastr.success('Item added to cart.');";
            //ScriptManager.RegisterStartupScript(this, GetType(), "toastrMessage", script, true);



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

            // Trigger Toastr notification
            //string script = "toastr.success('Item added to cart.');";
            //ScriptManager.RegisterStartupScript(this, GetType(), "toastrMessage", script, true);

            // Redirect to  Shopping Cart page
            // Response.Redirect("Shop.aspx");
            //return false;
        }

       
    }

  
}