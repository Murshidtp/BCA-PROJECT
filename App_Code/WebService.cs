using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for WebService
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class WebService : System.Web.Services.WebService {
    dboprtn dbo = new dboprtn();
    SqlCommand cmd= new SqlCommand();
    String s="";
    public WebService() {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string HelloWorld() {
        return "Hello World";
    }
    [WebMethod]
    public String registration(string pname, string age, string gen, string plce, string phn, string email, string bloodgrp,string district)
{
    cmd.CommandText = "select max(id) from patient";
    int id = dbo.main(cmd);
    cmd.CommandText = "insert into patient values('" + id + "','" + pname + "','" + age + "','" + gen + "','" + plce + "','" + phn + "','" + email + "','" + bloodgrp + "','" + district + "')";
    SqlCommand cmd1 = new SqlCommand();
    cmd1.CommandText = "insert into login values('" + id + "','" + email + "','"+phn+"','patient')";

    try
    {
        dbo.execute(cmd);
        dbo.execute(cmd1);
        s = "success";
    }
    catch
    {
        s = "error";
    }
    return s;
}
    [WebMethod]
    public String post_question(string ques)
    {
        cmd.CommandText = "select max(id) from comp_frmpub";
        int id = dbo.main(cmd);
        cmd.CommandText = "insert into comp_frmpub values('" + id + "','"+System.DateTime.Now.ToShortDateString()+"','"+ques+"','pending')";
        
        try
        {
            dbo.execute(cmd);
            s = "success";
        }
        catch
        {
            s = "error";
        }
        return s;
    }
    [WebMethod]
    public String doctorboking(string pid,string did)
    {
        cmd.CommandText = "select max(id) from pat_bookng";
        int id = dbo.main(cmd);
        cmd.CommandText = "insert into  pat_bookng values('" + id + "','" + System.DateTime.Now.ToShortDateString() + "','0','" + pid + "','" + did + "')";

        try
        {
            dbo.execute(cmd);
            s = "success";
        }
        catch
        {
            s = "error";
        }
        return s;
    }
    [WebMethod]
    public String reqstblod(string blodgrp, string untrq, string pid,string cid)
    {
        cmd.CommandText = "select max(id) from req_frblood";
        int id = dbo.main(cmd);
        cmd.CommandText = "insert into  req_frblood values('" + id + "','" + System.DateTime.Now.ToShortDateString() + "','" + blodgrp + "','" + untrq + "','" + pid + "','"+ cid +"','pending')";


        try
        {
            dbo.execute(cmd);
            s = "success";
        }
        catch
        {
            s = "error";
        }
        return s;
    }

    [WebMethod]
    public string view_bloodreq(String pid)
    {
        string s = "";
        cmd.CommandText = "select date,bloodgrp,unt_req,status from req_frblood where p_id='"+pid+"'";
        DataTable dt = dbo.get(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                s += dr[0].ToString() + "#" + dr[1].ToString() + "#" + dr[2].ToString() + "#" + dr[3].ToString() + "@";
            }
        }
        else
        {
            s = "error";
        }
        return s;
    }

    [WebMethod]
    public String post_complaint(string pid, string complnt)
    {
        cmd.CommandText = "select max(id) from complaint";
        int id = dbo.main(cmd);
        cmd.CommandText = "insert into complaint values('" + id + "','" + System.DateTime.Now.ToShortDateString() + "','" + pid + "','" + complnt + "','pending')";

        try
        {
            dbo.execute(cmd);
            s = "success";
        }
        catch
        {
            s = "error";
        }
        return s;
    }
    [WebMethod]
    public String feedbck(string pid, string feedback)
    {
        cmd.CommandText = "select max(id) from feedback";
        int id = dbo.main(cmd);
        cmd.CommandText = "insert into feedback values('" + id + "','" + System.DateTime.Now.ToShortDateString() + "','" + pid + "','" + feedback + "')";

        try
        {
            dbo.execute(cmd);
            s = "success";
        }
        catch
        {
            s = "error";
        }
        return s;
    }
    [WebMethod]
    public string login(string usrnme,string passwd)
    {
        cmd.CommandText = "select * from login where usrnme='" + usrnme + "' and password='" + passwd + "'";
        DataTable dt = dbo.get(cmd);
        if(dt.Rows.Count> 0)
        {
            s+= dt.Rows[0][0].ToString() + "#" + dt.Rows[0][3].ToString();
        }
        else
        {
            s = "error";
        }
        return s;
    }
    [WebMethod]
    public string view_awareness()
    {
        string s = "";
        cmd.CommandText = "select * from post_awarens"; 
        DataTable dt = dbo.get(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                s += dr[0].ToString() + "#" + dr[1].ToString() + "#" + dr[2].ToString() + "@";
            }
        }
        else
        {
            s = "error";
        }
        return s;
    }
    [WebMethod]
    
    public String epidemic_details()
    {
        cmd.CommandText = "select * from add_epdmc ";
        DataTable dt = dbo.get(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                s += dr[1].ToString() + "#" + dr[2].ToString()+"#" + dr[3].ToString() + "@";
            }
        }
        else
        {
            s = "error";
        }
        return s;
    }
    [WebMethod]
    public String comfrmpublic()
    {
        cmd.CommandText = "select * from comp_frmpub ";
        DataTable dt = dbo.get(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                s += dr[1].ToString() + "#" + dr[2].ToString() + "#" + dr[3].ToString() + "#" + dr[3].ToString() + "@";
            }
        }
        else
        {
            s = "error";
        }
        return s;
    }
    [WebMethod]
    public String healthinformation()
    {
        cmd.CommandText = "select * from  health_infr";
        DataTable dt = dbo.get(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                s += dr[0].ToString() + "#" + dr[1].ToString()+"#" + dr[2].ToString() + "@";
            }
        }
        else
        {
            s = "error";
        }
        return s;
    }

    [WebMethod]
    public String clinic()
    {
        cmd.CommandText = "select * from  clinic_reg";
        DataTable dt = dbo.get(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                s += dr[0].ToString() + "#" + dr[1].ToString() + "#" + dr[2].ToString() + "#" + dr[3].ToString() + "#" + dr[4].ToString() + "#" + dr[5].ToString() + "@";
            }
        }
        else
        {
            s = "error";
        }
        return s;
    }
    [WebMethod]
    public String status(string pid)
    {
        cmd.CommandText = "select * from  pat_bookng where pid='" + pid + "'";
        DataTable dt = dbo.get(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                s += dr[0].ToString() + "#" + dr[1].ToString()+"#" + dr[2].ToString() + "#" + dr[4].ToString() + "@";
            }
        }
        else
        {
            s = "error";
        }
        return s;
    }
    [WebMethod]
    public String tokenno(string tok_no)
    {
        cmd.CommandText = "select * from  pat_bookng where tok_no='"+tok_no+"'";
        DataTable dt = dbo.get(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                s += dr[2].ToString() + "@" ;
            }
        }
        else
        {
            s = "error";
        }
        return s;
    }

    [WebMethod]
    public String vw_comreply(string uid)
    {
        cmd.CommandText = "select * from  complaint where p_id='" + uid + "'";
        DataTable dt = dbo.get(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                s += dr[1].ToString() + "#"+dr[3].ToString() +"#" +dr[4].ToString() +"@";
            }
        }
        else
        {
            s = "error";
        }
        return s;
    }


     [WebMethod]
    public String vw_comp_health()
    {
        cmd.CommandText = "select * from  comp_frmpub ";
        DataTable dt = dbo.get(cmd);
        if (dt.Rows.Count > 0)
        {
            foreach (DataRow dr in dt.Rows)
            {
                s += dr[0].ToString() + "#"+dr[1].ToString() +"#"+dr[2].ToString() + "#" +dr[3].ToString() +"@";
            }
        }
        else
        {
            s = "error";
        }
        return s;
     }

     [WebMethod]
     public String view_clinicnm()
     {
         cmd.CommandText = "select id,name,district,place from clinic_reg";
         DataTable dt = dbo.get(cmd);
         if (dt.Rows.Count > 0)
         {
             foreach (DataRow dr in dt.Rows)
             {
                 s += dr[0].ToString() + "#" + dr[1].ToString() + "#" + dr[2].ToString() + "#" + dr[3].ToString() + "@";
             }
         }
         else
         {
             s = "error";
         }
         return "0#CLINIC@"+s;
     }
     [WebMethod]
     public String view_clinicnm1()
     {
         cmd.CommandText = "select name,district,place from clinic_reg";
         DataTable dt = dbo.get(cmd);
         if (dt.Rows.Count > 0)
         {
             foreach (DataRow dr in dt.Rows)
             {
                 s += dr[0].ToString() + "#" + dr[1].ToString() + "#" + dr[2].ToString() + "@";
             }
         }
         else
         {
             s = "error";
         }
         return s;
     }
     [WebMethod]
     public String view_dept_cl( string clid)
     {
         cmd.CommandText = "select distinct department from add_doctr where c_id='"+clid+"'";
         DataTable dt = dbo.get(cmd);
         if (dt.Rows.Count > 0)
         {
             foreach (DataRow dr in dt.Rows)
             {
                 s += dr[0].ToString() + "#";
             }
         }
         else
         {
             s = "error";
         }
         return "DEPARTMENT#" + s;
     }
     [WebMethod]
     public String view_dept_doc(string dept,string clid)
     {
         cmd.CommandText = "select id,d_name from add_doctr where c_id='" + clid + "' and department='"+dept+"'";
         DataTable dt = dbo.get(cmd);
         if (dt.Rows.Count > 0)
         {
             foreach (DataRow dr in dt.Rows)
             {
                 s += dr[0].ToString() + "#" + dr[1].ToString() + "@";
             }
         }
         else
         {
             s = "error";
         }
         return  s;
     }
     [WebMethod]
     public string view_prediction(string pid)
     {
         cmd.CommandText = "select result,date from prediction_result where p_id='" + pid + "' and status='forward'";
         DataTable dt = dbo.get(cmd);
         if (dt.Rows.Count > 0)
         {
             foreach (DataRow dr in dt.Rows)
             {
                 s += dr[0].ToString() + "#" + dr[1].ToString() + "@";
             }
         }
         else
         {
             s = "No Prediction Found";
         }
         return s;
     }

}

