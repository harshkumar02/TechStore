<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WebDemo.ShoppingCart" %>
<%@ Register Src="~/WebUserControl1.ascx" TagName="Cat" TagPrefix="PCat" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <PCat:Cat ID="listCat" runat="server" />
        </div>
        <asp:GridView ID="gvShowCart" runat="server" AutoGenerateColumns="False" DataKeyNames="iProdID" OnRowDeleting="gvShowCart_RowDeleting" OnSelectedIndexChanged="gvShowCart_SelectedIndexChanged">
            <Columns>
                <asp:BoundField DataField="iProdId" HeaderText="Product ID" Visible="false" />
                <asp:BoundField DataField="cPName" HeaderText="Product Name" />
                <asp:BoundField DataField="iPrice" HeaderText="Price" DataFormatString="{0:C}" />
                <asp:BoundField DataField="iQoh" HeaderText="Quantity" />
                <%--<asp:ImageField DataImageUrlField="vImagePath" HeaderText="Image">
                    <ControlStyle Width="100px" Height="100px" />
                </asp:ImageField>--%>
                <asp:TemplateField HeaderText="Delete"> <ItemStyle HorizontalAlign ="Center" />
                    <ItemTemplate>
                        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images/d.jpg" CommandName="DeleteRow" CommandArgument='<%# Eval("iProdID") %>' ToolTip="Delete" />

                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
        <asp:Label ID="lblTotalPrice" runat="server" Text="Total Price"></asp:Label>
        <p>
            <asp:Button ID="btnBuy" runat="server" OnClick="btnBuy_Click" Text="Buy Now" />
        </p>
    </form>
</body>
</html>
