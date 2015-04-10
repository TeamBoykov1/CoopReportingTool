<<<<<<< HEAD
﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Student_Profile : System.Web.UI.Page
{
    int StudentId = 444444444; // make sure student info with id 444444444 exist in database (both tbl_Student and tbl_WorkTerm)
    protected void Page_Load(object sender, EventArgs e)
    {
        maketextBoxesReadonly();  // calling method to make textboxes read only  
        if (!IsPostBack)
        {
            displayStdProfile();
            displayGrade();
            displayCurrentWorkTerm();
        }       
    }

    RegistrationBO ObjRegistrationBO = new RegistrationBO();
    DataSet ds = new DataSet();

    // mathod to displaystudent info - subash
    private void displayStdProfile()
    {
        ObjRegistrationBO.StudentId = StudentId;
        ds = ObjRegistrationBO.SelectedStudentProfile();
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtSId.Text = ds.Tables[0].Rows[0]["StudentId"].ToString();
            // concat FName + LName in single textbox
            txtSName.Text = (ds.Tables[0].Rows[0]["SFname"].ToString()) + " " + (ds.Tables[0].Rows[0]["SLname"].ToString());
            txtAddress1.Text = ds.Tables[0].Rows[0]["SAddress1"].ToString();
            txtAddress2.Text = ds.Tables[0].Rows[0]["SAddress2"].ToString();
            txtCity.Text = ds.Tables[0].Rows[0]["SCity"].ToString();
            txtPostalCode.Text = ds.Tables[0].Rows[0]["SPostalCode"].ToString();
            txtProgram.Text = ds.Tables[0].Rows[0]["SProgram"].ToString();
            ddlProvince.Text = ds.Tables[0].Rows[0]["SProvince"].ToString();
        }
    }
    // mathod to display grade of selected student - subash
    private void displayGrade()
    {
        ObjRegistrationBO.StudentId = StudentId;
        ds = ObjRegistrationBO.StudentGrade();

        if ((ds.Tables[0].Rows.Count > 0) && (ds.Tables[0].Rows.Count < 2))
        // if there is only 0 grade entry (1 grade row only)
        {
            //lblWorkTerm1.Text = ds.Tables[0].Rows[0]["Grade"].ToString();
            lblWorkTerm1.Text = "--";
        }
        else if ((ds.Tables[0].Rows.Count > 1) && (ds.Tables[0].Rows.Count < 3))
        // if there is 1 grades entry (2 grade rows)
        {
            lblWorkTerm1.Text = ds.Tables[0].Rows[0]["Grade"].ToString(); // WorkTerm 1 Grade
            lblWorkTerm2.Text = ds.Tables[0].Rows[1]["Grade"].ToString(); // WorkTerm 2 Grade
            lblWorkTerm2.Text = "--";
        }
        else if ((ds.Tables[0].Rows.Count > 2) && (ds.Tables[0].Rows.Count < 4))
        // if there is 2 grades entry (but 3 grade rows )
        {
            lblWorkTerm1.Text = ds.Tables[0].Rows[0]["Grade"].ToString(); // WorkTerm 1 Grade
            lblWorkTerm2.Text = ds.Tables[0].Rows[1]["Grade"].ToString(); // WorkTerm 2 Grade
            //lblWorkTerm3.Text = ds.Tables[0].Rows[2]["Grade"].ToString(); // WorkTerm 3 Grade
            lblWorkTerm3.Text = "--";
        }
        else if ((ds.Tables[0].Rows.Count > 3) && (ds.Tables[0].Rows.Count < 5))
        // if there is 3 grades entry ( but 4 grade rows)
        {
            lblWorkTerm1.Text = ds.Tables[0].Rows[0]["Grade"].ToString(); // WorkTerm 1 Grade
            lblWorkTerm2.Text = ds.Tables[0].Rows[1]["Grade"].ToString(); // WorkTerm 2 Grade
            lblWorkTerm3.Text = ds.Tables[0].Rows[2]["Grade"].ToString(); // WorkTerm 3 Grade
            //lblWorkTerm4.Text = ds.Tables[0].Rows[3]["Grade"].ToString(); // WorkTerm 4 Grade
            lblWorkTerm4.Text = "--";
        }

    }

    // method to Dispay current work term - subash
    private void displayCurrentWorkTerm()
    {
        ObjRegistrationBO.StudentId = StudentId;
        ds = ObjRegistrationBO.CurrentWorkTerm();
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtCurrentWorkTerm.Text = ds.Tables[0].Rows[0]["WorkTerm"].ToString();
        }

    }

    // method to make textboxes Readonly
    private void maketextBoxesReadonly()
    {

        txtSId.ReadOnly = true;
        txtSName.ReadOnly = true;
        txtSName.ReadOnly = true;
        txtAddress1.ReadOnly = true;
        txtAddress2.ReadOnly = true;
        txtCity.ReadOnly = true;
        txtPostalCode.ReadOnly = true;
        txtProgram.ReadOnly = true;
        ddlProvince.Enabled = false;
        txtCurrentWorkTerm.ReadOnly = true;
    }

    // method to make textboxes editable or rollback textboxes read only
    private void maketextBoxesEditable() // call this method upon EDIT button click to edit profile
    {
        txtAddress1.ReadOnly = false;
        txtAddress2.ReadOnly = false;
        txtCity.ReadOnly = false;
        txtPostalCode.ReadOnly = false;
        // lets not allow student to change progrem by themself, Alagu?
        //txtProgram.ReadOnly = true;   
        ddlProvince.Enabled = true;
        // lets not allow student to change their current progrem by themself, Sukhpreet/Jasmeet?
        //txtCurrentWorkTerm.ReadOnly = false; 
    }

