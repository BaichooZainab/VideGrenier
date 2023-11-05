<%@ Page Title="register" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="videgrenier2110_2861.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">


    <section class="background-radial-gradient overflow-hidden mb-5">
        <style>
            .background-radial-gradient {
                background-color: hsl(218, 41%, 15%);
                background-image: radial-gradient(650px circle at 0% 0%, hsl(218, 41%, 35%) 15%, hsl(218, 41%, 30%) 35%, hsl(218, 41%, 20%) 75%, hsl(218, 41%, 19%) 80%, transparent 100%), radial-gradient(1250px circle at 100% 100%, hsl(218, 41%, 45%) 15%, hsl(218, 41%, 30%) 35%, hsl(218, 41%, 20%) 75%, hsl(218, 41%, 19%) 80%, transparent 100%);
            }

            #radius-shape-1 {
                height: 220px;
                width: 220px;
                top: -60px;
                left: -130px;
                background: radial-gradient(#44006b, #ad1fff);
                overflow: hidden;
            }

            #radius-shape-2 {
                border-radius: 38% 62% 63% 37% / 70% 33% 67% 30%;
                bottom: -60px;
                right: -110px;
                width: 300px;
                height: 300px;
                background: radial-gradient(#44006b, #ad1fff);
                overflow: hidden;
            }

            .bg-glass {
                background-color: hsla(0, 0%, 100%, 0.9) !important;
                backdrop-filter: saturate(200%) blur(25px);
            }
        </style>




        <div class="container px-4 py-5 px-md-5 text-center text-lg-start my-5">
            <div class="row gx-lg-5 align-items-center mb-5">
                <div class="col-lg-6 mb-5 mb-lg-0" style="z-index: 10">
                    <h1 class="my-5 display-5 fw-bold ls-tight" style="color: hsl(218, 81%, 95%)">The best offer
                        <br />
                        <span style="color: hsl(218, 81%, 75%)">for your business</span>
                    </h1>

                </div>

                <div class="col-lg-6 mb-5 mb-lg-0 position-relative">
                    <div id="radius-shape-1" class="position-absolute rounded-circle shadow-5-strong"></div>
                    <div id="radius-shape-2" class="position-absolute shadow-5-strong"></div>

                    <div class="card bg-glass">
                        <div class="card-body px-4 py-5 px-md-5">


                          <%--  <asp:PlaceHolder runat="server" ID="ErrorMessage"
                                Visible="false">
                                <p class="text-danger">
                                    <asp:Literal runat="server" ID="FailureText" />
                                </p>
                            </asp:PlaceHolder>--%>

                             <asp:ValidationSummary ID="ValidationSummary1" DisplayMode="BulletList" ForeColor="#990000" runat="server" CssClass="text-danger" HeaderText="Errors in the form are:"
            ShowMessageBox="true"
            ShowSummary="true" />

                            <h4>Create an account.</h4>
                            <hr />
                        

                            <!-- 2 column grid layout with text inputs for the first and last names -->

                            <div class="mb-3">
                                <asp:Label runat="server"
                                    CssClass="form-label">First Name</asp:Label>

                                <asp:TextBox runat="server" ID="txtFirstName"
                                    CssClass="form-control" BorderStyle="Dotted" />

                                <asp:RequiredFieldValidator ID="RF1" runat="server"
                                    ControlToValidate="txtFirstName" Display="Dynamic" SetFocusOnError="true"
                                    ErrorMessage="First Name Mandatory"></asp:RequiredFieldValidator>

                            </div>

                            <div class="mb-3">
                                <asp:Label runat="server"
                                    CssClass="form-label">Last Name</asp:Label>

                                <asp:TextBox runat="server" ID="txtLastName"
                                    CssClass="form-control" BorderStyle="Dotted" />

                                <asp:RequiredFieldValidator ID="RF2" runat="server"
                                    ControlToValidate="txtLastName" Display="Dynamic" SetFocusOnError="true"
                                    ErrorMessage="Last Name Mandatory"></asp:RequiredFieldValidator>


                            </div>

                            <div class="mb-3">
                                <asp:Label runat="server"
                                    CssClass="form-label">Date of Birth (You should be at least 18 years old)</asp:Label>

                                <asp:TextBox runat="server" ID="txtdob"
                                    TextMode="Date"
                                    CssClass="form-control" BorderStyle="Dotted" />

                                 <asp:RangeValidator ID="rvdob" runat="server"
                    ControlToValidate="txtdob"
                    ErrorMessage="Your age do not match"></asp:RangeValidator>


                            </div>

                            <div class="mb-3">

                                <asp:Label ID="lblLocation" runat="server" Text="Location" AssociatedControlID="ddlLocation"></asp:Label>
                                <div class="div_texbox">
                                    <asp:DropDownList ID="ddlLocation" runat="server"
                                        CssClass="form-control">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="ddlLocation" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                </div>
                            </div>

                            <!-- Email input -->

                            <div class="form-outline mb-4">
                                <asp:Label runat="server"
                                    CssClass="form-label">Email Address</asp:Label>

                                <asp:TextBox runat="server" ID="txtEmail"
                                    CssClass="form-control" BorderStyle="Dotted" />

                                <asp:RegularExpressionValidator ID="regEmail" runat="server"
                                    ControlToValidate="txtEmail"
                                    ValidationExpression="^[a-z0-9][-a-z0-9._]+@([-a-z0-9]+[.])+[a-z]{2,5}$"
                                    ErrorMessage="Incorrect format"></asp:RegularExpressionValidator>

                            </div>

                            <!-- Username input -->

                            <fieldset>
                <legend>Login Details</legend>
                <div class="form">

                    <asp:Label ID="lblUsername" runat="server" Text="Username" AssociatedControlID="txtUsername"></asp:Label>
                    <div class="div_texbox">

                        <asp:TextBox ID="txtUsername" runat="server"
 CssClass="form-control"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="reqUsername" ControlToValidate="txtUsername" runat="server" Display="Dynamic" SetFocusOnError="true"
                        ErrorMessage="Username is required"></asp:RequiredFieldValidator>

                     <%--   <br />

                        <asp:RegularExpressionValidator ID="regusername" ControlToValidate="txtUsername" 
