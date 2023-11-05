<%@ Page Title="Introducing C#" Language="C#" MasterPageFile="~/dummy.Master" AutoEventWireup="true" CodeBehind="welcome.aspx.cs" Inherits="videgrenier2110_2861.welcome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    Hello world !!!

    <asp:Button ID="btn1" runat="server" Text="Button" OnClick="btn1_Click" />

    <asp:Label ID="lblresult" runat="server" Text="message" BackColor="Black" ForeColor="#CC3399"></asp:Label>
</asp:Content>
