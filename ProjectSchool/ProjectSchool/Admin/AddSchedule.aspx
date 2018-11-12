<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddSchedule.aspx.cs" Inherits="ProjectSchool.Admin.AddSchedule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
   
        <h1>Add Schedule For
            <asp:Label ID="StudentNameLabel" runat="server"></asp:Label>
        </h1>
        <p>
            <asp:ListBox ID="ListBoxSubjects" runat="server" DataSourceID="SqlDataSource1" DataTextField="CourseName" DataValueField="Id" SelectionMode="Multiple"></asp:ListBox>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StudentDataBaseConnection %>" SelectCommand="SELECT [Id], [CourseName] FROM [Subject]"></asp:SqlDataSource>
        </p>
        <asp:Button ID="AddBtn" runat="server" OnClick="AddBtn_Click" Text="Add" />
        <asp:GridView ID="StudentGrid" runat="server" AutoGenerateColumns="False" OnRowCommand="StudentGrid_RowCommand">
            <Columns>
                <asp:BoundField DataField="CourseId" HeaderText="Course Id" />
                <asp:BoundField DataField="CourseName" HeaderText="Course Name" />
                <asp:BoundField DataField="Attendence" HeaderText="Attendence" />
                <asp:BoundField DataField="quiz" HeaderText="Quiz" />
                <asp:BoundField DataField="HomeWork" HeaderText="Home Work" />
                <asp:BoundField DataField="Research" HeaderText="Research" />
                <asp:BoundField DataField="LabPractice" HeaderText="Lab Practice" />
                <asp:BoundField DataField="FinalExam" HeaderText="Final Exam" />
                <asp:BoundField DataField="GrandSum" HeaderText="Grand Sum" />
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="score" runat="server" CommandName="score" CommandArgument="score" Text="Score Subject" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
         <div runat="server" id="scorediv" visible="True">
    
             <asp:Label ID="AttendenceLbl" runat="server" Text="Attendence:" Visible="False"></asp:Label>
             <asp:TextBox ID="Attendence" runat="server" TextMode="Number" Visible="False"></asp:TextBox>
             <br />
             <asp:Label ID="QuizLbl" runat="server" Text="Quiz:" Visible="False"></asp:Label>
             <asp:TextBox ID="quiz" runat="server" Visible="False"></asp:TextBox>
             <br />
             <asp:Label ID="HWLbl" runat="server" Text="Home Work:" Visible="False"></asp:Label>
             <asp:TextBox ID="HomeWork" runat="server" TextMode="Number" Visible="False"></asp:TextBox>
             <br />
             <asp:Label ID="ResearchLbl" runat="server" Text="Research:" Visible="False"></asp:Label>
             <asp:TextBox ID="Reasearch" runat="server" TextMode="Number" Visible="False"></asp:TextBox>
             <br />
             <asp:Label ID="LabLbl" runat="server" Text="Lab Practive:" Visible="False"></asp:Label>
             <asp:TextBox ID="LabPractice" runat="server" TextMode="Number" Visible="False"></asp:TextBox>
             <br />
             <asp:Label ID="ExamLbl" runat="server" Text="Final Exam:" Visible="False"></asp:Label>
             <asp:TextBox ID="FinalExam" runat="server" TextMode="Number" Visible="False"></asp:TextBox>
    
        </div>
    </form>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
</body>
</html>