=======
﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Student_Profile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            StudentProfile();
            //display student grades 
            StudentGrade();
        }
    }
    RegistrationBO ObjRegistrationBO = new RegistrationBO();
    //Grage class reference
    GradepageBO ObjGradepageBO = new GradepageBO();
    private void StudentGrade()
    {
        ObjGradepageBO.StudentID = int.Parse(txtSId.Text);
        DataSet ds = new DataSet();
        ds = ObjGradepageBO.StudentGrade();
        if (ds.Tables[0].Rows.Count > 0)
        {
            gdvGrades.DataSource = ds;
            gdvGrades.DataBind();
        }
        else
        {
            lblGradeMessage.ForeColor = System.Drawing.Color.Red;
            lblGradeMessage.Text = "Grades are not avaialble";
        }
    }
    //display student profile information
    private void StudentProfile()
    {
        ObjRegistrationBO.StudentId = int.Parse(txtSId.Text);
        DataSet ds = new DataSet();
        ds = ObjRegistrationBO.StudentProfile();
        if (ds.Tables[0].Rows.Count > 0)
        {
            txtSFName.Text = ds.Tables[0].Rows[0]["SFname"].ToString();
            txtSLName.Text = ds.Tables[0].Rows[0]["SLname"].ToString();
            txtProgram.Text = ds.Tables[0].Rows[0]["SProgram"].ToString();
            txtEmail.Text = ds.Tables[0].Rows[0]["SEmail"].ToString();
            txtAddress1.Text = ds.Tables[0].Rows[0]["SAddress1"].ToString();
            txtAddress2.Text = ds.Tables[0].Rows[0]["SAddress2"].ToString();
            txtCity.Text = ds.Tables[0].Rows[0]["SCity"].ToString();
            if (ds.Tables[0].Rows[0]["SProvince"].ToString() != "")
            {
                ddlProvince.Items.FindByText(ds.Tables[0].Rows[0]["SProvince"].ToString()).Selected = true; 
            }
            txtPostalCode.Text = ds.Tables[0].Rows[0]["SPostalCode"].ToString();
            txtPhoneNo.Text = ds.Tables[0].Rows[0]["SPhone"].ToString();
            txtMobileNo.Text = ds.Tables[0].Rows[0]["SCell"].ToString();
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        btnEdit.Enabled = false;
        btnSave.Enabled = true;
        btnClear.Enabled = true;
        txtAddress1.ReadOnly = false;
        txtAddress2.ReadOnly = false;
        txtCity.ReadOnly = false;
        ddlProvince.Enabled = true;
        txtPostalCode.ReadOnly = false;
        txtEmail.ReadOnly = false;
        txtPhoneNo.ReadOnly = false;
        txtMobileNo.ReadOnly = false;
    }
    protected void btnClear_Click(object sender, EventArgs e)
    {
        btnEdit.Enabled = true;
        btnSave.Enabled = false;
        btnClear.Enabled = false;
        txtSFName.ReadOnly = true;
        txtSLName.ReadOnly = true;
        txtAddress1.ReadOnly = true;
        txtAddress2.ReadOnly = true;
        txtCity.ReadOnly = true;
        ddlProvince.Enabled = false;
        txtPostalCode.ReadOnly = true;
        txtProgram.ReadOnly = true;
        txtEmail.ReadOnly = true;
        txtPhoneNo.ReadOnly = true;
        txtMobileNo.ReadOnly = true;
        lblMessage.Text = "";
        lblGradeMessage.Text = "";


    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        ObjRegistrationBO.StudentId = int.Parse(txtSId.Text);
        ObjRegistrationBO.SFname = txtSFName.Text;
        ObjRegistrationBO.SLname = txtSLName.Text;
        ObjRegistrationBO.SProgram = txtProgram.Text;
        ObjRegistrationBO.SEmail = txtEmail.Text;
        ObjRegistrationBO.SAddress1 = txtAddress1.Text;
        ObjRegistrationBO.SAddress2 = txtAddress2.Text;
        ObjRegistrationBO.SCity = txtCity.Text;
        ObjRegistrationBO.SProvince = ddlProvince.SelectedItem.ToString();
        ObjRegistrationBO.SPostalCode = txtPostalCode.Text;
        ObjRegistrationBO.SPhone = txtPhoneNo.Text;
        ObjRegistrationBO.SCell = txtMobileNo.Text;
        DataSet ds = new DataSet();
        ds = ObjRegistrationBO.UpdateProfile(ObjRegistrationBO);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblMessage.ForeColor = System.Drawing.Color.Green;
            lblMessage.Text = "Profile Updated";
        }
    }
>>>>>>> a7211cb0ff4008030f8ff94ae6cb98561b05f5fa
}