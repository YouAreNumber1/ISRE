<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRE0005.aspx.cs"
	Inherits="ISRE.ISRE0005" %>

<%--this page is for USER CLICK ON 報到 in email --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%   

		string GUID = Request["GUID"] ?? "";
		string CHECKINKEY = Request["CHECKINKEY"] ?? "";

	%>


	<main>
		<section>
			<div id="ISRI_SessionFlow" runat="server">
				<!-- #Include virtual="ISRI_RegistrationFlow.aspx" -->
			</div>
			<div class="d-flex justify-content-between justify-content-md-center mx-2 my-5">
				<% if (iCheckIn == 0)
					{  %>
				<a href="#" id="btnConfirm" guid="<%: GUID %>" checkinkey="<%: CHECKINKEY %>"
					data-target="ISRE0005.aspx/Process_Confirm"
					class="btn btn-primary-isre px-3 mx-1 mx-md-4 px-md-4 text-nowrap">報到</a>
				<% }
					else if (iCheckIn == -2)
					{  %>
				<a class="btn btn-primary disabled">已取消</a>

				<% }
					else  
					{  %>
				<a class="btn btn-primary disabled"><%: iCheckIn==1? "已報到" : "使用者不存在" %></a>

				<% } %>
			</div>
		</section>



	</main>
	<script> 


		var SaveForm = function (btn) {

			let GUID = btn.attr('GUID');	//// TAKE  reg GUID
			let CHECKINKEY = btn.attr('CHECKINKEY');	//// TAKE  reg GUID
			let target = btn.attr('data-target');


			$.ajax({
				url: target,
				data: JSON.stringify({ 'GUID': GUID, 'CHECKINKEY': CHECKINKEY }),
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
					///console.log(response);
					///// dynamic model returned
					var keys = response.d.map(function (o) { return o.Key; });
					//console.log(keys);

					let UserFound = response.d[keys.indexOf("UserFound")].Value;
					let UserStatus = response.d[keys.indexOf("UserStatus")].Value;
					let UserStatusAfter = response.d[keys.indexOf("UserStatusAfter")].Value;

					if (UserFound > 0) {
						if (UserStatus == UserStatusAfter) {
							AlertAndMove('已報到!');
						}
						else {
							btn.removeAttr('id guid CHECKINKEY').addClass('disabled');

							AlertAndMove('報到成功!');
						}
					}
					else {
						AlertAndMove('使用者不存在!');
					}
					///	var ROWCOUNTNO = response.d[keys.indexOf("ROWCOUNTNO")].Value;
					//console.log(ROWCOUNTNO);
					//if (ROWCOUNTNO > 0) { 
					//	btn.removeAttr('id guid CHECKINKEY').addClass('disabled');

					//	AlertAndMove('報到成功!');
					//}
					//else { 
					//	AlertAndMove('報到失敗!');
					//}

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
			if ("<%:iCheckIn%>" == 1) {
				$("#flowStep").slider('setValue', 5);
			}
			if ("<%:iCheckIn%>" <0  ) {
				$("#flowStep").slider('setValue', 1);
			}
			$(document).on('click', '#btnConfirm', function (e) {
				e.preventDefault();

				var btn = $(this);
				btn.addClass('disabled');
				showModalAjax();

				$(document).delay(500).queue(function () {
					$(document).dequeue();
					SaveForm(btn);
				});

			});
		});


	</script>

</asp:Content>
