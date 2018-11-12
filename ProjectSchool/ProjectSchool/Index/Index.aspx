<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ProjectSchool.Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color: #FFFFFF">
    <form id="form1" runat="server" >
        <div style="width: 500px" > 
            School Management
        </div>
        
        Who are you?<asp:DropDownList ID="DropDownList" runat="server" AutoPostBack="True">
            <asp:ListItem Selected="True">Select</asp:ListItem>
            <asp:ListItem>Admin</asp:ListItem>
            <asp:ListItem>Student</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="StudentCodeBox" runat="server" Visible="False"></asp:TextBox>
        <asp:Button ID="SubmitBtn" runat="server" OnClick="SubmitBtn_Click" Text="Submit" Visible="False" />
    </form>
</body>
</html>
