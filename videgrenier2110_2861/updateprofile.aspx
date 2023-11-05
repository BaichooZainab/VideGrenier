<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="updateprofile.aspx.cs" Inherits="videgrenier2110_2861.updateprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


     <style>
       .container{
           margin:auto;
       }

       .box{
            margin:auto;
       }

      .button{
          padding-bottom: 4px;
      }

       </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div class="container" style=" background-color: #Fbcb9c">
    <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
    <div>
        <div class="box">
            <fieldset>
               

                <div class="col-lg-4 d-none d-lg-flex">
         <asp:DetailsView AutoGenerateRows="false"  BorderStyle="None" ID="DetailsView1" runat="server" Height="200px" Width="200px">
               <Fields>
                   <asp:TemplateField>
                       <ItemTemplate>
                           <h4>Update your profile</h4>
                 <asp:Image runat="server"  ImageUrl='<%# Eval("profile_pic", "images/{0}")%>' ID="Image1"
                        CssClass="card-img-top img-fluid vys" AlternateText="Profile Picture" Width="190px" Height="200px" />
                           </ItemTemplate>
                        </asp:TemplateField>
            </Fields>
            </asp:DetailsView>
      </div>


                <div class="form">
                    <asp:Label ID="lblFname" runat="server" Text="First Name:"
                        AssociatedControlID="txtFname"></asp:Label>
                    <div class="div_texbox">
                        <asp:TextBox ID="txtfname" runat="server" CssClass="form-
control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqFname"
                            ControlToValidate="txtFname" runat="server"
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Label ID="lblLname" runat="server" Text="Last Name:"
                        AssociatedControlID="txtLname"></asp:Label>
                    <div class="div_texbox">
                        <asp:TextBox ID="txtlname" runat="server" CssClass="form-
control"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="reqLname"
                            ControlToValidate="txtLname" runat="server"
                            ErrorMessage="Required"></asp:RequiredFieldValidator>
                    </div>
                    <asp:Label ID="lblEmail" runat="server" Text="Email"
                        AssociatedControlID="txtemail"></asp:Label>
                    <div class="div_texbox">
                        <asp:TextBox ID="txtemail" runat="server" CssClass="form-
control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="reqEmail"
                            ControlToValidate="txtEmail" runat="server"
                            ></asp:RequiredFieldValidator><br />
                       
                    </div>

                     <asp:Label ID="lblPassword" runat="server" Text="Password"
                        AssociatedControlID="txtPassword"></asp:Label>
                    <div class="div_texbox">
                        <asp:TextBox ID="txtPassword" TextMode="Password" runat="server" CssClass="form-
control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="repass"
                            ControlToValidate="txtPassword" runat="server" ValidationExpression="^(?=.*\d{2})(?=.*[a-zA-Z]{2}).{6,}$" ErrorMessage="Password Not Strong"
                            ></asp:RequiredFieldValidator><br />
                       
                    </div>

                </div>
            </fieldset>
            <br />
            <fieldset class="button">
                <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server"
                    Text="Update Profile"
                    CssClass="btn btn-outline-primary btn-block" />
            </fieldset>
        </div>
    </div>
</div>

</asp:Content>
