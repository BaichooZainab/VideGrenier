<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="viewandmanage.aspx.cs" Inherits="videgrenier2110_2861.viewandmanage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">


     <div class="form-horizontal" style=" background-color: #Fbcb9c">
        <h4>View and Manage Added Products</h4>
        <hr />
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Select 
a Category</asp:Label>
            <div class="col-md-8">
                <asp:DropDownList ID="ddlcat" runat="server"
                    CssClass="form-control">
                </asp:DropDownList>
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label"></asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtpid" Visible="false"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Product 
name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtpname"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label">usage time</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtusage"
                    CssClass="form-control" />
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Brand name</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtbrand"
                    CssClass="form-control" />
            </div>
        </div>

          <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Cost of Products</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtcost"
                    CssClass="form-control" />
            </div>
        </div>

     
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label">Description</asp:Label>
           
 <div class="col-md-8">
     <asp:TextBox runat="server" ID="txtdesc" TextMode="Multiline"
         CssClass="form-control" />
 </div>
        </div>

         <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label">Document</asp:Label>
            <div class="col-md-8">
                <asp:FileUpload ID="fudoc" runat="server" CssClass="" />
                <asp:Image ID="Image2" runat="server" Visible="false" Width="75"
                    Height="100" />
            </div>
        </div>

          <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Expiry Date</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" TextMode="Date" ID="txtexp"
                    CssClass="form-control" />
            </div>
        </div>
        

        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label">Product Image</asp:Label>
            <div class="col-md-8">
                <asp:FileUpload ID="fupicture" runat="server" CssClass="" />
                <asp:Image ID="Image1" runat="server" Visible="false" Width="75"
                    Height="100" />
            </div>
        </div>


      
        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label"></asp:Label>
            <div class="col-md-8">
                <div class="form-check-inline">
                    <asp:CheckBox runat="server" ID="chkstatus"
                        CssClass="form-check-input" />
                    <asp:Label runat="server"
                        CssClass="form-check-label">Status</asp:Label>
                </div>
            </div>
        </div>
        <div class="form-group row justify-content-center">
            <div class="offset-md-2 col-md-8">
               


                <asp:Button runat="server" ID="btnupdate"  OnClick="btnupdate_Click" Text="Update Product"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />


                <asp:Button runat="server" ID="btndelete"  OnClick="btndelete_Click" OnClientClick="return confirm('Are you sure you want to delete this Product?')" Text="Delete Product"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />


                <asp:Button runat="server" ID="btncancel"  OnClick="btncancel_Click" Text="Cancel"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <hr />

    <asp:GridView ID="gvs" AutoGenerateColumns="false"  OnSelectedIndexChanged="gvs_SelectedIndexChanged" DataKeyNames="prod_id"  ClientIDMode="Static"
        Width="800"  runat="server">
        <HeaderStyle BackColor="#Fbcb9c" ForeColor="black" Font-Bold="true"
            Height="30" />
       
 <AlternatingRowStyle BackColor="#f5f5f5" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnSelect" runat="server"
                        CssClass="btn btn-outline-info" CommandName="Select" Text="Select" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Product Name">
                <ItemTemplate>
                    <!-- display the product name -->
                    <asp:Label ID="lblProd_name" Text='<%#Eval("prod_name")%>'
                        runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
           <%--  add an imagefield here to display the picture--%>
        </Columns>
    </asp:GridView>


</asp:Content>
