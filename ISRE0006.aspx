<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRE0006.aspx.cs"
	Inherits="ISRE.ISRE0006" %>

<%--this page is for USER CLICK ON CANCEL in email --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%   

		string GUID = Request["GUID"] ?? "";
		string CANCELKEY = Request["CANCELKEY"] ?? "";

	%>
	 
	 
	<main>
		<section >
			<div id="ISRI_SessionFlow" runat="server">
				<!-- #Include virtual="ISRI_RegistrationFlow.aspx" -->
			</div>
			<div class="d-flex justify-content-between justify-content-md-center mx-2 my-5">
				<% if (!bCancelled)
					{  %>

				<a href="#" id="btnConfirm" guid="<%: GUID %>" CANCELKEY="<%: CANCELKEY %>"
					data-target="ISRE0006.aspx/Process_Confirm"
					class="btn btn-primary-isre px-3 mx-1 mx-md-4 px-md-4 text-nowrap">取消</a>
				<% }
					else
					{  %>
				<a class="btn btn-primary disabled">已取消</a>

				<% } %>
			</div>
		</section>



	</main>
	<script>  
		var SaveForm = function (btn) { 
			 
			let GUID = btn.attr('GUID');	//// TAKE  reg GUID
			let CANCELKEY = btn.attr('CANCELKEY');	//// TAKE  reg GUID
			let target = btn.attr('data-target');
			 
			 
			$.ajax({
				url: target,
				data: JSON.stringify({ 'GUID': GUID, 'CANCELKEY': CANCELKEY }),
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
					var ROWCOUNTNO = response.d[keys.indexOf("ROWCOUNTNO")].Value;
					//console.log(ROWCOUNTNO);
					if (ROWCOUNTNO > 0) {
						 
						btn.removeAttr('id guid CANCELKEY').addClass('disabled');
						//SendMail(GUID);
						AlertAndMove('取消成功!');
					}
					else { 
						AlertAndMove('取消失敗!');
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
