<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="simpleApp.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>' ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>' SelectCommand="SELECT * FROM [Container_Header]"></asp:SqlDataSource>
</asp:Content>
