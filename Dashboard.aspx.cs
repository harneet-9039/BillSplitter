using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataSetTableAdapters;
using System.Web.Services;
using System.Configuration;
using System.Data.SqlClient;
using System.Net.Mail;


public partial class Dashboard : System.Web.UI.Page
{




    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["userID"] != null)                      //checking session variables
        {
            string check = Session["user"].ToString();
            Label1.Text = check;
            string check_img = Session["Image"].ToString();
            if (check_img != null)                                  //loading required files from graph api stored in session variables
            {
                fb_img.Src = check_img;

            }
            string email = Session["Email"].ToString();
            Retrieve_groupTableAdapter rt = new Retrieve_groupTableAdapter();               //Retrieving users group
            GridView1.DataSource = rt.GetDataBy(email);
            GridView1.DataBind();                                                           //storing in grid view b,y using data source
            Retrieve_friendTableAdapter rf = new Retrieve_friendTableAdapter();
            GridView2.DataSource = rf.friend(email);                                        //retrieving friends of loginnd user
            GridView2.DataBind();                                                           //binding to update gridview on the fly
            Get_amountTableAdapter ga = new Get_amountTableAdapter();
            CurrentElectionDataList.DataSource = ga.get_amount(email);
            CurrentElectionDataList.DataBind();
            Get_Login_amountTableAdapter gl = new Get_Login_amountTableAdapter();
            DataList1.DataSource = gl.GetLoginAmount(email);                                //populating datalist with due amounts of a user
            DataList1.DataBind();


        }
        else if (Session["Email_normal"] != null)                               //if user loggined through normal scenario
        {
            string temp = Session["User"].ToString();
            string ema = Session["Email_normal"].ToString();
            Label1.Text = temp;
            Retrieve_groupTableAdapter rt = new Retrieve_groupTableAdapter();
            GridView1.DataSource = rt.GetDataBy(temp);
            GridView1.DataBind();
            Retrieve_friendTableAdapter rf = new Retrieve_friendTableAdapter();
            GridView2.DataSource = rf.friend(ema);
            GridView2.DataBind();
            Get_amountTableAdapter ga = new Get_amountTableAdapter();
            CurrentElectionDataList.DataSource = ga.get_amount(ema);
            CurrentElectionDataList.DataBind();
            Get_Login_amountTableAdapter gl = new Get_Login_amountTableAdapter();
            DataList1.DataSource = gl.GetLoginAmount(ema);
            DataList1.DataBind();





        }


        else
        {
            Response.Redirect("Default.aspx");                      //user is not authorized or session is expired
        }



    }


    protected void Unnamed_ServerClick(object sender, EventArgs e)
    {
        Retreive_EmailTableAdapter rm = new Retreive_EmailTableAdapter();
        if (Session["Email_normal"] == null)
        {
            string email = Session["Email"].ToString();
            object chk = rm.Retreive_Email(txtSearch123.Text, email);
            bool temp = Convert.ToBoolean(chk);
            if (temp == true)

            
            {
                /*MailMessage mail = new MailMessage();                       //mailing a user when some adds him
                mail.To.Add(email);

                mail.From = new MailAddress("SSLL@lagalo.com");
                mail.Subject = email + "added you";
                string Body = "Hey," + "<br>" + txtSearch123.Text + "<br>" + email + "recently added you on SSLL!!";
                mail.Body = Body;
                mail.Priority = MailPriority.High;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.EnableSsl = true;
                smtp.Credentials = new System.Net.NetworkCredential
                ("username", "password");

                //Or your Smtp Email ID and Password

                smtp.Send(mail);*/

               ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Friend added successfully');window.location='Dashboard.aspx';", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('You are already friend with the particular person OR the user is not registered');window.location='Dashboard.aspx';", true);
            }
        }
        else
        {
            string email = Session["Email_normal"].ToString();
            object chk = rm.Retreive_Email(txtSearch123.Text, email);
            bool temp = Convert.ToBoolean(chk);
            if (temp == true)
           {
                /*MailMessage mail = new MailMessage();
                mail.To.Add(email);

                mail.From = new MailAddress("SSLL@lagalo.com");
                mail.Subject = email+"added you";
                string Body = "Hey," + "<br>" + txtSearch123.Text+"<br>"+email+"recently added you on SSLL!!";
                mail.Body = Body;
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.EnableSsl = true;
                smtp.Credentials = new System.Net.NetworkCredential
                ("yoyosinghji@gmail.com", "mohanamansingh@9039");

                //Or your Smtp Email ID and Password

                smtp.Send(mail);*/
                
            
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Friend added successfully');window.location='Dashboard.aspx';", true);
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('You are already friend with the particular person OR the person is not registered');window.location='Dashboard.aspx';", true);
            }
        }
    }

    protected void Unnamed_ServerClick1(object sender, EventArgs e)
    {
        Session.RemoveAll();
        Response.Redirect("Default.aspx");
    }









    protected void Unnamed_ServerClick2(object sender, EventArgs e)             //adding group and its members
    {
        create_groupTableAdapter cr = new create_groupTableAdapter();
        Insert_group_memberTableAdapter ig = new Insert_group_memberTableAdapter();

        string name = Request.Form["member_name"];

        string n = String.Format("{0}", Request.Form["member"]);

        if (n == "," || name == "")
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Fill out all the fields');window.location='Dashboard.aspx';", true);
        }


        else
        {
            string newone = n;
            int count = Convert.ToInt32(newone);

            if (Session["Email_normal"] == null)
            {
                string fb_id = Session["Email"].ToString();
                object chk = cr.create_group(name, fb_id, DateTime.Now.ToString("yyyy-MM-dd"));
                string check = DateTime.Now.ToString("yyyy-MM-dd");
                bool temp = Convert.ToBoolean(chk);
                if (temp == true)
                {
                    for (int i = 0; i < count; i++)                             //capturing all the dynamically generated fields
                    {
                        string mem = Request.Form["groupmem" + i];
                        object new_chk = ig.Insert_group_member(fb_id, name, mem);
                    }

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Group created');window.location='Dashboard.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Error');window.location='Dashboard.aspx';", true);
                }

            }
            else
            {



                string email = Session["Email_normal"].ToString();                                          //if user logineed through normal login method
                object chk = cr.create_group(name, email, DateTime.Now.ToString("yyyy-MM-dd"));
                bool temp = Convert.ToBoolean(chk);
                if (temp == true)
                {
                    for (int i = 0; i < count; i++)
                    {
                        string mem = Request.Form["groupmem" + i];
                        object new_chk = ig.Insert_group_member(email, name, mem);
                    }

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Group created');window.location='Dashboard.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Error');window.location='Dashboard.aspx';", true);
                }

            }
        }
    }

    protected void Unnamed_ServerClick3(object sender, EventArgs e)             //calculating split and inserting bill
    {
        string money = Request.Form["money"];
        string desc = Request.Form["description"];

        string user = Request.Form["member_name"];
        string[] tokens = user.Split(',');
        string newone1 = tokens[0];

        int money_new = Convert.ToInt32(money);
        int user_new = Convert.ToInt32(newone1);

        int result = money_new / (user_new + 1);
        if (Session["Email_normal"] == null)
        {
            object chk_2 = null;
            string fb_id = Session["Email"].ToString();
            splitterTableAdapter st = new splitterTableAdapter();
            Calculate_splitTableAdapter cp = new Calculate_splitTableAdapter();
            for (int i = 0; i < user_new; i++)
            {
                chk_2 = cp.Calculate_split(fb_id, Request.Form["split" + i], result.ToString());
            }
            object chk = st.splitter(desc, money, fb_id);
            bool temp = Convert.ToBoolean(chk);
            bool temp2 = Convert.ToBoolean(chk_2);
            if (temp == true)
            {
                if (temp2 == true)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Done');window.location='Dashboard.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Failed');window.location='Dashboard.aspx';", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Failed');window.location='Dashboard.aspx';", true);
            }
        }
        else
        {
            object chk_2 = null;
            string id = Session["Email_normal"].ToString();
            splitterTableAdapter st = new splitterTableAdapter();
            Calculate_splitTableAdapter cp = new Calculate_splitTableAdapter();
            for (int i = 0; i < user_new; i++)
            {
                chk_2 = cp.Calculate_split(id, Request.Form["split" + i], result.ToString());
            }
            object chk = st.splitter(desc, money, id);
            bool temp = Convert.ToBoolean(chk);
            bool temp2 = Convert.ToBoolean(chk_2);
            if (temp == true)
            {
                if (temp2 == true)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Done');window.location='Dashboard.aspx';", true);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Failed');window.location='Dashboard.aspx';", true);
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Failed');window.location='Dashboard.aspx';", true);
            }
        }
    }



    protected void Unnamed_ServerClick4(object sender, EventArgs e)             //settle up functionality function
    {
        string money = Request.Form["money1"];
        string email = Request.Form["email"];
        int money_int = Convert.ToInt32(money);
        Pay_amountTableAdapter pa = new Pay_amountTableAdapter();
        object chk = pa.Pay_amount(money_int, email);
        bool temp = Convert.ToBoolean(chk);
        if(temp==true)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Paid Success');window.location='Dashboard.aspx';", true);
        }

        else
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "popup", "alert('Paid UnSuccess');window.location='Dashboard.aspx';", true);
        }

    }

   
}
