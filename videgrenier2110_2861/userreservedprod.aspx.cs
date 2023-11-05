using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection;
using System.Security.Cryptography;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace videgrenier2110_2861
{
    public partial class userreservedprod : System.Web.UI.Page
    {

        private static string _conString =
WebConfigurationManager.ConnectionStrings["videgrenierCS"].ConnectionString;
        SqlConnection con = new SqlConnection(_conString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("~/home");
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    getprodreserved();

                }
            }
        }

        private void getprodreserved()
        {
            //Create Connection
            SqlConnection con = new SqlConnection(_conString);
            //Create Command
            SqlCommand scmd = new SqlCommand();
            scmd.CommandText = "SELECT * from tblProductUser INNER JOIN tblProduct ON tblProductUser.prod_id = tblProduct.prod_id INNER JOIN tblUser ON tblProductUser.user_id = tblUser.user_id where tblProductUser.user_id = '" + Session["userid"] + "'";

            scmd.Parameters.AddWithValue("user_id", Convert.ToInt32(Session["userid"]));
            scmd.Connection = con;

            SqlDataAdapter da
                 = new SqlDataAdapter(scmd);

            DataTable dt
                 = new DataTable();

            using (da)
            {
                da.Fill(dt);
            }

            Grdview.DataSource = dt;
            Grdview.DataBind();
        }

        protected void Grdview_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Grdview.PageIndex = e.NewPageIndex;
            getprodreserved();
        }
    }
}