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

			<% 
				dynamic Activity = Process_ActivityInfoBySession(GUID);
			%>

			<!-- #include file="ActivityInfo.html" -->



			<%--session   start  --%>

			<%  
				dynamic Model = Process_Session(GUID);
			%>
			<!-- #include file="SessionInfo.html" -->


			<div class="mt-5">

				<h3 class="text-center">活動報名表</h3>
				 

				<div class="my-1 py-1">
					<div class="d-flex justify-content-center">
						<span>報名⾝分：</span>
						<div class="form-check  form-check-inline">
							<input type="radio" class="form-check-input " 
								id="REG_TYPE1" name="REG_TYPE" value="1" checked>個人
							<label class="form-check-label" for="REG_TYPE1"></label>
						</div>
						<div class="form-check  form-check-inline">
							<input type="radio" class="form-check-input " 
								id="REG_TYPE2" name="REG_TYPE" value="2">單位
							<label class="form-check-label" for="REG_TYPE2"></label>
						</div>
					</div>


					<div class="  ">
						<div class="row my-1 py-1  border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>欄位</label>
							</div>
							<div class="col-2 text-nowrap text-center">
								<label>顯示</label>
							</div>
							<div class="col-2  text-nowrap text-center">
								<label>必填</label>
							</div>
						</div>
						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8  ">
								<label>投保單位代號</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center ">
								<input type="checkbox">
							</div>
						</div>
						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>醫療院所代號</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>
						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>統⼀編號</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>
						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>投保單位代號或統⼀編號</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>

						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>指定單位代號</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>

						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>單位名稱</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>

						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>⾝分證號/居留證號</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>
						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>職稱</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>

						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>製作教師研習證明</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>

						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>上傳公務⼈員訓練時數</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>

						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>參與⽅式</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>

						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>個資使⽤同意證明</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>



						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>餐飲習慣</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>
						<div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
							<div class="col-8">
								<label>備註</label>
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
							<div class="col-2 text-center">
								<input type="checkbox">
							</div>
						</div>
					</div>
				</div>

			</div>









			<%--             <table class="table border table-registration">
                 <thead>
                     <tr>
                         <th>欄位</th>
                         <th>顯示</th>
                         <th>必填</th>
                     </tr>
                 </thead>
                 <tbody>
                     <tr>
                         <th class="note-g">投保單位代號</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td rowspan="5"><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                     </tr>
                     <tr>
                         <th class="note-g">醫療院所代號</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th class="note-g">統⼀編號</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th class="note-g">投保單位代號或統⼀編號</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th class="note-g">指定單位代號</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>單位名稱</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                    <%-- @*<tr>  must
                             <th>姓名</th>
                             <td><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                             <td><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                         </tr>*@ 
                     <tr>
                         <th>⾝分證號/居留證號</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>職稱</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                    <%-- @*<tr> must
                             <th>連絡電話</th>
                             <td><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                             <td><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                         </tr>
                         <tr>
                             <th>電⼦郵件信箱</th>
                             <td><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                             <td><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                         </tr>*@ 
                     <tr>
                         <th>製作教師研習證明</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>上傳公務⼈員訓練時數</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>參與⽅式</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>個資使⽤同意證明</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>餐飲習慣</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>備註</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                 </tbody>
             </table>
			--%>

			<div class="d-flex justify-content-center my-4">

				<button type="button" id="btn_Insert"
					class="    px-4 py-2  me-5 mb-2 text-nowrap  btn-primary-isre btn ">
					<span>儲存</span>
				</button>
				<a href="#" class="btn btn-primary-isre    px-3 py-2  me-5 mb-2 ">回前頁</a>

			</div>



		</div>




	</main>
	<script> 

		$(document).ready(function () {



		});

	</script>
</asp:Content>
