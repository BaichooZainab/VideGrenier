using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Text;
using System.IO;
using System.Security.Cryptography;
using System.Net.Mail;
using System.Net.Configuration;
using System.Configuration;
using System.Net;
using System.Threading.Tasks;

namespace videgrenier2110_2861
{
    public partial class login : System.Web.UI.Page
    {

        private string _conString =
 WebConfigurationManager.ConnectionStrings["videgrenierCS"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!Page.IsPostBack)
            {

                rvdob.MaximumValue = DateTime.Now.AddYears(-18).ToShortDateString();
                rvdob.MinimumValue = DateTime.Now.AddYears(-45).ToShortDateString();
                rvdob.Type = ValidationDataType.Date;

                // invoke the getCountry method
                getLocation();
                // Insert a default item in Dropdown
                ListItem LI = new ListItem("Select Location", "-1");
                ddlLocation.Items.Insert(0, LI);
            }
        }

        public void getLocation()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "SELECT * FROM tblLocation";
            cmd.Connection = con;
            //Create DataAdapter

            SqlDataAdapter dad = new SqlDataAdapter(cmd);
            //Create a Datatable or a DataSet
            DataTable dt = new DataTable();
            //Fill the Dataset and ensure the DB Connection is closed 
            using (dad)
            {
                dad.Fill(dt);
            }
            //To load country names in dropdown
            ddlLocation.DataSource = dt;
            //assign a field name and id to ddl
            ddlLocation.DataTextField = "location_name";
            ddlLocation.DataValueField = "location_id";
            ddlLocation.DataBind();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtdob.Text = "";
            ddlLocation.SelectedIndex = 0;
            txtEmail.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtCpassword.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            try
            {
                string filen = "person.jpg";
                //Check whether the fileupload contains a file
                if (FileUpload1.HasFile)
                {
                    if (CheckFileType(FileUpload1.FileName))
                    {
                        filen = Path.GetFileName(FileUpload1.PostedFile.FileName);
                        FileUpload1.PostedFile.SaveAs(Server.MapPath("~/Images/") +
                        filen);
                    }
                }
                // Create Connection
                SqlConnection con = new SqlConnection(_conString);
                // Create Command
                SqlCommand cmd = new SqlCommand();

                cmd.CommandType = CommandType.Text;
                cmd.Connection = con;
                //create a parameterized query for the username
                //search for username from tbluser 
                cmd.CommandText = "select * from tblUser where username = @un";
                cmd.Parameters.AddWithValue("@un", txtUsername.Text.Trim());

                //Create DataReader
                SqlDataReader dr;
                con.Open();
                dr = cmd.ExecuteReader();
                //Check if username already exists in the DB
                if (dr.HasRows)
                {
                    lblmsg.Text = "Username Already Exist, Please Choose Another";
                    lblmsg.ForeColor = System.Drawing.Color.Red;
                    txtUsername.Focus();
                }
                else
                {
                    //Ensure the DataReader is closed
                    dr.Close();

                    string strDate = txtdob.Text;
                    //DateTime dt = Convert.ToDateTime(strDate);
                    // Create another Command object for the insert statement
                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.Connection = con;
                    cmd1.CommandText = "INSERT INTO tbluser(first_name, last_name, location_id, dob, profile_pic, email_address, username, password, status) VALUES(@firstname, @lastname, @location, @dob,@profile, @email, @username, @pass, @status)";
                    cmd1.Parameters.AddWithValue("@firstname", txtFirstName.Text);
                    cmd1.Parameters.AddWithValue("@lastname", txtLastName.Text);

                    //retrieve the country dropdown list value
                    cmd1.Parameters.AddWithValue("@location", ddlLocation.SelectedValue);
                    cmd1.Parameters.AddWithValue("@dob", strDate);
                    cmd1.Parameters.AddWithValue("@profile", filen);
                    cmd1.Parameters.AddWithValue("@email", txtEmail.Text);
                    cmd1.Parameters.AddWithValue("@username", txtUsername.Text);
                    //add a method to encrypt your password 
                    cmd1.Parameters.AddWithValue("@pass", Encrypt(txtPassword.Text));
                    //set the status to active or inactive
                    cmd1.Parameters.AddWithValue("@status", 1);

                    cmd1.CommandType = CommandType.Text;

                    cmd1.ExecuteNonQuery();
                    //call the sendemail method

                    sendemail();
                    con.Close();
                    Response.Redirect("login.aspx");
                }

            }

            catch/*(Exception ex)*/
            {

            }
        }

        //check file format before uploading
        bool CheckFileType(string fileName)
        {
            string ext = Path.GetExtension(fileName);
            switch (ext.ToLower())
            {
                case ".gif":
                    return true;
                case ".png":
                    return true;
                case ".jpg":
                    return true;
                case ".jpeg":
                    return true;
                default:
                    return false;
            }
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


        //Sending an email to notify and welcome user
        private void sendemail()
        {
            String filen = Path.GetFileName(FileUpload1.PostedFile.FileName);
            SmtpSection smtpSection =
           (SmtpSection)ConfigurationManager.GetSection("system.net/mailSettings/smtp");
            using (MailMessage m = new MailMessage(smtpSection.From, txtEmail.Text.Trim()))
            {
                SmtpClient sc = new SmtpClient();
                try
                {
                    m.Subject = "This is a Test Mail";
                    m.IsBodyHtml = true;
                    StringBuilder msgBody = new StringBuilder();
                    msgBody.Append("Dear " + txtUsername.Text + ", your registration is successful, thank you for signing up on xyz.");
                    //msgBody.Append(txtbody.Text.Trim());
                    m.Attachments.Add(new Attachment(Server.MapPath("~/images/") + filen));
                    msgBody.Append("<a href='https://" +
                   HttpContext.Current.Request.Url.Authority + "/login.aspx'>Click here to login to...</ a > ");

                    m.Body = msgBody.ToString();
                    sc.Host = smtpSection.Network.Host;
                    sc.EnableSsl = smtpSection.Network.EnableSsl;
                    NetworkCredential networkCred = new
                    NetworkCredential(smtpSection.Network.UserName, smtpSection.Network.Password);
                    sc.UseDefaultCredentials = smtpSection.Network.DefaultCredentials;
                    sc.Credentials = networkCred;
                    sc.Port = smtpSection.Network.Port;
                    sc.Send(m);
                    Response.Write("Email Sent successfully");
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }

        protected void chk1_CheckedChanged(object sender, EventArgs e)
        {

        }

        //protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    if (args.Value.Length >= 7 && args.Value.Length <= 12)
        //        args.IsValid = true;
        //    else
        //        args.IsValid = false;
        //}
    }

      
}
