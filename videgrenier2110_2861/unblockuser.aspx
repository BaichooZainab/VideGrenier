<%@ Page Title="" Language="C#" MasterPageFile="~/grand.Master" AutoEventWireup="true" CodeBehind="unblockuser.aspx.cs" Inherits="videgrenier2110_2861.unblockuser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        #gvs {
            width: 100%;
        }

        th {
            background: #494e5d;
            color: white;
        }
    </style>



</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="maincontent" runat="server">

    <div class="row">
        <div class="col-lg-12">
            <h2>Unblock users:</h2>
        </div>
    </div>
    <asp:GridView ID="gvs" OnPreRender="gvs_PreRender" ClientIDMode="Static" CssClass="table table-striped table-bordered"
        runat="server" AutoGenerateColumns="false" HeaderStyle-BackColor="#9900cc">
        <Columns>
            <asp:BoundField DataField="first_name" HeaderText="First Name" />
            <asp:BoundField DataField="last_name" HeaderText="Last Name" />
            <asp:BoundField DataField="username" HeaderText="Username" />
            <asp:ImageField DataImageUrlField="profile_pic" ControlStyle-Width="50"
                DataImageUrlFormatString="~/images/{0}" HeaderText="profile" />
            <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <%-- Assign the User_Id to the link button using the CommandArgument --%>
                    <asp:LinkButton ID="lnkunblock" CssClass="btn btn-outline-warning"
                        runat="server" OnClick="lnkunblock_Click" CommandArgument='<%# Eval("user_id") %>'>Unblock</asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>

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
    <br />

</asp:Content>
