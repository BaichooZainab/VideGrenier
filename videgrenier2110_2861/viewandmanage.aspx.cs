using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.WebControls.WebParts;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.IO;
using Microsoft.Ajax.Utilities;
using System.Xml.Linq;

namespace videgrenier2110_2861
{
    public partial class viewandmanage : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["videgrenierCS"].ConnectionString;

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
                    BindproductData();
                    BindCategory();
                    ListItem li = new ListItem("Select Category", "-1");
                    ddlcat.Items.Insert(0, li);

                }
            }
        }

        private void BindCategory()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblCategory";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();
            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);
            }
            //Set the DataTable as the DataSource
            ddlcat.DataSource = dt;
            //assign the FIELD values to the dropdown
            ddlcat.DataTextField = "cat_name";
            ddlcat.DataValueField = "cat_id";
            ddlcat.DataBind();
        }


        private void BindproductData()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblProduct where user_id = '" + Session["userid"] + "'";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();
            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);
            }

            //Set the DataTable as the DataSource
            gvs.DataSource = dt;
            gvs.DataBind();
        }


        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            Image1.Visible = true;



            txtpid.Text =
            (gvs.DataKeys[gvs.SelectedIndex].Value.ToString());

            txtpname.Text =
            ((Label)gvs.SelectedRow.FindControl("lblprod_name")).Text;

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //create the movieid parameter
            cmd.Parameters.AddWithValue("@pid", txtpid.Text);
            //assign the parameter to the sql statement
            cmd.CommandText = "SELECT * FROM tblProduct where user_id ='" + Session["userid"] + "'";
            cmd.Parameters.AddWithValue("user_id", Convert.ToInt32(Session["userid"]));
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())

            {
                //retrieving FIELD values and assign the form controls
                txtpname.Text = dr["prod_name"].ToString();
                txtusage.Text = dr["usage_time"].ToString();
                txtcost.Text = dr["cost_of_prod"].ToString();
                txtdesc.Text = dr["prod_desc"].ToString();
                txtbrand.Text = dr["brand_name"].ToString();
                txtexp.Text = dr["expiry_date"].ToString();
                ddlcat.SelectedValue = dr["cat_id"].ToString();
                //chkstatus.Checked = (Boolean)dr["status"];
                Image1.ImageUrl = "~/images/" + dr["pictures"].ToString();
                Image2.ImageUrl = "~/images/" + dr["document"].ToString();



            }
            con.Close();
           
            btnupdate.Visible = true;
            btndelete.Visible = true;
            btncancel.Visible = true;
        }

        

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            String filen = "vgrenier.jpg";
            String fileshe = "avatar2.jpg";
            //check if the fileupload contains a file before uploading
            if (fupicture.HasFile)
            {
                filen = Path.GetFileName(fupicture.PostedFile.FileName);
                fupicture.PostedFile.SaveAs(Server.MapPath("~/images/") + filen);
            }

            if (fudoc.HasFile)
            {
                fileshe = Path.GetFileName(fudoc.PostedFile.FileName);
                fudoc.PostedFile.SaveAs(Server.MapPath("~/images/") +
                fileshe);
            }

            //check whether the moviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtpname.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            //get the movieid from the textbox
            int prod_id = Convert.ToInt32(txtpid.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update the movie
            cmd.CommandText = "update tblProduct set prod_name = @pname, usage_time = @usage_time, prod_desc = @desc, cost_of_prod = @cost, brand_name = @brand, expiry_date = @exp, pictures = @pic where prod_id=@pid";
            //Create the parameterized queries

            cmd.Parameters.AddWithValue("@pid", prod_id);
            cmd.Parameters.AddWithValue("@pname", txtpname.Text.Trim());
            cmd.Parameters.AddWithValue("@usage_time", txtusage.Text.Trim());
            cmd.Parameters.AddWithValue("@doc", "../../images/" + fileshe);
            cmd.Parameters.AddWithValue("@desc", txtdesc.Text.Trim());
            cmd.Parameters.AddWithValue("@cost", txtcost.Text.Trim());
            cmd.Parameters.AddWithValue("@brand", txtbrand.Text.Trim());
            cmd.Parameters.AddWithValue("@exp", txtexp.Text.Trim());


            cmd.Parameters.AddWithValue("@pic", filen);

            //cmd.Parameters.AddWithValue("@status", chkstatus.Checked);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;

            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = txtpname.Text + " product updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the
                BindproductData();
            }
            else
            {
                lblMsg.Text = "Error while updating product " + txtpname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            //check whether the txtmoviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtpname.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            //get the movieid from the textbox
            int prod_id = Convert.ToInt32(txtpid.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected movie
            cmd.CommandText = " delete from tblProduct where prod_id=@pid ";
            //Create a parametererized query
            cmd.Parameters.AddWithValue("@pid", prod_id);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsDeleted)
            {
                lblMsg.Text = txtpname.Text + " product deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the
                BindproductData();
            }

            else
            {
                lblMsg.Text = "Error while deleting product " + txtpname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            ResetAll();
        }

        private void ResetAll()

        {
           
            btncancel.Visible = false;
            btnupdate.Visible = true;
            btndelete.Visible = true;
            ddlcat.SelectedIndex = 0;
            txtpname.Text = "";
            txtcost.Text = "";
            txtdesc.Text = "";
            txtbrand.Text = "";
            txtusage.Text = "";
            txtexp.Text = "";



            //chkstatus.Checked = false;
            Image1.ImageUrl = "";
            Image2.ImageUrl = "";


        }

    }
}