ValidationExpression="^[a-zA-Z]{5,}$" runat="server" 
ErrorMessage="Username must be minimum 5 characters"></asp:RegularExpressionValidator>--%>


                    </div>
                    <asp:Label ID="lblPassword" runat="server" Text="Password" AssociatedControlID="txtPassword"></asp:Label>
                   
                    <div class="div_texbox">
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>

                        <asp:RequiredFieldValidator ID="reqPassword" ControlToValidate="txtPassword" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator><br />

                       <%-- <asp:CustomValidator ID="CustomValidator1" runat="server"
                        ControlToValidate="txtPassword"  OnServerValidate="CustomValidator1_ServerValidate"
                        ValidateEmptyText="true"
                        ErrorMessage="Your password must be more than 6 character"></asp:CustomValidator>--%>


                        <asp:RegularExpressionValidator ID="regPassword" ControlToValidate="txtPassword" 
ValidationExpression="^(?=.*\d{2})(?=.*[a-zA-Z]{2}).{6,}$" runat="server" ErrorMessage="Password Not Strong"></asp:RegularExpressionValidator>

                    </div>

                    <asp:Label ID="lblCpassword" runat="server" Text="Confirm Password" AssociatedControlID="txtCpassword"></asp:Label>
                    <div class="div_texbox">
                        <asp:TextBox ID="txtCpassword" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>


                        <asp:RequiredFieldValidator ID="ReqCpassword" ControlToValidate="txtCpassword" runat="server" ErrorMessage="Required"></asp:RequiredFieldValidator><br />

                        <asp:CompareValidator ID="conPassword" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtCpassword"  Operator="Equal"
ErrorMessage="Password does not match"></asp:CompareValidator>

                    </div>

                    <asp:Label ID="Label2" runat="server" Text="Upload profile"></asp:Label>
                    <asp:FileUpload ID="FileUpload1" runat="server" 
CssClass="form-control" />
                </div>
                                </fieldset>



                       

                            <!-- Checkbox -->
                            <div class="mb-3">
                                <asp:Label runat="server"
                                    CssClass="form-label">How did you hear about us?</asp:Label>

                                <div class="form-check-inline">
                                    <asp:CheckBox runat="server" ID="chk1" OnCheckedChanged="chk1_CheckedChanged" AutoPostBack="true" />
                                    <asp:Label runat="server"
                                        CssClass="form-check-label">Email</asp:Label>
                                </div>
                                <div class="form-check-inline">
                                    <asp:CheckBox runat="server" ID="chk2" AutoPostBack="true" />
                                    <asp:Label runat="server"
                                        CssClass="form-check-label">Social Network</asp:Label>
                                </div>

                            </div>

                            <fieldset>

                            <div class="mb-3">

                                <asp:Button ID="btnSubmit" OnClick="btnSubmit_Click" runat="server" CssClass="btn btn-outline-primary btn-block" Style="color: #660000; background-color: #ffb366;" Text="Register" />

                                <asp:Button ID="btnClear" OnClick="btnClear_Click"  runat="server" CssClass="btn btn-outline-danger btn-block" Text="Clear All" CausesValidation="false" />

                              
                <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>

                            </div>
                                </fieldset>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </section>

</asp:Content>
