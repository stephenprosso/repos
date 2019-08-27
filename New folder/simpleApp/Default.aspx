<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="simpleApp._Default" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
 <script>
        function updateDetailGrids(s, e) {
            var keVal = s.GetRowKey(s.GetFocusedRowIndex());
            DetailGridview.PerformCallback(keVal);
        }

        function updateAllocationGrid(s, e) {
            var keVal = s.GetRowKey(s.GetFocusedRowIndex());            
            AllocationDetailGridview.PerformCallback(keVal);
        }
    </script>

  
    <div class="row">

    <dx:ASPxGridView ID="HeaderGridview" runat="server"></dx:ASPxGridView>

    </div>
        <div class="row">
            <dx:ASPxGridView ID="DetailGridview" runat="server"></dx:ASPxGridView>

    </div>    <div class="row">

        <dx:ASPxGridView ID="AllocationDetailGridview" runat="server"></dx:ASPxGridView>
    </div>

</asp:Content>
