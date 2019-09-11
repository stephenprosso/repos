using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace simpleApp
{
    public partial class PTLBrowse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HeaderGridview.DataBind();
            DetailDS.SelectParameters["Batch_Number"].DefaultValue = FocusedContainerID();
            DetailGridview.DataBind();
        }

        protected void DetailGridview_CustomCallback(object sender, DevExpress.Web.ASPxGridViewCustomCallbackEventArgs e)
        {
            DetailDS.SelectParameters["Batch_Number"].DefaultValue = FocusedContainerID();
            DetailGridview.DataBind();
        }

        private string FocusedContainerID()
        {
            if (HeaderGridview.VisibleRowCount > 0 && HeaderGridview.FocusedRowIndex > -1)
            {
                return HeaderGridview.GetRowValues(HeaderGridview.FocusedRowIndex, "Batch_Number").ToString();
            }
            else
            {
                return "";
            }
        }


        private string FocusedSeqNum()
        {
            if (DetailGridview.VisibleRowCount > 0 && DetailGridview.FocusedRowIndex > -1)
            {
                return DetailGridview.GetRowValues(DetailGridview.FocusedRowIndex, "ATA_Seq_#").ToString();
            }
            else
            {
                return "";
            }
        }

        protected void ASPxGridView1_BeforePerformDataSelect(object sender, EventArgs e)
        {
            Session["ATA_seq_#"] = (sender as ASPxGridView).GetMasterRowKeyValue();

        }

        protected void AllocationGridview_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            AllocationGridviewDS.SelectParameters["ATA_Seq_#"].DefaultValue = FocusedSeqNum();
            AllocationGridviewDS.DataBind();
        }
    }
}