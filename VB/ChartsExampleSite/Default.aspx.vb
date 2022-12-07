Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports System.Collections

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Private headerText As String = Nothing
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
	End Sub
	Protected Sub ASPxCallbackPanel1_Callback(ByVal source As Object, ByVal e As DevExpress.Web.CallbackEventArgsBase)
		AccessDataSource1.SelectCommand = "SELECT * FROM [Products] WHERE ProductName = '" & e.Parameter & "'"
		Dim data As IEnumerable = AccessDataSource1.Select(DataSourceSelectArguments.Empty)
		For Each row As DataRowView In data
			ASPxLabel1.Text = "Price: " & row("UnitPrice").ToString()
			ASPxLabel2.Text = "Units in Stock: " & row("UnitsInStock").ToString()
			headerText = row("ProductName").ToString()
			Exit For
		Next row
	End Sub
	Protected Sub ASPxCallbackPanel1_CustomJSProperties(ByVal sender As Object, ByVal e As DevExpress.Web.CustomJSPropertiesEventArgs)
		If Not headerText Is Nothing Then
			e.Properties.Add("cpHeaderText", headerText)
		End If
	End Sub
End Class