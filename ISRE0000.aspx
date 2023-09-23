<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRE0000.aspx.cs"
	Inherits="ISRE.ISRE0000" %>

<%--this page is for frontend activity list--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%   
		//string colorName = ShowAssumptions.Items[ShowAssumptions.SelectedIndex].Text;
		//Response.Write(colorName);
		string sSelected = "";
		string SESS_LOC = Request["SESS_LOC"] ?? "";


		string OBJ_NO = Request["OBJ_NO"] ?? "";
		string ACT_TYPE = Request["ACT_TYPE"] ?? "";
		string ACT_NAME = Request["ACT_NAME"] ?? "";
		string ACT_HOST = Request["ACT_HOST"] ?? "";
		string ACT_DATE_S_DATE = Request["ACT_DATE_S_DATE"] ?? "";
		string ACT_DATE_E_DATE = Request["ACT_DATE_E_DATE"] ?? "";
		StringBuilder sb = new StringBuilder();
		bool bSearch = false;
		if (SESS_LOC != "" || OBJ_NO != "" || ACT_TYPE != "" || ACT_NAME != "" || ACT_HOST != "" || ACT_DATE_S_DATE != "" || ACT_DATE_E_DATE != "")
		{
			bSearch = true;
		}
	%>



	<%--<%: SESS_LOC  %>
