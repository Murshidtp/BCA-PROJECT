<%@ Page Title="" Language="C#" MasterPageFile="~/clinic.master" AutoEventWireup="true" CodeFile="c_adddoct.aspx.cs" Inherits="c_adddoct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 927px;
    }
    .style2
    {
        width: 813px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:MultiView ID="MultiView1" runat="server">
                    <asp:View ID="View3" runat="server">
                        <table class="style1">
                            <tr>
                                <td>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                                        onitemcommand="DataGrid1_ItemCommand" Width="807px">
                                        <Columns>
                                            <asp:BoundColumn DataField="id" HeaderText="ID"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="d_name" HeaderText="NAME"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="department" HeaderText="DEPARTMENT">
                                            </asp:BoundColumn>
                                            <asp:ButtonColumn CommandName="update" Text="update"></asp:ButtonColumn>
                                            <asp:ButtonColumn CommandName="delete" Text="delete"></asp:ButtonColumn>
                                        </Columns>
                                    </asp:DataGrid>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="Button4" runat="server" onclick="Button4_Click" 
                                        Text="ADD DOCTOR" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View4" runat="server">
                        <table class="style1">
                            <tr>
                                <td>
                                    Name</td>
                                <td>
                                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Department</td>
                                <td>
                                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="Button1" runat="server" Text="UPDATE" onclick="Button1_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="Button3" runat="server" Text="SAVE" onclick="Button3_Click" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>

