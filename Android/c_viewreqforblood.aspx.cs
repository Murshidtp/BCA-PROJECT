using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class c_viewreqforblood : System.Web.UI.Page
{
    dboprtn dbo = new dboprtn();
    static int id, upid;
    protected void Page_Load(object sender, EventArgs e)
    {
        MultiView1.SetActiveView(View1);
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT        req_frblood.id, req_frblood.date, req_frblood.bloodgrp, req_frblood.unt_req, patient.p_name, patient.phone_no FROM   patient INNER JOIN req_frblood ON patient.id = req_frblood.p_id where req_frblood.c_id='" + Session["id"] + "'and  req_frblood.status='pending' ";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        MultiView1.SetActiveView(View2);
        upid=Convert.ToInt32(e.Item.Cells[0].Text);
        TextBox1.Text = e.Item.Cells[2].Text;
        TextBox2.Text = e.Item.Cells[3].Text;
        TextBox3.Text = e.Item.Cells[4].Text;
        TextBox4.Text = e.Item.Cells[5].Text;

    }
}