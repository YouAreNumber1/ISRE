﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Dapper;
using System.Web.Services;
using Backend;
using Newtonsoft.Json;

namespace ISRE
{

    public partial class ISRI0004 : Page
    {
        public static readonly int _ConnectionTimeout = 10000;
        public static readonly IDbConnection _dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);
        public static readonly int _PageSize = 3;

        private string TableName = "ISRE_SESSION_MAIN"; 
        private readonly static string SPName = "[dbo].[SESSION_ISRE_ACTIVITY_MAIN]"; 
       // private string GUID = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected dynamic Process_ActivityInfoBySession(String GUID)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
            param.Add("@QueryMode", "ActivityInfoBySession", DbType.String, ParameterDirection.Input);

            dynamic model = _dbConn.Query<dynamic>(
            "Session_ISRE_SESSION_MAIN",
            param,
            commandType: CommandType.StoredProcedure
            , commandTimeout: _ConnectionTimeout)
            .FirstOrDefault();

            return model;
        }


        //protected dynamic  Process_ActivityInfo(String GUID)
        //{
        //    GUID = Request.QueryString["GUID"];
             
        //    DynamicParameters param = new DynamicParameters();
        //    param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
        //    param.Add("@QueryMode", "SessionList", DbType.String, ParameterDirection.Input);

        //    dynamic  model = _dbConn.Query<dynamic>(
        //    "Home_ISRE_ACTIVITY_MAIN",
        //    param,
        //    commandType: CommandType.StoredProcedure
        //    , commandTimeout: _ConnectionTimeout)
        //    .FirstOrDefault();

        //    return model;
        //}

        protected dynamic Process_Session(string GUID)
        {
            DynamicParameters param = new DynamicParameters();
            param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
            param.Add("@QueryMode", "R", DbType.String, ParameterDirection.Input);

            dynamic model = _dbConn.Query<dynamic>(
            "Session_ISRE_SESSION_MAIN",
            param,
            commandType: CommandType.StoredProcedure
            , commandTimeout: _ConnectionTimeout)
            .FirstOrDefault();

            return model;
        }

		protected dynamic Process_SessionRegForm(string GUID)
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

		[WebMethod]
        /////////// guid=session guid
		protected dynamic Process_SettingForm(string GUID, ISRE_SESSION_REG_FORM rq)
		{
			DynamicParameters param = new DynamicParameters();
			string jsonData = JsonConvert.SerializeObject(rq);
			dynamic InputsJSON = JsonConvert.DeserializeObject<dynamic>(jsonData);
			foreach (var item in InputsJSON)
			{ 
					param.Add(String.Format("@{0}", item.Name), item.Value.Value, DbType.String, ParameterDirection.Input);
				  
			}
             
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "I", DbType.String, ParameterDirection.Input);

			dynamic model = _dbConn.Query<dynamic>(
			"Session_ISRE_SESSION_MAIN",
			param,
			commandType: CommandType.StoredProcedure
			, commandTimeout: _ConnectionTimeout)
			.FirstOrDefault();

			return model;
		}


	}
}