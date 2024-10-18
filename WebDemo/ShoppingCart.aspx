<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WebDemo.ShoppingCart"   %>
<%@ Register Src="~/SignInControl.ascx" TagName="SignInControl" TagPrefix="uc" %>

<%@ Register Src="~/WebUserControl1.ascx" TagName="Cat" TagPrefix="PCat" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager> 
        <div>
            <PCat:Cat ID="listCat" runat="server" />
        </div>
        <asp:GridView ID="gvShowCart" runat="server" AutoGenerateColumns="False" DataKeyNames="iProdID" OnRowDeleting="gvShowCart_RowDeleting" OnSelectedIndexChanged="gvShowCart_SelectedIndexChanged" Height="259px">
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
                        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images/d.jpg" CommandName="DeleteRow" CommandArgument='<%# Eval("iProdID") %>' ToolTip="Delete"  />

                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>
        <asp:Label ID="lblTotalPrice" runat="server" Text="Total Price"></asp:Label>
        <p>
            <asp:Button ID="btnBuy" runat="server" OnClick="btnBuy_Click" Text="Buy Now" />
        </p>    
        <div class="address-section">   <%--<asp:ImageField DataImageUrlField="vImagePath" HeaderText="Image">
                    <ControlStyle Width="100px" Height="100px" />
                </asp:ImageField>--%>
            <uc:SignInControl ID="SignInCtrl" runat="server" Visible="false" />
            <asp:Panel ID="PanelPincheck" runat="server" Visible="False" Height="474px">    <%--static panel--%>
                <br />

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Label ID="lblWelcome" runat="server" Text="Welcome"></asp:Label>
                 <br />
                 <br />
                 &nbsp;

                 <asp:Label ID="lblP" runat="server" Text="Enter PinCode "></asp:Label>
                 &nbsp;<asp:TextBox ID="txtPincode" runat="server"></asp:TextBox>
                 &nbsp;&nbsp;&nbsp;&nbsp;
                 <asp:Button ID="btnPincheck" runat="server" Height="24px" OnClick="btnPincheck_Click1" Text="Check Delivery" Width="125px" AutoPostBack ="true" />
                 &nbsp; &nbsp;
                 <asp:Label ID="lbldelivery" runat="server"></asp:Label>
                 <br />
                 <asp:UpdatePanel ID="PanelDeliveryDetails" runat="server" UpdateMode="Conditional" Visible="False">
                     <ContentTemplate>
                         <br />
                         <br />
                         <asp:Label ID="lblship" runat="server" Text="Shipping Address"></asp:Label>
                         &nbsp; &nbsp;
                         <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                         <br />
                         <br />
                         <asp:DropDownList ID="dropdownPaymentMethod" runat="server" AutoPostBack="true" Height="29px" OnSelectedIndexChanged="dropdownPaymentMethod_SelectedIndexChanged1" Width="141px">
                             <asp:ListItem Value="COD">Cash On Delivery</asp:ListItem>
                             <asp:ListItem Value="CreditCard">Credit Card</asp:ListItem>
                         </asp:DropDownList>
                         &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnPayment" runat="server" Height="22px" OnClick="btnPayment_Click" Text="Make Payment" Width="107px" />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;&nbsp;
                         <asp:Label ID="lblMsg" runat="server"></asp:Label>
                         <br />
                         <br />
                         <br />
                         <br />
                         <br />
                         <asp:UpdatePanel ID="UpdatePanelCc" runat="server" Visible="False">
                             <ContentTemplate>
                                 <asp:TextBox ID="txtcardNumber" runat="server" OnTextChanged="txtcardNumber_TextChanged" TextMode="Number" Width="144px" AutoPostBack="True"></asp:TextBox>
                                 <asp:Label ID="lblcardcompany" runat="server"></asp:Label>
                                 <br />
                                 <br />
                                 <asp:TextBox ID="txtcardexpiry" runat="server" Height="16px" TextMode="Month" Width="123px" AutoPostBack="True" OnTextChanged="txtcardexpiry_TextChanged"></asp:TextBox>
                                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                 <asp:Button ID="btnSaveCard" runat="server" Height="22px" OnClick="btnSaveCard_Click" Text="Save Card" Width="77px" />
                                 <br />
                             </ContentTemplate>
                         </asp:UpdatePanel>
                         <br />
                         &nbsp;&nbsp;
                         <br />
                         <br />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <br />
                     </ContentTemplate>
                 </asp:UpdatePanel>
                 <br />
                 <br />
                 <br />
                 <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    
                 <br />
                 <br />
                 <br />
                 
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
                 <br />
            </asp:Panel>
        <br />
        <br />  
      </div>
    </form>
    </body>

</html>
