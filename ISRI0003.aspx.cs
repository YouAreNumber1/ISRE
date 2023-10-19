using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;

namespace ISRE
{

	public partial class ISRI0003 : Page
	{
		public static readonly int _ConnectionTimeout = 10000;
		public static readonly IDbConnection _dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

		//public string SESSIONGUID = string.Empty;
		public string ActioinName = string.Empty;
	　
		//public string GUID = string.Empty;
		//public string GetGUID = string.Empty;
		public dynamic Model = null;
		　
		public dynamic List_CityList = null;


		protected void Page_Load(object sender, EventArgs e)
		{ 

			if (!IsPostBack)
			{/////////// first load
				string SESSIONGUID = Request.QueryString["SESSIONGUID"] ?? "";  /////////SESSIONGUID=session guid
				//GUID = Request.QueryString["GUID"] ?? "";  /////////SESSIONGUID=session guid

				ActioinName = (SESSIONGUID == "") ? "新增" : "編輯";

				if (SESSIONGUID == "")
				{
					ActioinName = "新增";
				}
				else
				{
					ActioinName = "編輯";
					Model = Process_Session(SESSIONGUID);
				} 
			}
			else
			{

			}
				　
			List_CityList = StaticQueryDB("Home_ISRE_ACTIVITY_MAIN", "CityList");
			 
		}

		protected static List<dynamic> StaticQueryDB(string SPName, string QueryMode)
		{
			DynamicParameters param = new DynamicParameters();
			param.Add("@QueryMode", QueryMode, DbType.String, ParameterDirection.Input);

			List<dynamic> result = new List<dynamic>();

			result = _dbConn.Query<dynamic>(
			   SPName,
				param,
				commandType: CommandType.StoredProcedure
				, commandTimeout: _ConnectionTimeout)
				.ToList();

			return result;

		}

		protected ISRE_ACTIVITY_MAIN Process_ActivityInfo(String GUID)
		{
			DynamicParameters param = new DynamicParameters();
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "R", DbType.String, ParameterDirection.Input);
			ISRE_ACTIVITY_MAIN model = new ISRE_ACTIVITY_MAIN();


			model = _dbConn.Query<ISRE_ACTIVITY_MAIN>(
					"Home_ISRE_ACTIVITY_MAIN",
					param,
					commandType: CommandType.StoredProcedure
					, commandTimeout: _ConnectionTimeout)
					.FirstOrDefault();

			return model;
		}


		/// <summary>
		/// ////////// get activity by session guid
		/// </summary>
		/// <param name="GUID"></param>
		/// <returns></returns>

		protected ISRE_SESSION_MAIN Process_Session(string GUID)
		{
			DynamicParameters param = new DynamicParameters();
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "R", DbType.String, ParameterDirection.Input);
			ISRE_SESSION_MAIN model = new ISRE_SESSION_MAIN();

			using (IDbConnection _dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString))
			{
				model = _dbConn.Query<ISRE_SESSION_MAIN>(
						"Session_ISRE_SESSION_MAIN",
						param,
						commandType: CommandType.StoredProcedure
						, commandTimeout: _ConnectionTimeout)
						.FirstOrDefault();
			}
			return model;
		}

		/// <summary>
		/// 新增按鈕
		 

		protected void btnAdd_Click(object sender, EventArgs e)
		{
			////////////// if need to execute after
			//Page.ClientScript.RegisterStartupScript(GetType(), "none", "<script>executeAfter();</script>", false);
			var model = Process_Session(Request["GUID"], "C");
			 
			if (model!=null && model.SerialID>0)
			{
				Session["StatusMessage"] = string.Concat("場次 ", model.SESS_NO, " 新增成功!"); 
			}
			 Response.Redirect(string.Format("ISRI0002.aspx?GUID={0}", Request["GUID"]  ));
		}

		protected void btnSave_Click(object sender, EventArgs e)
		{ 
			var model = Process_Session(Request["SESSIONGUID"], "U");
			if (model != null && model.SerialID > 0)
			{
				Session["StatusMessage"] = string.Concat("場次 ", model.SESS_NO, " 修改成功!"); 
			}
			 Response.Redirect(string.Format("ISRI0002.aspx?GUID={0}", Request["GUID"]));
		}
		protected void btnDelete_Click(object sender, EventArgs e)
		{
			var model = Process_Session(Request["SESSIONGUID"], "D");
			if (model != null  )
			{
				Session["StatusMessage"] = string.Concat("場次刪除成功!"); 
			}
			 Response.Redirect(string.Format("ISRI0002.aspx?GUID={0}", Request["GUID"]));
		}

		/// <summary>
		/// 更新資料
		/// </summary>
		/// <param name="sender"></param>
		/// <param name="e"></param>

		protected void btnInsert_Click(object sender, EventArgs e)
		{
			var model = Process_Session(Request["GUID"], "C");

			if (model != null && model.SerialID > 0)
			{
				Session["StatusMessage"] = string.Concat("場次 ", model.SESS_NO, " 新增成功!");
			}
			Response.Redirect(string.Format("ISRI0002.aspx?GUID={0}", Request["GUID"]));
		}

		protected void btnActivate_Click(object sender, EventArgs e)
		{
			var model = Process_Session(Request["SESSIONGUID"], "A");

			if (model != null && model.SerialID > 0)
			{
				Session["StatusMessage"] = string.Concat("場次 ", model.SESS_NO, " 傳送成功!");
			}
			Response.Redirect(string.Format("ISRI0002.aspx?GUID={0}", Request["GUID"]));
		}

		protected dynamic Process_Session(string GUID, string QueryMode)
		{
			DynamicParameters param = new DynamicParameters();

			param.Add("@QueryMode", QueryMode, DbType.String, ParameterDirection.Input);
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			foreach (string key in Request.Form.AllKeys)
			{
				if (key.IndexOf("__")>=0 || key.IndexOf("MainContent") >= 0)
				{

				}
				else
				{
					param.Add(string.Format(@"@{0}", key), Request.Form[key], DbType.String, ParameterDirection.Input);
				} 
			}
			dynamic model = _dbConn.Query<dynamic>(
						"Session_ISRE_SESSION_MAIN",
						param,
						commandType: CommandType.StoredProcedure
					, commandTimeout: _ConnectionTimeout)
					.FirstOrDefault();

			return model;
		}



		public static dynamic ProcessActivityInfo(String GUID)
		{
			DynamicParameters param = new DynamicParameters();
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "R", DbType.String, ParameterDirection.Input);
			 
			dynamic model = _dbConn.Query<dynamic>(
						"Home_ISRE_ACTIVITY_MAIN",
						param,
						commandType: CommandType.StoredProcedure
						, commandTimeout: _ConnectionTimeout)
						.FirstOrDefault();
			return model;
		}

		 
		 


	}

}