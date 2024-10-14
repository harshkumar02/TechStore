<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Order.aspx.cs" Inherits="WebDemo.Order" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            <asp:Label ID="lblOrder" runat="server" Text="Thank you for placing an order!" ForeColor="Blue"></asp:Label>
        </p>
        <p>
            <asp:Button ID="btnReview" runat="server" Text="Review Product" OnClick="btnReview_Click" />
        </p>
        <p>
            &nbsp;</p>
        <asp:Panel ID="pnlReview" runat="server" Height="284px" Width="618px" Visible="False">
            <asp:Label ID="lblReview" runat="server" Text="Review for Product"></asp:Label>
            <br />
            <br />
            <asp:TextBox ID="txtReview" runat="server" Height="129px" TextMode="MultiLine" Width="228px" Columns="40" Rows="5"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="btnSubmitReview" runat="server" Text="Submit" OnClick="btnSubmitReview_Click" />
        </asp:Panel>

        <br />
        <asp:Label ID="lblSubmit" runat="server" Text="Thank you for submitting your review!" Visible="False"></asp:Label>

    </form>
</body>
</html>
