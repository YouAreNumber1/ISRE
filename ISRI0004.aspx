﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRI0004.aspx.cs"
	Inherits="ISRE.ISRI0004" %>

<%--this page is for backend to manage frontend registration form (show/required) --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	 
	<%
	String SESSIONGUID = Request.QueryString["SESSIONGUID"] ?? "";  /////////GUID=activity guid
 
	 
%>

	<main aria-labelledby="title">


		<div class=" my-2 ">
			<div id="ISRI_SessionFlow" runat="server">
				<!-- #Include virtual="ISRI_SessionFlow.aspx" -->
			</div>

			<div id="ActivityInfo" runat="server">
				<!-- #Include virtual="ISRI_ActivityInfo.aspx" -->
			</div>

			<div id="ISRI_SessionInfo" runat="server">
				<!-- #Include virtual="ISRI_SessionInfo.aspx" -->
			</div>



			<div id="RegistrationFormSetting" runat="server">
				<!-- #Include virtual="ISRI_RegistrationFormSetting.aspx" -->
			</div>

			 
			<div class="d-flex justify-content-center my-4">

				<button type="button" id="btn_Insert" guid="<%:SESSIONGUID %>"
					data-target="ISRI0004.aspx/Process_Test" 
					class="    px-4 py-2  me-5 mb-2 text-nowrap  btn-primary-isre btn ">
					<span>儲存</span>
				</button>
				<a href="#" class="btn btn-primary-isre    px-3 py-2  me-5 mb-2 ">回前頁</a>

			</div>



		</div>




	</main>
	
      <script>

$(document).ready(function () {
	var SaveForm = function ( btn) { 
		let id = btn.attr('id');
		let guid = btn.attr('guid'); 
		let target = btn.attr('data-target'); 
		let thisForm = btn.closest('form');
		let thisFormId = thisForm.attr('id');

		 let data = new FormData($('#' + thisFormId).get(0));
		//let data = new FormData(thisForm).get(0);
		// data.append('guid', guid);
		console.log(data);
		//var postData = { User: 'JOE', Phone: '0900222333' };
		// return;
		$.ajax({
			url: target,
			  data: data,
			//data: JSON.stringify({ 'postData': postData }),
		   // dataType: 'json', // 預期從server接收的資料型態
			//   contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
		    //contentType: 'application/json; charset=utf-8', // 要送到server的資料型態
			type: 'POST',
			 enctype: 'multipart/form-data',
			 caches: false,
			//async:true,
		  contentType: false, // Not to set any content header  //formdata required
		  	processData: false, // Not to process data  //formdata required
			success: function (response, textStatus, jqXHR) {
				console.log('success');
				var responseDOM = $(response);
				console.log(responseDOM);
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


	$('#btn_Insert').on('click', function () {
		SaveForm($(this));
        //$.ajax({
        //    type: "POST",
        //    url: url,
         
        //    data: "{postData:'1'}", 
        //  //  data: JSON.stringify({ 'postData': postData }),
        //    contentType: "application/json; charset=utf-8",
        //    dataType: "json",
        //    success: function (data) {
        //        console.log(data.d);
        //        //alert(data);
        //    }
        //});
    });
    var SearchResult = $('#SearchResult');
    var thisForm = SearchResult.closest('form');
    //SearchResult.parent().find('form');

    //$(thisForm)
    //    .attr('data-ajax', 'true')
    //    .attr('data-ajax-method', 'GET')
    //    .attr('data-ajax-mode', 'replace')
    //    .attr('data-ajax-update', '#SearchResult')
    //    ;

    //var w = $(window).width();
    //var actionUrl = (w <= 576) ? formAction_Mobile : formAction_Desktop;
    //$("#clientScreenWidth").val(w);
    /////////// event handler
    ////////// must be on last
    //console.log(thisForm);
   // alert('here');
   // thisForm.attr('action', actionUrl).submit();
  //  thisForm.submit();
   
   
});

 

	  </script>
</asp:Content>
