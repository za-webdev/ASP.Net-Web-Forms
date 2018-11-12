<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddStudent.aspx.cs" Inherits="ProjectSchool.Admin.AddStudent" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="height: 243px; width: 277px; margin-left: 478px; margin-top: 139px">
    
        <br />
        <br />
        <asp:Label ID="FisrtName" runat="server" Text="First Name:"></asp:Label>
        <asp:TextBox ID="FName" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="LastName" runat="server" Text="Last Name:"></asp:Label>
        <asp:TextBox ID="Lname" runat="server"></asp:TextBox>
        <br />
        <br />
        <br />
        <asp:Label ID="StudentCode" runat="server" Text="Student Code:"></asp:Label>
        <asp:TextBox ID="SCode" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:Button ID="SubmitBtn" runat="server" OnClick="SubmitBtn_Click" Text="Submit" />
    
    </div>
    </form>
</body>
</html>
