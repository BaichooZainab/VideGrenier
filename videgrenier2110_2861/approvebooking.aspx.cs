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
    public partial class approvebooking : System.Web.UI.Page
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
                    getUserProductDetails();
                }
            }
        }

        void getUserProductDetails()
        {
            SqlConnection con = new SqlConnection(_conString);
            con.Open();
            SqlCommand ccmd = con.CreateCommand();
            ccmd.CommandType = CommandType.Text;
            ccmd.CommandText = "Select tu.user_id as user_id, ";
            ccmd.CommandText += "tu.first_name as fname, ";
            ccmd.CommandText += "tu.last_name as lname, ";
            ccmd.CommandText += "tu.username as uname, ";
            ccmd.CommandText += "tu.profile_pic as image, ";
            ccmd.CommandText += "tu.status as ustatus, ";
            ccmd.CommandText += "tup.prod_id as pid, ";
            ccmd.CommandText += "tup.AccessDate as accdate, ";
            ccmd.CommandText += "tup.status as tupstatus, ";
            ccmd.CommandText += "tup.Status as tupstatus, ";
            ccmd.CommandText += "tp.prod_name as pname, ";
            ccmd.CommandText += "tp.status as pstatus ";
            ccmd.CommandText += "from tblUser tu, tblProductUser tup, tblProduct tp ";
            ccmd.CommandText += "where tu.user_id = tup.user_id ";
            ccmd.CommandText += "and tup.prod_id = tp.prod_id ";
            ccmd.CommandText += "and tup.user_id != "+ Session["userid"];
            ccmd.CommandText += "and tp.user_id =  "+ Session["userid"];

            ccmd.CommandText += "and tu.status = '1' ";
            ccmd.CommandText += "and tp.status = '1' ";

            //ccmd.CommandText += "and tup.status = '0' ";
            SqlDataAdapter sqlda = new SqlDataAdapter(ccmd.CommandText, con);
            DataTable dta = new DataTable();
            sqlda.Fill(dta);
            con.Close();
            gvs.DataSource = dta;
            gvs.DataBind();

           
        }

        protected void gvs_PreRender(object sender, EventArgs e)
        {
            if (gvs.Rows.Count > 0)
            {
                //This replaces <td> with <th> and adds the scope attribute
                gvs.UseAccessibleHeader = true;
                //This will add the <thead> and <tbody> elements
                gvs.HeaderRow.TableSection =
                TableRowSection.TableHeader;
            }
        }
        protected void lnkdeny_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            GridViewRow grvRow = (GridViewRow)lnk.NamingContainer;
            HiddenField hf = grvRow.FindControl("hidpro") as HiddenField;
            int prod_id = Convert.ToInt32(hf.Value);
            int user_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SqlConnection con = new SqlConnection(_conString);
            con.Open();
            SqlCommand ucmd = con.CreateCommand();
            ucmd.CommandType = CommandType.Text;
            ucmd.CommandText = "update tblProductUser set Status='0' Where user_id ='" + user_id + "' and prod_id ='" + prod_id + "'";
            ucmd.ExecuteNonQuery();
            con.Close();
            getUserProductDetails();
        }

        protected void lnkgrant_Click(object sender, EventArgs e)
        {
            LinkButton lnk = (LinkButton)sender;
            GridViewRow grvRow = (GridViewRow)lnk.NamingContainer;
            HiddenField hf = grvRow.FindControl("hidprod") as HiddenField;
            int prod_id = Convert.ToInt32(hf.Value);
            int user_id = Convert.ToInt32((sender as LinkButton).CommandArgument);
            SqlConnection con = new SqlConnection(_conString);
            con.Open();
            SqlCommand ucmd = con.CreateCommand();
            ucmd.CommandType = CommandType.Text;
            ucmd.CommandText = "update tblProductUser set Status='1' Where user_id ='"
            + user_id + "' and prod_id ='" + prod_id + "'";
            ucmd.ExecuteNonQuery();
            con.Close();
            getUserProductDetails();
        }
    }
}