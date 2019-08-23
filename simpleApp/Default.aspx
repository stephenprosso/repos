<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="simpleApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

 <button onclick="myFunction()">Click me</button>
 <button id="Dash1Butt" Name="" onclick="myFunction2()">Click me</button>

<p id="demo"></p>

<script>
function myFunction() {
    document.getElementById("demo").innerHTML = "Hello World";
    document.getElementById("Dash1Butt").name = "Taco Truck";


}
</script>
</asp:Content>
