<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="postreview.aspx.cs" Inherits="videgrenier2110_2861.postreview" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .review td, .review th {
            padding: 5px;
            font: 14px Arial,Sans-Serif;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

      <div class="container my-5" style="margin: auto; width: 80%; background-color:  antiquewhite; padding-bottom: 10px; ">
        <asp:FormView
            ID="frmReview"
            DataSourceID="srcReview"
            DefaultMode="Insert"
            runat="server">
            <InsertItemTemplate>
                <asp:Label
                    ID="lblComment"
                    Text="Enter comments:"
                    AssociatedControlID="txtComment"
                    runat="server" />

                <br />
                <asp:TextBox
                    ID="txtComment"
                    Text='<%# Bind("Comment") %>'
                    TextMode="MultiLine"
                    Columns="50"
                    Rows="4"
                    runat="server" />
                <br />
                <asp:Button
                    ID="btnInsert"
                    Text="Post Review"
                    CommandName="Insert"
                    runat="server" />
            </InsertItemTemplate>
        </asp:FormView>
        <hr />
        <asp:GridView
            ID="gvs"
            DataSourceID="srcReview"
             ClientIDMode="Static"
             OnPreRender="gvs_PreRender"
            CssClass="review"
            runat="server" />
        <%--Invoke the component and the methods GetEntries() and AddEntry() --%>
        <asp:ObjectDataSource
            ID="srcReview"
            TypeName="DataAccessLayer"
            OnInserting="srcReview_Inserting"
            SelectMethod="GetEntries"
             InsertMethod="AddEntry"
            runat="server" />
    </div>

</asp:Content>
