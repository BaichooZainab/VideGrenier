<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="addproduct.aspx.cs" Inherits="videgrenier2110_2861.add_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <!-- Section: Design Block -->
    <section class="text-center text-lg-start" style=" background-color: #Fbcb9c">
        <style>
            .cascading-right {
                margin-right: -50px;
            }

            @media (max-width: 991.98px) {
                .cascading-right {
                    margin-right: 0;
                }
            }
        </style>

        <!-- Jumbotron -->
        <div class="container py-4">
            <div class="row g-0 align-items-center">
                <div class="col-lg-6 mb-5 mb-lg-0">
                    <div class="card cascading-right" style="background: hsla(0, 0%, 100%, 0.55); backdrop-filter: blur(30px);">
                        <div class="card-body p-5 shadow-5 text-center">
                            <h2 class="fw-bold mb-5">Add Products</h2>

                            <div class="mb-3 form-outline">
                                <asp:Label runat="server" CssClass="form-label">Select a Category</asp:Label>

                                <asp:DropDownList ID="ddlcat" runat="server"
                                    CssClass="form-control">
                                </asp:DropDownList>
                            </div>

                            <div class="mb-3 form-outline">
                                <asp:Label runat="server" CssClass="col-md-2 col-form-label"></asp:Label>

                                <asp:TextBox runat="server" ID="txtpid" Visible="false"
                                    CssClass="form-control" />
                            </div>

                            <div class="mb-3 form-outline">
                                <asp:Label runat="server"
                                    CssClass="form-label">Product Name</asp:Label>

                                <asp:TextBox runat="server" ID="txtpname"
                                    CssClass="form-control" />
                            </div>

                            <div class="mb-3 form-outline">
                                <asp:Label runat="server"
                                    CssClass="col-md-2 col-form-label">usage time</asp:Label>

                                <asp:TextBox runat="server" ID="txtusage"
                                    CssClass="form-control" />
                            </div>

                              <div class="mb-3 form-outline">
                                <asp:Label runat="server" CssClass="col-md-2 col-form-label">Brand name</asp:Label>

                               <asp:TextBox runat="server" ID="txtbrand" CssClass="form-control" />
                            </div>

                            <div class="mb-3 form-outline">
                                <asp:Label runat="server" CssClass="col-md-2 col-form-label">Cost of Products</asp:Label>

                                   <asp:TextBox runat="server" ID="txtcost" CssClass="form-control" />
                            </div>

                            <div class="mb-3">
                                <asp:Label runat="server" CssClass="form-label">Description  
                                 <span id="notif" class="badge bg-danger rounded-pill" runat="server"></span>
                                </asp:Label>

                                <asp:TextBox runat="server" ID="txtdesc" AutoPostBack="true"
                
                                    TextMode="Multiline" CssClass="form-control" />

                            </div>

                          <div class="mb-3 form-outline">
                            <asp:Label runat="server" CssClass="col-md-2 col-form-label">Document</asp:Label>

                             <asp:FileUpload ID="fudoc" runat="server" CssClass="" />
                             <asp:Image ID="Image2" runat="server" Visible="false" Width="75" Height="100" />

                          </div>

                        <div class="mb-3 form-outline">
                                 <asp:Label runat="server"
                                    CssClass="form-label">Expiry Date</asp:Label>

                                <asp:TextBox runat="server" ID="txtexp" TextMode="Date" CssClass="form-control" />
                                  
                            </div>

                          <div class="mb-3 form-outline">
                              <asp:Label runat="server" CssClass="col-md-2 col-form-label">Product Image</asp:Label>
            
                                 <asp:FileUpload ID="fupicture" runat="server" CssClass="" />
                                  <asp:Image ID="Image1" runat="server" Visible="false" Width="75" Height="100" />
                           </div>

                            
                               <div class="mb-3 form-outline">
                                 <asp:Label runat="server" CssClass="col-md-2 col-form-label"></asp:Label>
           
                                 <div class="form-check-inline">
                                        <asp:CheckBox runat="server" ID="chkstatus" CssClass="form-check-input" />
                                        <asp:Label runat="server" CssClass="form-check-label">Status</asp:Label>
                                 </div>
                             </div>
                          


                            <div class="mb-3">
                                <asp:Button runat="server" ID="btnAddprod" OnClick="btnAddprod_Click" Text="ADD PRODUCT"
                                    CssClass="col-12 btn btn-outline-primary btn-lg" BackColor="Blue" ForeColor="White" />
                            </div>

                       

                            <div class="mb-3">
                                <asp:Button runat="server" ID="btncancel" OnClick="btncancel_Click" Text="Cancel"
                    Visible="false" CssClass="btn btn-block btn-outline-primary" />
                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label>

                            </div>


                   
                    </div>
                </div>

                
            </div>
        </div>
         </div>
        <!-- Jumbotron -->
    </section>
   

</asp:Content>
