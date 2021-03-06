﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Student/student.Master" AutoEventWireup="true" CodeFile="StudentCoopReport.aspx.cs" Inherits="Student_StudentCoopReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <h3>Student Coop Report</h3>

    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lblMessage" Font-Size="Large" runat="server" Text=""></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <asp:Label ID="Label1" runat="server" Text="Student ID:"></asp:Label>
            <asp:TextBox ID="txtSId" CssClass="form-control" placeholder="StudentID" runat="server" MaxLength="9" ReadOnly="True"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtSId"
                ErrorMessage="StudentId Required" ForeColor="Red" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="txtSId"
                ErrorMessage="StudentId should be numbers" ForeColor="Red" Font-Size="X-Small" SetFocusOnError="True"
                ValidationExpression="^[0-9/ ]+$"></asp:RegularExpressionValidator>
        </div>
        <div class="col-md-6">
            <asp:Label ID="Label2" runat="server" Text="Student Name:"></asp:Label>
            <asp:TextBox ID="txtSName" CssClass="form-control" placeholder="Student Name" runat="server" ReadOnly="True"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="txtSName"
                ErrorMessage="Name Required" ForeColor="Red" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator8" runat="server" ControlToValidate="txtSName"
                ErrorMessage="Plz,EnterCharactersOnly" ForeColor="Red" Font-Size="X-Small" SetFocusOnError="True"
                ValidationExpression="^[A-Za-z./ ]+$"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <asp:Label ID="Label4" runat="server" Text="Report Month:"></asp:Label>
            <asp:DropDownList ID="ddlRmonth" CssClass="form-control" Operator="NotEqual" runat="server">
                <asp:ListItem>Choose Month</asp:ListItem>
                <asp:ListItem>January</asp:ListItem>
                <asp:ListItem>February</asp:ListItem>
                <asp:ListItem>March</asp:ListItem>
                <asp:ListItem>April</asp:ListItem>
                <asp:ListItem>May</asp:ListItem>
                <asp:ListItem>June</asp:ListItem>
                <asp:ListItem>July</asp:ListItem>
                <asp:ListItem>August</asp:ListItem>
                <asp:ListItem>September</asp:ListItem>
                <asp:ListItem>October</asp:ListItem>
                <asp:ListItem>November</asp:ListItem>
                <asp:ListItem>December</asp:ListItem>
            </asp:DropDownList>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ErrorMessage="Choose Month"
                ControlToValidate="ddlRmonth" Font-Size="X-Small" ForeColor="red"
                Operator="NotEqual" SetFocusOnError="True" ValueToCompare="Choose Year"></asp:CompareValidator>
        </div>
        <div class="col-md-6">
            <asp:Label ID="Label8" runat="server" Text="Report Year:"></asp:Label>
            <asp:DropDownList ID="ddlYear" CssClass="form-control" Operator="NotEqual" runat="server">
                <asp:ListItem>Select Year</asp:ListItem>
                <asp:ListItem>2015</asp:ListItem>
                <asp:ListItem>2016</asp:ListItem>
                <asp:ListItem>2017</asp:ListItem>
                <asp:ListItem>2018</asp:ListItem>
                <asp:ListItem>2019</asp:ListItem>
                <asp:ListItem>2020</asp:ListItem>
                <asp:ListItem>2021</asp:ListItem>
                <asp:ListItem>2022</asp:ListItem>
                <asp:ListItem>2023</asp:ListItem>
                <asp:ListItem>2024</asp:ListItem>
                <asp:ListItem>2025</asp:ListItem>
            </asp:DropDownList>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Select year"
                ControlToValidate="ddlYear" Font-Size="X-Small" ForeColor="red"
                Operator="NotEqual" SetFocusOnError="True" ValueToCompare="Select Year"></asp:CompareValidator>
        </div>


    </div>
    <div class="row">
        <div class="col-md-6">
            <asp:Label ID="Label5" runat="server" Text="Oraganization:"></asp:Label>
            <asp:TextBox ID="txtOrg" CssClass="form-control" placeholder="Organization" runat="server" ReadOnly="True"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtOrg"
                ErrorMessage="Organization Name is Required" ForeColor="Red" Font-Size="X-Small" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>
        <div class="col-md-6">
            <asp:Label ID="Label3" runat="server" Text="Co-op Advisor Name:"></asp:Label>
            <asp:TextBox ID="txtCoopAdvisorName" CssClass="form-control" placeholder="Advisor Name" runat="server" ReadOnly="True"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtCoopAdvisorName"
                ErrorMessage="Coop Advisor Name is Required" ForeColor="Red" Font-Size="X-Small"
                SetFocusOnError="True"></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtCoopAdvisorName"
                ErrorMessage="Plz,EnterCharactersOnly" ForeColor="Red" Font-Size="X-Small" SetFocusOnError="True"
                ValidationExpression="^[A-Za-z./ ]+$"></asp:RegularExpressionValidator>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <asp:Label ID="Label7" runat="server" Text="Job Title:"></asp:Label>
            <asp:TextBox ID="txtJTitle" CssClass="form-control" placeholder="Job Tiltle" runat="server" ReadOnly="True"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtJTitle"
                ErrorMessage="Job title is Required" ForeColor="Red" Font-Size="X-Small"
                SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>
        <div class="col-md-6">
            <asp:Label ID="Label6" runat="server" Text="Work Term:"></asp:Label>
            <asp:TextBox ID="txtWorkTerm" CssClass="form-control" placeholder="WorkTerm" runat="server" ReadOnly="True"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtWorkTerm"
                ErrorMessage="Job title is Required" ForeColor="Red" Font-Size="X-Small"
                SetFocusOnError="True"></asp:RequiredFieldValidator>
        </div>
    </div>


    <p>1. Do you like your internship?</p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblIntership" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitely Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>2. Do you feel adequately prepared for your internship? </p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblAdequately" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitely Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>3. Are you able to relate your internship to your curriculum in communication?</p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblCurriculum" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitely Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>4. Does your internship fulfill your expectations?</p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblExpectation" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>5. Do you think that you are successfully fulfilling the requirements of your internship?</p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblRequirements" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>6. Do you think the lines of communication are open between you and the internship director?</p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblCoopAdvisor" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>7. Do you think the lines of communication are open between you and your agency supervisor?</p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblAgencySupervisor" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>8. Is your agency supervisor aware or actively involved in your internship? </p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblSupervisorActive" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>9. Is attendance stressed by your agency supervisor?</p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblAttendance" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>10. Is punctuality stressed?</p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblPunctuality" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>11. Is your internship structured enough?</p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblStructured" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>12. Is your internship overly structured? </p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblOverStructured" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>13. Do you currently have any problems related to your internship?</p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblProblems" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>
        14. Have you received help with intern-related problems from sources other than your faculty and
