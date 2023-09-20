<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRE0001.aspx.cs"
	Inherits="ISRE.ISRE0001" %>

<%--this page is for frontend activity and session list--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<%
		string GUID = Request.QueryString["GUID"] ?? "";  /////////GUID=activity guid
		string plan = Request.QueryString["plan"] ?? "";  /////////GUID=activity guid
	%>
	<style>
		.schedule td {
			padding: 4px;
		}
	</style>
	<main aria-labelledby="title">


		<div class="">
			<h3 class="text-center my-2">活動內容</h3>
			<%

				dynamic Activity = Process_ActivityInfo(GUID);
			%>
			<h5 class="text-center my-4">0524「東區第⼆、三類投保單位承保業務說明會」視訊會議</h5>


			<%-- @*banner*@--%>
			<div class="text-center">
				<img src="https://localhost:444/images/even-banner-img.png" alt="" width="100%">
			</div>

			<%-- @*活動說明*@--%>
			<div>
				<div class="card mt-4">
					<div class="card-header ">活動說明</div>
				</div>
				<div class="my-2 d-flex ">
					<ol>
						<li>為利⼆三類業務承辦⼈員熟悉健保承保法規與業務，本組特以Microsoft Teams軟
                                體辦理視訊說明會，採網路報名⾄5⽉19⽇截⽌。
						</li>
						<li>會議連結預計5⽉22⽇寄⾄您於報名網站登錄的電⼦郵件信箱，另將於5⽉23⽇
                                14:00~14:30召開測試會議，屆時請開啟郵件連結，以來賓⾝分登入並輸入【投保單位
                                代號+姓名】即可參與，務請撥宂參與測試。
						</li>
						<li>簡報資料預計5⽉23⽇上架，請⾄本報名系統下⽅之「活動資料」下載。</li>
						<li>說明會當⽇如遇颱風、豪雨或其他不可抗拒之因素，經轄區縣市政府宣布停班時，
                                說明會將延期辦理，本組將以報名網站登錄的電⼦郵件信箱另⾏通知。
						</li>
					</ol>
				</div>
			</div>

			<%-- @*參加對象*@--%>
			<div>
				<div class="card  mt-4">
					<div class="card-header ">參加對象</div>
				</div>
				<div class="my-2   font85  px-3">
					花蓮縣及台東縣⼆、三類投保單位業務承辦⼈員
				</div>
			</div>

			<%-- @*活動內容*@--%>
			<%
				if (plan == "a")
				{%>
			<div>
				<div class="card  mt-4">
					<div class="card-header ">活動內容</div>
				</div>
				<div class="my-2 px-3">
					<div>
						<div class=" d-flex justify-content-between justify-content-lg-start ">
							<div class="d-flex">
								<div class="">
									<span class="badge bg-info">112/06/24</span>
								</div>
								<div class="ms-2">
									(台北市)Microsoft Teams線上視訊會議  
								</div>
							</div>

							<div class=" ">
								<a href="#" class="btn-showSchedule  "
									data-bs-toggle="collapse"
									data-bs-target="#showSchedule">
									<i class="fa-solid fa-chevron-down   ms-1 ms-lg-4"></i>
								</a>

							</div>
						</div>

						<div id="showSchedule" class="ps-3 my-1   collapse table-responsive">
							<table class="schedule">
								<thead>
									<tr>
										<th class="time-td">時間</th>
										<th>活動內容</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="time-td">10:30~10:40</td>
										<td>主席致詞</td>
									</tr>
									<tr>
										<td class="time-td">10:40~10:50</td>
										<td>本署政策暨廉政業務宣導、「健保好夥伴。五恁真好」活動說明</td>
									</tr>
									<tr>
										<td class="time-td">10:50~11:20</td>
										<td>⼆三類承保業務說明</td>
									</tr>
									<tr>
										<td class="time-td">11:20~11:30</td>
										<td>休息</td>
									</tr>
									<tr>
										<td class="time-td">11:30~11:50</td>
										<td>⼆三類多憑證網路承保業務</td>
									</tr>
									<tr>
										<td class="time-td">11:50~12:00</td>
										<td>弱勢協助措施</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div>
						<div class=" d-flex justify-content-between justify-content-lg-start ">
							<div class="d-flex">
								<div class="">
									<span class="badge bg-info">112/07/24</span>
								</div>
								<div class="ms-2">
									(台北市)Microsoft Teams線上視訊會議  
								</div>
							</div>

							<div class=" ">
								<a href="#" class="btn-showSchedule  "
									data-bs-toggle="collapse"
									data-bs-target="#showSchedule2">
									<i class="fa-solid fa-chevron-down   ms-1 ms-lg-4"></i>
								</a>

							</div>
						</div>

						<div id="showSchedule2" class="ps-3 my-1   collapse table-responsive">
							<table class="schedule">
								<thead>
									<tr>
										<th class="time-td">時間</th>
										<th>活動內容</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="time-td">10:30~10:40</td>
										<td>主席致詞</td>
									</tr>
									<tr>
										<td class="time-td">10:40~10:50</td>
										<td>本署政策暨廉政業務宣導、「健保好夥伴。五恁真好」活動說明</td>
									</tr>
									<tr>
										<td class="time-td">10:50~11:20</td>
										<td>⼆三類承保業務說明</td>
									</tr>
									<tr>
										<td class="time-td">11:20~11:30</td>
										<td>休息</td>
									</tr>
									<tr>
										<td class="time-td">11:30~11:50</td>
										<td>⼆三類多憑證網路承保業務</td>
									</tr>
									<tr>
										<td class="time-td">11:50~12:00</td>
										<td>弱勢協助措施</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div>
						<div class=" d-flex justify-content-between justify-content-lg-start ">
							<div class="d-flex">
								<div class="">
									<span class="badge bg-info">112/08/24</span>
								</div>
								<div class="ms-2">
									(台北市)Microsoft Teams線上視訊會議  
								</div>
							</div>

							<div class=" ">
								<a href="#" class="btn-showSchedule  "
									data-bs-toggle="collapse"
									data-bs-target="#showSchedule3">
									<i class="fa-solid fa-chevron-down   ms-1 ms-lg-4"></i>
								</a>

							</div>
						</div>

						<div id="showSchedule3" class="ps-3 my-1   collapse table-responsive">
							<table class="schedule">
								<thead>
									<tr>
										<th class="time-td">時間</th>
										<th>活動內容</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td class="time-td">10:30~10:40</td>
										<td>主席致詞</td>
									</tr>
									<tr>
										<td class="time-td">10:40~10:50</td>
										<td>本署政策暨廉政業務宣導、「健保好夥伴。五恁真好」活動說明</td>
									</tr>
									<tr>
										<td class="time-td">10:50~11:20</td>
										<td>⼆三類承保業務說明</td>
									</tr>
									<tr>
										<td class="time-td">11:20~11:30</td>
										<td>休息</td>
									</tr>
									<tr>
										<td class="time-td">11:30~11:50</td>
										<td>⼆三類多憑證網路承保業務</td>
									</tr>
									<tr>
										<td class="time-td">11:50~12:00</td>
										<td>弱勢協助措施</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

					<div id="more" class=" collapse">
						<div>
							<div class=" d-flex justify-content-between justify-content-lg-start ">
								<div class="d-flex">
									<div class="">
										<span class="badge bg-info">112/09/24</span>
									</div>
									<div class="ms-2">
										(台北市)Microsoft Teams線上視訊會議  
									</div>
								</div>

								<div class=" ">
									<a href="#" class="btn-showSchedule  "
										data-bs-toggle="collapse"
										data-bs-target="#showSchedule4">
										<i class="fa-solid fa-chevron-down   ms-1 ms-lg-4"></i>
									</a>

								</div>
							</div>

							<div id="showSchedule4" class="ps-3 my-1   collapse table-responsive">
								<table class="schedule">
									<thead>
										<tr>
											<th class="time-td">時間</th>
											<th>活動內容</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="time-td">10:30~10:40</td>
											<td>主席致詞</td>
										</tr>
										<tr>
											<td class="time-td">10:40~10:50</td>
											<td>本署政策暨廉政業務宣導、「健保好夥伴。五恁真好」活動說明</td>
										</tr>
										<tr>
											<td class="time-td">10:50~11:20</td>
											<td>⼆三類承保業務說明</td>
										</tr>
										<tr>
											<td class="time-td">11:20~11:30</td>
											<td>休息</td>
										</tr>
										<tr>
											<td class="time-td">11:30~11:50</td>
											<td>⼆三類多憑證網路承保業務</td>
										</tr>
										<tr>
											<td class="time-td">11:50~12:00</td>
											<td>弱勢協助措施</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

						<div>
							<div class=" d-flex justify-content-between justify-content-lg-start ">
								<div class="d-flex">
									<div class="">
										<span class="badge bg-info">112/11/24</span>
									</div>
									<div class="ms-2">
										(台北市)Microsoft Teams線上視訊會議  
									</div>
								</div>

								<div class=" ">
									<a href="#" class="btn-showSchedule  "
										data-bs-toggle="collapse"
										data-bs-target="#showSchedule5">
										<i class="fa-solid fa-chevron-down   ms-1 ms-lg-4"></i>
									</a>

								</div>
							</div>

							<div id="showSchedule5" class="ps-3 my-1   collapse table-responsive">
								<table class="schedule">
									<thead>
										<tr>
											<th class="time-td">時間</th>
											<th>活動內容</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="time-td">10:30~10:40</td>
											<td>主席致詞</td>
										</tr>
										<tr>
											<td class="time-td">10:40~10:50</td>
											<td>本署政策暨廉政業務宣導、「健保好夥伴。五恁真好」活動說明</td>
										</tr>
										<tr>
											<td class="time-td">10:50~11:20</td>
											<td>⼆三類承保業務說明</td>
										</tr>
										<tr>
											<td class="time-td">11:20~11:30</td>
											<td>休息</td>
										</tr>
										<tr>
											<td class="time-td">11:30~11:50</td>
											<td>⼆三類多憑證網路承保業務</td>
										</tr>
										<tr>
											<td class="time-td">11:50~12:00</td>
											<td>弱勢協助措施</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
						<div>
							<div class=" d-flex justify-content-between justify-content-lg-start ">
								<div class="d-flex">
									<div class="">
										<span class="badge bg-info">112/12/24</span>
									</div>
									<div class="ms-2">
										(台北市)Microsoft Teams線上視訊會議  
									</div>
								</div>

								<div class=" ">
									<a href="#" class="btn-showSchedule  "
										data-bs-toggle="collapse"
										data-bs-target="#showSchedule6">
										<i class="fa-solid fa-chevron-down   ms-1 ms-lg-4"></i>
									</a>

								</div>
							</div>

							<div id="showSchedule6" class="ps-3 my-1   collapse table-responsive">
								<table class="schedule">
									<thead>
										<tr>
											<th class="time-td">時間</th>
											<th>活動內容</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td class="time-td">10:30~10:40</td>
											<td>主席致詞</td>
										</tr>
										<tr>
											<td class="time-td">10:40~10:50</td>
											<td>本署政策暨廉政業務宣導、「健保好夥伴。五恁真好」活動說明</td>
										</tr>
										<tr>
											<td class="time-td">10:50~11:20</td>
											<td>⼆三類承保業務說明</td>
										</tr>
										<tr>
											<td class="time-td">11:20~11:30</td>
											<td>休息</td>
										</tr>
										<tr>
											<td class="time-td">11:30~11:50</td>
											<td>⼆三類多憑證網路承保業務</td>
										</tr>
										<tr>
											<td class="time-td">11:50~12:00</td>
											<td>弱勢協助措施</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>

					</div>


				</div>

				<a id="btnMore" class="btn btn-link  px-3  "
					data-bs-toggle="collapse"
					data-bs-target="#more">More .....</a>



			</div>
			<%}
			%>



			<%--  @*主辦單位*@--%>
			<div>
				<div class="card  mt-4">
					<div class="card-header ">相關資訊</div>
				</div>
				<div class="my-2 px-3">
					<div class=" d-flex">
						<div class="">
							<span class="badge bg-info">主辦單位</span>
						</div>
						<div class="ms-2">承保服務科 </div>
					</div>
					<div class=" d-flex">
						<div class="">
							<span class="badge bg-info">協辦單位</span>
						</div>
						<div class="ms-2">協辦單位 </div>
					</div>
					<div class=" d-flex">
						<div class="">
							<span class="badge bg-info">洽詢專線</span>
						</div>
						<div class="ms-2">03-8332111轉1002梁⼩姐 (東區業務組承保服務科)</div>
					</div>
				</div>
			</div>


		</div>



		<%--session list title columns start --%>
		<div class="  card mt-4  d-none d-lg-block ">
			<div class="card-header ">
				<div class="row no-gutters  ">
					<div class=" col-lg-1 text-center ">
						<span>場次 </span>
					</div>
					<div class=" col-lg-2 text-center ">
						<span>日期時間</span>
					</div>
					<div class=" col-lg-1 text-center ">
						<span>地點</span>
					</div>
					<div class=" col-lg-2   text-center   ">
						<span>報名截⽌⽇</span>
					</div>
					<div class=" col-lg-1 text-center ">
						<span>活動資料</span>
					</div>
					<div class=" col-lg-1 text-center   ">
						<span>尚餘名額</span>
					</div>

					<div class=" col-lg-4 text-center ">
						<span>報名</span>
					</div>

				</div>
			</div>
		</div>

		<%-- session list title columns end--%>

		<%--session list start  --%>
		<%  
			dynamic sessions = Process_SessionList(GUID);
			foreach (var item in sessions)
			{
		%>


		<div class="border rounded my-1 py-1">
			<div class="    card m-1 border-end-0 border-top-0 border-bottom-0 border-start-0   ">
				<div class=" row no-gutters session ">
					<div class="col-12 col-lg-1 ">
						<div class="row no-gutters">
							<span class="d-lg-none col-4 col-sm-2   ">
								<span class="badge bg-info">場次</span>
							</span>
							<div class="col-8 col-lg-12 ">
								<div class="d-flex justify-content-lg-center">
									<%:item.SESS_Serial_NO??"" %>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-2 ">
						<div class="row no-gutters">
							<span class="d-lg-none  col-4   col-sm-2  ">
								<span class="badge bg-info">日期時間</span>
							</span>
							<div class="col-8 col-lg-12  text-center  ">
								<div class="d-flex justify-content-lg-center">112/08/31 </div>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-1 ">
						<div class="row no-gutters">
							<span class="d-lg-none  col-4  col-sm-2   ">
								<span class="badge bg-info">地點</span>
							</span>
							<div class="col-8 col-lg-12   text-center  ">
								<div class="d-flex justify-content-lg-center">台北市 </div>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-2 ">
						<div class="row no-gutters">
							<div class="d-lg-none  col-4  col-sm-2   ">
								<span class="badge bg-info">報名截⽌⽇</span>
							</div>
							<div class="col-8 col-lg-12  text-center  ">
								<div class="d-flex justify-content-lg-center">112/08/31  </div>
							</div>
						</div>
					</div>

					<div class="col-12 col-lg-1 ">
						<div class="row no-gutters">
							<div class="d-lg-none  col-4  col-sm-2   ">
								<span class="badge bg-info">活動資料</span>
							</div>
							<div class="col-8 col-lg-12 ">
								<div class="  text-center ">
									<div class="d-flex justify-content-lg-center">資料  </div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-lg-1 ">
						<div class="row no-gutters">
							<div class="d-lg-none  col-4  col-sm-2   ">
								<span class="badge bg-info">尚餘名額</span>
							</div>
							<div class="col-8 col-lg-12  text-center ">
								<div class="d-flex justify-content-lg-center">
									<div class="badge bg-warning">21</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-12  showSchedule collapse">
						<div class="row no-gutters">
							<%--	<div class="d-lg-none  col-12   ">
								<span class="badge bg-info">活動內容</span>
							</div>--%>
							<div class="  col-lg-12   ">

								<div class="p-2 m-2 col-12     table-responsive">
									<table class="schedule">
										<thead>
											<tr>
												<th class="time-td">時間</th>
												<th>活動內容</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class="time-td">10:30~10:40</td>
												<td>主席致詞</td>
											</tr>
											<tr>
												<td class="time-td">10:40~10:50</td>
												<td>本署政策暨廉政業務宣導、「健保好夥伴。五恁真好」活動說明</td>
											</tr>
											<tr>
												<td class="time-td">10:50~11:20</td>
												<td>⼆三類承保業務說明</td>
											</tr>
											<tr>
												<td class="time-td">11:20~11:30</td>
												<td>休息</td>
											</tr>
											<tr>
												<td class="time-td">11:30~11:50</td>
												<td>⼆三類多憑證網路承保業務</td>
											</tr>
											<tr>
												<td class="time-td">11:50~12:00</td>
												<td>弱勢協助措施</td>
											</tr>
										</tbody>
									</table>
								</div>


							</div>
						</div>
					</div>



					<div class="col-12 col-lg-4 mt-3 mt-lg-0 col-Command">
						<div class="row no-gutters  ">
							<div class="col d-flex justify-content-around">
								<% if (plan == "b")
									{ %>
								<div>
									<a class=" btn-showSchedule btn btn-primary-isre px-2">檢視議程 </a>
								</div>
								<%}
								%>

								<% if (sessions.Count == 1)
									{ %>
								<div>
									<a class="btn disabled px-3 btn-primary-isre text-nowrap mx-1 btn-SessionSingleRegister">額滿</a>
								</div>
								<% 	}
									else if (sessions.Count == 2)
									{%>
								<div>
									<a guid="<%:item.GUID %>"
										href="ISRE0002.aspx?guid=<%:item.GUID %>&RegisterMultiple=2"
										class="btn btn-danger text-nowrap mx-1  ">候補報名</a>
								</div>
								<% }
									else
									{ %>
								<div>
									<a guid="<%:item.GUID %>"
										href="ISRE0002.aspx?guid=<%:item.GUID %>&RegisterMultiple=0"
										class="btn btn-primary-isre text-nowrap mx-1  ">單人報名</a>
								</div>
								<div>
									<a guid="<%:item.GUID %>"
										href="ISRE0002.aspx?guid=<%:item.GUID %>&RegisterMultiple=1"
										class="btn btn-primary-isre text-nowrap mx-1  ">多人報名   </a>
								</div>
								<% 	}%>
							</div>
						</div>
					</div>


				</div>
			</div>

		</div>

		<%} %>

		<%--  session list end  --%>
	</main>
	<script> 

		$(document).ready(function () {

			$('#btnMore').on('click', function () {
				this.remove();
			});

			$('.btn-showSchedule').on('click', function () {
				console.log('here');
				let targetRow = $(this).closest('.session');
				let target = $(this).closest('.session').find('.showSchedule');
				let test = target.hasClass('collapse');
				if (test) {
					target.removeClass('collapse');
					var scrollTop = target == null ? 0 : target.offset().top;
					$('html, body').animate({
						scrollTop: scrollTop
					}, {
						// duration:1000,
						easing: 'swing',
						complete: function () {
							//obj.focus();
							//bFileInput
							//    ? obj.parent().parent().removeClass('border-4 border-danger').addClass('border-0')
							//    : obj.removeClass('border-4 border-danger');

						}
					});
					$(this).closest('.col-Command').removeClass('col-lg-4');
				}
				else {

					target.addClass('collapse');
					var scrollTop = targetRow == null ? 0 : targetRow.offset().top;
					$('html, body').animate({
						scrollTop: scrollTop
					}, {
						// duration:1000,
						easing: 'swing',
						complete: function () {
							//obj.focus();
							//bFileInput
							//    ? obj.parent().parent().removeClass('border-4 border-danger').addClass('border-0')
							//    : obj.removeClass('border-4 border-danger');

						}
					});
					$(this).closest('.col-Command').addClass('col-lg-4');
				}
				console.log(test);
				//$(this).closest('.session').find('.showSchedule').toggle();
			});

			//$('.btn-SessionSingleRegister').on('click', function () {
			//    console.log('here');
			//    var thisForm = this.closest('form');
			//    $('#RegisterMultiple').val(0);
			//    $(thisForm).attr('action', 'isre00002.aspx');
			//    $(thisForm).submit();
			//});
			//$('.btn-SessionMultipleRegister').on('click', function () {
			//    var thisForm = this.closest('form');
			//    $('#RegisterMultiple').val(1);
			//    $(thisForm).attr('action', 'isre00002.aspx');
			//    $(thisForm).submit();
			//});
			//var SearchResult = $('#SearchResult');
			//var thisForm = SearchResult.closest('form');
			//SearchResult.parent().find('form');

			//$(thisForm)
			//    .attr('data-ajax', 'true')
			//    .attr('data-ajax-method', 'GET')
			//    .attr('data-ajax-mode', 'replace')
			//    .attr('data-ajax-update', '#SearchResult')
			//    ;




		});

	</script>
</asp:Content>
