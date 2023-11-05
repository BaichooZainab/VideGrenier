<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="search.aspx.cs" Inherits="videgrenier2110_2861.search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

   

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">


    

     <div class="container my-3" style=" background-color: #Fbcb9c">
        <h3>Search for Products</h3>
        <h4>Filter by Cost of Product:</h4>
        <asp:DropDownList ID="ddlcost" AutoPostBack="true" OnSelectedIndexChanged="txtprodname_TextChanged" runat="server" CssClass="form-control">
            <asp:ListItem Text="Select Amount" Value="-1"></asp:ListItem>
            <asp:ListItem Text="Above $4500" Value="4500"></asp:ListItem>
            <asp:ListItem Text="Above $2600" Value="2600"></asp:ListItem>
            <asp:ListItem Text="Above $500" Value="500"></asp:ListItem>
        </asp:DropDownList>
        <br />
        <h4>Enter Product name</h4>
        <asp:TextBox ID="txtprodname" AutoPostBack="true" CssClass="form-control"
            runat="server" OnTextChanged="txtprodname_TextChanged"></asp:TextBox>
        <br />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

            <ContentTemplate>
                 <asp:DataList
            ID="dlstProduct"
            runat="server">
            <ItemTemplate>
                <h1><%#Eval("prod_name")%></h1>
                Product Description:
                <%#Eval("prod_desc") %>
                <br />
                Price of product:
                <%#Eval("cost_of_prod","{0:c}") %>


            </ItemTemplate>

        </asp:DataList>



                </ContentTemplate>

            <Triggers>

                <asp:AsyncPostBackTrigger ControlID="ddlcost" EventName="SelectedIndexChanged" />
                <asp:AsyncPostBackTrigger ControlID="txtprodname" EventName="TextChanged" />
            </Triggers>

        </asp:UpdatePanel>
       
    </div>


</asp:Content>
