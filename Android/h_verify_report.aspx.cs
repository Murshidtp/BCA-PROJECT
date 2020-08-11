using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class h_verify_report : System.Web.UI.Page
{

    dboprtn db = new dboprtn();

    protected void Page_Load(object sender, EventArgs e)
    {
         SqlCommand cmd = new SqlCommand();
         cmd.CommandText = "SELECT prediction_result.date,patient.p_name, patient.age, patient.gender, patient.place, patient.blood_group, patient.district, prediction_result.result FROM patient INNER JOIN prediction_result ON patient.id = prediction_result.p_id";
        DataGrid1.DataSource = db.get(cmd);
        DataGrid1.DataBind();
    }
    protected void DataGrid1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
protected void  DataGrid1_ItemCommand(object source, DataGridCommandEventArgs e)
{
   
}
}