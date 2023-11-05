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
    public partial class Statistics : System.Web.UI.Page
    {
        private static string _conString =
WebConfigurationManager.ConnectionStrings["videgrenierCS"].ConnectionString;
        SqlConnection con = new SqlConnection(_conString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["admin_name"] ==null)
            {
                Response.Redirect("~/home");
            }

            else
            {
            
                if (!IsPostBack)
                {
                    prodstats();
                    userstats();

                    string query = "select * from tblCategory";
                    DataTable dt = GetData(query);
                    ddlCategory.DataSource = dt;
                    ddlCategory.DataTextField = "cat_name";
                    ddlCategory.DataValueField = "cat_id";
                    ddlCategory.DataBind();
                    ddlCategory.Items.Insert(0, new ListItem("Select", "-1"));

                }
            }

        }

        private static DataTable GetData(string query)
        {
            DataTable dt = new DataTable();
            string constr =
           WebConfigurationManager.ConnectionStrings["videgrenierCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        sda.Fill(dt);
                    }
                }
                return dt;
            }
        }

        private void prodstats()
        {
            SqlConnection dbconn = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.CommandType = CommandType.StoredProcedure;
            scmd.CommandText = "prodcount";
            scmd.Connection = dbconn;
            dbconn.Open();
            hyprod.Text = scmd.ExecuteScalar().ToString();
            dbconn.Close();
        }

        private void userstats()
        {
            SqlConnection dbconn = new SqlConnection(_conString);
            SqlCommand scmd = new SqlCommand();
            scmd.CommandType = CommandType.StoredProcedure;
            scmd.CommandText = "usercount";
            scmd.Connection = dbconn;
            dbconn.Open();
            hyuser.Text = scmd.ExecuteScalar().ToString();
            dbconn.Close();
        }

        protected void ddlCategory_SelectedIndexChanged(object sender, EventArgs e)
        {
            //add an SQL statement to search for moviename and 
            //boxofficetotals as per category chosen from dropdown
            string query = string.Format("select * from tblProduct Where cat_id =  {0}", ddlCategory.SelectedValue);
            DataTable dt = GetData(query);
            //Loop and add each datatable row to the Pie Chart Values
            foreach (DataRow row in dt.Rows)
            {
                PieChart1.PieChartValues.Add(new
               AjaxControlToolkit.PieChartValue
                {
                    Category = row["prod_name"].ToString(),
                    Data = Convert.ToDecimal(row["cost_of_prod"])
                });
            }
        }
    }
}