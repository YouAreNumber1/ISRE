<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRI0004.aspx.cs"
	Inherits="ISRE.ISRI0004" %>

<%--this page is for backend to manage frontend registration form (show/required) --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%
		string GUID = Request.QueryString["GUID"] ?? "";  /////////GUID=session guid 
		string ActioinName = (GUID == "") ? "新增" : "編輯";
	%>


	<main aria-labelledby="title">


		<div class=" my-2 ">


			<div id="RegistrationFormSetting" runat="server">
				<!-- #Include virtual="RegistrationFormSetting.aspx" -->
			</div>
			<% 
				dynamic Activity = Process_ActivityInfoBySession(GUID);
			%>





			<%--session   start  --%>

			<%  
				dynamic Model = Process_Session(GUID);
			%>
		 

 






			<div class="d-flex justify-content-center my-4">

				<button type="button" id="btn_Insert"
					class="    px-4 py-2  me-5 mb-2 text-nowrap  btn-primary-isre btn ">
					<span>儲存</span>
				</button>
				<a href="#" class="btn btn-primary-isre    px-3 py-2  me-5 mb-2 ">回前頁</a>

			</div>



		</div>




	</main>

</asp:Content>
