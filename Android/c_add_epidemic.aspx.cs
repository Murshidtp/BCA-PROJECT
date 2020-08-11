using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class c_add_epidemic : System.Web.UI.Page
{
    dboprtn dbo = new dboprtn();
    static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View3);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from add_epdmc";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
        cmd.CommandText = "Select max(id)from add_epdmc";
        id = dbo.main(cmd);

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View4);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "insert into add_epdmc values('" + id + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "') ";
        dbo.execute(cmd);
        Response.Write("<script> alert('Post successfully') </script>");
        TextBox1.Text = " ";
        TextBox2.Text = " ";
        TextBox3.Text = " ";
        MultiView1.SetActiveView(View3);
        cmd.CommandText = "select * from add_epdmc";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete from add_epdmc where id='" + e.Item.Cells[0].Text + "'";
            dbo.execute(cmd);

            MultiView1.SetActiveView(View3);
            cmd.CommandText = "select * from add_epdmc";
            DataGrid1.DataSource = dbo.get(cmd);
            DataGrid1.DataBind();
        }
    }
}