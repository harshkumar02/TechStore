using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Runtime.Serialization;
using WebDemo.WCFService;
using System.Web.Services;

namespace WebDemo
{
	public partial class WebUserControl1 : System.Web.UI.UserControl
	{
		//SqlConnection con=new SqlConnection(ConfigurationManager.ConnectionStrings["ShopDB"].ToString());
		protected void Page_Load(object sender, EventArgs e)
		{
			//SqlDataAdapter daCat = new SqlDataAdapter("select * from Category", con);
			DataSet dsCat = new DataSet();
			
			//ServiceReference1.ServiceCategorySoapClient uc = new ServiceReference1.ServiceCategorySoapClient();
			//dsCat = uc.GetCategory();
			//lstCat.DataSource = dsCat;
			WebService.ServiceCategorySoapClient uc = new WebService.ServiceCategorySoapClient();
			dsCat = uc.GetCategory();
			lstCat.DataSource = dsCat;
			lstCat.DataMember = dsCat.Tables[0].ToString();



            //DataSet dsCat=new DataSet();

            //daCat.Fill(dsCat);


            //lstCat.DataSource = dsCat.Tables[0];
            updateCartQuantity();
            lstCat.DataBind();

			
		}

        public void updateCartQuantity()
        {
         
            List<CreateCart> prod = (List<CreateCart>)Session["cart"];
            if (prod != null)
            {

                itemcount.Text = prod.Count.ToString();
            }
            else
            {
                itemcount.Text = "0";
            }
        }

        protected void Image1_Click(object sender, ImageClickEventArgs e)
        {
            Response.Redirect("ShoppingCart.aspx");
        }

        
    }
}