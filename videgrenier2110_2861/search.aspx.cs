using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;


namespace videgrenier2110_2861


{

    public partial class search : System.Web.UI.Page
    {
        private string _conString =
    WebConfigurationManager.ConnectionStrings["videgrenierCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            txtprodname_TextChanged(txtprodname, null);
        }

 

        protected void txtprodname_TextChanged(object sender, EventArgs e)
        {
            //retrieve the values from the textbox and dropdown
            string strmname = txtprodname.Text.Trim();
            string ddlamount = ddlcost.SelectedValue;

            //declare two variables and initialize to empty string literal
            string sql1 = "";
            string sql2 = "";

            //check if prodname textbox is not empty
            if (strmname != null)
            {
                sql1 = "and prod_name LIKE + @pname + '%' ";

            }
            //assign sql to search for moviename by starting character
            //check if a dropdown item has been selected
            if (ddlamount != "-1")
            {
                sql2 = "and  cost_of_prod > @amt";

            }
            //assign sql to check if boxofficetotals is greater than dropdown value
            SqlConnection dbconn = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = dbconn;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblProduct where status=1" + sql1 + sql2;
            //create two parameters: moviename and box
            cmd.Parameters.AddWithValue("@pname", strmname);
            cmd.Parameters.AddWithValue("@amt", ddlamount);
            SqlDataReader reader;

            dbconn.Open();
            reader = cmd.ExecuteReader();
            dlstProduct.DataSource = reader;
            dlstProduct.DataBind();
            dbconn.Close();
        }
    }
}