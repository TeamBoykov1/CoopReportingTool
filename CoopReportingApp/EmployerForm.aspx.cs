using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class EmployerForm : System.Web.UI.Page
{
    //Establishing conection to BOlayer
    EmployerEvaFormBO ObjEmployerBO = new EmployerEvaFormBO();
    DataSet ds = new DataSet();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            txtSId.Focus();
        }
    }
    //OnSubmitclick Action
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SubmitEmployerForm();
    }
    //Insert Method
    protected void SubmitEmployerForm()
    {
        ObjEmployerBO.AbilityToLearn = rblAbilityToLearn.SelectedItem.Value;
        ObjEmployerBO.AppreciationofDiversity = rblAppreciationofDiversity.SelectedItem.Value;
        ObjEmployerBO.Dependability = rblDependability.SelectedItem.Value;
        ObjEmployerBO.EnterpreneurialOrientation = rblEnterpreneurialOrientation.SelectedItem.Value;
        ObjEmployerBO.EthicalBehaviour = rblEthicalBehaviour.SelectedItem.Value;
        ObjEmployerBO.InterestInWork = rblInterestInWork.SelectedItem.Value;
        ObjEmployerBO.InterpersonalCommunication = rblInterpersonalCommunication.SelectedItem.Value;
        ObjEmployerBO.JobTitle = txtJTitle.Text;
        ObjEmployerBO.ManagerName = txtmanagerName.Text;
        ObjEmployerBO.NextWorkTerm = rblNextWorkTerm.SelectedItem.Value;
        ObjEmployerBO.OfferNextWorkTerm = rblOfferNextWorkTerm.SelectedItem.Value;
        ObjEmployerBO.OfferStatus = rblOfferStatus.SelectedItem.Value;
        ObjEmployerBO.OralCommuniation = rblOralCommuniation.SelectedItem.Value;
        ObjEmployerBO.Organization = txtOrg.Text;
        ObjEmployerBO.OverallPerformanceRating = rblOverallPerformanceRating.SelectedItem.Value;
        ObjEmployerBO.ProblemSolving = rblProblemSolving.SelectedItem.Value;
        ObjEmployerBO.QualityofWork = rblQualityofWork.SelectedItem.Value;
        ObjEmployerBO.Reflection = rblReflection.SelectedItem.Value;
        ObjEmployerBO.Resoursefulness = rblResoursefulness.SelectedItem.Value;
        ObjEmployerBO.ResponseToSupervision = rblResponseToSupervision.SelectedItem.Value;
        ObjEmployerBO.StudentId = int.Parse(txtSId.Text);
        ObjEmployerBO.StudentName = txtSName.Text;
        ObjEmployerBO.SupervisorsComments = txtSupervisorsComments.Text;
        ObjEmployerBO.SupervisorsName = txtSupervisorsName.Text;
        ObjEmployerBO.SupervisorsRecommendations = txtSupervisorsRecommendations.Text;
        ObjEmployerBO.SupervisorsTitle = txtSupervisorsTitle.Text;
        ObjEmployerBO.TeamWork = rblTeamWork.SelectedItem.Value;
        ObjEmployerBO.Term = ddlWorkTerm.Text;
        ObjEmployerBO.WrittenCommunication = rblWrittenCommunication.SelectedItem.Value;
        ObjEmployerBO.year = int.Parse(ddlYear.SelectedItem.ToString());
        ds = ObjEmployerBO.InsertEmpEvalForm(ObjEmployerBO);
        if (ds.Tables.Count > 0)
        {
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = txtSName.Text + "'s " + ddlWorkTerm.SelectedItem.ToString() + " term evaluation form submited";
        }
        else
        {
            lblMessage.ForeColor = System.Drawing.Color.Red;
            lblMessage.Text = txtSName.Text + "'s Evaluation form is already submitted for " + ddlWorkTerm.SelectedItem.ToString() + " Term";
        }
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        txtSId.Text = "";
        txtSName.Text = "";
        txtOrg.Text = "";
        txtJTitle.Text = "";
        ddlWorkTerm.SelectedIndex = 0;
        ddlYear.SelectedIndex = 0;
        txtSupervisorsComments.Text = "";
        txtSupervisorsRecommendations.Text = "";
        txtSupervisorsName.Text = "";
        txtSupervisorsTitle.Text = "";
        txtmanagerName.Text = "";
    }
}