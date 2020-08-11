<%@ Page Title="" Language="C#" MasterPageFile="~/hdpt.master" AutoEventWireup="true" CodeFile="h_view_comfrmpub.aspx.cs" Inherits="h_view_comfrmpub" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 30px;
        }
        .style3
        {
            height: 26px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View1" runat="server">
                        <table class="style1">
                            <tr>
                                <td>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                                        onitemcommand="DataGrid1_ItemCommand" Width="768px">
                                        <Columns>
                                            <asp:BoundColumn DataField="id" HeaderText="ID"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="date" HeaderText="DATE"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="complaint" HeaderText="COMPLAINT"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="reply" HeaderText="REPLY" Visible="False"></asp:BoundColumn>
                                            <asp:ButtonColumn CommandName="reply" Text="Reply"></asp:ButtonColumn>
                                        </Columns>
                                    </asp:DataGrid>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table class="style1">
                            <tr>
                                <td>
                                    Complaint</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Reply</td>
                                <td class="style3">
                                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                </td>
                                <td class="style2">
                                    <asp:Button ID="Button1" runat="server" Text="POST" onclick="Button1_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>

