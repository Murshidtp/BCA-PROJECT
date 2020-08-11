<%@ Page Title="" Language="C#" MasterPageFile="~/clinic.master" AutoEventWireup="true" CodeFile="c_add_epidemic.aspx.cs" Inherits="c_add_epidemic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style3
        {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View3" runat="server">
                        <table class="style1">
                            <tr>
                                <td>
                                    <table class="style1">
                                        <tr>
                                            <td>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                                                    onitemcommand="DataGrid1_ItemCommand" style="margin-right: 226px" 
                                                    Width="821px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <AlternatingItemStyle BackColor="White" />
                                                    <Columns>
                                                        <asp:BoundColumn DataField="id" HeaderText="ID"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="date" HeaderText="DATE"></asp:BoundColumn>
                                                        <asp:BoundColumn DataField="epidemic_name" HeaderText="EPIDEMIC NAME">
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="details" HeaderText="DETAILS"></asp:BoundColumn>
                                                        <asp:ButtonColumn CommandName="delete" Text="Delete"></asp:ButtonColumn>
                                                    </Columns>
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle BackColor="#EFF3FB" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                                                    Text="ADD NEW" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <table class="style1">
                            <tr>
                                <td class="style3">
                                    Date</td>
                                <td class="style3">
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="invalid format" ForeColor="Red" 
                                        ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Epidemic Name</td>
                                <td class="style3">
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    Details</td>
                                <td class="style3">
                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style3">
                                    </td>
                                <td class="style3">
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

