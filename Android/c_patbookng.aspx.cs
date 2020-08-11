using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class c_patbookng : System.Web.UI.Page
{
    dboprtn dbo = new dboprtn();
    static int id, upid;
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT patient.p_name, pat_bookng.date, pat_bookng.id, add_doctr.d_name , add_doctr.department FROM pat_bookng INNER JOIN patient ON pat_bookng.pid = patient.id INNER JOIN add_doctr ON pat_bookng.d_id = add_doctr.id WHERE pat_bookng.tok_no='0' and add_doctr.c_id='" + Session["id"] + "'";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
        cmd.CommandText = "Select max(id)from pat_bookng";
        id = dbo.main(cmd);

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update pat_bookng set tok_no='" + TextBox2.Text + "' where id='" + upid + "'";
        dbo.execute(cmd);
        Response.Write("<script>alert('token number sended')</script>");


        cmd.CommandText = "SELECT patient.p_name, pat_bookng.date, pat_bookng.id, add_doctr.d_name , add_doctr.department FROM pat_bookng INNER JOIN patient ON pat_bookng.pid = patient.id INNER JOIN add_doctr ON pat_bookng.d_id = add_doctr.id WHERE pat_bookng.tok_no='0' and add_doctr.c_id='" + Session["id"] + "'";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        upid = Convert.ToInt32(e.Item.Cells[0].Text);
        if (e.CommandName == "view")
        {

            MultiView1.SetActiveView(View2);
            TextBox1.Text = e.Item.Cells[2].Text;
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select max(tok_no) from pat_bookng ";
            TextBox2.Text = dbo.main(cmd).ToString(); 
                
        }
    }
}