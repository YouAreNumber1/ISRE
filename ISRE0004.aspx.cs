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
	public partial class ISRE0004 : Page
    {
        public static readonly int _ConnectionTimeout = 10000;
        public static readonly IDbConnection _dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

		public int iConfirmed = 0;
		
		protected void Page_Load(object sender, EventArgs e)
        {
			if (!this.IsPostBack)
			{
				 
				string GUID = Request["GUID"] ?? "";
				string CONFIRMKEY = Request["CONFIRMKEY"] ?? "";
				dynamic Model= Process_RegisterInfo(GUID);
				if (Model == null )
				{
					iConfirmed = -1;  ////////// user not found
				}
				else if ( Model.REG_STATUS
					==((int) ISRE.Enum_RegistrationFlow.EmailConfirm).ToString())
				{
					iConfirmed = 1;  ////////// confirmed
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
		public static dynamic Process_Confirm(string GUID, string CONFIRMKEY)
		{
			DynamicParameters param = new DynamicParameters();
		 
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input); 
			param.Add("@CONFIRMKEY", CONFIRMKEY, DbType.String, ParameterDirection.Input);
			param.Add("@REG_STATUS", ((int) ISRE.Enum_RegistrationFlow.EmailConfirm).ToString(), DbType.String, ParameterDirection.Input);

			 
			param.Add("@QueryMode", "CONFIRM", DbType.String, ParameterDirection.Input);

			dynamic model = _dbConn.Query<dynamic>(
			"Session_ISRE_SESSION_REG",
			param,
			commandType: CommandType.StoredProcedure
			, commandTimeout: _ConnectionTimeout)
			.FirstOrDefault();

			if (model.UserFound > 0 
				&&  model.UserStatus.ToString() == ((int)ISRE.Enum_RegistrationFlow.Registration).ToString()
				&& model.UserStatusAfter.ToString() == ((int) ISRE.Enum_RegistrationFlow.EmailConfirm).ToString()
				)
			{
				Process_SendSuccessMail(GUID);
			}
			return model;
		}

		[WebMethod]
		/////////// guid=Session_ISRE_SESSION_REG guid
		public static void Process_SendSuccessMail(string GUID)
		{
			string SenderEmailAccount = ConfigurationManager.AppSettings["SenderEmailAccount"];
			string SenderEmailPassword = ConfigurationManager.AppSettings["SenderEmailPassword"];

			string ClientHost = ConfigurationManager.AppSettings["ClientHost"];
			string WebAppHost = ConfigurationManager.AppSettings["WebAppHost"];


			dynamic Model = Process_RegisterInfo(GUID);
			 
			SmtpClient client = new SmtpClient(); 
			client.Host = ClientHost;
			client.Port = 587; 
			client.Credentials = new NetworkCredential(SenderEmailAccount, SenderEmailPassword); 
			client.EnableSsl = true;

			MailMessage mail = new MailMessage();
			mail.From = new MailAddress(SenderEmailAccount);
			mail.To.Add("iisiisr007@gmail.com");
			mail.Subject = string.Concat(Model.ACT_NAME ?? "", "成功通知");
			mail.SubjectEncoding = Encoding.UTF8;
			mail.IsBodyHtml = true;
			/////////// MAIL BODY
			StringBuilder sb = new StringBuilder();
			sb.Append(Model.NAME ?? "");
			sb.Append(" 您好 :<br><br>");
			sb.Append(Model.CONFIRM_MAIL ?? "");
			sb.Append("<br><br>");
			sb.Append("※以下為您的資料<br>");
			sb.Append("<br>");
			sb.Append("1. 報名序號: ");
			sb.Append(Model.SESS_SEQ_NO ?? "");
			sb.Append("<br>");
			sb.Append("2. 活動日期: ");
			sb.Append(Model.SESS_DATE_S ?? "");
			sb.Append("<br>");
			sb.Append("3. 活動地點: ");
			sb.Append(Model.CityName ?? "");
			sb.Append("<br>");


			sb.Append("4. 視訊連結: ");
			sb.Append("<a href="); 
			sb.Append(Model.VIDEO_LINK);
			sb.Append(">開啟視訊連結");
			sb.Append("</a>");

			 
			sb.Append("<br>");
			sb.Append("5. 線上報到連結: ");

			sb.Append("<a href=");
			sb.Append(WebAppHost);
			sb.Append("isre0005.aspx?GUID=");
			sb.Append(GUID);
			sb.Append("&checkinkey=");
			sb.Append(Model.CHECKINKEY);
			sb.Append(">點此報到");
			sb.Append("</a>");

			 
			sb.Append("<br>");
			sb.Append("6. 報到條碼: ");
			sb.Append("參考附件, 請下載並妥善保存");
			sb.Append("<br>");
			sb.Append("<br>");

			/////////////////////end of customize
			sb.Append("<br>");
			sb.Append("※注意事項");
			sb.Append("<br>");
			sb.Append("1. 於活動開始前, 請向現場工作人員出示報到條碼, 完成報到手續. 以視訊方式參加活動者請以線上方式完成報到.");
			sb.Append("<br>");
			sb.Append("2. 為尊重智慧財產權, 活動進行中未經主辦單位同意, 請勿錄音, 錄影或拍照.");
			sb.Append("<br>");
			sb.Append("3. 若要參考活動詳細內容, 請點此連結: 活動內容");
			sb.Append("<br>");
			sb.Append("4. 若要取消報名, 請點此連結: ");
			sb.Append("<a href=");
			sb.Append(WebAppHost);
			sb.Append("isre0006.aspx?GUID=");
			sb.Append(GUID);
			sb.Append("&cancelkey=");
			sb.Append(Model.CANCELKEY);
			sb.Append(">取消報名");
			sb.Append("</a>");

			 
			sb.Append("<br>");
			sb.Append("<br>");

			 
			sb.Append("衛生福利部中央健康保險署 敬上");




			mail.Body = sb.ToString();
			mail.BodyEncoding = Encoding.UTF8;



			//Attachment attachment = new Attachment(@"C:\fakepath\test.txt");
			//mail.Attachments.Add(attachment);

			try
			{
				client.Send(mail);
			}
			catch (Exception ex)
			{
				throw ex;
			}
			finally
			{
				//attachment.Dispose();
				mail.Dispose();
				client.Dispose();
			}
		}


	}
}