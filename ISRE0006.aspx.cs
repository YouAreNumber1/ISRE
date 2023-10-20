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
		public dynamic Model = null;
		public int iCancelled = -1;
		
		protected void Page_Load(object sender, EventArgs e)
        {
			if (!this.IsPostBack)
			{ 
				string GUID = Request["GUID"] ?? "";
				string CANCELKEY = Request["CANCELKEY"] ?? "";
			    Model= Process_RegisterInfo(GUID);

				if (Model == null)
				{
					iCancelled = -2;  ////////// user not found
				}
				else if (Model.REG_STATUS
					== ((int)ISRE.Enum_REG_STATUS.Cancel_Mail).ToString())
				{
					iCancelled = 0;  ////////// cancelled, should not be here
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