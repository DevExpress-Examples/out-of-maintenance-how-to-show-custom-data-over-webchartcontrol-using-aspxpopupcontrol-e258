<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%-- BeginRegion TagPrefix and page properties --%>
<%@ Register Assembly="DevExpress.XtraCharts.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v13.1, Version=13.1.14.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a"
    Namespace="DevExpress.Web" TagPrefix="dxpc" %>

<%@ Register Assembly="DevExpress.XtraCharts.v13.1.Web"
    Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.XtraCharts.v13.1"
    Namespace="DevExpress.XtraCharts" TagPrefix="cc2" %>

<%@ Register Assembly="DevExpress.Web.v13.1" Namespace="DevExpress.Web"
    TagPrefix="dxcb" %>






<%-- EndRegion --%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <script>
    var pcX, pxY;
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" DataSourceID="AccessDataSource1"
             EnableClientSideAPI="True" Height="500px" Width="1000px">
            <SeriesSerializable>
                <cc2:Series ArgumentDataMember="ProductName" 
                    Name="Series 1"  
                    ValueDataMembersSerializable="UnitPrice">
                    <ViewSerializable>
<cc1:SideBySideBarSeriesView hiddenserializablestring="to be serialized"></cc1:SideBySideBarSeriesView>
</ViewSerializable>
                    <LabelSerializable>
<cc1:SideBySideBarSeriesLabel hiddenserializablestring="to be serialized">
                        <fillstyle >
<OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized"></cc1:SolidFillOptions>
</OptionsSerializable>
</fillstyle>
                    </cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
                    <PointOptionsSerializable>
<cc1:PointOptions hiddenserializablestring="to be serialized"></cc1:PointOptions>
</PointOptionsSerializable>
                    <LegendPointOptionsSerializable>
<cc1:PointOptions hiddenserializablestring="to be serialized"></cc1:PointOptions>
</LegendPointOptionsSerializable>
                </cc2:Series>
            </SeriesSerializable>
            <SeriesTemplate  
                >
                <PointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized">
                </cc1:PointOptions>
</PointOptionsSerializable>
                <LabelSerializable>
<cc1:SideBySideBarSeriesLabel HiddenSerializableString="to be serialized">
                    <FillStyle >
                        <OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized" />
</OptionsSerializable>
                    </FillStyle>
                </cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
                <LegendPointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized">
                </cc1:PointOptions>
</LegendPointOptionsSerializable>
                <ViewSerializable>
<cc1:SideBySideBarSeriesView HiddenSerializableString="to be serialized">
                </cc1:SideBySideBarSeriesView>
</ViewSerializable>
            </SeriesTemplate>
            <DiagramSerializable>
<cc1:XYDiagram>
                <axisx visibleinpanesserializable="-1">
<Label Angle="-90"></Label>

<Range SideMarginsEnabled="True"></Range>
</axisx>
                <axisy visibleinpanesserializable="-1">
<Range SideMarginsEnabled="True"></Range>
</axisy>
            </cc1:XYDiagram>
</DiagramSerializable>
            <ClientSideEvents ObjectSelected="function(s, e) { 
    if (e.hitInfo.inSeries) {
       var obj = e.additionalHitObject;
       if (obj != null){
           pcX = e.absoluteX;
           pcY = e.absoluteY;
           cbp.PerformCallback(obj.argument);
       }
    }
}" />
            <FillStyle >
                <OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized" />
</OptionsSerializable>
            </FillStyle>
        </dxchartsui:WebChartControl>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [Products]"></asp:AccessDataSource>
        &nbsp;
    <dxpc:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="pc">
        <ContentCollection>
<dxpc:PopupControlContentControl runat="server" Height="100%"><dxcp:ASPxCallbackPanel runat="server" ClientInstanceName="cbp" Width="200px" ID="ASPxCallbackPanel1" OnCallback="ASPxCallbackPanel1_Callback" OnCustomJSProperties="ASPxCallbackPanel1_CustomJSProperties">
<ClientSideEvents EndCallback="function(s, e) {
	pc.SetHeaderText(s.cpHeaderText);
	pc.ShowAtPos(pcX, pcY);
}"></ClientSideEvents>
<PanelCollection>
<dxp:PanelContent runat="server" _designerRegion="0">
                <dxe:ASPxLabel runat="server" Text="ASPxLabel" ID="ASPxLabel1"></dxe:ASPxLabel>


                            <br />
                            <dxe:ASPxLabel runat="server" Text="ASPxLabel" ID="ASPxLabel2"></dxe:ASPxLabel>


                        </dxp:PanelContent>
</PanelCollection>
</dxcp:ASPxCallbackPanel>
 </dxpc:PopupControlContentControl>
</ContentCollection>
    </dxpc:ASPxPopupControl>
    
    </form>
</body>
</html>
