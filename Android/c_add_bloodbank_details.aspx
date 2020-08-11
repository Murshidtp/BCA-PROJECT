<%@ Page Title="" Language="C#" MasterPageFile="~/clinic.master" AutoEventWireup="true" CodeFile="c_add_bloodbank_details.aspx.cs" Inherits="c_add_bloodbank_details" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="View1" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" 
                            onitemcommand="DataGrid1_ItemCommand" 
                            onselectedindexchanged="DataGrid1_SelectedIndexChanged" Width="852px">
                            <Columns>
                                <asp:BoundColumn DataField="id" HeaderText="ID"></asp:BoundColumn>
                                <asp:BoundColumn DataField="blood_grp" HeaderText="BLOOD GROUP">
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="units" HeaderText="UNITS"></asp:BoundColumn>
                                <asp:ButtonColumn CommandName="Update" Text="Update"></asp:ButtonColumn>
                                <asp:ButtonColumn CommandName="Delete" Text="Delete"></asp:ButtonColumn>
                            </Columns>
                        </asp:DataGrid>
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                            style="height: 26px" Text="ADD NEW" />
                    </td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1">
        <tr>
            <td>
                Blood Group</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    onselectedindexchanged="DropDownList1_SelectedIndexChanged1" 
                    style="height: 22px; width: 76px">
                    <asp:ListItem>SELECT</asp:ListItem>
                    <asp:ListItem> A +ve</asp:ListItem>
                    <asp:ListItem>A -ve</asp:ListItem>
                    <asp:ListItem>B +ve</asp:ListItem>
                    <asp:ListItem>B -ve</asp:ListItem>
                    <asp:ListItem>AB +ve</asp:ListItem>
                    <asp:ListItem>AB -ve</asp:ListItem>
                    <asp:ListItem>O +ve</asp:ListItem>
                    <asp:ListItem>O -ve</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="DropDownList1" ErrorMessage="*" ForeColor="Red" 
                    InitialValue="SELECT"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                Unit</td>
            <td>
                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="ADD" />
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="UPDATE" />
            </td>
        </tr>
    </table>
        </asp:View>
    </asp:MultiView>
    
&nbsp;&nbsp;&nbsp; 
    </asp:Content>

