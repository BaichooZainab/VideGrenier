<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="details.aspx.cs" Inherits="videgrenier2110_2861.details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

        <asp:DetailsView ID="DetailsView1" AutoGenerateRows="false" runat="server">
        <Fields>
         <asp:ImageField DataImageUrlField="pictures"
                    DataImageUrlFormatString="~/images/{0}"
                   SortExpression="Picture"/>

             <asp:TemplateField>


                 <ItemTemplate>
                     <h5><strong><em>

                     <%# Eval("prod_name") %>
                 </em></strong></h5>
                     <br />

                         <%# Eval("prod_desc") %>
                        
                 </ItemTemplate>

             </asp:TemplateField>

     
            <asp:ButtonField DataTextField="prod_name"  ControlStyle-CssClass="btn btn-outline-success"/>

            </Fields>
    </asp:DetailsView>


</asp:Content>
