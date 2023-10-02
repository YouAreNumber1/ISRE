<%@    Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRI0009.aspx.cs"
	Inherits="ISRE.ISRI0009" %>

<%--this page is for frontend activity and session list--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%
		string GUID = Request.QueryString["GUID"] ?? "";  /////////GUID=activity guid 
	%>
	  
	 <div class="    card p-2  my-2   d-lg-block bg-ice    ">
				<div class="row text-center  ">
					<div class=" col-12 text-start">
						活動流程
       
					</div>
				</div>

			</div>


			<div class="mx-5">
				<input
					type="text"
					id="flowStep"
					data-provide="slider"
					data-slider-ticks="[1, 2, 3]"
					data-slider-ticks-labels='["<%:ISRE.Enum_ActivityFlow.Activity.GetDisplayName() %>", 
					"<%:ISRE.Enum_ActivityFlow.Session.GetDisplayName() %>",
					"<%:ISRE.Enum_ActivityFlow.RegistrationForm.GetDisplayName() %>",
					"<%:ISRE.Enum_ActivityFlow.Activate.GetDisplayName() %>"]'
					 
					data-slider-value="3"  
					data-slider-tooltip="hide"
					data-slider-enabled="false">
			</div>
</asp:Content>
