<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Login.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            text-align: right;
            width: 427px;
        }
        .auto-style6 {
            width: 385px;
            text-align: justify;
        }
        .auto-style7 {
            text-align: left;
        }
        .auto-style8 {
            text-align: right;
            width: 427px;
            height: 48px;
        }
        .auto-style9 {
            width: 385px;
            text-align: justify;
            height: 48px;
        }
        .auto-style10 {
            text-align: left;
            height: 48px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2">UserName:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserName" ErrorMessage="User name is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Email:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="email" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="email" ErrorMessage="Email is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Invalid Email" ForeColor="#FF3300" ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Password:</td>
                <td class="auto-style6">
                    <asp:TextBox ID="pass" runat="server"  TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="pass" ErrorMessage="Passwords is Required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style8">Confirm Password:</td>
                <td class="auto-style9">
                    <asp:TextBox ID="cpass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
                <td class="auto-style10">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="cpass" ErrorMessage="Confirm password is required" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                    <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Confirm Password must match password" ControlToCompare="pass" ControlToValidate="cpass" ForeColor="#FF3300"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">Who Are You:</td>
                <td class="auto-style6">
                    <asp:DropDownList ID="DropDownList" runat="server" >
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>Student</asp:ListItem>
                        <asp:ListItem>Admin</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style7">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList" ErrorMessage="Please choose an option" ForeColor="#FF3300" style="text-align: left"></asp:RequiredFieldValidator>
                </td>
            </tr>
            </table>
        <asp:Button ID="Button1" runat="server" style="margin-left: 517px" Text="Submit" />
        <input id="Reset1" type="reset" value="reset" /></form>
</body>
</html>
