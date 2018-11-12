<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DefulatForm.aspx.cs" Inherits="CRUD.DefulatForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>Create Read Update and Delete<br />
        </h1>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <h1>&nbsp;</h1>
        <h1>
            <asp:FormView ID="FormView1" runat="server" AllowPaging="True" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="StudentId" DataSourceID="SqlDataSource1" GridLines="Both">
                <EditItemTemplate>
                    StudentId:
                    <asp:Label ID="StudentIdLabel1" runat="server" Text='<%# Eval("StudentId") %>' />
                    <br />
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Garde:
                    <asp:TextBox ID="GardeTextBox" runat="server" Text='<%# Bind("Garde") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </EditItemTemplate>
                <EditRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                <InsertItemTemplate>
                    Name:
                    <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Garde:
                    <asp:TextBox ID="GardeTextBox" runat="server" Text='<%# Bind("Garde") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                </InsertItemTemplate>
                <ItemTemplate>
                    StudentId:
                    <asp:Label ID="StudentIdLabel" runat="server" Text='<%# Eval("StudentId") %>' />
                    <br />
                    Name:
                    <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                    <br />
                    Garde:
                    <asp:Label ID="GardeLabel" runat="server" Text='<%# Bind("Garde") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
                </ItemTemplate>
                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                <RowStyle BackColor="White" ForeColor="#003399" />
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [Student] WHERE [StudentId] = @original_StudentId AND [Name] = @original_Name AND (([Garde] = @original_Garde) OR ([Garde] IS NULL AND @original_Garde IS NULL))" InsertCommand="INSERT INTO [Student] ([Name], [Garde]) VALUES (@Name, @Garde)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Student]" UpdateCommand="UPDATE [Student] SET [Name] = @Name, [Garde] = @Garde WHERE [StudentId] = @original_StudentId AND [Name] = @original_Name AND (([Garde] = @original_Garde) OR ([Garde] IS NULL AND @original_Garde IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_StudentId" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Garde" Type="Double" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Garde" Type="Double" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Name" Type="String" />
                    <asp:Parameter Name="Garde" Type="Double" />
                    <asp:Parameter Name="original_StudentId" Type="Int32" />
                    <asp:Parameter Name="original_Name" Type="String" />
                    <asp:Parameter Name="original_Garde" Type="Double" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
            <br />
            <br />
            <br />
        </h1>
    
    </div>
    </form>
</body>
</html>
