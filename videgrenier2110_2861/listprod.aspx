<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="listprod.aspx.cs" Inherits="videgrenier2110_2861.listprod" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .content {
            border: solid 1px black;
            background-color: #424242;
            color: #660000;
            padding-bottom: 2px;
        }

        .prod {
            width: 900px;
            border-collapse: collapse;
            text-align: justify;
            margin: auto;
        }

            .prod th, .prod td {
                padding: 10px;
                border-bottom: 5px solid #424242;
            }

            .prod th {
                color: aliceblue;
            }

        .item {
            background-color: #ffd480;
        }

        .alternating {
            background-color:  #ffdd99;
        }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

  

    <div class="row">
        <div class="content">
            <asp:Repeater
                ID="rptProduct"
                runat="server">
                <HeaderTemplate>
                    <table class="prod">
                        <tr>
                            <th>Product Title</th>
                            <th>Product Price</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="item">
                        <td><%#Eval("Prod_name") %></td>
                        <td><%#Eval("cost_of_prod","{0:c}") %></td>
                    </tr>
                </ItemTemplate>
                <AlternatingItemTemplate>
                    <tr class="alternating">
                        <td><%#Eval("Prod_name") %></td>
                        <td><%#Eval("cost_of_prod","{0:c}") %></td>
                    </tr>
                </AlternatingItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>
 <br />

</asp:Content>
