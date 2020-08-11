using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class c_adddoct : System.Web.UI.Page
{
    dboprtn dbo = new dboprtn();
    static int id, upid;
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View3);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from add_doctr where c_id='"+Session["id"]+"'";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
        cmd.CommandText = "Select max(id)from add_doctr";
        id = dbo.main(cmd);
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View4);
        Button3.Visible = true;
        Button1.Visible = false;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update add_doctr set d_name='" + TextBox1.Text + "',department='" + TextBox2.Text + "' where id='" + upid + "'";
        dbo.execute(cmd);
        Response.Write("<script>alert('updated')</script>");

        MultiView1.SetActiveView(View3);
        cmd.CommandText = "select * from add_doctr where c_id='" + Session["id"] + "'";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "insert into add_doctr values('" + id + "','" + TextBox1.Text + "','" + TextBox2.Text +  "','"+Session["id"]+"') ";
        dbo.execute(cmd);
        Response.Write("<script> alert('add successfully') </script>");
        TextBox1.Text = " ";
        TextBox2.Text = " ";
        MultiView1.SetActiveView(View3);
        cmd.CommandText = "select * from add_doctr where c_id='" + Session["id"] + "'";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.CommandName == "update")
        {
            SqlCommand cmd = new SqlCommand();
            MultiView1.SetActiveView(View4);
            Button1.Visible = true;
            Button3.Visible = false;
            upid = Convert.ToInt32(e.Item.Cells[0].Text);
            TextBox1.Text = e.Item.Cells[1].Text;
            TextBox2.Text = e.Item.Cells[2].Text;

        }
        else
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete from add_doctr where id='" + e.Item.Cells[0].Text + "'";
            dbo.execute(cmd);

            MultiView1.SetActiveView(View3);
            cmd.CommandText = "select * from add_doctr where c_id='" + Session["id"] + "'";
            DataGrid1.DataSource = dbo.get(cmd);
            DataGrid1.DataBind();
        }
    }
}