<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PTLBrowse.aspx.cs" Inherits="simpleApp.PTLBrowse" %>

<%@ Register Assembly="DevExpress.Web.v19.1, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <script type="text/javascript">
        function updateDetailGrids(s, e) {
            console.log('update Grid triggered!');
            DetailGridview.PerformCallback();
            AllocationGridview.PerformCallback();
        }
    </script>


    <div class="row text-center">
        <h2><%: Title %></h2>

    </div>
    <div class="row text-center">
        <dx:ASPxGridView ID="HeaderGridview" runat="server" DataSourceID="HeaderDS" AutoGenerateColumns="False" KeyFieldName="Batch_Number" CssClass="centered">
            <SettingsPager Visible="true" />

            <Settings ShowFilterRow="True" ShowTitlePanel="true"></Settings>
            <SettingsDataSecurity AllowEdit="False" AllowInsert="False" AllowDelete="False"></SettingsDataSecurity>
            <ClientSideEvents FocusedRowChanged="updateDetailGrids" />
            <SettingsBehavior AllowFocusedRow="true" FilterRowMode="Auto" AllowClientEventsOnLoad="false" />
            <SettingsText Title="Pick To Label Header" />

            <Styles Header-Wrap="True" Cell-HorizontalAlign="Center">
            </Styles>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Batch_Number" VisibleIndex="0" ReadOnly="True" Caption="Batch Number">
                    <EditFormSettings Visible="False"></EditFormSettings>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Batch_Type" VisibleIndex="1" Caption="Batch Type"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Number_of_Containers" VisibleIndex="2" Caption="Number of Containers"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Bucket_Name" VisibleIndex="3" Caption="Bucket Name"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Bucket_Position" VisibleIndex="4" Caption="Bucket Position"></dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Create_Date" VisibleIndex="5" Caption="Create Date">
                    <PropertiesDateEdit DisplayFormatString="G"></PropertiesDateEdit>
                </dx:GridViewDataDateColumn>

                <dx:GridViewDataTextColumn FieldName="Create_User" VisibleIndex="6" Caption="Create User"></dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Completed_Date" VisibleIndex="7" Caption="Completed Date">
                    <PropertiesDateEdit DisplayFormatString="G"></PropertiesDateEdit>
                </dx:GridViewDataDateColumn>

                <dx:GridViewDataTextColumn FieldName="Completed_User" VisibleIndex="8" Caption="Completed User"></dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>

        <asp:SqlDataSource ID="HeaderDS"
            runat="server"
            ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
            ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
            SelectCommand="SELECT * FROM [LabelPrinting_Batch_Header] order by Batch_Number"></asp:SqlDataSource>
    </div>

    <br />

    <%--start detail gridview--%>

    <div class="row text-center">

        <dx:ASPxGridView ID="DetailGridview" runat="server" CssClass="centered" DataSourceID="DetailDS"
            AutoGenerateColumns="False" OnCustomCallback="DetailGridview_CustomCallback" ClientInstanceName="DetailGridview" KeyFieldName="ATA_Seq_#">
            <Settings ShowFilterRow="True" ShowTitlePanel="true"></Settings>
            <SettingsDataSecurity AllowEdit="False" AllowInsert="False" AllowDelete="False"></SettingsDataSecurity>
            <SettingsBehavior FilterRowMode="Auto" AllowClientEventsOnLoad="false" />
            <ClientSideEvents FocusedRowChanged="updateDetailGrids" />
            <SettingsText Title="Pick To Label Details" />
            <Styles Header-Wrap="True" Cell-HorizontalAlign="Center">
            </Styles>
            <%--            <SettingsDetail AllowOnlyOneMasterRowExpanded="true" ShowDetailRow="true" />--%>
            <Columns>
                <dx:GridViewDataTextColumn FieldName="Batch_Number" VisibleIndex="0" Caption="Batch Number"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Sort" VisibleIndex="1" Caption="Sort"></dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="ATA_Seq_#" ReadOnly="True" VisibleIndex="2" Caption="ATA Seq #"></dx:GridViewDataTextColumn>
                <dx:GridViewDataCheckColumn FieldName="Printed" VisibleIndex="3" Caption="Printed"></dx:GridViewDataCheckColumn>
                <dx:GridViewDataTextColumn FieldName="Printed_User" VisibleIndex="4" Caption="Printed User"></dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="Printed_Date" VisibleIndex="5" Caption="Printed Date">
                    <PropertiesDateEdit DisplayFormatString="G"></PropertiesDateEdit>
                </dx:GridViewDataDateColumn>
            </Columns>
           <%-- 
               <%--Start NESTED GRIDVIEW--%>
            <SettingsDetail ShowDetailRow="true" ShowDetailButtons="true" />

            <Templates>
                <DetailRow>
                    <dx:ASPxGridView ID="AllocationGridview" runat="server" DataSourceID="AllocationGridviewDS" AutoGenerateColumns="False" KeyFieldName="seq_#" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect"
                        OnCustomCallback="AllocationGridview_CustomCallback" ClientInstanceName="AllocationGridview">
                        <Settings ShowTitlePanel="true"></Settings>
                        <SettingsDataSecurity AllowEdit="false" AllowInsert="False" AllowDelete="False"></SettingsDataSecurity>
                        <%--            <SettingsBehavior AllowFocusedRow="true" FilterRowMode="Auto" AllowClientEventsOnLoad="false" />
            <ClientSideEvents FocusedRowChanged="updateDetailGrids" />--%>
                        <SettingsText Title="Allocations" />
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
                            <dx:GridViewDataDateColumn FieldName="Picked_Date" VisibleIndex="16" Caption="Picked Date">
                                <PropertiesDateEdit DisplayFormatString="G"></PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Picked_User" VisibleIndex="17" Caption="Picked User"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Picked_Cart" VisibleIndex="18" Caption="Picked Cart"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="seq_#" ReadOnly="True" VisibleIndex="19" Caption="seq #">
                                <EditFormSettings Visible="False"></EditFormSettings>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Batch_Number" VisibleIndex="20" Caption="Batch Number" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Sort" VisibleIndex="21" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ATA_Seq_#" ReadOnly="True" VisibleIndex="22" Caption="ATA Seq #" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataCheckColumn FieldName="Printed" VisibleIndex="23" Caption="Printed" Visible="false"></dx:GridViewDataCheckColumn>
                            <dx:GridViewDataTextColumn FieldName="Printed_User" VisibleIndex="24" Caption="Printed User" Visible="false"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="Printed_Date" VisibleIndex="25" Caption="Printed Date" Visible="false"></dx:GridViewDataDateColumn>
                        </Columns>
                    </dx:ASPxGridView>

                </DetailRow>
            </Templates>--%>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="DetailDS" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
            ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
            SelectCommand="SELECT * FROM [LabelPrinting_Batch_Detail] WHERE ([Batch_Number] = ?)">
            <SelectParameters>
                <asp:Parameter Name="Batch_Number" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />

    <div class="row text-center">


        <asp:SqlDataSource
            ID="AllocationGridviewDS"
            runat="server"
            ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
            ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
            SelectCommand="select * from Allocation_Tote_Assignment ata, LabelPrinting_Batch_Detail lpbd where ata.seq_# = lpbd.ATA_Seq_# and lpbd.ATA_Seq_# = ? ">
            <SelectParameters>
                <asp:SessionParameter DefaultValue="0" Name="ATA_Seq_#"
                    SessionField="ATA_Seq_#" Type="string" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
   
</asp:Content>
