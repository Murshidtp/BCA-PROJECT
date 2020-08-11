using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for dboprtn
/// </summary>
public class dboprtn
{
    SqlConnection con = new SqlConnection(@"Data Source=LAPTOP-CID7O6QP\SQLEXPRESS;Initial Catalog=C:\INETPUB\WWWROOT\SANGUIS\APPDATA\SANGUIS.MDF;Persist Security Info=True;User ID=sign;Password=user123");
    public void execute(SqlCommand cmd)
    {
        cmd.Connection = con;
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public DataTable get(SqlCommand cmd)
    {
        cmd.Connection = con;
        SqlDataAdapter da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        DataSet ds = new DataSet();
        da.Fill(ds);
        return ds.Tables[0];
    }
    public int main(SqlCommand cmd)
    {
        cmd.Connection = con;
        int i;
        try
        {
            con.Open();
            i = Convert.ToInt32(cmd.ExecuteScalar()) + 1;
        }
        catch
        {
            i = 1;
        }
        con.Close();
        return i;
    }

    public dboprtn()
	{
		//
		// TODO: Add constructor logic here
		//
	}
}