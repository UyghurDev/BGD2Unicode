<%@ Page Title="بوغدا، سەنلى فاڭجېڭ ھۆججەت كودىنى يۇنىكودقا ئايلاندۇرۇش-Bughda,Founder,Sanli File Format Converter-博格达，三立，方正编码交换器" Language="C#" MasterPageFile="~/Common/Public.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<script language="javascript" type="text/javascript">
    function DownFile() {
        window.open("DownloadFile.aspx", "", "");
    }
</script>
  <table cellpadding="0" cellspacing="0" style="width: 100%">
        <tr>
            <td style="text-align: center">
                <br />
                بۇغدا(فاڭجېڭ، سەنلى)ھۆججەت كودىنى يۇنىكودقا ئالماشتۇرۇش<br />
                <br />
                 Bughda(Founder,SanLi) to Unicode File Code Converter<br />
                <hr class="HorzentalLineHeader" dir="rtl" />
            </td>
        </tr>
        <tr>
            <td >
            <center>
               
    <asp:Wizard ID="wzrdConverter" runat="server" ActiveStepIndex="0" BackColor="#EFF3FB" 
        BorderColor="#B5C7DE" BorderWidth="1px"    
        Width="600px" CancelButtonText="بىكار قىلىش" FinishCompleteButtonText="تامام" 
                    FinishPreviousButtonText="ئالدىنقى قەدەم" StartNextButtonText="باشلاش" 
                    StepNextButtonText="كىيىنكى قەدەم" StepPreviousButtonText="ئالدىنقى قەدەم" 
                    DisplayCancelButton="True" 
                    onactivestepchanged="wzrdConverter_ActiveStepChanged" 
                    oncancelbuttonclick="wzrdConverter_CancelButtonClick" 
                    DisplaySideBar="False" 
                    onfinishbuttonclick="wzrdConverter_FinishButtonClick">
        <StepStyle Font-Size="0.8em" ForeColor="#333333" />
        <WizardSteps>
            <asp:WizardStep runat="server" StepType="Start" Title="باشلاش">
                <table align="center" bgcolor="#FFFFCC" cellpadding="0" cellspacing="0" 
                    style="width: 100%">
                    <tr>
                        <td bgcolor="#66CCFF" width="25%" style="color: #FFFFFF">
                            باشلاش</td>
                        <td width="25%">
                            يۈكلەش</td>
                        <td width="25%">
                            ئايلاندۇرۇش</td>
                    </tr>
                </table>
                <br />
                مەزكۇر كود ئالماشتۇرغۇچ بوغدا، فاڭجېڭ، سەنلى مەتبەئە سىستىمىلىرىدا كىرگۈزۈلگەن 
                تېكست ھۆججەتلىرىنى يۇنىكود ئۆلچىمىدىكى تېكىستكە ئايلاندۇرۇپ بىرىدۇ.<br />
                كودىنى ئالماشتۇرماقچى بولغان ئەسلى ھۆججەتنى تورغا يوللاپ، ئالماشتۇرۇپ بولغاندىن 
                كىيىن توردىن چۈشۈرۈپ ئىشلىتىسىز.</asp:WizardStep>
            <asp:WizardStep runat="server" title="ھۆججەت يۈكلەش">
                <table align="center" bgcolor="#FFFFCC" cellpadding="0" cellspacing="0" 
                    style="width: 100%">
                    <tr>
                        <td bgcolor="#66CCFF" width="25%">
                            باشلاش</td>
                        <td bgcolor="#66CCFF" width="25%" style="color: #FFFFFF">
                            يۈكلەش</td>
                        <td width="25%">
                            ئايلاندۇرۇش</td>
                    </tr>
                </table>
                <br />
                <asp:Label ID="lblMemo" runat="server" Text="ئەسلى ھۆججەتنى تاللاڭ:"></asp:Label>
                <asp:FileUpload ID="fuSource" runat="server" />
                <asp:CustomValidator ID="cvFileType" runat="server" 
                    ControlToValidate="fuSource" ErrorMessage="ھۆججەت تىپى چەكلەنگەن" 
                    OnServerValidate="cvFileType_ServerValidate">*</asp:CustomValidator>
                <br />
                <asp:Button ID="btnUpload" runat="server" Text="تورغا يۈكلەش" 
                    OnClick="btnUpload_Click" />
                <br />
                <asp:Label ID="lblMsgUpload" runat="server"></asp:Label>
            </asp:WizardStep>
            <asp:WizardStep runat="server" Title="ئايلاندۇرۇش ۋە چۈشۈرۈش">
                <table align="center" bgcolor="#FFFFCC" cellpadding="0" cellspacing="0" 
                    style="width: 100%">
                    <tr>
                        <td bgcolor="#66CCFF" width="25%">
                            باشلاش</td>
                        <td bgcolor="#66CCFF" width="25%">
                            يۈكلەش</td>
                        <td bgcolor="#66CCFF" width="25%" style="color: #FFFFFF">
                            ئايلاندۇرۇش
                        </td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="btnConvert" runat="server" Text="ئايلاندۇرۇش" 
                    OnClick="btnConvert_Click" />
                <asp:Button ID="btnDownload" runat="server" Enabled="False" Text="چۈشۈرۈش" 
                    OnClientClick="DownFile()" />
                <br />
                <asp:Label ID="lblMsgConvert" runat="server"></asp:Label>
            </asp:WizardStep>
        </WizardSteps>
        <SideBarButtonStyle BackColor="#507CD1"   
            ForeColor="White" Font-Bold="False" />
        <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" 
            BorderStyle="Solid" BorderWidth="1px"    
            ForeColor="#284E98" />
        <SideBarStyle BackColor="#0099FF"   VerticalAlign="Top" />
        <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" 
            BorderWidth="2px" Font-Bold="True"   ForeColor="White" 
            HorizontalAlign="Center" />
    </asp:Wizard>
               
                <br />
              
                <br />
                <br />
                <br />
                مۇناسىۋەتلىك ئۇلىنىشلار</td>
        </tr>
    </table>

    </asp:Content>

