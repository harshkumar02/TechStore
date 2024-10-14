<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="WebDemo.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LOGIN<br />
        </div>
        <asp:Label ID="lblName" runat="server" Text="User Name"></asp:Label>
        <asp:TextBox ID="txtUserName" runat="server" style="margin-left: 67px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUserName" ErrorMessage="Enter Your Name"></asp:RequiredFieldValidator>
        <br />
        <br />
        <asp:Label ID="lblEmail" runat="server" Text="Email Id"></asp:Label>
        <asp:TextBox ID="txtEmail" runat="server" style="margin-left: 84px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="lblPassNo" runat="server" Text="Passport No"></asp:Label>
&nbsp;&nbsp;
        <asp:TextBox ID="txtPassNo" runat="server" style="margin-left: 52px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassNo" ErrorMessage="Passport No is required"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPassNo" ErrorMessage="Invalid Passport format" ValidationExpression="^[A-Za-z][0-9]{7}$"></asp:RegularExpressionValidator>
        <br />
        <br />
        <asp:Label ID="lblAge" runat="server" Text="Age"></asp:Label>
        <asp:TextBox ID="txtAge" runat="server" style="margin-left: 119px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtAge" ErrorMessage="Age is required"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtAge" ErrorMessage="Age must be between 18 to 120" MaximumValue="120" MinimumValue="18" Type="Integer"></asp:RangeValidator>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSignIn" runat="server" OnClick="btnSignIn_Click" Text="Sign In" />
&nbsp;
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
    </form>
</body>
</html>
