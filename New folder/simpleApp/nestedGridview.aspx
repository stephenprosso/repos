<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="nestedGridview.aspx.cs" Inherits="simpleApp.nestedGridview" %>

<%@ Register Assembly="DevExpress.Web.v17.2, Version=17.2.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script>
        //1.change to make
        function updateDetailGrids(s, e) {
            console.log('update Grid triggered!');
            DetailGridview.PerformCallback();
            AllocationDetailGridview.PerformCallback();

        }
        function updateAllocationGrid(s, e) {
            console.log('update Grid triggered!');
            AllocationDetailGridview.PerformCallback();
        }
        //function updateDetailGrids(s, e) {
        //    var keVal = s.GetRowKey(s.GetFocusedRowIndex());
        //    DetailGridview.PerformCallback(keVal);
        //}

        //function updateAllocationGrid(s, e) {
        //    var keVal = s.GetRowKey(s.GetFocusedRowIndex());
        //    AllocationDetailGridview.PerformCallback(keVal);
        //}
    </script>
    <div class="row text-center">
        <h2><%: Title %></h2>
    </div>
    <div class="row">
        <div class="col-md text-center">
            <dx:ASPxGridView ID="HeaderGridview" runat="server" DataSourceID="HeaderDS" AutoGenerateColumns="False" KeyFieldName="Order_Number" CssClass="centered" ClientInstanceName="grid">
                <SettingsPager Visible="true" />

                <Settings ShowTitlePanel="true" ShowFilterRow="true" />
                <SettingsText Title="Order Header" />
                <SettingsBehavior AllowFocusedRow="true" FilterRowMode="Auto" AllowClientEventsOnLoad="false" />
                <ClientSideEvents FocusedRowChanged="updateDetailGrids" />
                <SettingsDataSecurity AllowEdit="False" AllowInsert="False" AllowDelete="False"></SettingsDataSecurity>
                <Styles Header-Wrap="True" Cell-HorizontalAlign="Center">
                </Styles>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Order_Number" ReadOnly="True" VisibleIndex="0" Caption="Order Number"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Order_Type" VisibleIndex="1" Caption="Order Type"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Order_Priority" VisibleIndex="2" Caption="Order Priority"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Order_Status" VisibleIndex="3" Caption="Order Status"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Pack_Type" VisibleIndex="4" Caption="Pack Type"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="Downloaded_Date" VisibleIndex="5" Caption="Downloaded Date">
                        <PropertiesDateEdit DisplayFormatString="G"></PropertiesDateEdit>
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="Start_Process_Date" VisibleIndex="6" Caption="Start Process Date">
                        <PropertiesDateEdit DisplayFormatString="G"></PropertiesDateEdit>
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Start_Process_Time" VisibleIndex="7" Caption="Start Process Time">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Batch_Number" VisibleIndex="8" Caption="Batch Number"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="BatchPosition" VisibleIndex="9" Caption="Batch Position"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="Complete_Process_Date" VisibleIndex="10" Caption="Complete Process Date"></dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="Uploaded_Date" VisibleIndex="11" Caption="Uploaded Date">
                        <PropertiesDateEdit DisplayFormatString="G"></PropertiesDateEdit>
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="Upload_File_Name" VisibleIndex="12" Caption="Upload File Name"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Door_ID" VisibleIndex="13" Caption="Door ID"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Interrupt_Order" VisibleIndex="14" Caption="Interrupt Order"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataTextColumn FieldName="Label_Counter" VisibleIndex="15" Caption="Label Counter"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="User_Name" VisibleIndex="16" Caption="User Name"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataCheckColumn FieldName="Big_Order" VisibleIndex="17" Caption="Big Order"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="Small_Order" VisibleIndex="18" Caption="Small Order"></dx:GridViewDataCheckColumn>
                    <dx:GridViewDataCheckColumn FieldName="Single_Allocation_Order" VisibleIndex="19" Caption="Single Allocation Order"></dx:GridViewDataCheckColumn>
                </Columns>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="HeaderDS"
                runat="server"
                ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
                ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
                SelectCommand="SELECT * FROM [Order_Header]"></asp:SqlDataSource>
        </div>
    </div>
    <br />
    <div class="row">
            <%--            2. put this back in your detail grid view
             OnBeforePerformDataSelect="DetailGrid_BeforePerformDataSelect"--%>
            <dx:ASPxGridView ID="DetailGridview" runat="server" DataSourceID="DetailDS" AutoGenerateColumns="False" KeyFieldName="Container_ID"
                OnCustomCallback="DetailGridview_CustomCallback" ClientInstanceName="DetailGridview" CssClass="centered">
                <Settings ShowTitlePanel="true" ShowFilterRow="true" />
                <SettingsText Title="Container Details" />
                <Styles Header-Wrap="True" Cell-HorizontalAlign="Center" />
                <SettingsPager Visible="true" />
                <SettingsBehavior AllowFocusedRow="true" FilterRowMode="Auto" AllowClientEventsOnLoad="false" />
                <ClientSideEvents FocusedRowChanged="updateAllocationGrid" />
                <SettingsDataSecurity AllowEdit="False" AllowInsert="False" AllowDelete="False" />
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Order_Number" VisibleIndex="0" Caption="Order Number"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Container_ID" ReadOnly="True" VisibleIndex="1" Caption="Container ID"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Zone_Grouping" VisibleIndex="2" Caption="Zone Grouping"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Container_Size" VisibleIndex="3" Caption="Container Size"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="LPN" VisibleIndex="4" Caption="LPN"></dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Container_Seq_#" ReadOnly="True" VisibleIndex="5" Caption="Container Seq #">
                        <EditFormSettings Visible="False"></EditFormSettings>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsDetail ShowDetailRow="true" ShowDetailButtons="true" />
                <Templates>
                    <DetailRow>

                        <dx:ASPxGridView ID="AllocationDetailGridview" runat="server" DataSourceID="AllocationDetailDS" AutoGenerateColumns="False" KeyFieldName="seq_#" ClientInstanceName="AllocationDetailGridview"
                            OnBeforePerformDataSelect="AllocationDetailGridview_BeforePerformDataSelect">
                            <Settings ShowTitlePanel="true" ShowFilterRow="true" />
                            <SettingsText Title="Allocation Details" />
                            <Styles Header-Wrap="True" Cell-HorizontalAlign="Center" />
                            <SettingsPager Visible="true" />
                            <SettingsBehavior FilterRowMode="Auto" AllowClientEventsOnLoad="false" />
                            <SettingsDataSecurity AllowEdit="False" AllowInsert="False" AllowDelete="False" />
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
                                <dx:GridViewDataTextColumn FieldName="seq_#" ReadOnly="True" VisibleIndex="19" Caption="seq #">
                                    <EditFormSettings Visible="False"></EditFormSettings>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:ASPxGridView>


                    </DetailRow>
                </Templates>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="DetailDS"
                runat="server"
                ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
                ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
                SelectCommand="SELECT * FROM [Container_Header] WHERE ([Order_Number] = ?)">
                <SelectParameters>
                    <%-- 3. change your select parameter--%>
                    <%--<asp:SessionParameter DefaultValue="0" Name="Order_Number"
                        SessionField="Order_Number" Type="string" />--%>
                    <asp:Parameter Name="Order_Number" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource
                ID="AllocationDetailDS"
                runat="server"
                ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
                ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
                SelectCommand="select * from Allocation_Tote_Assignment where Container_ID = ?">
                <SelectParameters>
                    <%--4. change you select parameter to a session parameter--%>
                    <%--I am trying to pass both of these paramters to the sql data source but cannot in the code behind.--%>
                    <asp:SessionParameter DefaultValue="0" Name="Container_ID"
                        SessionField="Container_ID" Type="string" />


                </SelectParameters>

            </asp:SqlDataSource>
    </div>

</asp:Content>
