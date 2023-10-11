<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRE0002.aspx.cs"
	Inherits="ISRE.ISRE0002" %>


<%--this page is for frontend  session  registration--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<link href="Scripts/jquery-ui-custom/jquery-ui-custom.css" rel="stylesheet" />

<script src="Scripts/jquery-ui-custom/jquery-ui-custom.js"></script>

	<% 
/////if not dynamic model, use GetHashCode() for an unassigned datetime Is always zero, use this to check null date 
//////if dynamic need to use ==null to check null date
	%>
	<main>
		<%
			string GUID = Request.QueryString["GUID"];///GUID= activity guid 
			string SESSIONGUID = Request.QueryString["SESSIONGUID"];///GUID= activity guid 

			string RegisterMultiple = Request.QueryString["RegisterMultiple"] ?? ((int)ISRE.Enum_Register.Single).ToString();
			//dynamic Model = Process_ActivityInfo(GUID);
			dynamic Model = Process_SessionInfo(SESSIONGUID);
		%>
		<div id="ISRI_SessionFlow" runat="server">
			<!-- #Include virtual="ISRI_RegistrationFlow.aspx" -->
		</div>
		<h3 class="text-center my-2">活動內容</h3>

		<%-- activity info summary title start --%>
		<div class="  card p-2  my-2  active    d-none d-lg-block ">

			<div class="row  text-center d-flex align-items-center ">
				<div class=" col-lg-3  text-start  ">
					活動主題 
				</div>
				<div class=" col-lg-3  ">
					活動起訖⽇期 
				</div>

				<div class=" col-lg-2       ">
					主辦單位 
				</div>
				<div class=" col-lg-3   ">
					發布起訖⽇期 
				</div>

			</div>

		</div>

		<%-- activity info summary title end --%>
		<%-- activity info summary content start --%>

		<div class="  card p-2  my-2   ">
			<div class=" row  d-flex align-items-center  ">
				<div class="col-12 col-sm-5 col-lg-3 ">
					<div class="row   d-flex align-items-center">
						<span class="d-lg-none col-4     ">
							<span class="badge bg-info  ">活動主題</span>
						</span>
						<div class="col-8 col-lg-12  ">
							<div>
								<%:Model == null || Model.ACT_NAME==null  ? "" : Model.ACT_NAME %>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-7  col-lg-3 ">
					<div class="row  d-flex align-items-center">
						<span class="d-lg-none  col-4     ">
							<span class="badge bg-info">活動起訖⽇期</span>
						</span>
						<div class="col-8 col-lg-12    ">
							<div class="d-block d-lg-flex justify-content-lg-center">
								<%:Model == null || Model.ACT_DATE_S==null
									? "" 
									: string.Concat((Int32.Parse( Model.ACT_DATE_S.ToString("yyyy"))-1911),"/" , Model.ACT_DATE_S.ToString("MM"), "/", Model.ACT_DATE_S.ToString("dd"))%> 
									- 
									<%:Model == null || Model.ACT_DATE_E.GetHashCode()==0  
									? "" 
									: string.Concat((Int32.Parse( Model.ACT_DATE_E.ToString("yyyy"))-1911),"/" , Model.ACT_DATE_E.ToString("MM"), "/", Model.ACT_DATE_E.ToString("dd"))%>
							</div>
						</div>
					</div>
				</div>

				<div class="col-12 col-sm-5 col-lg-2 ">
					<div class="row  d-flex align-items-center ">
						<div class="d-lg-none  col-4     ">
							<span class="badge bg-info">主辦單位</span>
						</div>
						<div class="col-8  col-lg-12 ">
							<div class="d-flex justify-content-lg-center">
								<%:Model == null || Model.ACT_HOST==null  ? "" : Model.ACT_HOST %>
							</div>
						</div>
					</div>
				</div>

				<div class="col-12 col-sm-7  col-lg-3 ">
					<div class="row  d-flex align-items-center">
						<div class="d-lg-none  col-4     ">
							<span class="badge bg-info">發布起訖⽇期</span>
						</div>
						<div class="col-8  col-lg-12 ">

							<div class="d-block d-lg-flex justify-content-lg-center">
								<%:Model == null || Model.PUB_DATE_S==null  
? "" 
: string.Concat((Int32.Parse( Model.PUB_DATE_S.ToString("yyyy"))-1911),"/" , Model.PUB_DATE_S.ToString("MM"), "/", Model.PUB_DATE_S.ToString("dd"))%> 
- 
								<%:Model == null || Model.PUB_DATE_E==null  
