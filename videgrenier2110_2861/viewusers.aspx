<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="viewusers.aspx.cs" Inherits="videgrenier2110_2861.viewusers" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


   

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">



   

    <asp:GridView ID="gvs" runat="server"
        OnPreRender="gvs_PreRender"
        DataSourceID="srcUsers"
        ClientIDMode="Static"
        AutoGenerateColumns="False" ForeColor="#333333c">
        <Columns>
       <%--     <asp:ImageField   ControlStyle-Width="80px"
                DataImageUrlFormatString="~/images/{0}" HeaderText="Profile"
                SortExpression="profile_pic" />--%>

            <asp:ImageField DataImageUrlField="profile_pic"
                 ControlStyle-Width="80px"
                DataImageUrlFormatString="~/images/{0}" HeaderText="Profile"
                SortExpression="profile_pic" />


            <asp:BoundField DataField="username" HeaderText="Username"
                SortExpression="username" />
            <asp:BoundField DataField="status" HeaderText="Status"
                SortExpression="status" />
        </Columns>
    </asp:GridView>

 <asp:ObjectDataSource
            ID="srcUsers"
            runat="server"
            TypeName="DataAccessLayer"
            SelectMethod="GetUsers"
            />

     
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>
