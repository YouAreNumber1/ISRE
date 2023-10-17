using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web.UI;
using Dapper;
using System.Collections.Generic;
using System.Web.Services;

namespace ISRE
{

	public partial class ISRI0005 : Page
    {
        public static readonly int _ConnectionTimeout = 10000;
        public static readonly IDbConnection _dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
         
      
        protected void Page_Load(object sender, EventArgs e)
        {

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
		 
       
        protected ISRE_SESSION_MAIN Process_SessionInfo(string GUID)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
            param.Add("@QueryMode", "R", DbType.String, ParameterDirection.Input);

			ISRE_SESSION_MAIN model = _dbConn.Query<ISRE_SESSION_MAIN>(
            "Session_ISRE_SESSION_MAIN",
            param,
            commandType: CommandType.StoredProcedure
            , commandTimeout: _ConnectionTimeout)
            .FirstOrDefault();

            return model;
        }

		/// <summary>
		/// //////////guid=session guid
		/// </summary>
		/// <param name="GUID"></param>
		/// <returns></returns>
		protected List<dynamic> Process_Registers(string GUID)
		{
			DynamicParameters param = new DynamicParameters();
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "Registers", DbType.String, ParameterDirection.Input);

			List<dynamic> model = _dbConn.Query<dynamic>(
			"Session_ISRE_SESSION_REG",
			param,
			commandType: CommandType.StoredProcedure
			, commandTimeout: _ConnectionTimeout)
			.ToList();

			return model;
		}

		protected  dynamic  Process_Registers_Status(string GUID)
		{
			DynamicParameters param = new DynamicParameters();
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "Registers_Status", DbType.String, ParameterDirection.Input);

			dynamic model = _dbConn.Query<dynamic>(
		   "Session_ISRE_SESSION_REG",
		   param,
		   commandType: CommandType.StoredProcedure
		   , commandTimeout: _ConnectionTimeout)
		   .FirstOrDefault();

			return model;
		}

		[WebMethod]
		public static dynamic Process_Registers_Status_Update(string GUID = "")
		{
			DynamicParameters param = new DynamicParameters();
			param.Add("@REG_STATUS", ( (int)ISRE.Enum_REG_STATUS.CheckIn_Backend).ToString(), DbType.String, ParameterDirection.Input);
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "CHECKINByGUID", DbType.String, ParameterDirection.Input);

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