<%@ Page Title="login" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="videgrenier2110_2861.login1" %>

<%@ Register Src="~/loginadmin.ascx" TagPrefix="uc" TagName="login" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">


    <section class="vh-100 mb-5" style="background-color: #e67300;">
        <div class="container py-5 h-50">
            <div class="row d-flex justify-content-center align-items-center h-50">
                <div class="col col-xl-10">
                    <div class="card" style="border-radius: 1rem;">
                        <div class="row g-0">
                            <div class="col-md-6 col-lg-5 d-none d-md-block">
                                <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img1.webp"
                                    alt="login form" class="img-fluid" style="border-radius: 1rem 0 0 1rem;" />
                            </div>
                            <div class="col-md-6 col-lg-7 d-flex align-items-center">
                                <div class="card-body p-4 p-lg-5 text-black">

                                    <div class="d-flex align-items-center mb-3 pb-1">

                                        <span class="h1 fw-bold mb-0">Logo</span>
                                    </div>

                                    <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                                    <asp:PlaceHolder runat="server" ID="ErrorMessage"
                                        Visible="false">
                                        <p class="text-danger">
                                            <asp:Literal runat="server" ID="FailureText" />
                                        </p>
                                    </asp:PlaceHolder>

                                    <div class="form-outline mb-4">
<uc:login runat="server" ID="userlogin" />

                                    
                                  

                                    <div class="mb-3">
                                        <asp:Button runat="server" Text="Log in"
                                            ID="btnlogin" OnClick="btnlogin_Click"
                                            CssClass="col-12 btn btn-outline-dark btn-lg" />
                                    </div>

                                    <p>
                                         <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label><br />
                                        <asp:Button ID="btnRegister" runat="server"
                                            PostBackUrl="~/register.aspx" Text="Don’t have an account yet? 
Join now"
                                            CausesValidation="false" CssClass="btn" style="color:#660000; background-color:#ffb366;" />
                                    </p>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
