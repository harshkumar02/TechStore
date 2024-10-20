<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WebUserControl1.ascx.cs" Inherits="WebDemo.WebUserControl1" %>

<p style="background-color : dimgrey;">

    <asp:Label ID="MyShoppingCart" runat="server" Text="My Shopping Site" style ="font-size : 40px;color:black; "></asp:Label>

    <span style="float:right">
        <asp:Label ID="itemcount" runat="server" Text="0" style="float:right" Height="20px" Width="45px"></asp:Label>
        <asp:ImageButton ID="Image1" runat="server" Height="50px"   ImageUrl ="~/Images/cart.png" OnClick="Image1_Click" />
      </span>
    
</p>
<p>
    &nbsp;</p>
<asp:ListView ID="lstCat" runat="server" DataKeyNames="iCatID" >
    
    <EmptyDataTemplate>
        <table style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
            <tr>
                <td>No data was returned.</td>
            </tr>
        </table>
    </EmptyDataTemplate>
   
    <ItemTemplate>
        <td runat="server" style="background-color:#FFFBD6; color: #333333;">
           <%-- iCatID:
            <asp:Label ID="iCatIDLabel" runat="server" Text='<%# Eval("iCatID") %>' />
            <br />
            vDescription:--%>
            <a href ="Shop.aspx?cid=<%# Eval("iCatID") %>"  style="margin:30px">
            <asp:Label ID="vDescriptionLabel" runat="server" Text='<%# Eval("vDescription") %>' />
                </a>
            <br />
        </td>
    </ItemTemplate>
    <LayoutTemplate>
        <table runat="server" border="1" style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </table>
        <div style="text-align: center;background-color: #FFCC66; font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
        </div>
    </LayoutTemplate>
   
</asp:ListView>
