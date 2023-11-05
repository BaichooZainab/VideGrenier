<%@ Page Title="home" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="videgrenier2110_2861.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


    <style>
       
        .ads{
           margin-left:30%;
        }
    </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div class="container text-center mt-2">
        <asp:Image ID="Image1" ImageUrl="/images/vgrenier.jpg" runat="server" />
    </div>


            <div class="container">

        <div class="row form-group" runat="server">
            <div class="col-sm-6 " style="float: left">
                <h2>List of Products</h2>
            </div>
            <div class="col-sm-3" style="float: right;">
                <div class="input-group">
                    <%--Trigger the TextChanged event--%>
                    <asp:DropDownList ID="ddlCategory" runat="server" OnSelectedIndexChanged="TextBox1_TextChanged"
                        CssClass="form-control" AutoPostBack="true">
                    </asp:DropDownList>&nbsp;
                </div>
            </div>
            <div class="col-sm-3" style="float: right;">
                <div class="input-group">
                    <%--generate text changed event--%>
                    <asp:TextBox ID="TextBox1"  OnTextChanged="TextBox1_TextChanged"  runat="server"  AutoPostBack="true" CssClass="form-control" Placeholder="Search..." />
                    <span class="input-group-addon">
                        <i class="fa fa-search"></i></span>
                </div>
            </div>
        </div>

        <%-- START AJAX CONTROL --%>
        <hr />


        <asp:UpdatePanel ID="UpdatePanel1" runat="server">

             <contentTemplate>
                  <asp:ListView
            ID="lvproduct" OnPagePropertiesChanging="lvproduct_PagePropertiesChanging" 
            runat="server" ItemPlaceholderID="itemPlaceholder" DataKeyNames="prod_id">



            <ItemTemplate>

                <div class="card"
                    style="width: 200px; float: left; margin: 8px;">
                    <asp:Image runat="server"
                        ImageUrl='<%# Eval("pictures", "~/images/{0}")%>' ID="Image1"
                        class="card-img-top" alt="Card image" Width="193px" Height="195px" />
                    <div class="card-body">
                        <h6 class="card-title"><%# Eval("prod_name")%></h6>
                        <p class="card-text">
                            by 
                        <asp:HyperLink runat="server" NavigateUrl='<%#Eval("prod_id","~/details.aspx?id={0}")%>'>
                            <%#Eval("brand_name").ToString() +": "+ Eval("prod_name").ToString() %>
                        </asp:HyperLink>
                        </p>

                        <p class="card-text">
                            <span><strong>Price of Products:<br />
                            </strong></span><%# Eval("cost_of_prod","{0:c}")%>
                        </p>
                        <%--Eval prod_id as the commandargument--%>
                        <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" ValidationGroup="prodgroup"  runat="server" Text="Request access" CommandName="btnAccess" CommandArgument='<%# Eval("prod_id") %>' CssClass="btn btn-primary" />

                    </div>
                </div>
            </ItemTemplate>
            <LayoutTemplate>
                <div id="itemPlaceholder" class="categoryContainer" runat="server">
                </div>
                <hr style="clear: both" />

                <div class="text-right">
<asp:DataPager ID="DataPager1" runat="server" PageSize="5">
<Fields>
<asp:NextPreviousPagerField ButtonType="Link"
ShowNextPageButton="false" ShowFirstPageButton="true" />
<asp:NumericPagerField />
<asp:NextPreviousPagerField ButtonType="Link"
ShowPreviousPageButton="false" ShowLastPageButton="true" />

</Fields>
</asp:DataPager>
</div
            </LayoutTemplate>
        </asp:ListView>

 </contentTemplate>

     <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlCategory" EventName="SelectedIndexChanged" />

            <asp:AsyncPostBackTrigger ControlID="TextBox1" EventName="TextChanged" />

        </Triggers>



        </asp:UpdatePanel>

       
       
        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
    </div>      
    


    <section class="container py-5">
        <div class="centeredText">
            <div class="ads">
                <asp:AdRotator
                    ID="AdRotator"
                    AdvertisementFile="~/App_Data/ads.xml"
                    runat="server" />
            </div>
        </div>

        </section>



       <section class="page-section cta" style="background-color: #ffb366;">
            <div class="container">
                <div class="row">
                    <div class="col-xl-9 mx-auto">
                        <div class="cta-inner bg-faded text-center rounded">
                            <h2 class="section-heading mb-4">
                                <span class="section-heading-upper">Our Job</span>
                                <span class="section-heading-lower">To You</span>
                            </h2>
                            <p style="background-color: grey; padding: 2px;" class="mb-3">When you travel throught our website to start your day, we are dedicated to provide you with friendly services, a welcoming atmosphere, and above all else, excellent products. If you are not satisfied, please let us know through post reviews and we will do whatever we can to make things right!</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>



   


</asp:Content>
