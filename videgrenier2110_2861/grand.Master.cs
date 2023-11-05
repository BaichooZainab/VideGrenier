using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace videgrenier2110_2861
{
    public partial class Site1 : System.Web.UI.MasterPage
    {

        private string _conString =
WebConfigurationManager.ConnectionStrings["videgrenierCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //verify if session username is not null
            if (Session["username"] != null)
            {
                pnllog.Style.Add("visibility", "hidden");
                Page.Controls.Remove(pnllog);
                lgregis.CssClass = "nav navbar-nav navbar-right";
                lbllgged.CssClass = "btn btn-outline-success text-white";
                //add the session name
                lbllgged.Text = "Welcome " + Session["username"];
                btnlgout.Visible = true;
                pnlprofile.Visible = true;
                hyregister.Visible = true;
                paneluser.Visible = true;


                //retrieve the user id session
                //int user_id = Convert.ToInt32( );
                //hyuser.Attributes["href"]=ResolveUrl("~updateprofile?id=" +user_id + "");
            }


            else
            {
                viewp.Visible = false;
                listprod.Visible = false;   
                search.Visible = false;
                add.Visible = false;
                reserved.Visible = false;
                usercontrol.Visible = false;
                booking.Visible = false;

            }

            if (!IsPostBack)
            {
                if (Request.Cookies["adminuname"] != null &&
                Request.Cookies["adminpass"] != null)
                {
                    adminlogin.Username = Request.Cookies["adminuname"].Value;
                    adminlogin.Password = Request.Cookies["adminpass"].Value;
                }
            }
            //Disable/Enable some menu items
            if (Session["admin_name"] != null)
            {
                hyregister.Visible = false;
                lgregis.CssClass = "nav navbar-nav navbar-right";
                lbllgged.CssClass = "btn btn-outline-success text-white";
                lbllgged.Text = "Welcome " + Session["adminname"];
                btnlgout.Visible = true;
                ////pnlmanage.Visible = true;
                pnlmanageprod.Visible = true;
                pnlprofile.Style.Add("visibility", "hidden");
                Page.Controls.Remove(pnlprofile);
                pnllog.Style.Add("visibility", "hidden");
                Page.Controls.Remove(pnllog);
            }




        }

        protected void btnlgout_Click(object sender, EventArgs e)
        {
            lgout();
        }

        void lgout()
        {
            if (Session["username"] != null || Session["admin_name"] != null)
            {
                //Remove all session
                Session.Clear();
                //Destroy all Session objects
                Session.Abandon();
                //Redirect to homepage or login page
                Response.Redirect("login");
            }

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //get the value of username and password fields and state of checkbox from 
            //admin login form
            string username = adminlogin.Username;
            string password = adminlogin.Password;
            bool chk = adminlogin.Chk;
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandType = CommandType.Text;
            //searching for a record containing matching username & password with 
            //an active status
            cmd.CommandText = "select * from tblAdmin where admin_name=@auname and password=@apass";
            //create two parameterized query for the above select statement
            //use above variables
            cmd.Parameters.AddWithValue("@auname", username);
            cmd.Parameters.AddWithValue("@apass", password);
            //Create DataReader
            SqlDataReader dr;
            con.Open();
            dr = cmd.ExecuteReader();
            // check if the DataReader contains a record
            if (dr.HasRows)
            {
                if (dr.Read())
                {
                    //create a memory cookie to store username and pwd

                    Response.Cookies["uname"].Value = username;
                    Response.Cookies["pwd"].Value = password;

                    if (chk)
                    {
                        //if checkbox is checked, make cookies persistent

                        Response.Cookies["uname"].Expires = DateTime.Now.AddDays(100);
                        Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(100);
                    }
                    else
                    {
                        //delete the cookies if checkbox is unchecked
                        //delete content of password field 

                        Response.Cookies["uname"].Expires = DateTime.Now.AddDays(-100);
                        Response.Cookies["pwd"].Expires = DateTime.Now.AddDays(-100);
                    }
                    //create and save adminuname in a session variable

                    Session["admin_name"] = username;

                    //create and save adminid in a session variable

                    Session["admin_id"] = dr["admin_id"].ToString();

                    //redirect to the dashboard page

                    Response.Redirect("home.aspx");

                }
                con.Close();
            }
            else
            {
                //delete content of password field 
                lblmsg.Style.Add("margin-left", "10%");
                lblmsg.ForeColor = System.Drawing.Color.Red;
                username = "";
                password = "";

                lblmsg.Text = "You are not registered or your account has been suspended!";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "adminModal();", true);

            
            }
        }
    }
}