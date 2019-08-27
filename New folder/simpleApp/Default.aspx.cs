using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

namespace simpleApp
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void productsGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["SupplierID"] = HeaderGridview.GetRowValues(HeaderGridview.FocusedRowIndex, HeaderGridview.KeyFieldName);
        }
        protected void orderItemsGrid_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["ProductID"] = DetailGridview.GetRowValues(DetailGridview.FocusedRowIndex, DetailGridview.KeyFieldName);
        }

        protected void DetailGridview_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            object masterKeyValue = Convert.ToInt32(e.Parameters);
            ASPxGridView gv = sender as ASPxGridView;
            Session["SupplierID"] = masterKeyValue;
            gv.DataBind();
        }

        protected void AllocationDetailGridview_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            object masterKeyValue = Convert.ToInt32(e.Parameters);
            ASPxGridView gv = sender as ASPxGridView;
            Session["ProductID"] = masterKeyValue;
            gv.DataBind();
        }
    }
}