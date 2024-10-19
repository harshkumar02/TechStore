<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="WebDemo.Shop" %>
<%@ Register Src="~/WebUserControl1.ascx" TagName="Cat" TagPrefix="PCat" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
              
   
<title></title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>
           --%> <PCat:Cat ID="listCat" runat="server" />
        </div>

            <asp:ListView ID="lstProduct" runat="server" DataKeyNames="iProdId" GroupItemCount="3" OnSelectedIndexChanged="lstProduct_SelectedIndexChanged" >
                
                                                          
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
               
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
               
               
                <ItemTemplate>
                    <td runat="server" style=""><%--iProdID--%>
                        <%--<asp:Label ID="iProdIDLabel" runat="server" Text='<%# Eval("iProdID") %>' />
                        <br />
                        
                        <asp:Label ID="iCatIDLabel" runat="server" Text='<%# Eval("iCatID") %>' />
                        <br />--%>
                        
                        <asp:Label ID="cPNameLabel" runat="server" Text='<%# Eval("cPName") %>' />
                        

                        <br />
                         <asp:Image ID="Image2" runat="server" width="50px" ImageUrl ='<%# Eval("vImagePath") %>'/>
                        <br />
                       
                        
                        <asp:Label ID="vDescLabel" runat="server" Text='<%# Eval("vDesc") %>' />
                        <br />
                        
                        <asp:Label ID="vBrandLabel" runat="server" Text='<%# Eval("vBrand") %>' />
                        <br />
                       
                        <p>
                            <%# Eval("OfferPrice") == DBNull.Value || Convert.ToDecimal(Eval("OfferPrice")) == 0 ? 
                            $"<span>{Eval("iPrice", "{0:C}")}</span>" : 
                            $"<span style='text-decoration: line-through; color: red;'>{Eval("iPrice", "{0:C}")}</span> <span style='color: green;'>{Eval("OfferPrice", "{0:C}")}</span>" %>
                        </p>
                        
                       <%-- <asp:Label ID="iPriceLabel" runat="server" Text='<%# Eval("iPrice") %>' />
                        <br />
                        
                        <asp:Label ID="iQohLabel" runat="server" Text='<%# Eval("iQoh") %>' />
                        <br />--%>                   
            
                        <asp:Button ID="btnAdd" runat="server" Text="Add To Cart" OnClick="btnAdd_Click" CommandArgument='<%# Eval("iProdID") %>'  />
                       <%-- <asp:Image ID="Image1" runat="server" width="50px" ImageUrl ='<%# Eval("vImagePath") %>'/>--%>

                        
                       <%-- <asp:Label ID="vImagePathLabel" runat="server" Text='<%# Eval("vImagePath") %>' />--%>
                        <br />
                       
                    </td>
                </ItemTemplate>
                
                
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                    <tr id="groupPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
               
               
            </asp:ListView>
      <%--  <asp:SqlDataSource ID="ShopDB" runat="server" ConnectionString="<%$ ConnectionStrings:ShopConnectionString %>" SelectCommand="SELECT * FROM [Product]"></asp:SqlDataSource>--%>

    </form>
</body>
</html>