using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace simpleApp
{
    public partial class nestedGridview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DetailDS.SelectParameters["Order_Number"].DefaultValue = FocusedContainerID();
            DetailGridview.DataBind();


        }

        protected void DetailGridview_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            DetailDS.SelectParameters["Order_Number"].DefaultValue = FocusedContainerID();

            DetailGridview.DataBind();
        }

        private string FocusedContainerID()
        {
            if (HeaderGridview.VisibleRowCount > 0 && HeaderGridview.FocusedRowIndex > -1)
            {
                return HeaderGridview.GetRowValues(HeaderGridview.FocusedRowIndex, "Order_Number").ToString();
            }
            else
            {
                return "";
            }
        }
     

        protected void AllocationDetailGridview_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["Container_ID"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        }
    }
}