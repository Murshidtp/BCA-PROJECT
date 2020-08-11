using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class login : System.Web.UI.Page
{
    dboprtn dbo = new dboprtn();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from login where usrnme='"+TextBox1.Text+"'and password='"+TextBox2.Text+"'";
        DataTable dt = dbo.get(cmd);
        if (dt.Rows.Count > 0)
        {
            Session["id"] = dt.Rows[0][0];
            string type = dt.Rows[0][3].ToString();
            if (type == "admin") 
            {
                Response.Redirect("a_newhm.aspx");

            }
            if (type == "clinic")
            {
                Response.Redirect("c_newhm.aspx");
            }
            if (type == "health")
            {
                Response.Redirect("h_newhm.aspx");
            }
           


        }
         else 
            {
                Response.Write("<Script>alert('No user exist')</Script>");
            }

    }
}