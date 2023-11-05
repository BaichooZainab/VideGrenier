using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using static System.Net.WebRequestMethods;
using System.Threading;

namespace videgrenier2110_2861
{
    public partial class listprod : System.Web.UI.Page
    {

        private string _conString = WebConfigurationManager.ConnectionStrings["videgrenierCS"].ConnectionString;

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
                    getlistprod();

                }
            }

        }

        private void getlistprod()
        {
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "select * from tblProduct tp, tblCategory tc where tp.cat_id=tc.cat_id";
            //Create DataReader
            SqlDataReader dr;
            //open connection
            con.Open();
            //execute sql statememt
            dr = cmd.ExecuteReader();
            //Bind the reader to the repeater control
            rptProduct.DataSource = dr;
            rptProduct.DataBind();
            con.Close();

        }
    }
}