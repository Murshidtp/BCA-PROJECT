using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class c_add_bloodbank_details : System.Web.UI.Page
{
    dboprtn dbo=new dboprtn();
    SqlCommand cmd = new SqlCommand();
    static int id,upid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            MultiView1.SetActiveView(View1);
            cmd.CommandText = "Select max(id)from add_bloodbnk";
            id = dbo.main(cmd);

            cmd.CommandText = "select * from add_bloodbnk where c_id='" + Session["id"] + "'";
            DataGrid1.DataSource = dbo.get(cmd);
            DataGrid1.DataBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       
        
        cmd.CommandText = "insert into add_bloodbnk values('"+id+"','"+Session["id"]+"','"+DropDownList1.SelectedValue+"','"+TextBox4.Text+"') ";
        dbo.execute(cmd);
        Response.Write("<script> alert('add successfully') </script>");
       
        TextBox4.Text = " ";
        DropDownList1.SelectedIndex =-1;
        MultiView1.SetActiveView(View1);
        cmd.CommandText = "select * from add_bloodbnk where c_id='" + Session["id"] + "'";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
        cmd.CommandText = "Select max(id)from add_bloodbnk";
        id = dbo.main(cmd);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        cmd.CommandText = "update add_bloodbnk set units='" + TextBox4.Text + "',blood_grp='" + DropDownList1.SelectedValue + "' where id='" + upid + "'";
        dbo.execute(cmd);
        Response.Write("<script>alert('updated')</script>");
        TextBox4.Text = " ";
        DropDownList1.SelectedIndex = -1;

        MultiView1.SetActiveView(View1);
        cmd.CommandText = "select * from add_bloodbnk where c_id='" + Session["id"] + "'";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
        Button1.Visible = true;
        Button2.Visible = false;
    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.CommandName == "Update")
        {
            MultiView1.SetActiveView(View2);
            Button2.Visible = true;
            Button1.Visible = false;
            upid = Convert.ToInt32(e.Item.Cells[0].Text);
            TextBox4.Text = e.Item.Cells[2].Text;
            DropDownList1.SelectedValue = e.Item.Cells[1].Text;


        }
        else
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete from add_bloodbnk where id='" + e.Item.Cells[0].Text + "'";
            dbo.execute(cmd);

            MultiView1.SetActiveView(View1);
            cmd.CommandText = "select * from add_bloodbnk";
            DataGrid1.DataSource = dbo.get(cmd);
            DataGrid1.DataBind();
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}