using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class c_blood_analising : System.Web.UI.Page
{
    dboprtn db = new dboprtn();
    static int id;
    knn k = new knn();
    static string p1, p2, p3, p4, p5, p6,p7,p8,p9;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select id,p_name from patient";
            DropDownList1.DataSource = db.get(cmd);
            DropDownList1.DataValueField = "id";
            DropDownList1.DataTextField = "p_name";
            DropDownList1.DataBind();
            DropDownList1.Items.Insert(0, "--SELECT--");
            cmd.CommandText = "select max(id) from prediction_result";
            id = db.main(cmd);
            Label1.Visible = false;
            Label2.Visible = false;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        p1 = RadioButtonList12.SelectedValue;
        p2 = RadioButtonList8.SelectedValue;
        p3 = RadioButtonList4.SelectedValue;
        p4 = RadioButtonList6.SelectedValue;
        p5 = RadioButtonList7.SelectedValue;
        p6 = RadioButtonList3.SelectedValue;
        p7 = RadioButtonList9.SelectedValue;
        p8 = RadioButtonList10.SelectedValue;
        p9 = RadioButtonList11.SelectedValue;


        string ou = k.predict(p1, p2, p3, p4, p5, p6,p7,p8,p9);
        Label1.Visible = true;
        Label2.Visible = true;
        Label2.Text = ou;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert into prediction_result values('" + id + "','" + DropDownList1.SelectedValue + "','" + Label2.Text + "','" + Session["id"] + "','" + System.DateTime.Now.ToShortDateString() + "','pending')";
        db.execute(cmd);
        Response.Write("<script>alert('success')</script>");

    }
    protected void RadioButtonList3_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
    protected void RadioButtonList10_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
}