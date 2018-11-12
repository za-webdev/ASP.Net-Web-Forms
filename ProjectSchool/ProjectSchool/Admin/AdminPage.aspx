<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="ProjectSchool.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 81px;
            height: 59px;
            border-width: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <h1>Welcome admin</h1>
    <p>
        <asp:Button ID="Add" runat="server" OnClick="Add_Click" Text="Add A Student" />
        </p>
        <p>
            <asp:GridView ID="StudentGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="StudentId" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowCommand="StudentGrid_RowCommand">
                <Columns>
                    <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                    <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                    <asp:BoundField DataField="Description" HeaderText="Description" />
                    <asp:BoundField DataField="GrandSum" HeaderText="Grand Sum" />
                    <asp:BoundField DataField="StudentCode" HeaderText="Student Code" />
                    <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="delete" runat="server" CommandName="delete" CommandArgument="deleteStudent" Text="Delete Student" />
                        <asp:Button ID="schedule" runat="server" CommandName="schedule" CommandArgument="schedule" Text="Student Info" />
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
    <p>
        <a href="../Index/Index.aspx">
        <img alt="goBack" class="auto-style1" src="../Images/arrow.png" /></a></p>
        <p>
            List Of&nbsp; All Subjects</p>
        <p>
            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="Id" DataSourceID="SqlDataSource1">
                <EditItemTemplate>
                    Id:
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    CourseName:
                    <asp:TextBox ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    CourseName:
                    <asp:TextBox ID="CourseNameTextBox" runat="server" Text='<%# Bind("CourseName") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    Id:
                    <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                    <br />
                    CourseName:
                    <asp:Label ID="CourseNameLabel" runat="server" Text='<%# Bind("CourseName") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:StudentDataBaseConnection %>" DeleteCommand="DELETE FROM [Subject] WHERE [Id] = @original_Id AND (([CourseName] = @original_CourseName) OR ([CourseName] IS NULL AND @original_CourseName IS NULL))" InsertCommand="INSERT INTO [Subject] ([CourseName]) VALUES (@CourseName)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Subject]" UpdateCommand="UPDATE [Subject] SET [CourseName] = @CourseName WHERE [Id] = @original_Id AND (([CourseName] = @original_CourseName) OR ([CourseName] IS NULL AND @original_CourseName IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_CourseName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CourseName" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CourseName" Type="String" />
                    <asp:Parameter Name="original_Id" Type="Int32" />
                    <asp:Parameter Name="original_CourseName" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </p>
        <br />
        Add A schedule for A student<br />
        <asp:DropDownList ID="StudentList" runat="server" DataSourceID="lDataSource" DataTextField="FirstName" DataValueField="StudentId" AutoPostBack="True">
        </asp:DropDownList>
        <asp:SqlDataSource ID="lDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:StudentDataBaseConnection %>" SelectCommand="SELECT [StudentId], [FirstName] FROM [Student]"></asp:SqlDataSource>
        <asp:Button ID="SubmitBtn" runat="server" OnClick="SubmitBtn_Click" Text="Submit" />
    </form>
    </body>
</html>
