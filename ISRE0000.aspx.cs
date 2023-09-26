using Dapper;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Reflection.Emit;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace ISRE
{
    public partial class ISRE0000 : Page
    {
        public static readonly int _ConnectionTimeout = 10000;
        public static readonly IDbConnection _dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        public static readonly int _PageSize = 3;

        private readonly static string TableName = "ISRE_ACTIVITY_MAIN";
        //  private readonly static string ControllerName = string.Concat("/Home/");
        private readonly static string SPName = "[dbo].[HOME_ISRE_ACTIVITY_MAIN]";
        //  private readonly static string Updated_RowView = "Updated_Row";
        //  string sSelected= "";

        /// <summary>
        /// Conbobox class
        /// </summary>
        public class CboDataList
        {
            /// <summary>
            /// Conbobox名稱
            /// </summary>
            public string Cbo_Name { get; set; }
            /// <summary>
            /// Conbobox名稱
            /// </summary>
            public string Cbo_Value { get; set; }
        }

        //Init事件：aspx初始化時觸發.
        public void Page_Init(object sender, EventArgs e)
        {


        }

        protected void Page_Load(object sender, EventArgs e)
        {
            this.BtnQuery.ServerClick += new EventHandler(BtnQuery_Click);


            //string colorName = SESS_LOC.Items[SESS_LOC.SelectedIndex].Text;
            //StringBuilder sb2 = new StringBuilder();
            if (!this.IsPostBack)
            {


                SqlConnection db = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

                //SqlCommand cmd = new SqlCommand("Home_ISRE_ACTIVITY_MAIN", db);
                //cmd.CommandType = CommandType.StoredProcedure;
                ////cmd.Parameters["@Name"].Value = "CityList";
                ////cmd.Parameters.Add("@QueryMod", SqlDbType.NVarChar, 50);


                //cmd.Parameters.Add("@QueryMode", SqlDbType.VarChar, 15);
                //cmd.Parameters["@QueryMode"].Value = "CityList";

                ////SqlParameter retValParam = cmd.Parameters.Add("@OutputData", SqlDbType.VarChar, 250);
                ////retValParam.Direction = ParameterDirection.Output;

                //try
                //{
                //    db.Open();
                //    int LastInsertedID = Convert.ToInt32(cmd.ExecuteScalar());
                //}
                //catch (Exception ex)
                //{
                //    throw ex.GetBaseException();
                //}
                //finally
                //{
                //    db.Close();
                //}






                dynamic List_CityList1 = StaticQueryDB("Home_ISRE_ACTIVITY_MAIN", "CityList");
                dynamic OBJ_NOList1 = StaticQueryDB("Home_ISRE_ACTIVITY_MAIN", "OBJ_NO");
                dynamic List_ACT_TYPE1 = StaticQueryDB("Home_ISRE_ACTIVITY_MAIN", "ACT_TYPE");

                List<CboDataList> lis_DataList = new List<CboDataList>();

                //ddlCitySelectFont.Text = string.Empty;
                //ddlNOSelectFont.Text = string.Empty;
                //ddlActTypeSelectFont.Text = string.Empty;


                // 預設值
                CboDataList DefaultVal = new CboDataList
                {
                    Cbo_Value = "",
                    Cbo_Name = "請選擇"
                };

                // ddlCityList
                lis_DataList.Add(DefaultVal);

                foreach (var item in List_CityList1)
                {
                    CboDataList comObj1 = new CboDataList
                    {
                        Cbo_Value = item.CityNo,
                        Cbo_Name = item.CityName
                    };
                    lis_DataList.Add(comObj1);
                }

                SESS_LOC.DataSource = lis_DataList;
                SESS_LOC.DataTextField = "Cbo_Name";
                SESS_LOC.DataValueField = "Cbo_Value";
                SESS_LOC.DataBind();

                // ddlNOList
                lis_DataList = new List<CboDataList>();
                lis_DataList.Add(DefaultVal);

                foreach (var item in OBJ_NOList1)
                {
                    CboDataList comObj1 = new CboDataList
                    { //SerialID
                        Cbo_Value = item.SerialID.ToString(),
                        Cbo_Name = item.OBJ_NO_NAME
                    };
                    lis_DataList.Add(comObj1);
                }

                OBJ_NO.DataSource = lis_DataList;
                OBJ_NO.DataTextField = "Cbo_Name";
                OBJ_NO.DataValueField = "Cbo_Value";
                OBJ_NO.DataBind();

                // ddlActTypeList
                lis_DataList = new List<CboDataList>();
                lis_DataList.Add(DefaultVal);

                foreach (var item in List_ACT_TYPE1)
                {
                    CboDataList comObj1 = new CboDataList
                    { //SerialID
                        Cbo_Value = item.SerialID.ToString(),
                        Cbo_Name = item.TYPE_NAME
                    };
                    lis_DataList.Add(comObj1);
                }

                ACT_TYPE.DataSource = lis_DataList;
                ACT_TYPE.DataTextField = "Cbo_Name";
                ACT_TYPE.DataValueField = "Cbo_Value";
                ACT_TYPE.DataBind();

                //List<string> list = new List<string>()
                // {
                //	"test",
                //	"test2"
                // };
                //ListItem LICountry = new ListItem("----Select----", "-1");
                //dynamic List_CityList  = StaticQueryDB("Home_ISRE_ACTIVITY_MAIN", "CityList");
                //List<dynamic> products = new List<dynamic>();
                //foreach (DataRow row in List_CityList)
                //{
                //	products.add(New dynamic { row.CityNo, row.CityName  });
                //}
                //sb2.Append("<option>請選擇</option>");
                //foreach (var item in List_CityList)
                //{
                //	ShowAssumptions.Items.Add(item);
                //	//sb2.Append("<option value=");
                //	//sb2.Append(item.CityNo);
                //	//sb2.Append(">");
                //	//sb2.Append(item.CityName);
                //	//sb2.Append("</option>");
                //	list.Add(item);
                //}
                //ShowAssumptions.DataSource = List_CityList;
                // ShowAssumptions.DataBind();



                //DataTable dt = new DataTable();
                //dt.Columns.AddRange(new DataColumn[3] { new DataColumn("Id", typeof(int)),
                //	new DataColumn("Name", typeof(string)),
                //	new DataColumn("Country",typeof(string)) });
                //dt.Rows.Add(1, "John Hammond", "United States");
                //dt.Rows.Add(2, "Mudassar Khan", "India");
                //dt.Rows.Add(3, "Suzanne Mathews", "France");
                //dt.Rows.Add(4, "Robert Schidner", "Russia");

                //StringBuilder sb = new StringBuilder();
                ////Table start.
                //sb.Append("<table cellpadding='5' cellspacing='0' style='border: 1px solid #ccc;font-size: 9pt;font-family:Arial'>");

                ////Adding HeaderRow.
                //sb.Append("<tr>");
                //foreach (DataColumn column in dt.Columns)
                //{
                //	sb.Append("<th style='background-color: #B8DBFD;border: 1px solid #ccc'>" + column.ColumnName + "</th>");
                //}
                //sb.Append("</tr>");


                ////Adding DataRow.
                //foreach (DataRow row in dt.Rows)
                //{
                //	sb.Append("<tr>");
                //	foreach (DataColumn column in dt.Columns)
                //	{
                //		sb.Append("<td style='width:100px;border: 1px solid #ccc'>" + row[column.ColumnName].ToString() + "</td>");
                //	}
                //	sb.Append("</tr>");
                //}

                ////Table end.
                //sb.Append("</table>");
                //ltTable.Text = sb.ToString();
               
                SearchResult.Visible = false;   // 查詢結果
                SearchCriteria.Visible = false; // 搜尋條件
            }
            else
            {
                SearchResult.Visible = true;    // 查詢結果
                SearchCriteria.Visible = true;  // 搜尋條件

            }

        }



        protected static List<dynamic> StaticQueryDB(string SPName, string QueryMode)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@QueryMode", QueryMode, DbType.String, ParameterDirection.Input);
            
            try
            {
                List<dynamic> result = 
                    _dbConn.Query<dynamic>(
                        SPName,
                        param,
                        commandType: CommandType.StoredProcedure
                    , commandTimeout: _ConnectionTimeout
                   )
                .ToList();
                return result;
            }
            catch (Exception ex)
            {
                throw ex.GetBaseException();
            }
            finally
            {
                _dbConn.Close();
            }
        }

        protected List<dynamic> Process_ActivityList(int Page = 1
            , int OrderIndex = 1)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@PageSize", _PageSize, DbType.Int16, ParameterDirection.Input);
            param.Add("@Page", Page, DbType.Int16, ParameterDirection.Input);
            param.Add("@OrderIndex", OrderIndex, DbType.Int16, ParameterDirection.Input);
            param.Add("@QueryMode", "QF", DbType.String, ParameterDirection.Input);

            try
            {

                List<dynamic> model = _dbConn.Query<dynamic>(
                    SPName,
                    param,
                    commandType: CommandType.StoredProcedure
                    , commandTimeout: _ConnectionTimeout
                )
                .ToList();

                return model;
            }
            catch (Exception ex)
            {
                throw ex.GetBaseException();
            }
            finally
            {
                _dbConn.Close();
            }
        }


        /// ===================
        /// Function Area
        /// ===================






        /// <summary>
        /// 取搜尋條件相關欄位
        /// </summary>
        private void GetFieID()
        {
            ContentPlaceHolder PageNow;

            string StrLabel = string.Empty;
            
            string ComSearchCriteriaData = string.Empty;

            PageNow = (ContentPlaceHolder)Master.FindControl("MainContent");

            foreach (Control myControl in PageNow.Controls)
            {
                if (myControl is DropDownList)
                {
                    DropDownList dropDownList = myControl as DropDownList;
                    if (dropDownList != null)
                    {
                        var dropDownListID = dropDownList.ID;
                        //Page.ClientScript.RegisterStartupScript(Page.GetType(), "message", "<script language='javascript' defer>alert('" + dropDownListID + "');</script>");
                        DropDownList ddlDept = (DropDownList)Master.FindControl("MainContent").FindControl(dropDownListID);

                        var svalue =
                            ddlDept.SelectedValue;


                        if (svalue != "")
                        {
                            ComSearchCriteriaData += CombineSearchCriteriaData(ddlDept.SelectedItem.Text);
                            //Label1.Text += CombineSearchCriteriaData(ddlDept.SelectedItem.Text);
                        }


                    }


                }



            }

            LtlSearchCriteriaData.Text = ComSearchCriteriaData;
        }

        /// <summary>
        /// 組合搜尋條件資料
        /// </summary>
        /// <param name="SearchCriteriaDatas">搜尋條件資料</param>
        /// <returns></returns>
        public static string CombineSearchCriteriaData(string SearchCriteriaDatas ="")
        { 
            string result = string.Empty;
           
            if(SearchCriteriaDatas.Trim() != string.Empty)
            {
                result = String.Format("<span class=\"badge bg-secondary\">{0}</span>&nbsp;", SearchCriteriaDatas);
            }

            return result;
        }





        /// <summary>
        /// 查詢按鈕
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        protected void BtnQuery_Click(object sender, EventArgs e)
        {
            GetFieID();
        }



    }

}