﻿﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CoopAdvisor_SelectedStudent : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            SelectedStudentReport();
            EmployeeEvaForm();
        }
    }
    EmployerEvaFormBO objEmployerEvaFormBO = new EmployerEvaFormBO();
    GradepageBO objGradepageBo = new GradepageBO(); 
    CoopReportBO ObjCoopReportBO = new CoopReportBO();
    DataSet ds = new DataSet();
    private void EmployeeEvaForm()
    {
        objEmployerEvaFormBO.StudentId = Convert.ToInt32(Request.QueryString["StudentID"].ToString());
        ds = objEmployerEvaFormBO.EmpEvalutionForm();
        if (ds.Tables[0].Rows.Count > 0)
        {
            gdvEmployeeEvaForm.DataSource = ds;
            gdvEmployeeEvaForm.DataBind();
        }
        else {
            lblmessage.Text = "Employer Evalutions form not yet received";
        }
    }

    private void SelectedStudentReport()
    {
        ObjCoopReportBO.StudentID = int.Parse(Request.QueryString["StudentID"].ToString());
        DataSet ds = new DataSet();
        ds = ObjCoopReportBO.ReportByStudentID();
        if (ds.Tables[0].Rows.Count > 0)
        {
            gdvSelectdReport.DataSource = ds;
            gdvSelectdReport.DataBind();
        }
    }
    protected void gdvSelectdReport_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            Response.Redirect("IndividualReport.aspx?ID=" + e.CommandArgument.ToString());
        }
    }
    protected void gdvEmployeeEvaForm_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "View")
        {
            Response.Redirect("IndividualEvalutionForm.aspx?ID=" + e.CommandArgument.ToString());
        }
    }

    protected void btnGrade_Click(object sender, EventArgs e)
    {
        int StudentID = int.Parse(Request.QueryString["StudentID"].ToString());
        Response.Redirect("Gradepage.aspx?StudentID=" + StudentID);
    }
}