using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class c_analsdresltforwtopatn : System.Web.UI.Page
{
    dboprtn db = new dboprtn();
    protected void Page_Load(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT prediction_result.id, patient.p_name, prediction_result.result, prediction_result.date FROM patient INNER JOIN prediction_result ON patient.id = prediction_result.p_id";
        DataGrid1.DataSource = db.get(cmd);
        DataGrid1.DataBind();
    }
    protected void DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
    {
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "update prediction_result set status='forward' where id='" + e.Item.Cells[0].Text + "'";
        db.execute(cmd);
        cmd.CommandText = "SELECT prediction_result.id, patient.p_name, prediction_result.result, prediction_result.date FROM patient INNER JOIN prediction_result ON patient.id = prediction_result.p_id";
        DataGrid1.DataSource = db.get(cmd);
        DataGrid1.DataBind();
    }
}