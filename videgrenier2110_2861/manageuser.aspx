<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="manageuser.aspx.cs" Inherits="videgrenier2110_2861.manageuser" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .bbox {
            background-color: #Eebc8a;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div class="bbox">
        <h4>Manage Users</h4>
        <hr />
        <div>

           
            <div class="form-group row justify-content-center">
                <asp:Label runat="server"
                    CssClass="col-md-2 col-form-label"></asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtuserid" Visible="false"
                        CssClass="form-control" />
                </div>
            </div>

          
            <div class="form-group row justify-content-center">
                <asp:Label runat="server" CssClass="col-md-2 col-form-label">First Name</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtfname"
                        CssClass="form-control" />
                </div>
            </div>

             <div class="form-group row justify-content-center">
                <asp:Label runat="server" CssClass="col-md-2 col-form-label">Last Name</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtlname"
                        CssClass="form-control" />
                </div>
            </div>

             <div class="form-group row justify-content-center">
                <asp:Label runat="server" CssClass="col-md-2 col-form-label">Email Address</asp:Label>
                <div class="col-md-8">
                    <asp:TextBox runat="server" ID="txtemail"
                        CssClass="form-control" />
                </div>
            </div>

          

            <div class="form-group row justify-content-center">
            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Date Of Birth</asp:Label>
            <div class="col-md-8">
                <asp:TextBox runat="server" ID="txtdob"
                    CssClass="form-control" />
            </div>
        </div>

        <div class="form-group row justify-content-center">
            <asp:Label runat="server"
                CssClass="col-md-2 col-form-label">Profile picture</asp:Label>
            <div class="col-md-8">
                <asp:FileUpload ID="pic" runat="server" CssClass="" />
                <asp:Image ID="img" runat="server" Visible="true" Width="75"
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
   
                <asp:Button runat="server" ID="btnupdate"  OnClick="btnupdate_Click" Text="Update User"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />


                <asp:Button runat="server" ID="btndelete"  OnClick="btndelete_Click" Text="Delete User"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" OnClientClick= "return confirm('Are you sure you want to delete?')" />


                <asp:Button runat="server" ID="btncancel" Text="Cancel"  OnClick="btncancel_Click"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />


              
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>
            </div>
        </div>

        <hr />
        <asp:GridView ID="gvs" AutoGenerateColumns="false" DataKeyNames="user_id"  OnSelectedIndexChanged="gvs_SelectedIndexChanged" ClientIDMode="Static"
            Width="800" runat="server">
            <HeaderStyle BackColor="black" ForeColor="White" Font-Bold="true"
                Height="30" />

            <AlternatingRowStyle BackColor="#f5f5f5" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnSelect" runat="server"
                            CssClass="btn btn-outline-info" CommandName="Select" Text="Select" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="User Name">
                    <ItemTemplate>
                        <!-- display the user name -->
                        <asp:Label ID="lblusername" Text='<%#Eval("first_name")%>'
                            runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <%-- add an imagefield here to display the poster--%>
            </Columns>
        </asp:GridView>
    </div>




</asp:Content>