<%: OBJ_NO  %>
<%: ACT_TYPE  %>
<%: ACT_NAME  %>
<%: ACT_HOST  %>
<%: ACT_DATE_S_DATE  %>
<%: ACT_DATE_E_DATE  %>--%>
	<% if (bSearch)
		{
			if (ACT_NAME != "")
			{
				sb.Append("<h6>活動名稱 <span class='");
				sb.Append("badge bg-secondary'>");
				sb.Append(ACT_NAME);
				sb.Append("</span></h6>");
			}
			//if (OBJ_NO != "")
			//{
			//	sb.Append("<h6>身分別 <span class='badge bg-secondary'>");
			//	sb.Append(OBJ_NO);
			//	sb.Append("</span></h6>");
			//}
			//if (ACT_TYPE != "")
			//{
			//	sb.Append("<h6>活動類別 <span class='badge bg-secondary'>");
			//	sb.Append(ACT_TYPE);
			//	sb.Append("</span></h6>");
			//}
			//if (ACT_NAME != "")
			//{
			//	sb.Append("<h6>活動名稱 <span class='badge bg-secondary'>");
			//	sb.Append(ACT_NAME);
			//	sb.Append("</span></h6>");
			//}
			//if (ACT_HOST != "")
			//{
			//	sb.Append("<h6>主辦單位 <span class='badge bg-secondary'>");
			//	sb.Append(ACT_HOST);
			//	sb.Append("</span></h6>");
			//}
			//if (ACT_DATE_S_DATE != "")
			//{
			//	sb.Append("<h6>活動時間起日 <span class='badge bg-secondary'>");
			//	sb.Append(ACT_DATE_S_DATE);
			//	sb.Append("</span></h6>");
			//}
			//if (ACT_DATE_S_DATE != "")
			//{
			//	sb.Append("<h6>活動時間迄日 <span class='badge bg-secondary'>");
			//	sb.Append(ACT_DATE_E_DATE);
			//	sb.Append("</span></h6>");
			//}
		}
	%>






	<main>
		<section>
			<div class="d-flex  justify-content-between align-items-center  ">
				<div class="d-none d-sm-block"></div>
				<div>
					<h3 class="text-center my-3">活動報名</h3>
				</div>
				<div class="mt-2">
					<a id="aFilter" href="#Filter" class=" btn btn-primary-isre  px-lg-4 "
						data-bs-toggle="collapse">查詢條件 
                            <i class="fa-solid fa-chevron-down  text-white"></i>
					</a>
				</div>
			</div>



			<div id="Filter" class="collapse ">
				<div class="card p-2  my-2">
					<div class="      row d-flex align-items-center ">
						<div class=" col-sm-6   col-lg-4">
							<div class="row d-flex align-items-center p-2">
								<div class="col-4  col-sm-5 ">

									<label class="text-nowrap">辦理縣市</label>

								</div>
								<div class="col-8  col-sm-7">

									<select name="SESS_LOC" id="SESS_LOC" class="form-control form-select">
										<option value="">請選擇</option>
										<% 

											dynamic List_CityList = StaticQueryDB("Home_ISRE_ACTIVITY_MAIN", "CityList");
											foreach (var item in List_CityList)
											{
												sSelected = (SESS_LOC.ToString() == item.CityNo.ToString()) ? "selected" : "";
										%>
										<option value="<%: item.CityNo %>" <%: sSelected %>><%: item.CityName %> </option>
										<%
											}
										%>
									</select>

								</div>
							</div>
						</div>

						<div class="  col-sm-6  col-lg-4">
							<div class="row d-flex align-items-center p-2">
								<div class="col-4 col-sm-5">

									<label class="text-nowrap">身分別</label>

								</div>
								<div class="col-8 col-sm-7">

									<select name="OBJ_NO" id="OBJ_NO" class="form-control form-select">
										<option value="">請選擇</option>
										<%  
											dynamic OBJ_NOList = StaticQueryDB("Home_ISRE_ACTIVITY_MAIN", "OBJ_NO");
											foreach (var item in OBJ_NOList)
											{
												sSelected = (OBJ_NO.ToString() == item.SerialID.ToString()) ? "selected" : "";
										%>
										<option value="<%: item.SerialID %>" <%: sSelected %>><%: item.OBJ_NO_NAME %> </option>
										<%
											}
										%>
									</select>

								</div>
							</div>
						</div>

						<div class="  col-sm-6    col-lg-4">
							<div class="row d-flex align-items-center p-2">
								<div class="col-4 col-sm-5">

									<label class="text-nowrap">活動類別</label>

								</div>
								<div class="col-8 col-sm-7">

									<select name="ACT_TYPE" id="ACT_TYPE" class="form-control form-select">
										<option value="">請選擇</option>
										<% 
											dynamic List_ACT_TYPE = StaticQueryDB("Home_ISRE_ACTIVITY_MAIN", "ACT_TYPE");
											foreach (var item in List_ACT_TYPE)
											{
												sSelected = (ACT_TYPE.ToString() == item.SerialID.ToString()) ? "selected" : "";
										%>
										<option value="<%: item.SerialID %>" <%: sSelected %>><%: item.TYPE_NAME%> </option>
										<%
											}
										%>
									</select>

								</div>
							</div>
						</div>
						<%--</div>

							<div class="      row  ">--%>
						<div class=" col-sm-6   col-lg-4">
							<div class="row d-flex align-items-center p-2">
								<div class="col-4 col-sm-5">

									<label class="text-nowrap">主辦單位</label>

								</div>
								<div class="col-8 col-sm-7">

									<input type="text" class="form-control" name="ACT_HOST" id="ACT_HOST"
										value="<%:  Request["ACT_HOST"] %>">
								</div>
							</div>
						</div>

						<div class="  col-sm-6  col-lg-4">
							<div class="row d-flex align-items-center p-2">
								<div class="col-4  col-sm-5 ">

									<label class="text-nowrap">活動名稱</label>

								</div>
								<div class="col-8  col-sm-7">

									<input type="text" class="form-control" name="ACT_NAME" id="ACT_NAME"
										value="<%:  Request["ACT_NAME"] %>">
								</div>
							</div>
						</div>


						<%--	</div>

							<div class=" row  ">--%>


						<div class=" col-sm-6   col-lg-4">
							<div class="row d-flex align-items-center p-2">
								<div class="col-4 col-sm-5">

									<label class="text-nowrap">活動起始日</label>

								</div>
								<div class="col-8 col-sm-7">

									<input type="text" id="ACT_DATE_S_DATE" name="ACT_DATE_S_DATE"
										class="form-control " placeholder="民國年/月/日"
										value="<%:  Request["ACT_DATE_S_DATE"] %>">
									<input type="hidden" id="ACT_DATE_S" name="ACT_DATE_S" />


								</div>
							</div>
						</div>



						<div class=" col-sm-6   col-lg-4">
							<div class="row d-flex align-items-center p-2">
								<div class="col-4 col-sm-5">

									<label class="text-nowrap">活動結束日</label>

								</div>
								<div class="col-8 col-sm-7">

									<input type="text" id="ACT_DATE_E_DATE" name="ACT_DATE_E_DATE"
										class="form-control " placeholder="民國年/月/日"
										value="<%:  Request["ACT_DATE_E_DATE"] %>">
									<input type="hidden" id="ACT_DATE_E" name="ACT_DATE_E" />

								</div>
							</div>
						</div>
						 
						<div class="  d-lg-none  col-sm-6 col-lg-4">
							<div class="row d-flex align-items-center p-2">
								<div class="col-4 col-sm-5">

									<label class="text-nowrap">排序</label>

								</div>
								<div class="col-8 col-sm-7">

									<select class="form-control form-select">
										<option>活動主題</option>
										<option>日期時間</option>
										<option>發布⽇期</option>
									</select>

								</div>
							</div>
						</div>

					</div>
				</div>
				<div class="card-footer d-flex justify-content-center m-4">
					<button type="submit" class="btn btn-primary-isre px-5 text-nowrap">
						查詢   <i class="fa-solid fa-magnifying-glass text-white"></i>
					</button>
				</div>
			</div>


			 
		</section>

		 

		<% if (bSearch)
			{ %>
		<div class="card mb-2">
			<div class="card-body">
				<span class="   ">查詢條件</span>
				<div class="badge bg-secondary">台北市</div>
				<div class="badge bg-secondary">一般民眾</div>
				<div class="badge bg-secondary">健康促進活動</div>
				<div class="badge bg-secondary">QRCode</div>
				<div class="badge bg-secondary">健保局</div>
				<div class="badge bg-secondary">112/04/30</div>
				<div class="badge bg-secondary">112/06/30</div>

				<%  if (ACT_NAME != "")
					{ %>
				<h6>活動名稱 <span class="badge bg-secondary"><%: ACT_NAME %>   </span></h6>
				<% } %>
				<%  if (ACT_HOST != "")
					{ %>
				<h6>主辦單位 <span class="badge bg-secondary"><%: ACT_HOST %>   </span></h6>
				<% } %>
				 
			 
			</div>
		</div>
		<%	}%>

		<%	if (bSearch)
			{%>
		<h5 class="my-2  text-center">查詢結果</h5>
		<%		} %>



		<div class="  card  d-none d-lg-block ">
			<div class="card-header ">
				<div class="row  d-flex align-items-center   text-center ">
					<div class=" col-lg-4 text-start">
						活動主題
						 
					</div>
					<div class=" col-lg-3">
						日期  
					</div>
					<div class=" col-lg-1">
						尚餘名額 
					</div>
					<div class=" col-lg-2    ">
						發布⽇期
                    <i class="fas fa-long-arrow-alt-down mx-1 color-isre "></i>

					</div>
					<div class=" col-lg-2">
					</div>

				</div>
			</div>
		</div>

		<% 
			dynamic List_Activities = Process_ActivityList(1, 1);
			foreach (var item in List_Activities)
			{
		%>
		<%-- card p-2  my-2 , no header, body as standard --%>
		<div class="     card p-2  my-2 ">

			<div class=" row  d-flex align-items-center ">
				<div class="col-12 col-lg-4 ">
					<div class="row  ">
						<span class="d-lg-none col-4 col-sm-2   ">
							<span class="badge bg-info">活動主題</span>
						</span>
						<span class="col-8 col-sm-10">
							<%:item.ACT_NAME %> 
						</span>
					</div>
				</div>
				<div class="col-12 col-lg-3 ">
					<div class="row  d-flex align-items-center  ">
						<span class="d-lg-none  col-4   col-sm-2  ">
							<span class="badge bg-info">日期 </span>
						</span>
						<div class="col-8 col-sm-10 col-lg-12 ">
							<div class=" d-block d-lg-flex   justify-content-lg-center">
								<div class=" ">112/08/31 - 112/12/31 </div>
							</div>
						</div>


					</div>
				</div>
				<div class="col-12 col-lg-1   ">
					<div class="row   d-flex align-items-center ">
						<div class="d-lg-none  col-4  col-sm-2   ">
							<div class="badge bg-info">尚餘名額</div>
						</div>
						<div class="col-8 col-sm-10 col-lg-12 ">
							<div class=" d-flex  d-lg-block">
								<div class="text-center">
									<div class="badge bg-primary">
										120
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-lg-2 ">
					<div class="row   d-flex align-items-center ">
						<div class="d-lg-none  col-4  col-sm-2   ">
							<div class="badge bg-info">發布⽇期</div>
						</div>
						<div class="col-8 col-sm-10 col-lg-12 ">
							<div class="  d-block d-lg-flex   justify-content-lg-center">
								<div class=" ">112/08/31 </div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-lg-2 mt-3 mt-lg-0">
					<div class="row  d-flex align-items-center  ">
						<div class="col d-flex justify-content-around">
							<div class="d-flex">
								<%-- <a href="/isre0001.aspx?guid=this&multiple=1"  class="btn btn-primary-isre text-nowrap mx-1"> 查場次  </a> --%>
								<a href="ISRE0001.aspx?GUID=<%:item.GUID %>"
									class="btn btn-primary-isre text-nowrap mx-1 px-3">檢視場次<span class="d-lg-none badge bg-warning mx-1"><%:item.TotalSessionNo %></span>

								</a>
							</div>
						</div>

					</div>
				</div>

			</div>
			 
		</div>


		<% } %>


		<%-- <div id="test"  >test test</div>--%>
	</main>

	<script> 
		$(document).ready(function () {

			$("#ACT_DATE_S_DATE, #ACT_DATE_E_DATE").datepicker($.datepicker.regional['zh-TW']);

			$(".collapse").on('show.bs.collapse', function () {
				$('#aFilter').children().addClass('fa-chevron-up').removeClass('fa-chevron-down');
			});

			$(".collapse").on('hide.bs.collapse', function () {
				$('#aFilter').children().addClass('fa-chevron-down').removeClass('fa-chevron-up');
			});
		});



	</script>
</asp:Content>
