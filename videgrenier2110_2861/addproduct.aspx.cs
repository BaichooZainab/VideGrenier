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
    public partial class add_product : System.Web.UI.Page
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
            cmd.CommandText = "SELECT * FROM tblProduct";
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            //Create a DataTable
            DataTable dt = new DataTable();
            using (da)
            {
                //Populate the DataTable
                da.Fill(dt);
            }

           
        }


        protected void btnAddprod_Click(object sender, EventArgs e)
        {

            String filen = "avatar.jpg";
            String fileshe = "avatar2.jpg";
            //check if the fileupload contains a file before uploading
            if (fupicture.HasFile)
            {
                filen = Path.GetFileName(fupicture.PostedFile.FileName);
                fupicture.PostedFile.SaveAs(Server.MapPath("~/images/") + filen);
            }

            Boolean IsAdded = false;
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //add INSERT statement to create new movie
            cmd.CommandText = "insert into tblProduct (prod_name, usage_time, document, prod_desc, cost_of_prod, brand_name, expiry_date, pictures,status,cat_id,user_id) values (@pname, @usage_time, @doc, @desc, @cost, @brand, @exp, @pic, @status, @cid, @uid)";
            //create Parameterized query to prevent sql injection by
            cmd.Parameters.AddWithValue("@cid", ddlcat.SelectedValue);
            cmd.Parameters.AddWithValue("@pname", txtpname.Text.Trim());
            cmd.Parameters.AddWithValue("@usage_time", txtusage.Text.Trim());
            cmd.Parameters.AddWithValue("@doc", "../../images/" + fileshe);
            cmd.Parameters.AddWithValue("@desc", txtdesc.Text.Trim());
            cmd.Parameters.AddWithValue("@cost", txtcost.Text.Trim());
            cmd.Parameters.AddWithValue("@brand", txtbrand.Text.Trim());
            cmd.Parameters.AddWithValue("@exp", txtexp.Text.Trim());
            cmd.Parameters.AddWithValue("@pic", filen);
            cmd.Parameters.AddWithValue("@status", 0);
            cmd.Parameters.AddWithValue("@uid", Session["userid"]);

            cmd.Connection = con;
            con.Open();
            //use Command method to execute INSERT statement and return
            //Boolean true if number of records inserted is greater than zero
            IsAdded = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsAdded)
            {
                lblMsg.Text = txtpname.Text + " product added successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the BindproductData()
                BindproductData();
            }
            else
            {
                lblMsg.Text = "Error while adding product " + txtpname.Text;
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
            btnAddprod.Visible = true;
            btncancel.Visible = false;
            
            ddlcat.SelectedIndex = 0;
            txtpname.Text = "";
            txtcost.Text = "";
            txtdesc.Text = "";
            txtbrand.Text = "";
            txtusage.Text = "";
            txtexp.Text = "";

         
            Image1.ImageUrl = "";
            Image2.ImageUrl = "";

        }

    }

}