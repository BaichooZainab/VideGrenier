﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.UI.WebControls.WebParts;


namespace videgrenier2110_2861
{
    public partial class viewuser : System.Web.UI.Page
    {
        private string _conString =
WebConfigurationManager.ConnectionStrings["videgrenierCS"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            

                if (!Page.IsPostBack)
                {
                    getUserlist();
                }
            
        }


        private void getUserlist()
        {
            // Create Connection
            SqlConnection con = new SqlConnection(_conString);
            // Create Command
            SqlCommand scmd = new SqlCommand();
            scmd.CommandText = "SELECT * FROM tblUser";
            scmd.Connection = con;
            // Create DataAdapter named dad (Refer to slide 7)
            SqlDataAdapter da = new SqlDataAdapter(scmd);
            //Create DataSet/DataTable named dtUser
            DataTable dt = new DataTable();
            //Populate the datatable using the Fill()
            using (da)
            {
                da.Fill(dt);
            }

            //Bind datatable to gridview

            Grd.DataSource = dt;
            Grd.DataBind();

        }

        protected void Grd_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            Grd.PageIndex = e.NewPageIndex;
            getUserlist();
        }
    }
}