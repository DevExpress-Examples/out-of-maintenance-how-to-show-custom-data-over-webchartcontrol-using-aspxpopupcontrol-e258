using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

public partial class _Default : System.Web.UI.Page {
	string headerText = null;
    protected void Page_Load(object sender, EventArgs e) {
    }
    protected void ASPxCallbackPanel1_Callback(object source, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e) {
        String param = e.Parameter.Replace("'", "''");
        AccessDataSource1.SelectCommand = "SELECT * FROM [Products] WHERE ProductName = '" + param + "'";
        IEnumerable data = AccessDataSource1.Select(DataSourceSelectArguments.Empty);
        foreach(DataRowView row in data) {
            ASPxLabel1.Text = "Price: " + row["UnitPrice"].ToString();
            ASPxLabel2.Text = "Units in Stock: " + row["UnitsInStock"].ToString();
			headerText = row["ProductName"].ToString();
            break;
        }
    }
	protected void ASPxCallbackPanel1_CustomJSProperties(object sender, DevExpress.Web.ASPxClasses.CustomJSPropertiesEventArgs e) {
		if(headerText != null)
			e.Properties.Add("cpHeaderText", headerText);
	}
}