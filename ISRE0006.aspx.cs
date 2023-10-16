using Dapper;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web.Services;
using System.Web.UI;

namespace ISRE
{
	public partial class ISRE0006 : Page
    {
        public static readonly int _ConnectionTimeout = 10000;
        public static readonly IDbConnection _dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

		public int iCancelled = 0;
		
		protected void Page_Load(object sender, EventArgs e)
        {
			if (!this.IsPostBack)
			{ 
				string GUID = Request["GUID"] ?? "";
				string CANCELKEY = Request["CANCELKEY"] ?? "";
				dynamic Model= Process_RegisterInfo(GUID);

				if (Model == null)
				{
					iCancelled = -1;  ////////// user not found
				}
				else if (Model.REG_STATUS
					== ((int)ISRE.Enum_REG_STATUS.Cancel_Mail).ToString())
				{
					iCancelled = 1;  ////////// cancelled, should not be here
				}

				//if (Model != null && Model.REG_STATUS
				//	== ((int)ISRE.Enum_REG_STATUS.Cancel_Mail).ToString())
				//{ 
				//	bCancelled = true;
				//} 
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
		public static dynamic Process_Confirm(string GUID, string CANCELKEY)
		{
			DynamicParameters param = new DynamicParameters();
		 
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input); 
			param.Add("@CANCELKEY", CANCELKEY, DbType.String, ParameterDirection.Input);
			param.Add("@REG_STATUS", ((int)ISRE.Enum_REG_STATUS.Cancel_Mail).ToString(), DbType.String, ParameterDirection.Input);

			 
			param.Add("@QueryMode", "CANCEL", DbType.String, ParameterDirection.Input);

			dynamic model = _dbConn.Query<dynamic>(
			"Session_ISRE_SESSION_REG",
			param,
			commandType: CommandType.StoredProcedure
			, commandTimeout: _ConnectionTimeout)
			.FirstOrDefault();

			 
			return model;
		}
 

	}
}