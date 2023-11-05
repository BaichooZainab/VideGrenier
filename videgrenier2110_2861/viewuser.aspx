<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="viewuser.aspx.cs" Inherits="videgrenier2110_2861.viewuser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>


        .viewuser {

           
            padding-bottom: 10px;
            margin-right:auto;
            margin-left:auto;
            width:550px;


        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">


   <div class="viewuser" style="text-align:center">
        <h3>View User</h3>
        <asp:GridView
            ID="Grd"
            AutoGenerateColumns="false"
               OnPageIndexChanging="Grd_PageIndexChanging"
            AllowPaging="true"
            PageSize="3"
            CellPadding="20"
            runat="server"
             HeaderStyle-BackColor="#Fbcb9c">
            <Columns>

               
                 <asp:ImageField DataImageUrlField="profile_pic"
                    DataImageUrlFormatString="~/images/{0}"
                    HeaderText="Profile" SortExpression="profile_pic"
                    ControlStyle-Width="100" />

    
                <asp:HyperLinkField HeaderText="First Name" DataTextField="first_name" />

                <asp:HyperLinkField HeaderText="Last Name" DataTextField="last_name"  />

                 <asp:HyperLinkField HeaderText="Address" DataTextField="location_id"  />


            </Columns>
        </asp:GridView>
    </div>



</asp:Content>