agencysupervisor? 
   
    </p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblHelpProblems" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>15. Are you learning from your internship? </p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblLearning" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>16. Is your internship rewarding? </p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblRewarding" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>17. Do you think you are mastering the objectives established for the internship? </p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblObjectiveEstablished" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>18. Would you recommend your internship to others? </p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblRecommend" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Yes Definitely</asp:ListItem>
                <asp:ListItem Selected="True">Yes</asp:ListItem>
                <asp:ListItem>Somewhat</asp:ListItem>
                <asp:ListItem>No</asp:ListItem>
                <asp:ListItem>Definitly Not</asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>19. Self-evaluation:</p>
    <div class="row">
        <div class="col-md-2" aria-orientation="vertical">
            <asp:RadioButtonList ID="rblSelfEvaluation" runat="server" RepeatDirection="Horizontal" Width="1000px">
                <asp:ListItem>Exceptional</asp:ListItem>
                <asp:ListItem Selected="True">Exceeded Expectations</asp:ListItem>
                <asp:ListItem>Successfully Met Exceptations</asp:ListItem>
                <asp:ListItem>Did not meet Expectations</asp:ListItem>

            </asp:RadioButtonList>
        </div>
    </div>
    <hr />
    <p>Duties Performed:</p>
    <asp:TextBox ID="txtDutiesPerformed" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
    <hr />
    <p>Comments:</p>
    <asp:TextBox ID="txtComments" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
    <hr />

    <div class="row">
        <div class="col-md-4">
        </div>
        <div class="col-md-4">
            <asp:Button ID="btnSubmit" runat="server" CausesValidation="True" Text="Submit" CssClass="btn btn-success" Height="41px" Width="138px" OnClick="btnSubmit_Click" />
            <asp:Button ID="btnClear" runat="server" CausesValidation="False"
                Text="Clear" CssClass="btn btn-warning" Height="41px" Width="138px" />
        </div>
        <div class="col-md-4">
        </div>

    </div>
    <br />
</asp:Content>

