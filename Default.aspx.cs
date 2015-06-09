using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(Session["FileName"].ToString());
    }
    protected void wzrdConverter_ActiveStepChanged(object sender, EventArgs e)
    {
        if ((sender as Wizard).ActiveStepIndex == 1)
        { 
            
        }
    }
    protected void wzrdConverter_CancelButtonClick(object sender, EventArgs e)
    {
        Session["FileName"] = null;
        btnConvert.Enabled = false;
        btnDownload.Enabled = false;
        wzrdConverter.ActiveStepIndex = 0;
    }
    protected void btnConvert_Click(object sender, EventArgs e)
    {
        if (Session["FileName"] != null)
        {
            net.UyghurDev.Text.CodeConvert cc = new net.UyghurDev.Text.CodeConvert(Request.PhysicalApplicationPath + "\\App_Data\\BGD2Unicode.xml");
            File.WriteAllText(Request.PhysicalApplicationPath + "\\App_Data\\Converted\\" + Session["FileName"].ToString(), cc.ToConvert(File.ReadAllText(Request.PhysicalApplicationPath  + "\\App_Data\\Source\\" + Session["FileName"].ToString(), System.Text.Encoding.GetEncoding("GB2312"))));
            btnDownload.Enabled = true;
            btnConvert.Enabled = false;

        }
        else
        { 
        
        }
    }
    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (fuSource.HasFile && cvFileType.IsValid)
        {
            Session["FileName"]=MakeFileName()+getExtendedName(fuSource.FileName);
            fuSource.SaveAs( Request.PhysicalApplicationPath+ "\\App_Data\\Source\\" + Session["FileName"].ToString());
            btnConvert.Enabled = true;
            btnDownload.Enabled = false;
            wzrdConverter.ActiveStepIndex = 2;
        }
    }

    /// <summary>
    /// ھۆججەتنىڭ كەڭەيتىلگەن نامىنى ئېلىش
    /// </summary>
    /// <param name="strFileName">ئەسلى ھۆججەت نامى</param>
    /// <returns>كەڭەيتىلگەن نامى</returns>
    private string getExtendedName(string strFileName)
    {
        string strExtName="";
        if(strFileName.Contains("."))
        {
            strExtName=strFileName.Substring(strFileName.LastIndexOf('.'));
        }
        return strExtName;
    }

    
    /// <summary>
    /// تەكرارلانمايدىغان ھۆججەت نامى ھاسىل قىلىش
    /// </summary>
    /// <returns></returns>
    private string MakeFileName()
    {
        string strFileName = Guid.NewGuid().ToString().Replace("-","");
        return strFileName;
    }

    protected void cvFileType_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (args.Value.Contains("."))
        {
            string strExt = args.Value.Substring(args.Value.LastIndexOf('.'));
            if (strExt == ".exe" || strExt == ".dll" || strExt == ".zip" || strExt == ".rar" || strExt == ".js" || strExt == "vb" || strExt == "vbs" || strExt == ".swf")
            {
                args.IsValid = false;
            }
        }
        else
        {
            args.IsValid = true;
        }
       
    }
    protected void wzrdConverter_FinishButtonClick(object sender, WizardNavigationEventArgs e)
    {
        Session["FileName"] = null;
        btnConvert.Enabled = false;
        btnDownload.Enabled = false;
        wzrdConverter.ActiveStepIndex = 0;
    }
}
