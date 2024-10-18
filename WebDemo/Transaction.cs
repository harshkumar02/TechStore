//using System;
//using System.Data;
//using System.Data.SqlClient;
//using System.Web.UI;

//namespace WebDemo
//{
//    public partial class ProductRegister : System.Web.UI.Page
//    {
//        private readonly string connectionString = "Data Source=(localdb)\\localDB1;Initial Catalog=Institute;Integrated Security=True";

//        protected void Page_Load(object sender, EventArgs e)
//        {
//            if (!IsPostBack)
//            {
//                DisplayProducts();
//            }
//        }

//        public void DisplayProducts()
//        {
//            using (SqlConnection con = new SqlConnection(connectionString))
//            {
//                SqlDataAdapter daProduct = new SqlDataAdapter("SELECT * FROM Product", con);
//                DataSet dsProduct = new DataSet();

//                daProduct.Fill(dsProduct);

//                gvProduct.DataSource = dsProduct.Tables[0];
//                gvProduct.DataBind();

//                dProduct.DataSource = dsProduct.Tables[0];
//                dProduct.DataTextField = "cPName";
//                dProduct.DataValueField = "iProdID";
//                dProduct.DataBind();
//            }
//        }

//        protected void btnAddProduct_Click(object sender, EventArgs e)
//        {
//            pProductRegister.Visible = true;
//        }

//        protected void btnSubmitProduct_Click(object sender, EventArgs e)
//        {
//            using (SqlConnection con = new SqlConnection(connectionString))
//            {
//                SqlCommand insP = new SqlCommand("insProduct", con)
//                {
//                    CommandType = CommandType.StoredProcedure
//                };

//                insP.Parameters.AddWithValue("@cPName", txtProductName.Text);
//                insP.Parameters.AddWithValue("@vDesc", txtDescription.Text);
//                insP.Parameters.AddWithValue("@vBrand", txtBrand.Text);
//                insP.Parameters.AddWithValue("@iPrice", Convert.ToDecimal(txtPrice.Text));
//                insP.Parameters.AddWithValue("@iQoh", Convert.ToInt32(txtQuantity.Text));

//                SqlParameter prodIDParam = new SqlParameter("@iProdID", SqlDbType.Int)
//                {
//                    Direction = ParameterDirection.Output
//                };
//                insP.Parameters.Add(prodIDParam);

//                SqlCommand upQty = new SqlCommand("upProductQuantity", con)
//                {
//                    CommandType = CommandType.StoredProcedure
//                };
//                upQty.Parameters.AddWithValue("@iProdID", Convert.ToInt32(dProduct.SelectedValue));
//                upQty.Parameters.AddWithValue("@iQtySold", Convert.ToInt32(txtQuantitySold.Text));

//                con.Open();

//                // Start Transaction
//                SqlTransaction transaction = con.BeginTransaction();
//                try
//                {
//                    insP.Transaction = transaction;
//                    insP.ExecuteNonQuery(); // Execute to insert product

//                    upQty.Transaction = transaction;
//                    upQty.ExecuteNonQuery(); // Execute to update quantity

//                    // Retrieve the output parameter value after execution
//                    transaction.Commit();

//                    lblMsg.Text = $"Product Registered Successfully! Product ID: {prodIDParam.Value}";
//                    DisplayProducts(); // Refresh product display
//                }
//                catch (Exception ex)
//                {
//                    transaction.Rollback();
//                    lblMsg.Text = $"Error: {ex.Message}";
//                }
//            }
//        }
//    }
//}
