<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="userreservedprod.aspx.cs" Inherits="videgrenier2110_2861.userreservedprod" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">


      <div class="container my-5" style="margin: auto; width: 50%; background-color:  antiquewhite; padding-bottom: 10px; ">
        <h3>List of Reserved Product</h3>
        
        <asp:GridView
             ID="Grdview"
             AutoGenerateColumns="false"
             OnPageIndexChanging="Grdview_PageIndexChanging"
             AllowPaging="true"
             PageSize="3"
             CellPadding="20"
             runat="server">

            <Columns>

                <asp:TemplateField HeaderText="Status" HeaderStyle-ForeColor="#ff6600">
                    <ItemTemplate>

                        <h5>
                            <%# Eval("Status") %>
                        </h5>

                    </ItemTemplate>
                </asp:TemplateField>


                 <asp:TemplateField HeaderText="Access Date" HeaderStyle-ForeColor="#ff6600">
                    <ItemTemplate>

                        <h5>
                            <%# Eval("AccessDate") %>
                        </h5>

                    </ItemTemplate>
                </asp:TemplateField>

             

               <asp:ImageField DataImageUrlField="profile_pic" 
                    DataImageUrlFormatString="../images/{0}"
                    HeaderText="Profile" HeaderStyle-ForeColor="#ff6600" SortExpression="profile_pic"
                    ControlStyle-Width="150" />

            </Columns>



        </asp:GridView>
        
        
        
        
        </div>
   

</asp:Content>
