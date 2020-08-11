using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
public partial class a_clinic_regi : System.Web.UI.Page
{
    dboprtn dbo = new dboprtn();
    static int id,upid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            MultiView1.SetActiveView(View1);
           

            cmd.CommandText = "select * from clinic_reg ";
            DataGrid1.DataSource = dbo.get(cmd);
            DataGrid1.DataBind();


        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
        Button3.Visible = true;
        Button1.Visible = false;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Select max(id)from clinic_reg";
        id = dbo.main(cmd);

        Label3.Visible = true;
        TextBox6.Visible = true;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlCommand cmd=new SqlCommand();
        cmd.CommandText = "insert into clinic_reg values('"+id+"','"+TextBox1.Text+"','"+DropDownList1.SelectedValue+"','"+TextBox3.Text+"','"+TextBox4.Text+"','"+TextBox5.Text+"') ";
        dbo.execute(cmd);
        cmd.CommandText = "insert into login values('" + id + "','" + TextBox5.Text + "','" + TextBox6.Text + "','clinic')";
        dbo.execute(cmd);
        Response.Write("<script> alert('add successfully') </script>");
        TextBox1.Text=" ";
        DropDownList1.SelectedIndex=-1;
        TextBox3.Text=" ";
        TextBox4.Text = " ";
        TextBox5.Text=" ";
        MultiView1.SetActiveView(View1);
        cmd.CommandText = "select * from clinic_reg";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
        cmd.CommandText = "Select max(id)from clinic_reg";
        id = dbo.main(cmd);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update clinic_reg set name='" + TextBox1.Text + "',district='" + DropDownList1.SelectedValue + "',place='" + TextBox3.Text + "',phone_number='" + TextBox4.Text + "',email='" + TextBox5.Text + "' where id='" + upid + "'";
        dbo.execute(cmd);
        cmd.CommandText = "update login set usrnme='" + TextBox5.Text + "' where id='" + upid + "' and type='clinic'";
        dbo.execute(cmd);
        Response.Write("<script>alert('updated')</script>");

        MultiView1.SetActiveView(View1);
        cmd.CommandText = "select * from clinic_reg";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
    }
    protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        upid = Convert.ToInt32(e.Item.Cells[0].Text);
        if (e.CommandName == "update")
        {
            MultiView1.SetActiveView(View2);
            Button1.Visible = true;
            Button3.Visible= false;
            upid = Convert.ToInt32(e.Item.Cells[0].Text);
            TextBox1.Text = e.Item.Cells[1].Text;
            DropDownList1.SelectedValue = e.Item.Cells[2].Text;
            TextBox3.Text = e.Item.Cells[3].Text;
            TextBox4.Text = e.Item.Cells[4].Text;
            TextBox5.Text = e.Item.Cells[5].Text;

            Label3.Visible = false;
            TextBox6.Visible = false;
        }
        else 
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete from clinic_reg where id='" + e.Item.Cells[0].Text + "'";
            dbo.execute(cmd);

            MultiView1.SetActiveView(View1);
            cmd.CommandText = "select * from clinic_reg";
            DataGrid1.DataSource = dbo.get(cmd);
            DataGrid1.DataBind();
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void TextBox6_TextChanged(object sender, EventArgs e)
    {

    }
}
