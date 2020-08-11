<%@ Page Title="" Language="C#" MasterPageFile="~/hdpt.master" AutoEventWireup="true" CodeFile="c_analsdresltforwtopatn.aspx.cs" Inherits="c_analsdresltforwtopatn" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 1150px;
        }
        .style2
        {
            width: 1185px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <table class="style1">
        <tr>
            <td class="style2">
                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                    Height="204px" onitemcommand="DataGrid1_ItemCommand" Width="1095px">
                    <Columns>
                        <asp:BoundColumn DataField="id" HeaderText="ID"></asp:BoundColumn>
                        <asp:BoundColumn DataField="p_name" HeaderText="Patient Name"></asp:BoundColumn>
                        <asp:BoundColumn DataField="date" HeaderText="Date"></asp:BoundColumn>
                        <asp:BoundColumn DataField="result" HeaderText="Result"></asp:BoundColumn>
                        <asp:ButtonColumn Text="view"></asp:ButtonColumn>
                    </Columns>
                </asp:DataGrid>
            </td>
        </tr>
        </table>
</asp:Content>

