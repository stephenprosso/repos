<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ConsolidationBrowse.aspx.cs" Inherits="simpleApp.ConsolidationBrowse" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <script type="text/javascript">
        function updateDetailGridview(s, e) {
            console.log('update Grid triggered!');
            DetailGridview.PerformCallback();
        }

    </script>
    <div class="row text-center">
        <h2><%: Title %></h2>
    </div>
    <div class="row text-center">
        <dx:ASPxGridView ID="HeaderGridview" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" KeyFieldName="Location" CssClass="centered">
            <Settings ShowTitlePanel="true" ShowFilterRow="true" />
            <SettingsText Title="Consolidation Location Header" />
            <SettingsBehavior AllowFocusedRow="true" FilterRowMode="Auto" AllowClientEventsOnLoad="false" />
            <ClientSideEvents FocusedRowChanged="updateDetailGridview" />
            <Styles Header-Wrap="True" Cell-HorizontalAlign="Center" />
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Location" ReadOnly="True" VisibleIndex="0" Caption="Location"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Cell_Size" VisibleIndex="1" Caption="Cell Size"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Order_Number" VisibleIndex="2" Caption="Order Number"></dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Location_Full" VisibleIndex="3" Caption="Location Full"></dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Consolidation_Status" VisibleIndex="4" Caption="Consolidation Status"></dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Initial_Consolidation_Eventtime" VisibleIndex="5" Caption="Initial Consolidation Eventtime"></dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="Initial_Consolidation_User" VisibleIndex="6" Caption="Initial Consolidation User"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Sort_Path" VisibleIndex="7" Caption="Sort Path"></dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
            ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
            SelectCommand="SELECT * FROM [Consolidation_Location_Header]"></asp:SqlDataSource>
    </div>
    <br />
    <div class="row text-center">

        <dx:ASPxGridView
            ID="DetailGridview"
            runat="server"
            ClientInstanceName="DetailGridview"
            AutoGenerateColumns="False"
            DataSourceID="DetailDS"
            KeyFieldName="ATA_Seq_#"
            CssClass="centered"
            OnCustomCallback="DetailGridview_CustomCallback">
            <Settings ShowTitlePanel="true" ShowFilterRow="true" />
            <SettingsBehavior FilterRowMode="Auto" AllowClientEventsOnLoad="false" />
            <ClientSideEvents FocusedRowChanged="updateDetailGridview" />

            <SettingsText Title="Consolidation Location Details" />
            <Columns>

                <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="0" Caption="Location"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Order_Number" VisibleIndex="1" Caption="Order Number"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Container_ID" VisibleIndex="2" Caption="Container ID"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="LPN" VisibleIndex="3" Caption="LPN"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ATA_Seq_#" VisibleIndex="4" Caption="ATA Seq #"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Consolidation_User" VisibleIndex="5" Caption="Consolidation User"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Consolidated_Qty" VisibleIndex="6" Caption="Consolidated Qty"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Consolidation_Seq_#" ReadOnly="True" VisibleIndex="7" Caption="Consolidation Seq #">
                    <EditFormSettings Visible="False"></EditFormSettings>
                </dx:GridViewDataTextColumn>
            </Columns>
            <%--<SettingsDetail ShowDetailRow="true" ShowDetailButtons="true" />--%>
            <%--START OF DETAIL ROW--%>
           <%-- <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="AllocationDetailGridview" runat="server" AutoGenerateColumns="False" CssClass="centered" ClientInstanceName="AllocationDetailGridview"
                        DataSourceID="AllocationDetailsDS" KeyFieldName="seq_#" OnBeforePerformDataSelect="AllocationDetailGridview_BeforePerformDataSelect">
                        <Settings ShowTitlePanel="true" />
                        <SettingsText Title="Allocation Details" />
                        <SettingsBehavior AllowClientEventsOnLoad="false" />
                        <Styles Header-Wrap="True" Cell-HorizontalAlign="Center">
                        </Styles>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Order_Number" VisibleIndex="0" Caption="Order Number"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Line_Number" VisibleIndex="1" Caption="Line Number"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Container_ID" VisibleIndex="2" Caption="Container ID"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PO_Number" VisibleIndex="3" Caption="PO Number"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Part_Number" VisibleIndex="4" Caption="Part Number"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Order_Quantity" VisibleIndex="5" Caption="Order Quantity"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Zone_Grouping" VisibleIndex="6" Caption="Zone Grouping"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Zone" VisibleIndex="7" Caption="Zone"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Host_Location" VisibleIndex="8" Caption="Host Location"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Sort_Path" VisibleIndex="9" Caption="Sort Path"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Tote_Number" VisibleIndex="10" Caption="Tote Number"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Alloc_Weight" VisibleIndex="11" Caption="Alloc Weight"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Alloc_Cube" VisibleIndex="12" Caption="Alloc Cube"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Alloc_Qty" VisibleIndex="13" Caption="Alloc Qty"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Picked_Qty" VisibleIndex="14" Caption="Picked Qty"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn FieldName="Picked_Flag" VisibleIndex="15" Caption="Picked Flag"></dx:GridViewDataCheckColumn>
                            <dx:GridViewDataDateColumn FieldName="Picked_Date" VisibleIndex="16" Caption="Picked Date"></dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Picked_User" VisibleIndex="17" Caption="Picked User"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Picked_Cart" VisibleIndex="18" Caption="Picked Cart"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="seq_#" ReadOnly="True" VisibleIndex="19" Caption="Seq #">
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Location" VisibleIndex="20" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Order_Number1" VisibleIndex="21" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Container_ID1" VisibleIndex="22" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="LPN" VisibleIndex="23" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ATA_Seq_#" VisibleIndex="24" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Consolidation_User" VisibleIndex="25" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Consolidated_Qty" VisibleIndex="26" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Consolidation_Seq_#" ReadOnly="True" VisibleIndex="27" Visible="false">
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>

                </DetailRow>
            </Templates>--%>
        </dx:ASPxGridView>
        <%--DATA SOURCE FOR DETAIL GRID--%>
        <asp:SqlDataSource ID="DetailDS" runat="server"
            ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
            ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
            SelectCommand="select cld.location, cld.order_number, cld.container_Id, cld.lpn, ata.line_number, ata.part_number, ata.order_quantity, ata.picked_qty, ata.host_location, ata.picked_flag, ata.picked_date, ata.picked_user, ata.picked_cart, cld.ata_seq_#, cld.Consolidation_User, cld.Consolidated_Qty, cld.Consolidation_Seq_# from consolidation_location_detail cld, allocation_tote_assignment ata where cld.ata_seq_# = ata.seq_# and (cld.Location = ?)">

            <SelectParameters>
                <asp:Parameter Name="Location" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
      <%--  <asp:SqlDataSource
            ID="AllocationDetailsDS"
            runat="server" ConnectionString='<%$ConnectionStrings:ConnectToPoweredPik %>'
            ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
            SelectCommand="SELECT * FROM [Allocation_Tote_Assignment] ata, Consolidation_Location_Detail cld WHERE ata.seq_# = cld.ATA_Seq_# and cld.ATA_Seq_# = ?">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="ATA_Seq_#"
                    SessionField="ATA_Seq_#" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>--%>

    </div>




</asp:Content>
