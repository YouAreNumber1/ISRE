<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRE0004.aspx.cs"
	Inherits="ISRE.ISRE0004" %>

<%--this page is for USER CLICK ON confirm in email--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%   

		string GUID = Request["GUID"] ?? "";
		string CONFIRMKEY = Request["CONFIRMKEY"] ?? "";

	%>
	 
	 
	<main>
		<section >
			<div id="ISRI_SessionFlow" runat="server">
				<!-- #Include virtual="ISRI_RegistrationFlow.aspx" -->
			</div>
			<div class="d-flex justify-content-between justify-content-md-center mx-2 my-5">
				<% if (!bConfirmed)
					{  %>

				<a href="#" id="btnConfirm" guid="<%: GUID %>" confirmkey="<%: CONFIRMKEY %>"
					data-target="ISRE0004.aspx/Process_Confirm"
					class="btn btn-primary-isre px-3 mx-1 mx-md-4 px-md-4 text-nowrap">確認</a>
				<% }
					else
					{  %>
				<a class="btn btn-primary disabled">已確認</a>

				<% } %>
			</div>
		</section>



	</main>
	<script> 
		var SendMail = function (GUID) {
			$.ajax({
				url: "ISRE0004.aspx/Process_RegisterSuccessMail",
				data: JSON.stringify({ 'GUID': GUID }),
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
					AlertAndMove('確認成功!  請 check email for more information!');
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

		var SaveForm = function (btn) { 
			 
			let GUID = btn.attr('GUID');	//// TAKE  reg GUID
			let CONFIRMKEY = btn.attr('CONFIRMKEY');	//// TAKE  reg GUID
			let target = btn.attr('data-target');
			 
			 
			$.ajax({
				url: target,
				data: JSON.stringify({ 'GUID': GUID, 'CONFIRMKEY': CONFIRMKEY }),
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
					console.log(keys);
					var ROWCOUNTNO = response.d[keys.indexOf("ROWCOUNTNO")].Value;
					console.log(ROWCOUNTNO);
					if (ROWCOUNTNO > 0) {
						$("#flowStep").slider('setValue', 5);
						btn.removeAttr('id guid confirmkey').addClass('disabled');
						//SendMail(GUID);
						AlertAndMove('確認成功!  請 check email for more information!');
					}
					else { 
						AlertAndMove('確認失敗!');
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
		 
		$(function () {

			if ("<%:bConfirmed%>" == 'True') {
				$("#flowStep").slider('setValue', 5);
			}
			$(document).on('click', '#btnConfirm', function (e) {
				e.preventDefault();
				
				var btn = $(this);
				btn.addClass('disabled');
				showModalAjax();
				 
				$(document).delay(1000).queue(function () {
					$(document).dequeue();
					 SaveForm(btn);
				});
				
			});
		});


	</script>

</asp:Content>
