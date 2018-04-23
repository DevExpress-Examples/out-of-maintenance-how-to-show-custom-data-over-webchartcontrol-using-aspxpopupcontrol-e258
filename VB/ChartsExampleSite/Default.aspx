<%@ Page Language="vb" AutoEventWireup="true"  CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%-- BeginRegion TagPrefix and page properties --%>
<%@ Register Assembly="DevExpress.XtraCharts.v8.2, Version=8.2.0.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
	Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Assembly="DevExpress.Web.v8.2, Version=8.2.0.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
	Namespace="DevExpress.Web.ASPxCallbackPanel" TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v8.2, Version=8.2.0.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
	Namespace="DevExpress.Web.ASPxPanel" TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.2, Version=8.2.0.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
	Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dxe" %>
<%@ Register Assembly="DevExpress.Web.v8.2, Version=8.2.0.0, Culture=neutral, PublicKeyToken=9B171C9FD64DA1D1"
	Namespace="DevExpress.Web.ASPxPopupControl" TagPrefix="dxpc" %>

<%@ Register Assembly="DevExpress.XtraCharts.v8.2.Web"
	Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.XtraCharts.v8.2"
	Namespace="DevExpress.XtraCharts" TagPrefix="cc2" %>

<%@ Register Assembly="DevExpress.Web.v8.2" Namespace="DevExpress.Web.ASPxCallback"
	TagPrefix="dxcb" %>

<%@ Register Assembly="DevExpress.Web.v8.2" Namespace="DevExpress.Web.ASPxPopupControl"
	TagPrefix="dxpc" %>

<%@ Register Assembly="DevExpress.Web.v8.2" Namespace="DevExpress.Web.ASPxCallbackPanel"
	TagPrefix="dxcp" %>
<%@ Register Assembly="DevExpress.Web.v8.2" Namespace="DevExpress.Web.ASPxPanel"
	TagPrefix="dxp" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v8.2" Namespace="DevExpress.Web.ASPxEditors"
	TagPrefix="dxe" %>
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
			DiagramTypeName="XYDiagram" EnableClientSideAPI="True" Height="500px" Width="1000px">
			<SeriesSerializable>
				<cc2:Series ArgumentDataMember="ProductName" LabelTypeName="SideBySideBarSeriesLabel"
					Name="Series 1" PointOptionsTypeName="PointOptions" SeriesViewTypeName="SideBySideBarSeriesView"
					ValueDataMembersSerializable="UnitPrice">
					<view hiddenserializablestring="to be serialized"></view>
					<label hiddenserializablestring="to be serialized" overlappingoptionstypename="OverlappingOptions">
						<fillstyle filloptionstypename="SolidFillOptions">
<Options HiddenSerializableString="to be serialized"></Options>
</fillstyle>
					</label>
					<pointoptions hiddenserializablestring="to be serialized"></pointoptions>
					<legendpointoptions hiddenserializablestring="to be serialized"></legendpointoptions>
				</cc2:Series>
			</SeriesSerializable>
			<SeriesTemplate LabelTypeName="SideBySideBarSeriesLabel" PointOptionsTypeName="PointOptions"
				SeriesViewTypeName="SideBySideBarSeriesView">
				<PointOptions HiddenSerializableString="to be serialized">
				</PointOptions>
				<Label HiddenSerializableString="to be serialized" OverlappingOptionsTypeName="OverlappingOptions">
					<FillStyle FillOptionsTypeName="SolidFillOptions">
						<Options HiddenSerializableString="to be serialized" />
					</FillStyle>
				</Label>
				<LegendPointOptions HiddenSerializableString="to be serialized">
				</LegendPointOptions>
				<View HiddenSerializableString="to be serialized">
				</View>
			</SeriesTemplate>
			<Diagram>
				<axisx visibleinpanesserializable="-1">
<Label Angle="-90"></Label>

<Range SideMarginsEnabled="True"></Range>
</axisx>
				<axisy visibleinpanesserializable="-1">
<Range SideMarginsEnabled="True"></Range>
</axisy>
			</Diagram>
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
			<FillStyle FillOptionsTypeName="SolidFillOptions">
				<Options HiddenSerializableString="to be serialized" />
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
