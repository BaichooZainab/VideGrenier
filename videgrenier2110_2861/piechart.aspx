<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="piechart.aspx.cs" Inherits="videgrenier2110_2861.piechart" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <asp:DropDownList ID="ddlCategory" OnSelectedIndexChanged="ddlCategory_SelectedIndexChanged" AutoPostBack="true" runat="server"></asp:DropDownList>


    <ajaxToolkit:PieChart ID="PieChart1" ChartHeight="600" ChartWidth="500" ChartTitle="Stats for categories" runat="server"></ajaxToolkit:PieChart>

</asp:Content>

