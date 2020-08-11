<%@ Page Title="" Language="C#" MasterPageFile="~/hdpt.master" AutoEventWireup="true" CodeFile="h_verify_report.aspx.cs" Inherits="h_verify_report" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="nav-justified">
        <tr>
            <td>
                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                    Width="1307px" onitemcommand="DataGrid1_ItemCommand" 
                    onselectedindexchanged="DataGrid1_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundColumn DataField="date" HeaderText="DATE"></asp:BoundColumn>
                        <asp:BoundColumn DataField="p_name" HeaderText="NAME"></asp:BoundColumn>
                        <asp:BoundColumn DataField="age" HeaderText="AGE"></asp:BoundColumn>
                        <asp:BoundColumn DataField="gender" HeaderText="GENDER"></asp:BoundColumn>
                        <asp:BoundColumn DataField="blood_group" HeaderText="BLOOD GROUP"></asp:BoundColumn>
                        <asp:BoundColumn DataField="place" HeaderText="PLACE"></asp:BoundColumn>
                        <asp:BoundColumn DataField="district" HeaderText="DISTRICT"></asp:BoundColumn>
                        <asp:BoundColumn DataField="result" HeaderText="RESULT"></asp:BoundColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
    </table>
</asp:Content>

