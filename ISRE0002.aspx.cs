using Dapper;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Dynamic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISRE
{
	public partial class ISRE0002 : Page
	{
		public static readonly int _ConnectionTimeout = 10000;
		public static readonly IDbConnection _dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
		public static readonly int _PageSize = 3;

		//  private readonly static string ControllerName = string.Concat("/Home/");

		// private readonly static string Updated_RowView = "Updated_Row";
		private string RegisterMultiple = "";
		protected void Page_Load(object sender, EventArgs e)
		{
			if (Page.IsPostBack)
			{
				RegisterMultiple = Request["RegisterMultiple"];
			}
			else
			{
				RegisterMultiple = Request["RegisterMultiple"];
			}
		}
		public dynamic Process_SessionInfo(string GUID = "")
		{ 
			DynamicParameters param = new DynamicParameters();

			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "R", DbType.String, ParameterDirection.Input);

			dynamic model = _dbConn.Query<dynamic>(
				"Session_ISRE_Session_MAIN",
				param,
				commandType: CommandType.StoredProcedure
				, commandTimeout: _ConnectionTimeout)
				.FirstOrDefault();



			return model;
		}

		public dynamic Process_RegistrationFormInfo(string GUID = "")
		{
			DynamicParameters param = new DynamicParameters();

			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "R", DbType.String, ParameterDirection.Input);

			dynamic model = _dbConn.Query<dynamic>(
				"Session_ISRE_SESSION_REG_FORM",
				param,
				commandType: CommandType.StoredProcedure
				, commandTimeout: _ConnectionTimeout)
				.FirstOrDefault();



			return model;
		}

		//protected dynamic Process_ActiviyInfoBySession(String GUID)
		//{
		//	DynamicParameters param = new DynamicParameters();
		//	param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
		//	param.Add("@QueryMode", "ActivityInfoBySession", DbType.String, ParameterDirection.Input);

		//	dynamic model = _dbConn.Query<dynamic>(
		//	"Session_ISRE_SESSION_MAIN",
		//	param,
		//	commandType: CommandType.StoredProcedure
		//	, commandTimeout: _ConnectionTimeout)
		//	.FirstOrDefault();

		//	return model;
		//}


		protected dynamic Process_ActivityInfo(String GUID="")
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

		[WebMethod]
		/////////// guid=session guid
		public static dynamic Process_RegisterForm(string GUID, string formData)
		{
			DynamicParameters param = new DynamicParameters();
			//	string jsonData = JsonConvert.SerializeObject(formData);
			dynamic InputsJSON = JsonConvert.DeserializeObject<dynamic>(formData);
			foreach (var item in InputsJSON)
			{
				param.Add(String.Format("@{0}", item.Name), item.Value.ToString(), DbType.String, ParameterDirection.Input);
			}
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "Register", DbType.String, ParameterDirection.Input);

			dynamic model = _dbConn.Query<dynamic>(
			"Session_ISRE_SESSION_REG_FORM",
			param,
			commandType: CommandType.StoredProcedure
			, commandTimeout: _ConnectionTimeout)
			.FirstOrDefault();

			return model;
		}


	}
}