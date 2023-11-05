using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;

namespace videgrenier2110_2861
{
    public partial class updateprofile : System.Web.UI.Page
    {

        private string _conString =
    WebConfigurationManager.ConnectionStrings["videgrenierCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            //checks whether the session variable has been created
            //from the login page and if null redirect to login page
            //else grant access to the page and display username
            if (string.IsNullOrEmpty(Convert.ToString(Session["username"])))
            {
                Response.Redirect("login.aspx?url=" +
                 Server.UrlEncode(Request.Url.AbsoluteUri));
            }
            else
            {
                if (!Page.IsPostBack)
                {
                    // Create Connection
                    SqlConnection con = new SqlConnection(_conString);
                    // Create Command
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@un", Session["username"]);
                    //To replace the txtusername.Text by the session variable
                    cmd.CommandText = "SELECT * FROM tblUser WHERE username=@un";

                    SqlDataAdapter da = new SqlDataAdapter(cmd);

                    DataTable dt = new DataTable();

                    using (da)
                    {
                        da.Fill(dt);
                    }

                    DetailsView1.DataSource = dt;
                    DetailsView1.DataBind();
                    con.Open();
                    //Create DataReader
                    SqlDataReader reader;

                    reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        //retrieve the values using the reader[“fieldname”] and
                        //store in corresponding Textboxes

                        txtfname.Text = reader["first_name"].ToString();
                        txtlname.Text = reader["last_name"].ToString();
                        txtemail.Text = reader["email_address"].ToString();
                        txtPassword.Text = reader["password"].ToString();
                    }
                    reader.Close();
                 
                    con.Close();
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string updateSQL;
            updateSQL = "update tblUser set first_name=@fname,last_name=@lname, email_address=@email, password=@pass WHERE username =@un";
            SqlConnection con = new SqlConnection(_conString);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = updateSQL;
            cmd.Connection = con;
            //Create a parameter for the Session username
            cmd.Parameters.AddWithValue("@un", Session["username"]);
            // Add the 3 parameters for firstname, lastname and email

            cmd.Parameters.AddWithValue("@fname", txtfname.Text.Trim());
            cmd.Parameters.AddWithValue("@lname", txtlname.Text.Trim());
            cmd.Parameters.AddWithValue("@email", txtemail.Text.Trim());
            cmd.Parameters.AddWithValue("@pass", txtPassword.Text.Trim());
            int updated = 0;
            //Add a “try – catch” block to handle any exceptions thrown during
            //program execution and displays the error Message if any
            con.Open();
            updated = cmd.ExecuteNonQuery();
            lblmsg.Text = updated.ToString() + " record updated.";
            //lblmsg.Text = "Error updating. ";
            con.Close();
        }

        public string Encrypt(string clearText)
        {
            // defining encrytion key
            string EncryptionKey = "MAKV2SPBNI99212";
            byte[] clearBytes = Encoding.Unicode.GetBytes(clearText);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new
               byte[] { 0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76 });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    // encoding using key
                    using (CryptoStream cs = new CryptoStream(ms,
                   encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    clearText = Convert.ToBase64String(ms.ToArray());
                }
            }
            return clearText;
        }


    }
}