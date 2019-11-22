<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="simpleApp.WebForm1" %>

<%@ Register Assembly="DevExpress.Web.Bootstrap.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.Bootstrap" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Calendar ID="Calendar1" runat="server"></asp:Calendar>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>' ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>' SelectCommand="SELECT * FROM [Container_Header]"></asp:SqlDataSource>

    <dx:BootstrapCalendar ID="BootstrapCalendar1" runat="server"></dx:BootstrapCalendar>

</asp:Content>
