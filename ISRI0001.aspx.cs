using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;
using Newtonsoft.Json;
using System.Web.Services;

namespace ISRE
{

    public partial class ISRI0001 : Page
    {
        public static readonly int _ConnectionTimeout = 10000;
        public static readonly IDbConnection _dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
      

         
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected static List<dynamic> StaticQueryDB(string SPName, string QueryMode)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@QueryMode", QueryMode, DbType.String, ParameterDirection.Input);

            List<dynamic> result = _dbConn.Query<dynamic>(
           SPName,
            param,
            commandType: CommandType.StoredProcedure
            , commandTimeout: _ConnectionTimeout)
            .ToList();
            return result;
        }

        protected dynamic Process_ActivityDetail(String GUID)
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

        protected List<dynamic> Process_SessionList(string GUID)
        {
            
            DynamicParameters param = new DynamicParameters();
            param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
            param.Add("@QueryMode", "SessionList", DbType.String, ParameterDirection.Input);

            List<dynamic> model = _dbConn.Query<dynamic>(
            "Home_ISRE_ACTIVITY_MAIN",
            param,
            commandType: CommandType.StoredProcedure
            , commandTimeout: _ConnectionTimeout)
            .ToList();

            return model;
        }
		[WebMethod]
		/////////// guid=session guid
		public static dynamic Process_Activity( string formData, string GUID="")
		{
			DynamicParameters param = new DynamicParameters(); 
			dynamic InputsJSON = JsonConvert.DeserializeObject<dynamic>(formData);
			foreach (var item in InputsJSON)
			{
				param.Add(String.Format("@{0}", item.Name), item.Value.ToString(), DbType.String, ParameterDirection.Input);
			}
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", GUID !=""? "U":"C", DbType.String, ParameterDirection.Input);

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