using Dapper;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Net;
using System.Text;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ISRE
{
	public partial class ISRE0004 : Page
    {
        public static readonly int _ConnectionTimeout = 10000;
        public static readonly IDbConnection _dbConn = new SqlConnection(ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString);

		public bool bConfirmed = false;
		
		protected void Page_Load(object sender, EventArgs e)
        {
			if (!this.IsPostBack)
			{
				 
				string GUID = Request["GUID"] ?? "";
				string CONFIRMKEY = Request["CONFIRMKEY"] ?? "";
				dynamic Model= Process_RegisterInfo(GUID);
				if (Model!=null && Model.REG_STATUS=="4")
				{
					 
					bConfirmed = true;
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
		/////////// guid=session guid
		public static dynamic Process_Confirm(string GUID, string CONFIRMKEY)
		{
			DynamicParameters param = new DynamicParameters();
		 
			param.Add("@GUID", GUID, DbType.String, ParameterDirection.Input); 
			param.Add("@CONFIRMKEY", CONFIRMKEY, DbType.String, ParameterDirection.Input);
			param.Add("@QueryMode", "CONFIRM", DbType.String, ParameterDirection.Input);

			dynamic model = _dbConn.Query<dynamic>(
			"Session_ISRE_SESSION_REG",
			param,
			commandType: CommandType.StoredProcedure
			, commandTimeout: _ConnectionTimeout)
			.FirstOrDefault();

			if (model.ROWCOUNTNO >0)
			{
				Process_RegisterSuccessMail(GUID);
			}
			return model;
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


	}
}