? "" 
: string.Concat((Int32.Parse( Model.PUB_DATE_E.ToString("yyyy"))-1911),"/" , Model.PUB_DATE_E.ToString("MM"), "/", Model.PUB_DATE_E.ToString("dd"))%>
							</div>

						</div>
					</div>
				</div>


			</div>
		</div>


		<%-- activity info summary content end --%>

		<%-- session info summary start --%>
		<h3 class="text-center mt-5 mb-2">場次資訊  </h3>
		<%-- session info summary title start --%>
		<div class="   card my-1 p-2  bg-ice d-none d-lg-block ">

			<div class="row  text-center  d-flex align-items-center">
				<div class=" col-lg-1   ">
					場次  
				</div>
				<div class=" col-lg-2  ">
					日期  
				</div>
				<div class=" col-lg-2  ">
					時間 
				</div>
				<div class=" col-lg-2  ">
					地點 
				</div>
				<div class=" col-lg-2      ">
					報名截⽌⽇ 
				</div>
				<div class=" col-lg-2  ">
					資料 
				</div>
				<div class=" col-lg-1     ">
					尚餘名額 
				</div>
			</div>

		</div>
		<%-- session info summary title end --%>
		<%-- session info summary content start --%>

		<div class="    card my-2 p-2   ">
			<div class=" row   ">
				<div class="col-12 col-sm-5  col-lg-1 ">
					<div class="row  d-flex align-items-center ">
						<span class="d-lg-none col-4    ">
							<span class="badge bg-info card-header">場次</span>
						</span>
						<div class="col-8 col-lg-12   ">
							<div class="d-block d-lg-flex justify-content-lg-center">
								<%:Model == null || Model.SESS_SERIAL_NO==null  ? "" : Model.SESS_SERIAL_NO %>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-7  col-lg-2">
					<div class="row   d-flex align-items-center">
						<span class="d-lg-none  col-4      ">
							<span class="badge bg-info">日期 </span>
						</span>
						<div class="col-8 col-lg-12  ">
							<div class="d-block d-lg-flex justify-content-lg-center">

								<%:Model == null || Model.SESS_DATE_S==null
								? "" 
								: Model.SESS_DATE_S.ToString("yyyy-MM-dd") %>
							</div>
						</div>
					</div>
				</div>

				<div class="col-12 col-sm-7  col-lg-2 ">
					<div class="row   d-flex align-items-center">
						<span class="d-lg-none  col-4      ">
							<span class="badge bg-info">時間</span>
						</span>
						<div class="col-8 col-lg-12  ">
							<div class="d-block d-lg-flex justify-content-lg-center">

								<%:Model == null || Model.SESS_DATE_S==null  
									? "" 
									: Model.SESS_DATE_S.ToString("HH:mm") %>
					-	<%:Model == null || Model.SESS_DATE_E==null  
							? "" 
							: Model.SESS_DATE_E.ToString("HH:mm") %>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-5 col-lg-2 ">
					<div class="row  d-flex align-items-center ">
						<span class="d-lg-none  col-4     ">
							<span class="badge bg-info">地點</span>
						</span>
						<div class="col-8  col-lg-12     ">
							<div class="d-block d-lg-flex justify-content-lg-center">台北市 </div>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-7  col-lg-2 ">
					<div class="row  d-flex align-items-center ">
						<div class="d-lg-none  col-4     ">
							<span class="badge bg-info">報名截⽌⽇</span>
						</div>
						<div class="col-8  col-lg-12    ">
							<div class="d-block d-lg-flex justify-content-lg-center">112/08/31  </div>
						</div>
					</div>
				</div>

				<div class="col-12 col-sm-5  col-lg-2 ">
					<div class="row  d-flex align-items-center ">
						<div class="d-lg-none  col-4     ">
							<span class="badge bg-info">資料</span>
						</div>
						<div class="col-8 col-lg-12   ">
							<div class="   ">
								<div class="d-flex justify-content-lg-center">資料 </div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-sm-7 col-lg-1 ">
					<div class="row   d-flex align-items-center">
						<div class="d-lg-none  col-4     ">
							<span class="badge bg-info">尚餘名額</span>
						</div>
						<div class="col-8 col-lg-12    ">
							<div class="d-block d-lg-flex justify-content-lg-center">
								<div class="badge bg-primary">21</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>


		<%-- session info summary content end --%>
		<%--   session info summary end--%>


		<%--     registration form start--%>
		<%--<input type="hidden" name="RegisterMultiple" id="RegisterMultiple"
			value="<%:RegisterMultiple %>" />--%>
		<%      
			dynamic enumValue = Int32.Parse(RegisterMultiple);
			var enumName = (ISRE.Enum_Register)enumValue;
			var desc = enumName.GetDescription();
		%>


		<div id="registrationForm" class="mt-5">
			<h3 class="text-center mt-5 mb-2">報名表(<%:desc %>)  </h3>

			<%
				bool bDisplay = false;
				bool bRequired = false;
				dynamic FormModel = Process_RegistrationFormInfo(SESSIONGUID);
				if (RegisterMultiple.ToString() == ((int)ISRE.Enum_Register.Single).ToString()
				|| RegisterMultiple.ToString() == ((int)ISRE.Enum_Register.Multiple).ToString()
				 || RegisterMultiple.ToString() == ((int)ISRE.Enum_Register.Backup).ToString()
				)
				{
			%>
			<div class="text-center">
				<div class=" mx-2  form-check-inline">報名⾝分：</div>
				<div class="form-check mx-2   form-check-inline">
					<input type="radio" class="form-check-input  "
						id="rdoREG_TYPE1" name="rdoREG_TYPE" value="1" checked>個人
                  <label class="form-check-label" for="rdoREG_TYPE1"></label>
				</div>
				<div class="form-check mx-2  form-check-inline">
					<input type="radio" class="form-check-input  "
						id="rdoREG_TYPE2" name="rdoREG_TYPE" value="2">單位
                  <label class="form-check-label" for="rdoREG_TYPE2"></label>
				</div>
				<div class="text-center text-danger"><span class="note">「*」</span>為必填</div>
			</div>


			<div class="card border">
				<div class="card-body">
					<div id="table_REG_TYPE1" class=" d-none  table_REG_TYPE ">
						<%  bDisplay = (FormModel != null && FormModel.PERSONAL_NAME_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.PERSONAL_NAME_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>姓名</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div>
									<input type="text"
										name="PERSONAL_NAME_D" id="PERSONAL_NAME_D"
										class=" form-control
										<%:(bRequired)  ? "requiredInput":"" %>
									">
								</div>
							</div>
						</div>
						<%}%>


						<%  bDisplay = (FormModel != null && FormModel.PERSONAL_IDAES_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.PERSONAL_IDAES_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>⾝分證號/居留證號</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div>
									<input type="text"
										name="PERSONAL_IDAES_D" id="PERSONAL_IDAES_D"
										class=" form-control
								<%:(bRequired)  ? "requiredInput":"" %>
							">
								</div>
							</div>
						</div>
						<%}%>


						<%  bDisplay = (FormModel != null && FormModel.PERSONAL_DOB_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.PERSONAL_DOB_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>出生⽇期</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div>
									<input type="text"
										name="PERSONAL_DOB_D" id="PERSONAL_DOB_D"
										class=" form-control
								<%:(bRequired)  ? "requiredInput":"" %>
							">
								</div>
							</div>
						</div>
						<%}%>

						 
						<%  bDisplay = (FormModel != null && FormModel.PERSONAL_WORK_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.PERSONAL_WORK_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>服務單位</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div>
									<input type="text"
										name="PERSONAL_WORK_D" id="PERSONAL_WORK_D"
										class=" form-control
								<%:(bRequired)  ? "requiredInput":"" %>
							">
								</div>
							</div>
						</div>
						<%}%>
						 

						<%  bDisplay = (FormModel != null && FormModel.PERSONAL_CONTACTNO_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.PERSONAL_CONTACTNO_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>聯絡電話</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<% if (bRequired)
									{ %>
								<div class="note">市話或⾏動電話請務必⾄少填寫⼀項</div>
								<% }  %>

								<div>⾏動電話格式：09XXXXXXXX</div>
								<div>
									<input type="text" placeholder="行動電話號碼"
										name="PERSONAL_CONTACTNO_D" id="PERSONAL_CONTACTNO_D"
										class=" form-control
									<%:(bRequired)  ? "requiredInput":"" %>
								">
									<div>市話</div>
									<div class="d-flex">
										<input type="text" size="20" maxlength="10"
											name="PERSONAL_AREACODE_D" id="PERSONAL_AREACODE_D"
											class=" form-control <%:(bRequired)  ? "requiredInput":"" %>" placeholder="區碼">
										<input type="text" name="PERSONAL_TELPHONE_D" id="PERSONAL_TELPHONE_D"
											class=" form-control <%:(bRequired)  ? "requiredInput":"" %>" placeholder="室內電話號碼">
									</div>
								</div>
							</div>
						</div>
						<%}%>

						 

						<%  bDisplay = (FormModel != null && FormModel.PERSONAL_EMAIL_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.PERSONAL_EMAIL_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>電⼦郵件信箱</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div>
									<input type="text"
										name="PERSONAL_EMAIL_D" id="PERSONAL_EMAIL_D"
										class=" form-control
							<%:(bRequired)  ? "requiredInput":"" %>
						">
									<div class="note font85">
										1.請正確填寫以利確認信寄達，並請
										於 2 小時內完成信件內點選連結驗證，未於時限內確認則取消報名。
									</div>
									<div class="note font85">
										2.若您使⽤免費信箱（例如：QQ、iCloud、pchome 信箱等）
，本署的回信可能被移⾄垃圾信件，或無法寄達，敬請留意。
									</div>
								</div>
							</div>
						</div>
						<%}%>

						 
						<%  bDisplay = (FormModel != null && FormModel.PERSONAL_TEACHERPROOF_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.PERSONAL_TEACHERPROOF_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>製作教師研習證明</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div class="form-control">
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input  
								<%:(bRequired)  ? "requiredInput":"" %>"
											id="PERSONAL_TEACHERPROOF_D1" name="PERSONAL_TEACHERPROOF_D" value="Y" checked>是
							<label class="form-check-label" for="PERSONAL_TEACHERPROOF_D1"></label>
									</div>
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input
								<%:(bRequired)  ? "requiredInput":"" %>"
											id="PERSONAL_TEACHERPROOF_D2" name="PERSONAL_TEACHERPROOF_D" value="N">否
							<label class="form-check-label" for="PERSONAL_TEACHERPROOF_D2"></label>
									</div>
								</div>
							</div>
						</div>
						<%}%>



						<%  bDisplay = (FormModel != null && FormModel.PERSONAL_TRAININGHOUR_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.PERSONAL_TRAININGHOUR_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>上傳公務⼈員訓練時數</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div class="form-control">
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input  
											<%:(bRequired)  ? "requiredInput":"" %>"
											id="PERSONAL_TRAININGHOUR_D1" name="PERSONAL_TRAININGHOUR_D" value="Y" checked>是
										<label class="form-check-label" for="PERSONAL_TRAININGHOUR_D1"></label>
									</div>
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input
											<%:(bRequired)  ? "requiredInput":"" %>"
											id="PERSONAL_TRAININGHOUR_D2" name="PERSONAL_TRAININGHOUR_D" value="N">否
										<label class="form-check-label" for="PERSONAL_TRAININGHOUR_D2"></label>
									</div>
								</div>
							</div>
						</div>
						<%}%>

						 
						<%  bDisplay = (FormModel != null && FormModel.PERSONAL_ATTEND_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.PERSONAL_ATTEND_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>參與⽅式</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div class="form-control">
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input  
								<%:(bRequired)  ? "requiredInput":"" %>"
											id="PERSONAL_ATTEND_D1" name="PERSONAL_ATTEND_D" value="Y" checked>是
							<label class="form-check-label" for="PERSONAL_ATTEND_D1"></label>
									</div>
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input
								<%:(bRequired)  ? "requiredInput":"" %>"
											id="PERSONAL_ATTEND_D2" name="PERSONAL_ATTEND_D" value="N">否
							<label class="form-check-label" for="PERSONAL_ATTEND_D2"></label>
									</div>
								</div>
							</div>
						</div>
						<%}%>

						<%  bDisplay = (FormModel != null && FormModel.PERSONAL_PIDAGREE_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.PERSONAL_PIDAGREE_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>個資使⽤同意證明</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div class="form-control">
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input  
					<%:(bRequired)  ? "requiredInput":"" %>"
											id="PERSONAL_PIDAGREE_D1" name="PERSONAL_PIDAGREE_D" value="Y" checked>是
				<label class="form-check-label" for="PERSONAL_PIDAGREE_D1"></label>
									</div>
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input
					<%:(bRequired)  ? "requiredInput":"" %>"
											id="PERSONAL_PIDAGREE_D2" name="PERSONAL_PIDAGREE_D" value="N">否
				<label class="form-check-label" for="PERSONAL_PIDAGREE_D2"></label>
									</div>
								</div>
							</div>
						</div>
						<%}%>



						<%  bDisplay = (FormModel != null && FormModel.PERSONAL_DIET_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.PERSONAL_DIET_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>餐飲習慣</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div class="form-control">
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input  
				<%:(bRequired)  ? "requiredInput":"" %>"
											id="PERSONAL_DIET_D1" name="PERSONAL_DIET_D" value="1" checked>無
										<label class="form-check-label" for="PERSONAL_DIET_D1"></label>
									</div>
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input
				<%:(bRequired)  ? "requiredInput":"" %>"
											id="PERSONAL_DIET_D2" name="PERSONAL_DIET_D" value="2">葷食
										<label class="form-check-label" for="PERSONAL_DIET_D2"></label>
									</div>
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input
<%:(bRequired)  ? "requiredInput":"" %>"
											id="PERSONAL_DIET_D3" name="PERSONAL_DIET_D" value="3">素食
									<label class="form-check-label" for="PERSONAL_DIET_D3"></label>
									</div>
								</div>
							</div>
						</div>
						<%}%>



						<%  bDisplay = (FormModel != null && FormModel.PERSONAL_MEMO_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.PERSONAL_MEMO_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>備註</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div class=" ">
									<input type="text"
										name="PERSONAL_MEMO_D" id="PERSONAL_MEMO_D"
										class=" form-control
									<%:(bRequired)  ? "requiredInput":"" %>
								">
								</div>
							</div>
						</div>
						<%}%>
						 
					</div>







					<div id="table_REG_TYPE2" class=" d-none  table_REG_TYPE ">


						<%  bDisplay = (FormModel != null
																	&& (FormModel.UNIT_INSUREDNO_D != null
																	|| FormModel.UNIT_HOSPNO_D != null
																	|| FormModel.UNIT_GUINO_D != null
																	|| FormModel.UNIT_INSUREDNO_OR_GUINO_D != null
																	|| FormModel.UNIT_ASSIGNEDNO_D != null))
																	? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_INSUREDNO_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<% if (FormModel.UNIT_INSUREDNO_D != null)
									{ %> <b>
									<label>投保單位代號</label></b> <% }  %>
								<% if (FormModel.UNIT_HOSPNO_D != null)
									{ %> <b>
									<label>醫療院所代號</label></b> <% }  %>
								<% if (FormModel.UNIT_GUINO_D != null)
									{ %> <b>
									<label>統⼀編號</label></b> <% }  %>
								<% if (FormModel.UNIT_INSUREDNO_OR_GUINO_D != null)
									{ %> <b>
									<label>投保單位代號或統⼀編號</label></b> <% }  %>
								<% if (FormModel.UNIT_ASSIGNEDNO_D != null)
									{ %> <b>
									<label>指定單位代號</label></b> <% }  %>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div>
									<input type="text"
										name="UNIT_INSUREDNO_D" id="UNIT_INSUREDNO_D"
										class=" form-control
					<%:(bRequired)  ? "requiredInput":"" %>
				">
								</div>
							</div>
						</div>
						<%}%>

						 


						<%  bDisplay = (FormModel != null && FormModel.UNIT_UNITNAME_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_UNITNAME_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>單位名稱</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div>
									<input type="text"
										name="UNIT_UNITNAME_D" id="UNIT_UNITNAME_D"
										class=" form-control
					<%:(bRequired)  ? "requiredInput":"" %>
				">
								</div>
							</div>
						</div>
						<%}%>

						<%  bDisplay = (FormModel != null && FormModel.UNIT_NAME_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_NAME_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>姓名</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div>
									<input type="text"
										name="UNIT_NAME_D" id="UNIT_NAME_D"
										class=" form-control
							<%:(bRequired)  ? "requiredInput":"" %>
						">
								</div>
							</div>
						</div>
						<%}%>


						<%  bDisplay = (FormModel != null && FormModel.UNIT_IDAES_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_IDAES_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>⾝分證號/居留證號</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div>
									<input type="text"
										name="UNIT_IDAES_D" id="UNIT_IDAES_D"
										class=" form-control
					<%:(bRequired)  ? "requiredInput":"" %>
				">
								</div>
							</div>
						</div>
						<%}%>


					 

						<%  bDisplay = (FormModel != null && FormModel.UNIT_JOBTITLE_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_JOBTITLE_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>職稱</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div>
									<input type="text"
										name="UNIT_JOBTITLE_D" id="UNIT_JOBTITLE_D"
										class=" form-control
							<%:(bRequired)  ? "requiredInput":"" %>
						">
								</div>
							</div>
						</div>
						<%}%>

						<%  bDisplay = (FormModel != null && FormModel.UNIT_CONTACTNO_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_CONTACTNO_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>聯絡電話</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<% if (bRequired)
									{ %>
								<div class="note">市話或⾏動電話請務必⾄少填寫⼀項</div>
								<% }  %>

								<div>⾏動電話格式：09XXXXXXXX</div>
								<div>
									<input type="text" placeholder="行動電話號碼"
										name="UNIT_CONTACTNO_D" id="UNIT_CONTACTNO_D"
										class=" form-control
									<%:(bRequired)  ? "requiredInput":"" %>
								">
									<div>市話</div>
									<div class="d-flex">
										<input type="text" size="20" maxlength="10"
											name="UNIT_AREACODE_D" id="UNIT_AREACODE_D"
											class=" form-control <%:(bRequired)  ? "requiredInput":"" %>" placeholder="區碼">
										<input type="text" name="UNIT_TELPHONE_D" id="UNIT_TELPHONE_D"
											class=" form-control <%:(bRequired)  ? "requiredInput":"" %>" placeholder="室內電話號碼">
									</div>
								</div>
							</div>
						</div>
						<%}%>


						<%  bDisplay = (FormModel != null && FormModel.UNIT_EMAIL_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_EMAIL_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>電⼦郵件信箱</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div>
									<input type="text"
										name="UNIT_EMAIL_D" id="UNIT_EMAIL_D"
										class=" form-control
							<%:(bRequired)  ? "requiredInput":"" %>
						">
									<div class="note font85">
										1.請正確填寫以利確認信寄達，並請
										於 2 小時內完成信件內點選連結驗證，未於時限內確認則取消報名。
									</div>
									<div class="note font85">
										2.若您使⽤免費信箱（例如：QQ、iCloud、pchome 信箱等）
，本署的回信可能被移⾄垃圾信件，或無法寄達，敬請留意。
									</div>
								</div>
							</div>
						</div>
						<%}%>

						<%  bDisplay = (FormModel != null && FormModel.UNIT_TEACHERPROOF_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_TEACHERPROOF_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>製作教師研習證明</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div class="form-control">
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input  
					<%:(bRequired)  ? "requiredInput":"" %>"
											id="UNIT_TEACHERPROOF_D1" name="UNIT_TEACHERPROOF_D" value="Y" checked>是
				<label class="form-check-label" for="UNIT_TEACHERPROOF_D1"></label>
									</div>
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input
					<%:(bRequired)  ? "requiredInput":"" %>"
											id="UNIT_TEACHERPROOF_D2" name="UNIT_TEACHERPROOF_D" value="N">否
				<label class="form-check-label" for="UNIT_TEACHERPROOF_D2"></label>
									</div>
								</div>
							</div>
						</div>
						<%}%>



						<%  bDisplay = (FormModel != null && FormModel.UNIT_TRAININGHOUR_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_TRAININGHOUR_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>上傳公務⼈員訓練時數</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div class="form-control">
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input  
								<%:(bRequired)  ? "requiredInput":"" %>"
											id="UNIT_TRAININGHOUR_D1" name="UNIT_TRAININGHOUR_D" value="Y" checked>是
							<label class="form-check-label" for="UNIT_TRAININGHOUR_D1"></label>
									</div>
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input
								<%:(bRequired)  ? "requiredInput":"" %>"
											id="UNIT_TRAININGHOUR_D2" name="UNIT_TRAININGHOUR_D" value="N">否
							<label class="form-check-label" for="UNIT_TRAININGHOUR_D2"></label>
									</div>
								</div>
							</div>
						</div>
						<%}%>
						 



						<%  bDisplay = (FormModel != null && FormModel.UNIT_ATTEND_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_ATTEND_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>參與⽅式</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div class="form-control">
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input  
								<%:(bRequired)  ? "requiredInput":"" %>"
											id="UNIT_ATTEND_D1" name="UNIT_ATTEND_D" value="Y" checked>是
							<label class="form-check-label" for="UNIT_ATTEND_D1"></label>
									</div>
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input
								<%:(bRequired)  ? "requiredInput":"" %>"
											id="UNIT_ATTEND_D2" name="UNIT_ATTEND_D" value="N">否
							<label class="form-check-label" for="UNIT_ATTEND_D2"></label>
									</div>
								</div>
							</div>
						</div>
						<%}%>

						<%  bDisplay = (FormModel != null && FormModel.UNIT_PIDAGREE_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_PIDAGREE_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>個資使⽤同意證明</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div class="form-control">
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input  
					<%:(bRequired)  ? "requiredInput":"" %>"
											id="UNIT_PIDAGREE_D1" name="UNIT_PIDAGREE_D" value="Y" checked>是
				<label class="form-check-label" for="UNIT_PIDAGREE_D1"></label>
									</div>
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input
					<%:(bRequired)  ? "requiredInput":"" %>"
											id="UNIT_PIDAGREE_D2" name="UNIT_PIDAGREE_D" value="N">否
				<label class="form-check-label" for="UNIT_PIDAGREE_D2"></label>
									</div>
								</div>
							</div>
						</div>
						<%}%>



						<%  bDisplay = (FormModel != null && FormModel.UNIT_DIET_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_DIET_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row      ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>餐飲習慣</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div class="form-control">
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input  
				<%:(bRequired)  ? "requiredInput":"" %>"
											id="UNIT_DIET_D1" name="UNIT_DIET_D" value="1" checked>無
										<label class="form-check-label" for="UNIT_DIET_D1"></label>
									</div>
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input
				<%:(bRequired)  ? "requiredInput":"" %>"
											id="UNIT_DIET_D2" name="UNIT_DIET_D" value="2">葷食
										<label class="form-check-label" for="UNIT_DIET_D2"></label>
									</div>
									<div class="form-check  form-check-inline">
										<input type="radio" class="form-check-input
<%:(bRequired)  ? "requiredInput":"" %>"
											id="UNIT_DIET_D3" name="UNIT_DIET_D" value="3">素食
									<label class="form-check-label" for="UNIT_DIET_D3"></label>
									</div>
								</div>
							</div>
						</div>
						<%}%>


						<%  bDisplay = (FormModel != null && FormModel.UNIT_MEMO_D != null) ? true : false; %>
						<% 	bRequired = (FormModel != null && FormModel.UNIT_MEMO_R != null) ? true : false; %>
						<% if (bDisplay)
							{%>
						<div class="   row ">
							<div class=" py-lg-3   col-lg-3  ">
								<% if (bRequired)
									{ %> <span class="note">*</span> <% }  %>
								<b>
									<label>備註</label></b>
							</div>
							<div class="  py-lg-3   col-lg-9  ">
								<div class=" ">
									<input type="text"
										name="UNIT_MEMO_D" id="UNIT_MEMO_D"
										class=" form-control
									<%:(bRequired)  ? "requiredInput":"" %>
								">
								</div>
							</div>
						</div>
						<%}%>
						 
					</div>





					<%--驗證碼--%>
					<div class="  row     ">
						<div class="     py-lg-3   col-lg-3    ">
							<span class="note">*</span><b><label> 驗證碼</label></b>
						</div>
						<div class="   py-lg-3    col-lg-9  ">
							<div class="row d-flex align-items-center ">
								<div class="col-sm-4">
									<input type="text" class=" form-control ">
								</div>

								<div class="col-sm-8">
									<div class=" d-flex  align-items-center my-1 my-sm-0">
										<div>
											<img class="img-fluid" src="Content/images/gdcode.jpg" alt="">
										</div>
										<div>
											<i class="fa-solid fa-arrows-rotate   fa-2x mx-2"></i>
										</div>
										<div>
											<i class="fa-solid fa-volume-high  fa-2x mx-2"></i>
										</div>
									</div>
								</div>
								<%--   <img src="Content/images/icon-reload.jpg"    alt="">
                            <img src="Content/images/icon-voice.jpg"    alt="">--%>
							</div>
						</div>
					</div>

				</div>
			</div>









			<%--  command buttons start--%>
			<div class="d-flex justify-content-between justify-content-md-center mx-2 my-5">
				<div>
					<a href="#" id="btnRegister"
						guid="<%:SESSIONGUID %>"
						data-target="ISRe0002.aspx/Process_RegisterForm"
						class="btn btn-primary-isre px-3 mx-1 mx-md-4 px-md-4 text-nowrap">送出
					</a>
				</div>

				<div>
					<a href="#" id="btnClear"
						class="btn btn-primary-isre  px-3 mx-1 mx-md-4 px-md-4 text-nowrap">清除</a>
				</div>
				<div>
					<a href="\isre0000.aspx" class="btn btn-primary-isre   mx-1 mx-md-4 px-md-4 text-nowrap">回首頁</a>
				</div>

			</div>

			<%--  command buttons end--%>
			<% }  %>
		</div>

		<%-- registration form end--%>
	</main>





	<script> 
 var SaveForm = function (btn) {
			let guid = btn.attr('guid');
			let target = btn.attr('data-target');
			let thisForm = btn.closest('form');
			thisForm.find('.requiredCheck').prop("disabled", false);
			///////////// collect form input collection
			let formData = new FormData(thisForm.get(0));
			formData.delete("__VIEWSTATEGENERATOR");
			formData.delete("__VIEWSTATE");
			///	console.log(formData);

			////// convert formdata to jsonstring
			var object = {};
			formData.forEach((value, key) => {
				// Reflect.has in favor of: object.hasOwnProperty(key) 
				if (!Reflect.has(object, key)) {
					object[key] = value;
					return;
				}
				if (!Array.isArray(object[key])) {
					object[key] = [object[key]];
				}
				object[key].push(value);
			});
			////////// json = formdata data in json format
			var json = JSON.stringify(object);
			//console.log(json);
			//return;
			$.ajax({
				url: target,
				data: JSON.stringify({ 'GUID': guid, 'formData': json }),
				dataType: 'json', // 預期從server接收的資料型態
				//   contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				contentType: 'application/json; charset=utf-8', // 要送到server的資料型態, webform required
				type: 'POST',
				caches: false,
				async: false,
				enctype: 'multipart/form-data',
				// contentType: false, // Not to set any content header  //formdata required
				//	processData: false, // Not to process data  //formdata required
				success: function (response, textStatus, jqXHR) {
					//thisForm.find('.requiredCheck').prop("disabled", true);
					//console.log('success');
					////var responseDOM = $(response);
					//console.log(response);
					//console.log(response.d);
					//if (response.d == null) {
					//	console.log('nogood');
					//}
					//else {
					//	AlertAndMove('報名表設定成功!  下一步: 場次傳送!');
					//}

					//AlertAndMove('報名表設定成功!', $('.display-1-5').first());

					//$("#flowStep").attr('data-slider-value', 2);
					//$("#flowStep").attr('data-slider-value', 2);
					//$("#flowStep").slider('refresh');
					//$('#flowStep').slider('setValue', 2);
					//$("#flowStep").slider().slider("value").val(2);
					//$("#flowStep").slider({
					//	value : 2
					//});
					//$('#flowStep').val(3);
					//$('#flowStep').slider('refresh');
				}
				, fail: function (jqXHR, textStatus, errorThrown) {
					console.log('fail');
					console.log(errorThrown);
				}
				, error: function (data) {
					console.log('error');
					console.log(data);
					console.log(data.responseText);
					console.log(data.status);
					console.log(data.statusText);
					jQuery('<div/>', {
						id: 'errorDiv'
					}).html(data.responseText).appendTo($('.footer')).hide();
					var msg = $('#errorDiv').find('title').text();
					$('#errorDiv').remove();
					alert(msg);
				}
				, done: function (data) {
					console.log('done');
					console.log(data);

				}

			});
		};

		$(function () {
			
		 //   $("#PERSONAL_DOB_D").datepicker($.datepicker.regional['zh-TW']);
			 
			$('#PERSONAL_DOB_D').datepicker($.extend({}, $.datepicker.regional['zh-TW'], {
				yearRange: "1942:2012"
			}));

			let rdoValue = $('input[name="rdoREG_TYPE"]:checked').val();
			//console.log(rdoValue);
			$('#table_REG_TYPE' + rdoValue).removeClass('d-none');


			$(document).on('click', 'input[name="rdoREG_TYPE"]', function (e) {
				 
				$('.table_REG_TYPE').addClass('d-none');
				$('#table_REG_TYPE' + $(this).val()).removeClass('d-none');
			})



			$(document).on('click', '#btnClear', function (e) {
				e.preventDefault();
				$('#cardInput').find('input[type=text]').val('');
			});


			$(document).on('click', '#btnRegister', function (e) {
				e.preventDefault();
				var btn = $(this);
				let thisForm = btn.closest('form');
				var requiredInput = $(thisForm).find('.table_REG_TYPE:visible').find('.requiredInput');
				console.log(requiredInput);
				 
				if (HasAllRequireValue(requiredInput) == false)
					return false;
				SaveForm($(this));
			});

		});
		 

	</script>
</asp:Content>
