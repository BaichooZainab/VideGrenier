<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="Statistics.aspx.cs" Inherits="videgrenier2110_2861.Statistics" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

        <div class="container-fluid" style=" background-color: #Fbcb9c">
        <div class="row" style="margin: 50px;">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4 mt-4">
                    <div class="card-body">Products Available:</div>
                    <div class="card-footer d-flex align-items-center justify-contentbetween">
                        <asp:HyperLink ID="hyprod" runat="server" CssClass="small 
text-white stretched-link"></asp:HyperLink>

                        <a class="small text-white stretched-link" href="/viewprod.aspx">View 
Products</a>

                        <div class="small text-white"><i class="fas fa-angleright"></i></div>
                    </div>
                </div>
            </div>



            <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4 mt-4">
                    <div class="card-body">Users</div>
                    <div class="card-footer d-flex align-items-center justify-contentbetween">
 <asp:HyperLink ID="hyuser" runat="server" CssClass="small 
text-white stretched-link"></asp:HyperLink>
                     
 <a class="small text-white stretched-link" href="/viewusers.aspx">View 
Users</a>
                        <div class="small text-white"><i class="fas fa-angleright"></i></div>
                    </div>
                </div>
            </div>

            </div>
    </div>

    
 <asp:DropDownList ID="ddlCategory"  OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>


    <ajaxToolkit:PieChart ID="PieChart1" ChartHeight="600" ChartWidth="500" ChartTitle="Stats for categories" runat="server"></ajaxToolkit:PieChart>

    
    <br />
   <br />
    <br />
    <br />
    <br />
    <br />
    <br />
   <br />
    <br />
    <br />
    <br />
    <br />
    <br />

</asp:Content>
