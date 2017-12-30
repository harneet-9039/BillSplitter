using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetTableAdapters;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //Response.Redirect("default2.aspx?id=" + HiddenField1.Value);
        
    }

   

    protected void submit_Click(object sender, EventArgs e)
    {

        Register_userTableAdapter ul = new Register_userTableAdapter(); //dataset table adapter
        
        string name = Name.Value;
        string email = email_form.Value;
        string pass = password_form.Value;
        object store = ul.Register_user(name,email,pass,false); //calling the stored procedure through table adapters
        bool chk = Convert.ToBoolean(store);
        if(chk==true) {
            Session["User"] = name;                         //maintaining session values
            Session["Image"] = HiddenField3.Value;
            Session["Email_normal"] = email;
            Session.Timeout = 1000;
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Email or Phone Number Already Exists.');window.location='Default.aspx';", true);
        }

    }

    protected void Unnamed_ServerClick(object sender, EventArgs e)          //register user
    {


        
        Register_userTableAdapter ul = new Register_userTableAdapter();
        string fb_id = HiddenField1.Value;
        string fb_name = HiddenField2.Value;
        string status = AccessHfd.Value;
        string email = Email_hfd.Value;
        if(String.Compare(status,"connected")==0) {                             //checking status of fb api
            object store = ul.Register_user(fb_name,email,"",true);
            bool chk = Convert.ToBoolean(store);
            if (chk == true)
            {
                Session["UseriD"] = HiddenField1.Value;
                Session["User"] = HiddenField2.Value;
                Session["Image"] = HiddenField3.Value;
                Session["Email"] = Email_hfd.Value;
                Session.Timeout = 1000;
                Response.Redirect("Dashboard.aspx");
                
            }


            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Email or Phone Number Already Exists.');window.location='Default.aspx';", true);
            }

        }

        else {
            return;
        }



    }

    protected void Button2_Click(object sender, EventArgs e)            //if user logins through norma lscenario
    {
        string email = Text2.Value;
        string pwd = password1.Value;
        login_normalTableAdapter lm = new login_normalTableAdapter();
        object chk = lm.login_normal(email, pwd);
        bool temp = Convert.ToBoolean(chk);
        if(temp==true) {
            reterive_nameTableAdapter rn = new reterive_nameTableAdapter();
           
            Session["User"] = rn.reterive_name(email);
            Session["Image"] = HiddenField3.Value;
            Session["Email_normal"] = email;
            Session.Timeout = 1000;
            Response.Redirect("Dashboard.aspx");
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Login failure');window.location='Default.aspx';", true);
        }
    
    }
}