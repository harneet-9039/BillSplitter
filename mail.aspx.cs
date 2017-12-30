using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Net.Mail;

public partial class mail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    public void SendMail()
    {
        MailMessage mail = new MailMessage();
        mail.To.Add(txtTo.Text);

        mail.From = new MailAddress("SSLL@lagalo.com");
        mail.Subject = txtTo.Text + "added you";
        string Body = "Hey," + "<br>" + txtsubject.Text + "<br>" + txtTo + "recently added you on SSLL!!";
        mail.Body = Body;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = "smtp.gmail.com"; //Or Your SMTP Server Address
        smtp.Port = 587;
        smtp.UseDefaultCredentials = false;
        smtp.EnableSsl = true;
        smtp.Credentials = new System.Net.NetworkCredential
        ("yoyosinghji@gmail.com", "mohanamansingh@9039");

        //Or your Smtp Email ID and Password

        smtp.Send(mail);
    }
   
    protected void Bttn_Send_Click(object sender, EventArgs e)
    {
        SendMail();
    }
}