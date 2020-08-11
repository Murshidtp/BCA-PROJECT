<%@ Page Title="" Language="C#" MasterPageFile="~/admin.master" AutoEventWireup="true" CodeFile="a_clinic_regi.aspx.cs" Inherits="a_clinic_regi" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 100%;
            height: 269px;
        }
        .style5
        {
            height: 40px;
        }
        .style6
        {
            height: 41px;
        }
        .style7
        {
            height: 40px;
            width: 256px;
        }
        .style8
        {
            height: 41px;
            width: 256px;
        }
        .style9
        {
            width: 256px;
            height: 39px;
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
                                        onitemcommand="DataGrid1_ItemCommand" 
                                        onselectedindexchanged="DataGrid1_SelectedIndexChanged" Width="850px" 
                                        CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <AlternatingItemStyle BackColor="White" />
                                        <Columns>
                                            <asp:BoundColumn DataField="id" HeaderText="ID"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="name" HeaderText="NAME"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="district" HeaderText="DISTRICT"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="place" HeaderText="PLACE"></asp:BoundColumn>
                                            <asp:BoundColumn DataField="phone_number" HeaderText="CONTACT">
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="email" HeaderText="EMAIL"></asp:BoundColumn>
                                            <asp:ButtonColumn CommandName="update" Text="update"></asp:ButtonColumn>
                                            <asp:ButtonColumn CommandName="delete" Text="delete"></asp:ButtonColumn>
                                        </Columns>
                                        <EditItemStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <ItemStyle BackColor="#EFF3FB" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:DataGrid>
                                </td>
                                <td>
                                &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                                        style="margin-left: 0px" Text="ADD" Width="87px" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:View>
                    <asp:View ID="View2" runat="server">
                        <table class="style1">
                            <tr>
                                <td class="style7">
                                Name</td>
                                <td class="style5">
                                    <asp:TextBox ID="TextBox1" runat="server" ontextchanged="TextBox1_TextChanged"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                        ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                District</td>
                                <td class="style5">
                                    <asp:DropDownList ID="DropDownList1" runat="server" Height="19px" Width="120px">
                                        <asp:ListItem>SELECT </asp:ListItem>
                                        <asp:ListItem>Kasargod</asp:ListItem>
                                        <asp:ListItem>Kannur</asp:ListItem>
                                        <asp:ListItem>Wayanad</asp:ListItem>
                                        <asp:ListItem>Kozhikkode</asp:ListItem>
                                        <asp:ListItem>Malappuram</asp:ListItem>
                                        <asp:ListItem>Palakkad</asp:ListItem>
                                        <asp:ListItem>Thrissur</asp:ListItem>
                                        <asp:ListItem>Ernamkulam</asp:ListItem>
                                        <asp:ListItem>Idukki</asp:ListItem>
                                        <asp:ListItem>Pathanamthitta</asp:ListItem>
                                        <asp:ListItem>Alappuzha</asp:ListItem>
                                        <asp:ListItem>Kottayam</asp:ListItem>
                                        <asp:ListItem>Kollam</asp:ListItem>
                                        <asp:ListItem>Thiruvananthapuram</asp:ListItem>
                                        <asp:ListItem></asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                        ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="Red" 
                                        InitialValue="SELECT"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                place</td>
                                <td class="style5">
                                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                        ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                Phone Number</td>
                                <td class="style5">
                                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                        ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                        ControlToValidate="TextBox4" ErrorMessage="invalid format" ForeColor="Red" 
                                        ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8">
                                Email</td>
                                <td class="style6">
                                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                        ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                        ControlToValidate="TextBox5" ErrorMessage="invalid fomat" ForeColor="Red" 
                                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                                </td>
                                <td class="style5">
                                    <asp:TextBox ID="TextBox6" runat="server" ontextchanged="TextBox6_TextChanged" 
                                        Width="150px"></asp:TextBox>
                                    &nbsp;
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                        ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    </td>
                                <td class="style5">
                                    <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="SAVE" />
                                    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="UPDATE" />
                                </td>
                            </tr>
                        </table>
                    </asp:View>
                </asp:MultiView>
            </td>
        </tr>
    </table>
</asp:Content>

