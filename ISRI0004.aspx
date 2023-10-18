<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRI0004.aspx.cs"
	Inherits="ISRE.ISRI0004" %>

<%--this page is for backend to manage frontend registration form (show/required) --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%-- <script src="Scripts/jquery-ui-custom/jquery-ui-custom.js"></script>--%>

	<%
		string SESSIONGUID = Request.QueryString["SESSIONGUID"] ?? "";  /////////GUID=activity guid

		string GUID = Request.QueryString["GUID"] ?? "";  /////////GUID=activity guid

	%>

	<main aria-labelledby="title">


		<div class=" my-2 ">


			<div id="ActivityInfo" runat="server">
				<!-- #Include virtual="ISRI_ActivityInfo.aspx" -->
			</div>
			<div id="ISRI_SessionFlow" runat="server">
				<!-- #Include virtual="ISRI_SessionFlow.aspx" -->
			</div>
			<div id="ISRI_SessionInfo" runat="server">
				<!-- #Include virtual="ISRI_SessionInfo.aspx" -->
			</div>


			 
       

		 

			<div id="RegistrationFormSetting" runat="server">
				<!-- #Include virtual="ISRI_RegistrationFormSetting.aspx" -->
			</div>


			<div class="d-flex justify-content-center my-4">

				<a href="#"   class="btn btn-primary-isre    px-3 py-2  me-5 mb-2 ">場次傳送</a>

				<a href="#" id="btnSave" guid="<%:SESSIONGUID %>"
					data-target="ISRI0004.aspx/Process_SettingForm"
					class="    px-4 py-2  me-5 mb-2 text-nowrap  btn-primary-isre btn ">
					<span>儲存</span>
				</a>
				<a href="ISRI0002.aspx?GUID=<%:GUID %>&SESSIONGUID=<%:SESSIONGUID %>" class="btn btn-primary-isre    px-3 py-2  me-5 mb-2 ">回前頁</a>

			</div>


		</div>




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
					thisForm.find('.requiredCheck').prop("disabled", true);
					console.log('success');
					//var responseDOM = $(response);
					console.log(response);
					console.log(response.d);
					if (response.d == null) {
						console.log('nogood');
					}
					else {
						AlertAndMove('報名表設定成功!  下一步: 場次傳送!');
					}

					 
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



		let CheckRules = function () {
			//let checked = $('#UNIT_INSUREDNO_R').is(":checked");
			/////////投保單位代號、醫療院所代號、統⼀編號、投保單位代號或統⼀編號、指定單位代號必須擇⼀填寫
			//if (checked) {
				var boxes = $('.display-1-5:checked');
				///console.log(boxes.length);
				if (boxes.length != 1) {
					AlertAndMove('投保單位代號、醫療院所代號、統⼀編號、投保單位代號或統⼀編號、指定單位代號必須擇⼀, 也只能擇一!!', $('.display-1-5').first());
					return -1;
				}
			//}

			return 0;
		};


		$(function () {

			let rdoValue = $('input[name="rdoREG_TYPE"]:checked').val();
			$('#table_REG_TYPE' + rdoValue).removeClass('d-none');

			$(document).on('click', 'input[name="rdoREG_TYPE"]', function (e) {
				$('.table_REG_TYPE').addClass('d-none');
				$('#table_REG_TYPE' + $(this).val()).removeClass('d-none');
			})

			$(document).on('click', '.display', function (e) {
				var box = $(this).is(":checked");
				if (!box) {
					$(this).closest('tr').find('.required').prop('checked', false);
				}
			})
			$(document).on('click', '.required', function (e) {
				var box = $(this).is(":checked");
				if (box) {
					$(this).closest('tr').find('.display').prop('checked', true);
				}
			})
			 

			$(document).on('click', '#btnSave', function (e) {
				e.preventDefault(); 
				if (CheckRules() != 0) {
					return false;
				} 
				var btn = $(this);
			 
				showModalAjax();

				$(document).delay(500).queue(function () {
					$(document).dequeue();
					SaveForm(btn);
				});
				 
			});


		});





	</script>
</asp:Content>
