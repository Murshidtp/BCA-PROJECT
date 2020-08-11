using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class a_view_feedback : System.Web.UI.Page
{
    dboprtn dbo = new dboprtn();
    static int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select f.*,p.p_name from feedback f,patient p where f.pid=p.id";
        DataGrid1.DataSource = dbo.get(cmd);
        DataGrid1.DataBind();
        
    }
}