﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CoopReportBO
/// </summary>
public class CoopReportBO
{
	public CoopReportBO(){
		//
		// TODO: Add constructor logic here
		//
	}
    public int Id { get; set; }
    public string StudentName { get; set; }
    public int StudentID { get; set; }
    public string AdvisorName { get; set; }
    public string Oraganization { get; set; }
    public int Year { get; set; }
    public string ReportMonth { get; set; }
    public string JobTitle { get; set; }
    public string WorkTerm { get; set; }
    public string LikeIntership { get; set; }
    public string AdequatelyPrepared { get; set; }
    public string Curriculum { get; set; }
    public string Expectation { get; set; }
    public string Requirement { get; set; }
    public string AboutCoopAdvisor { get; set; }
    public string AgencySupervisor { get; set; }
    public string SupervisorActive { get; set; }
    public string Attendance { get; set; }
    public string Punctuality { get; set; }
    public string Structured { get; set; }
    public string OverStructured { get; set; }
    public string Problems { get; set; }
    public string HelpProblems { get; set; }
    public string Learning { get; set; }
    public string Rewarding { get; set; }
    public string ObjectiveEstablished { get; set; }
    public string Recommend { get; set; }
    public string SelfEvaluation { get; set; }
    public string DutiesPerformed { get; set; }
    public string Comments { get; set; }
    public string Questionnaires { get; set; }

    public System.Data.DataSet AllStudentCoopReports()
    {
        return CoopReportDAL.AllStudentCoopReports();
    }

    public System.Data.DataSet ReportByStudentID()
    {
        return CoopReportDAL.ReportByStudentID(StudentID);
    }

    public System.Data.DataSet ReportsByMonth()
    {
        return CoopReportDAL.ReportsByMonth(ReportMonth);
    }

    public System.Data.DataSet ReportByStudentIDandMonth()
    {
        return CoopReportDAL.ReportaByStudentIDandMonth(StudentID,ReportMonth,Year);
    }

    public System.Data.DataSet IndividualReport()
    {
        return CoopReportDAL.IndividualReport(Id);
    }

    public System.Data.DataSet InsertCoopReport(CoopReportBO objCoopReportBO)
    {
        return CoopReportDAL.InsertCoopReport(objCoopReportBO);
    }

    public System.Data.DataSet GetQuestionnairesInfo()
    {
        return CoopReportDAL.GetQuestionnaresInfo(Oraganization, Questionnaires);
    }

    public System.Data.DataSet GetCompanies()
    {
        return CoopReportDAL.GetCompanies();
    }
}