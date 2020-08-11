<%@ Page Title="" Language="C#" MasterPageFile="~/clinic.master" AutoEventWireup="true" CodeFile="c_patbookng.aspx.cs" Inherits="c_patbookng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 23px;
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
                                        onitemcommand="DataGrid1_ItemCommand" Width="781px">
                                        <Columns>
                                            <asp:BoundColumn DataField="id" HeaderText="ID"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="date" HeaderText="DATE"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="p_name" HeaderText="Patient NAME"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="d_name" HeaderText="Doctor  name"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="department" HeaderText="Department">
                                            </asp:BoundColumn>
                                            <asp:ButtonColumn CommandName="view" Text="view"></asp:ButtonColumn>
                                        </Columns>
                                    </asp:DataGrid>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table class="style1">
                            <tr>
                                <td>
                                    &nbsp;Patient Name</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Token no</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style2">
                                    &nbsp;</td>
                                <td class="style2">
                                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="SEND" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>

