<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="simpleApp._Default" %>

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


  



</asp:Content>
