using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class h_helth_relatdinfaspx : System.Web.UI.Page
{
    dboprtn dbo = new dboprtn();
    static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from health_infr";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
        cmd.CommandText = "Select max(id)from health_infr";
        id = dbo.main(cmd);

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View2);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "insert into health_infr values('" + id + "','" + TextBox1.Text + "','" + TextBox2.Text + "') ";
        dbo.execute(cmd);
        Response.Write("<script> alert('Add successfully') </script>");
        TextBox1.Text = " ";
        TextBox2.Text = " ";
        MultiView1.SetActiveView(View1);
        cmd.CommandText = "select * from health_infr";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        if (e.CommandName == "delete")
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "delete from health_infr where id='" + e.Item.Cells[0].Text + "'";
            dbo.execute(cmd);

            MultiView1.SetActiveView(View1);
            cmd.CommandText = "select * from health_infr";
            DataGrid1.DataSource = dbo.get(cmd);
            DataGrid1.DataBind();
        }
    }
}