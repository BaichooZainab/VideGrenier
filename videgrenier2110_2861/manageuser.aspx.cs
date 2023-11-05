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
using System.Xml.Linq;

namespace videgrenier2110_2861
{
    public partial class manageuser : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["videgrenierCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BinduserData();


            }
        }

       


        private void BinduserData()
        {
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblUser";
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

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            //check whether the moviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtfname.Text))
            {
                lblMsg.Text = "Please select record to update";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsUpdated = false;
            //get the movieid from the textbox
            int user_id = Convert.ToInt32(txtuserid.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add UPDATE statement to update the movie
            cmd.CommandText = "update tblUser set first_name=@fname, last_name = @lname, email_address = @email, dob = @dob, profile_pic = @profile, status = @sts where user_id=@uid";
            //Create the parameterized queries
            cmd.Parameters.AddWithValue("@uid", user_id);
            cmd.Parameters.AddWithValue("@fname", txtfname.Text.Trim());
            cmd.Parameters.AddWithValue("@lname", txtlname.Text.Trim());
            cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
            cmd.Parameters.AddWithValue("@dob", txtdob.Text.Trim());
        

            String filen = img.ImageUrl.Substring(8);


            if (pic.HasFile)
            {
                filen = Path.GetFileName(pic.PostedFile.FileName);
                pic.PostedFile.SaveAs(Server.MapPath("~/images/") + filen);
            }



            cmd.Parameters.AddWithValue("@profile", filen);

            cmd.Parameters.AddWithValue("@sts", chkstatus.Checked);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute UPDATE statement and return
            //boolean if number of records UPDATED is greater than zero
            IsUpdated = cmd.ExecuteNonQuery() > 0;

            con.Close();
            if (IsUpdated)
            {
                lblMsg.Text = txtfname.Text + " user updated successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the
                BinduserData();
            }
            else
            {
                lblMsg.Text = "Error while updating user " + txtfname.Text;
                lblMsg.ForeColor = System.Drawing.Color.Red;
            }
            ResetAll();

        }

        protected void btndelete_Click(object sender, EventArgs e)
        {
            //check whether the txtmoviename textbox is empty
            if (string.IsNullOrWhiteSpace(txtfname.Text))
            {
                lblMsg.Text = "Please select record to delete";
                lblMsg.ForeColor = System.Drawing.Color.Red;
                return;
            }
            Boolean IsDeleted = false;
            //get the movieid from the textbox
            int user_id = Convert.ToInt32(txtuserid.Text);
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            //Add DELETE statement to delete the selected movie
            cmd.CommandText = " delete from tblUser where user_id=@uid ";
            //Create a parametererized query
            cmd.Parameters.AddWithValue("@uid", user_id);
            cmd.Connection = con;
            con.Open();
            //use Command method to execute DELETE statement and return
            //Boolean True if number of records DELETED is greater than zero
            IsDeleted = cmd.ExecuteNonQuery() > 0;
            con.Close();
            if (IsDeleted)
            {
                lblMsg.Text = txtfname.Text + " user deleted successfully!";
                lblMsg.ForeColor = System.Drawing.Color.Green;
                //Refresh the GridView by calling the
                BinduserData();
            }

            else
            {
                lblMsg.Text = "Error while deleting product " + txtfname.Text;
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
            txtfname.Text = "";
            txtlname.Text = "";
            txtemail.Text = "";
            txtdob.Text = "";
            img.ImageUrl = "";
            chkstatus.Checked = false;
           

        }

        protected void gvs_SelectedIndexChanged(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            img.Visible = true;


            txtuserid.Text =
            (gvs.DataKeys[gvs.SelectedIndex].Value.ToString());

            txtfname.Text =
            ((Label)gvs.SelectedRow.FindControl("lblusername")).Text;

            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //create the movieid parameter
            cmd.Parameters.AddWithValue("@uid", txtuserid.Text);
            //assign the parameter to the sql statement
            cmd.CommandText = "SELECT * FROM tblUser where user_id = @uid";
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            while (dr.Read())

            {
                //retrieving FIELD values and assign the form controls

                txtfname.Text = dr["first_name"].ToString();
                txtlname.Text = dr["last_name"].ToString();
                txtemail.Text = dr["email_address"].ToString();
                txtdob.Text = dr["dob"].ToString();
               

                chkstatus.Checked = (Boolean)dr["status"];
                img.ImageUrl = "~/images/" + dr["profile_pic"].ToString();


            }
            con.Close();
            btnupdate.Visible = true;
            btndelete.Visible = true;
            btncancel.Visible = true;
        }
    }
}