<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="simpleApp.WebForm2" %>

<%@ Register Assembly="DevExpress.XtraCharts.v19.1.Web, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>
<%@ Register TagPrefix="dx" Namespace="DevExpress.XtraCharts" Assembly="DevExpress.XtraCharts.v19.1, Version=19.1.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">



 <div class="row text-center">
        <h1>Cart Activity</h1>
    </div>
    <div class="row">

<%--        THE SQL DATA SOURCE FOR THIS CHART RETURNS 5 FIELDS. THE SECOND FIELD IS THE USER NAME ASSOCIATED WITH THE CART_ID.
        CURRENTLY THE CART_ID IS DISPLAYED IN THE LEGEND, BUT I NEED TO SAY THE USER AND OR USER + CART_ID. 
        I CANNOT FIGURE OUT WHAT SETS THE VALUE IF I WERE TO SET THE LEGEND TEXT PATTERN TO {v}--%>
        <dx:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True" Height="360px" Width="640px" Style="margin-bottom: 0px" DataSourceID="SqlDataSource1" CssClass="centered">
            <DiagramSerializable>
                <dx:XYDiagram>
                    <AxisX Visibility="True" Title-Text="Cart" VisibleInPanesSerializable="-1" Title-Visibility="True">
                        <QualitativeScaleOptions AutoGrid="False" />
                        <Tickmarks MinorLength="1" />

                    </AxisX>

                    <AxisY VisibleInPanesSerializable="-1" Title-Visibility="True" Title-Text="Picks Remaining">
                    </AxisY>
                </dx:XYDiagram>
            </DiagramSerializable>

            <Legend Name="Default Legend"></Legend>

            <SeriesSerializable>

                <dx:Series Name="Picks Remaining" ArgumentDataMember="Cart_ID" ArgumentScaleType="Qualitative" CrosshairEnabled="True"
                    LabelsVisibility="True" ValueDataMembersSerializable="Remaining Picks" LegendTextPattern="{A}-{user_name}" LegendText="Remaining" ShowInLegend="true">
                    <ViewSerializable>
                        <dx:SideBySideBarSeriesView ColorEach="True">
                        </dx:SideBySideBarSeriesView>
                    </ViewSerializable>
                </dx:Series>

            </SeriesSerializable>
            <Titles>
                <dx:ChartTitle Tag="true" Text="Active Carts - Picks Remianing" />
            </Titles>
        </dx:WebChartControl>
    </div>
    <br />
    <div class="row text-center">


        <dx:WebChartControl ID="WebChartControl2" runat="server" CrosshairEnabled="True" Height="360px" Width="640px" Style="margin-bottom: 0px" DataSourceID="SqlDataSource1" CssClass="centered">
            <DiagramSerializable>
                <dx:XYDiagram>
                    <AxisX Visibility="True" Title-Text="Cart" VisibleInPanesSerializable="-1" Title-Visibility="True">
                        <QualitativeScaleOptions AutoGrid="False" />
                        <Tickmarks MinorLength="1" />

                    </AxisX>

                    <AxisY VisibleInPanesSerializable="-1" Title-Visibility="True" Title-Text="Picks Per Hour">
                    </AxisY>
                </dx:XYDiagram>
            </DiagramSerializable>

            <Legend Name="Default Legend"></Legend>

            <SeriesSerializable>

                <dx:Series Name="Picks Per Hour" ArgumentDataMember="Cart_ID" ArgumentScaleType="Qualitative" CrosshairEnabled="True"
                    LabelsVisibility="True" ValueDataMembersSerializable="Picks Per Hour" LegendTextPattern="{A}" LegendText="Per Hr." ShowInLegend="true">
                    <ViewSerializable>
                        <dx:SideBySideBarSeriesView ColorEach="True">
                        </dx:SideBySideBarSeriesView>
                    </ViewSerializable>
                </dx:Series>
            </SeriesSerializable>
            <Titles>
                <dx:ChartTitle Tag="true" Text="Active Carts - Current Picks Per Hour" />
            </Titles>
        </dx:WebChartControl>

        <%--              <dx:WebChartControl ID="WebChartControl2" runat="server"  CrosshairEnabled="True" Height="360px" Width="640px" style="margin-bottom: 0px">

                    <DiagramSerializable>
                       
                        <dx:XYDiagram>
                            <axisx visibleinpanesserializable="-1" Title-Text="Zone" Title-Visibility="True">
                                <QualitativeScaleOptions AutoGrid="False" />
                                <Tickmarks MinorLength="1" />
                            </axisx>
                            <axisy visibleinpanesserializable="-1" Title-Text="Lines" Title-Visibility="True">
                            </axisy>
                        </dx:XYDiagram>
                    </DiagramSerializable>
                    <Legend  Visibility="False"></Legend>
                    <SeriesSerializable>
                        <dx:Series ArgumentDataMember="zone" ArgumentScaleType="Qualitative" CrosshairEnabled="True" 
                            LabelsVisibility="True" Name="WorkRemaining" ValueDataMembersSerializable="Num_Open_Cycle_Counts">
                            <ViewSerializable>
                                <dx:SideBySideBarSeriesView ColorEach="True">
                                </dx:SideBySideBarSeriesView>
                            </ViewSerializable>
                        </dx:Series>
                    </SeriesSerializable>
                    <SeriesTemplate LabelsVisibility="True">
                    </SeriesTemplate>
                    <Titles>
                        <dx:ChartTitle Text="Open Cycle Count Lines" />
                    </Titles>
                </dx:WebChartControl>--%>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString='<%$ ConnectionStrings:ConnectToPoweredPik %>'
            ProviderName='<%$ ConnectionStrings:ConnectToPoweredPik.ProviderName %>'
            SelectCommand="exec sp_cart_activity_dashboard_data"></asp:SqlDataSource>
    </div>

</asp:Content>

