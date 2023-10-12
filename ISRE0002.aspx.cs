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
using System.Net.Mail;
using System.Net;
using System.Reflection;
using System.Text;
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
		public static dynamic Process_SessionInfo(string GUID = "")
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
			param.Add("@REG_Status", ((int) Enum_RegistrationFlow.Registration).ToString(), DbType.String, ParameterDirection.Input);
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


		[WebMethod]
		/////////// guid=Session_ISRE_SESSION_REG guid
		public static void Process_RegisterConfirmMail(string GUID)
		{

			dynamic Model =   Process_RegisterInfo(GUID);

			string Account = "youarenumber1@gmail.com";
			string Password = "mrztencqvewsbxgm";

			SmtpClient client = new SmtpClient();
			client.Host = "smtp.gmail.com";
			client.Port = 587;
			client.Credentials = new NetworkCredential(Account, Password);
			client.EnableSsl = true;

			MailMessage mail = new MailMessage();
			mail.From = new MailAddress(Account);
			mail.To.Add("youarenumber218015@gmail.com");
			mail.To.Add("scott.lin@iisigroup.com");
			mail.Subject = Model.ACT_NAME??"" + "成功通知";
			mail.SubjectEncoding = Encoding.UTF8;
			mail.IsBodyHtml = true;
			/////////// MAIL BODY
			StringBuilder sb = new StringBuilder();
			sb.Append(Model.NAME??"");
			sb.Append(" 您好 :<br><br>");
			sb.Append(Model.CONFIRM_MAIL??"");
			sb.Append("<br><br>");
			//////////////// customize
			sb.Append("請點選此連結完成電子郵件確認的動作, 完成報名程序.<br>");
			sb.Append("<br>");
			sb.Append("<a href=isre0003.aspx?comfirm=" );
			sb.Append(  GUID  );
			sb.Append(">isre0003.aspx?comfirm=");
			sb.Append(GUID);
			sb.Append("</a>");
			sb.Append("<br>");

			/////////////////////end of customize
			sb.Append("<br>");
			sb.Append("※本郵件由系統自動傳送, 請勿回覆此郵件."); 
			sb.Append( "<br>");
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


		[WebMethod]
		/////////// guid=Session_ISRE_SESSION_REG guid
		public static void Process_RegisterSuccessMail(string GUID)
		{

			dynamic Model = Process_RegisterInfo(GUID);

			string Account = "youarenumber1@gmail.com";
			string Password = "mrztencqvewsbxgm";

			SmtpClient client = new SmtpClient();
			client.Host = "smtp.gmail.com";
			client.Port = 587;
			client.Credentials = new NetworkCredential(Account, Password);
			client.EnableSsl = true;

			MailMessage mail = new MailMessage();
			mail.From = new MailAddress(Account);
			mail.To.Add("youarenumber218015@gmail.com");
			mail.To.Add("scott.lin@iisigroup.com");
			mail.Subject = Model.ACT_NAME ?? "" + "成功通知";
			mail.SubjectEncoding = Encoding.UTF8;
			mail.IsBodyHtml = true;
			/////////// MAIL BODY
			StringBuilder sb = new StringBuilder();
			sb.Append(Model.NAME ?? "");
			sb.Append(" 您好 :<br><br>");
			sb.Append(Model.CONFIRM_MAIL ?? "");
			sb.Append("<br><br>");
			sb.Append("以下為您的資料<br>");
			sb.Append("<br>");
			sb.Append("報名序號: ");
			sb.Append(Model.SESS_SEQ_NO ?? "");
			sb.Append("<br>");
			sb.Append("活動日期: ");
			sb.Append(Model.SESS_DATE_S ?? "");
			sb.Append("<br>");
			sb.Append("活動地點: ");
			sb.Append(Model.SESS_LOC ?? "");
			sb.Append("<br>");


			sb.Append("視訊連結: ");
			sb.Append(Model.VIDEO_LINK ?? "");
			sb.Append("<br>");
			sb.Append("線上報到連結: ");
			sb.Append("s3943823");
			sb.Append("<br>");
			sb.Append("報到條碼: ");
			sb.Append("s3943823");
			sb.Append("<br>");
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

		[WebMethod]
		/////////// guid=Session_ISRE_SESSION_REG guid
		public static void Process_RegisterBackUpMail(string GUID)
		{

			dynamic Model = Process_RegisterInfo(GUID);

			string Account = "youarenumber1@gmail.com";
			string Password = "mrztencqvewsbxgm";

			SmtpClient client = new SmtpClient();
			client.Host = "smtp.gmail.com";
			client.Port = 587;
			client.Credentials = new NetworkCredential(Account, Password);
			client.EnableSsl = true;

			MailMessage mail = new MailMessage();
			mail.From = new MailAddress(Account);
			mail.To.Add("youarenumber218015@gmail.com");
			mail.To.Add("scott.lin@iisigroup.com");
			mail.Subject = Model.ACT_NAME ?? "" + "成功通知";
			mail.SubjectEncoding = Encoding.UTF8;
			mail.IsBodyHtml = true;
			/////////// MAIL BODY
			StringBuilder sb = new StringBuilder();
			sb.Append(Model.NAME ?? "");
			sb.Append(" 您好 :<br><br>");
			sb.Append(Model.CONFIRM_MAIL ?? "");
			sb.Append("<br><br>");
			sb.Append("以下為您的資料<br>");
			sb.Append("<br>");
			sb.Append("報名序號: ");
			sb.Append(Model.SESS_SEQ_NO ?? "");
			sb.Append("<br>");
			sb.Append("活動日期: ");
			sb.Append(Model.SESS_DATE_S ?? "");
			sb.Append("<br>");
			sb.Append("活動地點: ");
			sb.Append(Model.SESS_LOC ?? "");
			sb.Append("<br>");


			sb.Append("視訊連結: ");
			sb.Append(Model.VIDEO_LINK ?? "");
			sb.Append("<br>");
			sb.Append("線上報到連結: ");
			sb.Append("s3943823");
			sb.Append("<br>");
			sb.Append("報到條碼: ");
			sb.Append("s3943823");
			sb.Append("<br>");
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

		[WebMethod]
		/////////// guid=Session_ISRE_SESSION_REG guid
		public static void Process_RegisterRemindMail(string GUID)
		{

			dynamic Model = Process_RegisterInfo(GUID);

			string Account = "youarenumber1@gmail.com";
			string Password = "mrztencqvewsbxgm";

			SmtpClient client = new SmtpClient();
			client.Host = "smtp.gmail.com";
			client.Port = 587;
			client.Credentials = new NetworkCredential(Account, Password);
			client.EnableSsl = true;

			MailMessage mail = new MailMessage();
			mail.From = new MailAddress(Account);
			mail.To.Add("youarenumber218015@gmail.com");
			mail.To.Add("scott.lin@iisigroup.com");
			mail.Subject = Model.ACT_NAME ?? "" + "成功通知";
			mail.SubjectEncoding = Encoding.UTF8;
			mail.IsBodyHtml = true;
			/////////// MAIL BODY
			StringBuilder sb = new StringBuilder();
			sb.Append(Model.NAME ?? "");
			sb.Append(" 您好 :<br><br>");
			sb.Append(Model.CONFIRM_MAIL ?? "");
			sb.Append("<br><br>");
			sb.Append("以下為您的資料<br>");
			sb.Append("<br>");
			sb.Append("報名序號: ");
			sb.Append(Model.SESS_SEQ_NO ?? "");
			sb.Append("<br>");
			sb.Append("活動日期: ");
			sb.Append(Model.SESS_DATE_S ?? "");
			sb.Append("<br>");
			sb.Append("活動地點: ");
			sb.Append(Model.SESS_LOC ?? "");
			sb.Append("<br>");


			sb.Append("視訊連結: ");
			sb.Append(Model.VIDEO_LINK ?? "");
			sb.Append("<br>");
			sb.Append("線上報到連結: ");
			sb.Append("s3943823");
			sb.Append("<br>");
			sb.Append("報到條碼: ");
			sb.Append("s3943823");
			sb.Append("<br>");
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

		/// <summary>
		/// ///////// guid=Session_ISRE_SESSION_REG guid
		/// </summary>
		/// <param name="GUID"></param>
		/// <returns></returns>
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

	}
}