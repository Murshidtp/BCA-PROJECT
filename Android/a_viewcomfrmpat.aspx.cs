using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class a_viewcomfrmpat : System.Web.UI.Page
{
    dboprtn dbo = new dboprtn();
    static int id,upid;
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT complaint.id, complaint.date, complaint.complaint, patient.p_name FROM  complaint INNER JOIN patient ON complaint.p_id = patient.id where complaint.reply='pending'";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
        cmd.CommandText = "Select max(id)from comp_frmpub";
        id = dbo.main(cmd);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update complaint set reply='" + TextBox2.Text + "' where id='" + upid + "'";
        dbo.execute(cmd);
        Response.Write("<script>alert('replied')</script>");
        TextBox2.Text = " ";

        cmd.CommandText = "SELECT complaint.id, complaint.date, complaint.complaint, patient.p_name FROM  complaint INNER JOIN patient ON complaint.p_id = patient.id where complaint.reply='pending'";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        upid = Convert.ToInt32(e.Item.Cells[0].Text);
        if (e.CommandName == "reply")
        {
         
            MultiView1.SetActiveView(View2);
            TextBox1.Text = e.Item.Cells[3].Text;

          
        }
    }
    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }
    protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}