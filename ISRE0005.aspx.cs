using Dapper;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Services;
using System.Web.UI;

namespace ISRE
{
	public partial class ISRE0005 : Page
    {
        public static readonly int _ConnectionTimeout = 10000;
        public static readonly IDbConnection _dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

		public int iCheckIn = 0;
		
		protected void Page_Load(object sender, EventArgs e)
        {
			if (!this.IsPostBack)
			{ 
				string GUID = Request["GUID"] ?? "";
				string CHECKINKEY = Request["CHECKINKEY"] ?? "";
				dynamic Model= Process_RegisterInfo(GUID);

				if (Model == null)
				{
					iCheckIn = -1;  ////////// user not found
				}
				else if ( Model.REG_STATUS
					== ((int)ISRE.Enum_REG_STATUS.CheckIn_Mail).ToString())
				{
					iCheckIn = 1;  ////////// checked in
				}
				else if (Model.REG_STATUS
					== ((int)ISRE.Enum_REG_STATUS.Cancel_Mail).ToString())
				{
					iCheckIn = -2;  ////////// cancel in
				}
			} 
		}

		private static dynamic Process_RegisterInfo(string GUID = "")
		{
			DynamicParameters param = new DynamicParameters();

			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "R", DbType.String, ParameterDirection.Input);

			dynamic model = _dbConn.Query<dynamic>(
				"Session_ISRE_SESSION_REG",
				param,
				commandType: CommandType.StoredProcedure
				, commandTimeout: _ConnectionTimeout)
				.FirstOrDefault(); 

			return model;
		}


		[WebMethod]
		///////////  guid=Session_ISRE_SESSION_REG guid
		public static dynamic Process_Confirm(string GUID, string CHECKINKEY)
		{
			DynamicParameters param = new DynamicParameters();
		 
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input); 
			param.Add("@CHECKINKEY", CHECKINKEY, DbType.String, ParameterDirection.Input);
			param.Add("@REG_STATUS", ((int)ISRE.Enum_REG_STATUS.CheckIn_Mail).ToString(), DbType.String, ParameterDirection.Input);
			 
			param.Add("@QueryMode", "CheckIn", DbType.String, ParameterDirection.Input);

			dynamic model = _dbConn.Query<dynamic>(
			"Session_ISRE_SESSION_REG",
			param,
			commandType: CommandType.StoredProcedure
			, commandTimeout: _ConnectionTimeout)
			.FirstOrDefault();

			 
			return model;
		}
		protected ISRE_ACTIVITY_MAIN Process_ActivityInfo(String GUID)
		{
			DynamicParameters param = new DynamicParameters();
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "R", DbType.String, ParameterDirection.Input);

			ISRE_ACTIVITY_MAIN model = _dbConn.Query<ISRE_ACTIVITY_MAIN>(
			"Home_ISRE_ACTIVITY_MAIN",
			param,
			commandType: CommandType.StoredProcedure
			, commandTimeout: _ConnectionTimeout)
			.FirstOrDefault();

			return model;
		}

	}
}