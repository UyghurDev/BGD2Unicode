using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DownloadFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (!string.IsNullOrEmpty(Session["FileName"].ToString()))
            {
                //Response.ContentType = "text/plain";
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + "Converted_"+Session["FileName"].ToString());

                Response.WriteFile(Request.PhysicalApplicationPath + "\\App_Data\\Converted\\" + Session["FileName"].ToString());
                // Response.End();
                Response.Flush();

                //Response.Output.Write(System.IO.File.ReadAllText( Server.MapPath("App_Data") + "\\Converted\\" + Session["FileName"].ToString()));
                //Response.Flush();
            }
        }
    }
}
