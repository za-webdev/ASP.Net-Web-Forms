<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentPage.aspx.cs" Inherits="ProjectSchool.StudentPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 111px;
            height: 58px;
            border-width: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    <h1>Welcome Student</h1>
        <asp:Label ID="StudentCodeLable" runat="server"></asp:Label>
        <br />
        <br />
        <asp:GridView ID="myGrid" runat="server" AutoGenerateColumns="False" >
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" />
                <asp:BoundField DataField="LastName" HeaderText="Last Name" />
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:BoundField DataField="GrandSum" HeaderText="Grand Sum" />
                
            </Columns>
        </asp:GridView>
        <br />
        Say Something about your self:
        <asp:TextBox ID="DescriptionBox" runat="server"></asp:TextBox>
        <asp:Button ID="SubmitBtn" runat="server" OnClick="SubmitBtn_Click" Text="Submit" />
    </form>
    <p>
        <a href="../Index/Index.aspx">
        <img alt="Goback" class="auto-style1" src="../Images/arrow.png" /></a></p>
    </body>
</html>
