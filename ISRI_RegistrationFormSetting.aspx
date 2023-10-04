<%-- THIS IS SUB PAGE FOR SESSION REGISTRATION FORM SETTING --%>


<%
	String SESSIONGUID = Request.QueryString["SESSIONGUID"] ?? "";  /////////GUID=activity guid
	String ActioinName = (SESSIONGUID == "") ? "新增" : "編輯";
	string sSelected = "";
	ISRE.ISRE_SESSION_MAIN Model = Process_SessionRegForm(SESSIONGUID);
%>

<h3 class="text-center mt-5">活動報名表</h3>
<div class="my-1 py-1">

	<div class="d-flex justify-content-center">
		<span>報名⾝分：</span>
		<div class="form-check  form-check-inline">
			<input type="radio" class="form-check-input rdoREG_TYPE"
				id="rdoREG_TYPEl" name="rdoREG_TYPE" value="1" checked>個人
			<label class="form-check-label" for="rdoREG_TYPEl"></label>
		</div>
		<div class="form-check  form-check-inline">
			<input type="radio" class="form-check-input rdoREG_TYPE"
				id="rdoREG_TYPE2" name="rdoREG_TYPE" value="2">單位
			<label class="form-check-label" for="rdoREG_TYPE2"></label>
		</div>
	</div>



	<table class=" d-none table_REG_TYPE  table border  " id="table_REG_TYPE1">
		<thead>
			<tr>
				<th class="left">欄位</th>
				<th>顯示</th>
				<th>必填</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="left">姓名</td>
				<td>
					<input id="PERSONAL_NAME_D" name="PERSONAL_NAME_D" value="1"
						type="checkbox" checked class="requiredCheck display" disabled>
				</td>
				<td>
					<input id="PERSONAL_NAME_R" name="PERSONAL_NAME_R" value="1"
						type="checkbox" checked class="requiredCheck required" disabled>
				</td>
			</tr>
			<tr>
				<td class="left">⾝分證號/居留證號</td>
				<td>
					<input id="PERSONAL_IDAES_D" name="PERSONAL_NAME_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="PERSONAL_IDAES_R" name="PERSONAL_NAME_R" value="1"
						type="checkbox" class="required ">
				</td>

			</tr>
			<tr>
				<td class="left">出生⽇期</td>
				<td>
					<input id="PERSONAL_DOB_D" name="PERSONAL_DOB_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="PERSONAL_DOB_R" name="PERSONAL_DOB_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>


			<tr>
				<td class="left">服務單位</td>
				<td>
					<input id="PERSONAL_WORK_D" name="PERSONAL_WORK_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="PERSONAL_WORK_R" name="PERSONAL_WORK_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">連絡電話</td>
				<td>
					<input id="PERSONAL_CONTACTNO_D" name="PERSONAL_CONTACTNO_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="PERSONAL_CONTACTNO_R" name="PERSONAL_CONTACTNO_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">電⼦郵件信箱</td>
				<td>
					<input id="PERSONAL_EMAIL_D" name="PERSONAL_EMAIL_D" value="1"
						type="checkbox" checked class="requiredCheck display" disabled>
				</td>
				<td>
					<input id="PERSONAL_EMAIL_R" name="PERSONAL_EMAIL_R" value="1"
						type="checkbox" checked class="requiredCheck required" disabled>
				</td>
			</tr>
			<tr>
				<td class="left">製作教師研習證明</td>
				<td>
					<input id="PERSONAL_TEACHERPROOF_D" name="PERSONAL_TEACHERPROOF_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="PERSONAL_TEACHERPROOF_R" name="PERSONAL_TEACHERPROOF_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">上傳公務⼈員訓練時數</td>
				<td>
					<input id="PERSONAL_TRAININGHOUR_D" name="PERSONAL_TRAININGHOUR_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="PERSONAL_TRAININGHOUR_R" name="PERSONAL_TRAININGHOUR_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">參與⽅式</td>
				<td>
					<input id="PERSONAL_ATTEND_D" name="PERSONAL_ATTEND_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="PERSONAL_ATTEND_R" name="PERSONAL_ATTEND_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">個資使⽤同意證明</td>
				<td>
					<input id="PERSONAL_PIDAGREE_D" name="PERSONAL_PIDAGREE_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="PERSONAL_PIDAGREE_R" name="PERSONAL_PIDAGREE_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">餐飲習慣</td>
				<td>
					<input id="PERSONAL_DIET_D" name="PERSONAL_DIET_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="PERSONAL_DIET_R" name="PERSONAL_DIET_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">備註</td>
				<td>
					<input id="PERSONAL_MEMO_D" name="PERSONAL_MEMO_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="PERSONAL_MEMO_R" name="PERSONAL_MEMO_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
		</tbody>
	</table>




	<table class="d-none table_REG_TYPE  table border   caption-top" id="table_REG_TYPE2">
		<caption class="ps-2">註：投保單位代號、醫療院所代號、統⼀編號、投保單位代號或統⼀編號、指定單位代號必須擇⼀填寫。</caption>
		<thead>
			<tr>
				<th class="left">欄位</th>
				<th>顯示</th>
				<th>必填</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td class="left">投保單位代號</td>
				<td>
					<input id="UNIT_INSUREDNO_D" name="UNIT_INSUREDNO_D" value="1"
						type="checkbox" class="display display-1-5">
				</td>
				<td rowspan="5" class="border">
					<input id="UNIT_INSUREDNO_R" name="UNIT_INSUREDNO_R" value="1"
						type="checkbox" checked class="requiredCheck required" disabled>
				</td>
			</tr>
			<tr>
				<td class="left">醫療院所代號</td>
				<td>
					<input id="UNIT_HOSPNO_D" name="UNIT_HOSPNO_D" value="1"
						type="checkbox" class=" display display-1-5">
				</td>
			</tr>
			<tr>
				<td class="left">統⼀編號</td>
				<td>
					<input id="UNIT_GUINO_D" name="UNIT_GUINO_D" value="1"
						type="checkbox" class=" display display-1-5">
				</td>
			</tr>
			<tr>
				<td class="left">投保單位代號或統⼀編號</td>
				<td>
					<input id="UNIT_INSUREDNO_OR_GUINO_D" name="UNIT_INSUREDNO_OR_GUINO_D" value="1"
						type="checkbox" class=" display display-1-5">
				</td>
			</tr>
			<tr>
				<td class="left">指定單位代號</td>
				<td>
					<input id="UNIT_ASSIGNEDNO_D" name="UNIT_ASSIGNEDNO_D" value="1"
						type="checkbox" class=" display display-1-5">
				</td>
			</tr>
			<tr>
				<td class="left">單位名稱</td>
				<td>
					<input id="UNIT_UNITNAME_D" name="UNIT_UNITNAME_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="UNIT_UNITNAME_R" name="UNIT_UNITNAME_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">姓名</td>
				<td>
					<input id="UNIT_NAME_D" name="UNIT_NAME_D" value="1"
						type="checkbox" class="requiredCheck display" disabled>
				</td>
				<td>
					<input id="UNIT_NAME_R" name="UNIT_NAME_R" value="1"
						type="checkbox" class="requiredCheck required " disabled>
				</td>
			</tr>
			<tr>
				<td class="left">⾝分證號/居留證號</td>
				<td>
					<input id="UNIT_IDAES_D" name="UNIT_IDAES_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="UNIT_IDAES_R" name="UNIT_IDAES_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">職稱</td>
				<td>
					<input id="UNIT_JOBTITLE_D" name="UNIT_JOBTITLE_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="UNIT_JOBTITLE_R" name="UNIT_JOBTITLE_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">連絡電話</td>
				<td>
					<input id="UNIT_CONTACTNO_D" name="UNIT_CONTACTNO_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="UNIT_CONTACTNO_R" name="UNIT_CONTACTNO_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">電⼦郵件信箱</td>
				<td>
					<input id="UNIT_EMAIL_D" name="UNIT_EMAIL_D" value="1"
						type="checkbox" checked class="requiredCheck display" disabled>
				</td>
				<td>
					<input id="UNIT_EMAIL_R" name="UNIT_EMAIL_R" value="1"
						type="checkbox" checked class="requiredCheck required" disabled>
				</td>
			</tr>
			<tr>
				<td class="left">製作教師研習證明</td>
				<td>
					<input id="UNIT_TEACHERPROOF_D" name="UNIT_TEACHERPROOF_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="UNIT_TEACHERPROOF_R" name="UNIT_TEACHERPROOF_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">上傳公務⼈員訓練時數</td>
				<td>
					<input id="UNIT_TRAININGHOUR_D" name="UNIT_TRAININGHOUR_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="UNIT_TRAININGHOUR_R" name="UNIT_TRAININGHOUR_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">參與⽅式</td>
				<td>
					<input id="UNIT_ATTEND_D" name="UNIT_ATTEND_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="UNIT_ATTEND_R" name="UNIT_ATTEND_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">個資使⽤同意證明</td>
				<td>
					<input id="UNIT_PIDAGREE_D" name="UNITL_PIDAGREE_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="UNIT_PIDAGREE_R" name="UNIT_PIDAGREE_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">餐飲習慣</td>
				<td>
					<input id="UNIT_DIET_D" name="UNIT_DIET_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="UNIT_DIET_R" name="UNIT_DIET_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
			<tr>
				<td class="left">備註</td>
				<td>
					<input id="UNIT_MEMO_D" name="UNIT_MEMO_D" value="1"
						type="checkbox" class=" display">
				</td>
				<td>
					<input id="UNIT_MEMO_R" name="UNIT_MEMO_R" value="1"
						type="checkbox" class="required ">
				</td>
			</tr>
		</tbody>
	</table>


</div>

<script>


	$(document).ready(function () {


	});

</script>
