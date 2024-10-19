<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="WebDemo.ShoppingCart" %>
<%@ Register Src="~/SignInControl.ascx" TagName="SignInControl" TagPrefix="uc" %>
<%@ Register Src="~/WebUserControl1.ascx" TagName="Cat" TagPrefix="PCat" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shopping Cart</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
    
    
    <style>
        .buy-button {
            background-color: green;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
        }

        

       /* .default-button {
            background-color: lightgray;
            color: black;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
        }*/
    </style>
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
               <asp:TemplateField HeaderText="Delete">
                <ItemStyle HorizontalAlign="Center" />
        <ItemTemplate>
        <asp:ImageButton ID="btnDelete" runat="server" ImageUrl="~/Images/d.jpg" CommandName="Delete" CommandArgument='<%# Eval("iProdID") %>' ToolTip="Delete" />
    </ItemTemplate>
</asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblTotalPrice" runat="server" Text="Total Price"></asp:Label>
        <p>
            <asp:Button ID="btnBuy" runat="server" CssClass="buy-button" OnClick="btnBuy_Click" Text="Buy Now" />
        </p>
        <div class="address-section">
            <uc:SignInControl ID="SignInCtrl" runat="server" Visible="false" />
            <asp:Panel ID="PanelPincheck" runat="server" Visible="False" Height="474px">
                <br />
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Label ID="lblWelcome" runat="server" Text="Welcome"></asp:Label>
                        <br /><br />
                        <asp:Label ID="lblP" runat="server" Text="Enter PinCode "></asp:Label>
                        <asp:TextBox ID="txtPincode" runat="server"></asp:TextBox>
                        <asp:Button ID="btnPincheck" runat="server" CssClass="default-button" OnClick="btnPincheck_Click1" Text="Check Delivery" />
                        <asp:Label ID="lbldelivery" runat="server" Text=""></asp:Label>
                        <br />
                        <asp:UpdatePanel ID="PanelDeliveryDetails" runat="server" UpdateMode="Conditional" Visible="False">
                            <ContentTemplate>
                                <br />
                                <asp:Label ID="lblship" runat="server" Text="Shipping Address"></asp:Label>
                                <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                                <br /><br />
                                <asp:DropDownList ID="dropdownPaymentMethod" runat="server" AutoPostBack="true" Height="29px" OnSelectedIndexChanged="dropdownPaymentMethod_SelectedIndexChanged1" Width="141px">
                                    <asp:ListItem Value="COD">Cash On Delivery</asp:ListItem>
                                    <asp:ListItem Value="CreditCard">Credit Card</asp:ListItem>
                                </asp:DropDownList>
                                <asp:Button ID="btnPayment" runat="server" CssClass="default-button" OnClick="btnPayment_Click" Text="Make Payment" Height="38px" Width="156px" />
                                <asp:Label ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                                <br />
                                <asp:UpdatePanel ID="UpdatePanelCc" runat="server" Visible="False">
                                    <ContentTemplate>
                                        <br />
                                        <asp:TextBox ID="txtcardNumber" runat="server" OnTextChanged="txtcardNumber_TextChanged" TextMode="Number" Width="144px" AutoPostBack="True"></asp:TextBox>
                                        <asp:Label ID="lblcardcompany" runat="server" Text=""></asp:Label>
                                        <br /><br />
                                        <asp:TextBox ID="txtcardexpiry" runat="server" Height="16px" TextMode="Month" Width="123px" AutoPostBack="True" OnTextChanged="txtcardexpiry_TextChanged"></asp:TextBox>
                                        <asp:Button ID="btnSaveCard" runat="server" CssClass="default-button" OnClick="btnSaveCard_Click" Text="Save Card" />
                                    </ContentTemplate>
                                </asp:UpdatePanel>
                                <br />
                            </ContentTemplate>
                        </asp:UpdatePanel>
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </asp:Panel>
        </div>
        <script type="text/javascript">
            $(document).ready(function ()
            {
                $("#btnPincheck").click(function () {
                    var pinCode = $("#txtPincode").val();
                    if (!/^\d{6}$/.test(pinCode)) { // Example pattern for a 6-digit pin code
                        //alert("Please enter a valid 6-digit pin code.");
                        toastr.error("Please enter a valid 6-digit pin code.");
                        return false;
                    }
                });

                //$("#dropdownPaymentMethod").change(function () {
                //    if ($(this).val() === "CreditCard") {
                //        $("#UpdatePanelCc").show();
                //    } else {
                //        $("#UpdatePanelCc").hide();
                //    }
                //});saved successfully.");
                //    }
                //});
            });
        </script>
    </form>
</body>
</html>
