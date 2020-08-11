using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class h_view_comfrmpub : System.Web.UI.Page
{
    dboprtn dbo = new dboprtn();
    static int id, upid;
    protected void Page_Load(object sender, EventArgs e)
    {
         MultiView1.SetActiveView(View1);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from comp_frmpub";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
     
        cmd.CommandText = "Select max(id)from complaint";
        id = dbo.main(cmd);
    }

    protected void  Button1_Click(object sender, EventArgs e)
{
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update comp_frmpub set reply='" + TextBox2.Text + "' where id='" + upid + "'";
        dbo.execute(cmd);
        Response.Write("<script>alert('replied')</script>");
        TextBox2.Text = " ";
       
        cmd.CommandText = "select * from comp_frmpub";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
}
protected void  DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
{
    upid = Convert.ToInt32(e.Item.Cells[0].Text);
    if (e.CommandName == "reply")
    {

        MultiView1.SetActiveView(View2);
        TextBox1.Text = e.Item.Cells[2].Text;
    }

}
}
    