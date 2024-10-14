<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Products.aspx.cs" Inherits="WebDemo.Products" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="height: 359px">
    <form id="form1" runat="server">
        <p>
            <asp:Label ID="lblWelcome" runat="server" Text="Welcome"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblProduct" runat="server" Text="Products"></asp:Label>
&nbsp;
            <asp:DropDownList ID="ddlProducts" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlProducts_SelectedIndexChanged">
            </asp:DropDownList>

        </p>
        <p>
            <br />

            <asp:Image ID="imgProduct" runat="server" Height="100px" />
            <br />
        </p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
            &nbsp;</p>
        <p>
&nbsp;<asp:Label ID="lblPrice" runat="server" Text="Label"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
        <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
        <p>
            <asp:TextBox ID="txtQuantity" runat="server" placeholder="Enter qty"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Enter Quantity" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;
            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtQuantity" ErrorMessage="Quantity  must be atleast 1" OnServerValidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
        </p>
        <p>
            &nbsp;</p>
        <p>
&nbsp;<asp:Button ID="btnBuyNow" runat="server" Text="Buy Now" OnClick="Button1_Click" />
        </p>
    </form>
</body>
</html>
