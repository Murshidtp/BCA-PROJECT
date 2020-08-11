<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="a_view_feedback.aspx.cs" Inherits="a_view_feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                    Width="864px">
                    <Columns>
                        <asp:BoundColumn DataField="id" HeaderText="ID"></asp:BoundColumn>
                        <asp:BoundColumn DataField="date" HeaderText="DATE"></asp:BoundColumn>
                        <asp:BoundColumn DataField="p_name" HeaderText="NAME"></asp:BoundColumn>
                        <asp:BoundColumn DataField="feedback" HeaderText="FEEDBACK"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
    </table>
</asp:Content>

