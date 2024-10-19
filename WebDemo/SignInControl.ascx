<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SignInControl.ascx.cs" Inherits="WebDemo.SignInControl" %>

<asp:TextBox ID="txtUserName" runat="server" placeholder="Enter Email to Sign In" TextMode="Email" Width="150px"></asp:TextBox>

<br />
<asp:Button ID="btnSignIn" runat="server" Text="Sign In" OnClick="btnSignIn_Click" />
<asp:Button ID="btnGuest" runat="server" Text="Continue as Guest"  OnClick="btnContinueAsGuest_Click" Width="123px" />
