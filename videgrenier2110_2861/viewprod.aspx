<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="viewprod.aspx.cs" Inherits="videgrenier2110_2861.Viewprod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

     <div class="container my-5" style="margin: auto; width: 50%; background-color:  antiquewhite; padding-bottom: 10px; ">
        <h3>View Products</h3>
        <asp:GridView
            ID="Grd"
            AutoGenerateColumns="false"
              OnPageIndexChanging="GrdView1_PageIndexChanging"
            AllowPaging="true"
            PageSize="3"
            CellPadding="20"
            runat="server" 
            HeaderStyle-BackColor="#Fbcb9c">
            
            <Columns>

                <asp:ImageField DataImageUrlField="pictures"
                    DataImageUrlFormatString="~/images/{0}"
                    HeaderText="Picture" SortExpression="Picture"
                    ControlStyle-Width="100" />

                <asp:TemplateField HeaderText="Cost">

                    <ItemTemplate>

                        <h5>
                            <%# Eval("cost_of_prod", "{0:c}") %>
                        </h5>

                    </ItemTemplate>

                </asp:TemplateField>

                <asp:BoundField HeaderText="Brand" DataField="brand_name"/>

                <asp:HyperLinkField HeaderText="Product Name" DataTextField="prod_name" DataNavigateUrlFields="prod_id" DataNavigateUrlFormatString="details.aspx?id={0}"/>


            </Columns>
        </asp:GridView>
    </div>


</asp:Content>
