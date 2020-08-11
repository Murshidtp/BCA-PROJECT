<%@ Page Title="" Language="C#" MasterPageFile="~/clinic.master" AutoEventWireup="true" CodeFile="c_blood_analising.aspx.cs" Inherits="c_blood_analising" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 50px;
            font-weight: 700;
        }
        .style2
        {
            height: 53px;
        }
        .style3
        {
            height: 51px;
        }
        .style4
        {
            height: 59px;
        }
        .style5
        {
            height: 66px;
        }
        .style6
        {
            height: 50px;
            color: #000000;
        }
        .style7
        {
            height: 50px;
            font-weight: 700;
            color: #000000;
        }
        .style8
        {
            height: 53px;
            color: #000000;
        }
        .style9
        {
            height: 51px;
            color: #000000;
        }
        .style10
        {
            height: 26px;
            font-weight: 700;
            color: #000000;
        }
        .style11
        {
            height: 26px;
            font-weight: 700;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="nav-justified">
        <tr>
            <td class="style6">
                <strong>Patient Name</strong></td>
            <td class="style1">
                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style7">
                <strong>Age</strong><br />
            </td>
            <td class="style1">
                <asp:RadioButtonList ID="RadioButtonList12" runat="server">
                    <asp:ListItem Value="0">0-10</asp:ListItem>
                    <asp:ListItem Value="1">10-20</asp:ListItem>
                    <asp:ListItem Value="2">20-30</asp:ListItem>
                    <asp:ListItem Value="3">30 and Above</asp:ListItem>
                </asp:RadioButtonList>
                .</td>
        </tr>
        <tr>
            <td class="style10">
                <strong>Gender</strong></td>
            <td class="style11">
                <asp:RadioButtonList ID="RadioButtonList8" runat="server">
                    <asp:ListItem Value="0">Female</asp:ListItem>
                    <asp:ListItem Value="1">Male</asp:ListItem>
                </asp:RadioButtonList>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style7">
                Living Area</td>
            <td class="style1">
                <asp:RadioButtonList ID="RadioButtonList4" runat="server">
                    <asp:ListItem Value="0">Urban</asp:ListItem>
                    <asp:ListItem Value="1">Rural</asp:ListItem>
                    <asp:ListItem Value="2">Suburban</asp:ListItem>
                </asp:RadioButtonList>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style8">
                <strong>Patient have suffering seasonal diseases?</strong></td>
            <td class="style2">
                <asp:RadioButtonList ID="RadioButtonList6" runat="server">
                    <asp:ListItem Value="0">Yes</asp:ListItem>
                    <asp:ListItem Value="1">No</asp:ListItem>
                </asp:RadioButtonList>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style9">
                <strong>Obesity</strong></td>
            <td class="style3">
                <asp:RadioButtonList ID="RadioButtonList7" runat="server">
                    <asp:ListItem Value="0">18.5 to &lt;25</asp:ListItem>
                    <asp:ListItem Value="1">25.0 to &lt;30</asp:ListItem>
                    <asp:ListItem Value="2">30.0 to above</asp:ListItem>
                </asp:RadioButtonList>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style4">
                <strong>Blood pressure</strong></td>
            <td class="style4">
                <asp:RadioButtonList ID="RadioButtonList3" runat="server" Height="16px" 
                    Width="225px">
                    <asp:ListItem Value="0">HighLevel</asp:ListItem>
                    <asp:ListItem Value="1">NormalLevel</asp:ListItem>
                    <asp:ListItem Value="2">LowLevel</asp:ListItem>
                </asp:RadioButtonList>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>RBC</strong></td>
            <td class="style3">
                <asp:RadioButtonList ID="RadioButtonList9" runat="server">
                    <asp:ListItem Value="0">High Level</asp:ListItem>
                    <asp:ListItem Value="1">Normal Level</asp:ListItem>
                    <asp:ListItem Value="2">Low Level</asp:ListItem>
                </asp:RadioButtonList>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>WBC</strong></td>
            <td class="style3">
                <asp:RadioButtonList ID="RadioButtonList10" runat="server" 
                    onselectedindexchanged="RadioButtonList10_SelectedIndexChanged">
                    <asp:ListItem Value="0">High Level</asp:ListItem>
                    <asp:ListItem Value="1">Normal Level</asp:ListItem>
                    <asp:ListItem Value="2">Low Level</asp:ListItem>
                </asp:RadioButtonList>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style3">
                <strong>PLATELETS</strong></td>
            <td class="style3">
                <asp:RadioButtonList ID="RadioButtonList11" runat="server">
                    <asp:ListItem Value="0">High Level</asp:ListItem>
                    <asp:ListItem Value="1">Normal Level</asp:ListItem>
                    <asp:ListItem Value="2">Low Level</asp:ListItem>
                </asp:RadioButtonList>
                <br />
            </td>
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td class="style5">
                <asp:Button ID="Button1" runat="server" Height="37px" onclick="Button1_Click" 
                    Text="PREDICTION" Width="102px" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="RESULT"></asp:Label>
            </td>
            <td>
                <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

