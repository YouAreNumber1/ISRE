<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRI0005.aspx.cs"
	Inherits="ISRE.ISRI0005" %>

<%--this page is for backend to manage   register --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<style>
		tr.searched {
			border: 4pt solid red;
		}

		.buttons-excel, .buttons-pdf {
			display: none;
		}

		 .ms20{
			 margin:0 0 0 20%;
		 }
	</style>
	<%
		string GUID = Request.QueryString["GUID"] ?? "";  /////////GUID=session guid 
		string plan = Request.QueryString["plan"] ?? "";
		string guest = Request.QueryString["guest"] ?? "";
	%>
	<script src="DataTable/datatables.js"></script>
	<main aria-labelledby="title">
		<div class=" my-2">

			<h3 class="text-center  ">活動內容</h3>
			<% 
				dynamic Activity = Process_ActivityInfoBySession(GUID);
			%>
			<%-- activity info summary start --%>
			<%-- activity info summary title start --%>
			<div class="    card p-2  my-2 d-none d-lg-block bg-ice    ">
				<div class="row text-center  ">
					<div class=" col-lg-3   text-start">
						活動主題  
					</div>
					<div class=" col-lg-3  ">
						⽇期 
					</div>
					<div class=" col-lg-1  ">
						總場次 
					</div>
					<div class=" col-lg-2    ">
						主辦單位 
					</div>
					<div class=" col-lg-3   ">
						發布⽇期 
					</div>

				</div>

			</div>
			<%-- activity info summary title end --%>
			<%-- activity info summary content start --%>
			<div class="    card p-2  my-2     ">
				<div class=" row    d-flex align-items-center ">
					<div class="col-12 col-sm-5 col-lg-3 ">
						<div class="row   ">
							<span class="d-lg-none col-3 col-sm-4   ">
								<span class="badge bg-info  ">活動主題</span>
							</span>
							<div class="col-9 col-sm-8 col-lg-12 ">
								<div>
									活動主題
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-sm-7 col-lg-3 ">
						<div class="row  d-flex align-items-center ">
							<span class="d-lg-none  col-3 col-sm-4    ">
								<span class="badge bg-info">⽇期</span>
							</span>
							<div class="col-9 col-sm-8 col-lg-12    ">
								<div class="d-flex justify-content-lg-center">112/08/31-112/09/30 </div>
							</div>
						</div>
					</div>
					<div class="col-12  col-sm-5  col-lg-1 ">
						<div class="row  d-flex align-items-center ">
							<span class="d-lg-none  col-3  col-sm-4  ">
								<span class="badge bg-info">總場次</span>
							</span>
							<div class="col-9 col-sm-8 col-lg-12   text-center  ">
								<div class="d-flex justify-content-lg-center">
									<div class="badge bg-warning">5</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12  col-sm-7  col-lg-2 ">
						<div class="row  d-flex align-items-center ">
							<div class="d-lg-none  col-3  col-sm-4   ">
								<span class="badge bg-info">主辦單位</span>
							</div>
							<div class="col-9 col-sm-8 col-lg-12  text-center  ">
								<div class="d-flex justify-content-lg-center">主辦單位 </div>
							</div>
						</div>
					</div>

					<div class="col-12  col-sm-5 col-lg-3 ">
						<div class="row  d-flex align-items-center ">
							<div class="d-lg-none  col-3  col-sm-4   ">
								<span class="badge bg-info">發布⽇期</span>
							</div>
							<div class="col-9 col-sm-8 col-lg-12 ">
								<div class="  text-center ">
									<div class="d-flex justify-content-lg-center">112/08/31  </div>
								</div>
							</div>
						</div>
					</div>


				</div>

			</div>
			<%-- activity info summary content end --%>
			<%--   activity info summary end--%>


			<div class="d-flex   justify-content-center my-4">
				<a href="#" id="btnVIP"
					class=" btn btn-primary-isre mx-2 mx-sm-4  px-4">VIP</a>
				<a href="#" id="btnOnsiteRegister"
					class=" btn btn-primary-isre mx-2 mx-sm-4  px-4">現場報名</a>
				<button type="button" id="btnQRcodePDF"
					class="btn btn-primary-isre mx-2 mx-sm-4 ">
					報名QRcode 
				</button>
				<%--	<a href="#" id="btnQRcode" class=" btn btn-primary-isre mx-2 mx-sm-4">報到QRcode  </a>
				--%>
				<a href="#" id="btnExportExcel"
					class="btn btn-primary-isre mx-2  mx-sm-4">匯出報名清單</a>
			</div>


			<%--session   start  --%>
			<h3 class="text-center mt-5 mb-2">場次資訊  </h3>
			<%  
				dynamic Model = Process_Session(GUID);

			%>

			<%--session   title columns start --%>
			<div class="  card p-2  my-2 d-none d-lg-block bg-ice      ">
				<div class="row text-center   d-flex align-items-center">
					<div class=" col-lg-1  ">
						場次  
					</div>
					<div class=" col-lg-2  ">
						日期時間 
					</div>
					<div class=" col-lg-1  ">
						地點 
					</div>
					<div class=" col-lg-1 ">
						主辦單位 
					</div>
					<div class=" col-lg-2      ">
						報名截⽌⽇ 
					</div>
					<div class=" col-lg-2     ">
						可報名⼈數 
					</div>
					<div class=" col-lg-2     ">
						已報名⼈數 
					</div>
					<div class=" col-lg-1    ">
						尚餘名額 
					</div>

				</div>
			</div>
			<%-- session   title columns end--%>

			<%-- session summary  content start --%>

			<div class="    card p-2  my-2     ">
				<div class=" row  d-flex align-items-center  ">
					<div class="col-12 col-sm-5  col-lg-1 ">
						<div class="row  d-flex align-items-center">
							<span class="d-lg-none  col-4 col-sm-5     ">
								<span class="badge bg-info">場次</span>
							</span>
							<div class=" col-8 col-sm-7    col-lg-12 ">
								<div class="d-flex justify-content-lg-center">
									4  
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 col-sm-7  col-lg-2 ">
						<div class="row  d-flex align-items-center">
							<span class="d-lg-none   col-4 col-sm-5     ">
								<span class="badge bg-info">日期時間</span>
							</span>
							<div class=" col-8 col-sm-7    col-lg-12  text-center  ">
								<div class="d-flex justify-content-lg-center">112/08/31 </div>
							</div>
						</div>
					</div>
					<div class="col-12 col-sm-5  col-lg-1 ">
						<div class="row  d-flex align-items-center">
							<span class="d-lg-none  col-4 col-sm-5      ">
								<span class="badge bg-info">地點</span>
							</span>
							<div class=" col-8 col-sm-7    col-lg-12   text-center  ">
								<div class="d-flex justify-content-lg-center">台北市 </div>
							</div>
						</div>
					</div>
					<div class="col-12 col-sm-7 col-lg-1 ">
						<div class="row  d-flex align-items-center">
							<span class="d-lg-none    col-4 col-sm-5      ">
								<span class="badge bg-info">主辦單位</span>
							</span>
							<div class=" col-8 col-sm-7    col-lg-12   text-center  ">
								<div class="d-flex justify-content-lg-center">台北市 </div>
							</div>
						</div>
					</div>
					<div class="col-12 col-sm-5 col-lg-2 ">
						<div class="row  d-flex align-items-center">
							<div class="d-lg-none   col-4 col-sm-5       ">
								<span class="badge bg-info">報名截⽌⽇</span>
							</div>
							<div class=" col-8 col-sm-7    col-lg-12  text-center  ">
								<div class="d-flex justify-content-lg-center">112/08/31  </div>
							</div>
						</div>
					</div>

					<div class="col-12 col-sm-7 col-lg-2 ">
						<div class="row  d-flex align-items-center">
							<div class="d-lg-none   col-4 col-sm-5     ">
								<span class="badge bg-info">可報名⼈數</span>
							</div>
							<div class=" col-8 col-sm-7    col-lg-12  text-center ">
								<div class="d-flex justify-content-lg-center">
									<div class="badge bg-primary">
										21
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-12 col-sm-5 col-lg-2 ">
						<div class="row  d-flex align-items-center">
							<div class="d-lg-none   col-4 col-sm-5      ">
								<span class="badge bg-info">已報名⼈數</span>
							</div>
							<div class="  col-8 col-sm-7    col-lg-12  text-center ">
								<div class="d-flex justify-content-lg-center">
									<div class="badge bg-success">
										7
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-12 col-sm-7 col-lg-1 ">
						<div class="row  d-flex align-items-center">
							<div class="d-lg-none   col-4 col-sm-5     ">
								<span class="badge bg-info">尚餘名額</span>
							</div>
							<div class="  col-8 col-sm-7     col-lg-12  text-center ">
								<div class="d-flex justify-content-lg-center">
									<div class="badge bg-dark">
										14
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<%-- session summary  content end --%>



			<%-- search bar start  --%>
			<% if (plan == "b")
				{%>
			<h3 class="text-center mt-5  ">報到工具  </h3>
			<div id="divTool" class="row g-1 sticky-top">
				<div class="  col-sm-6">
					<div class="card mb-1 h-100">
						<div class="card-header bg-success text-white">
							報到掃描區
						</div>
						<div class="card-body">
							<input id="scanQRcode" type="text" class="form-control">
						</div>
					</div>
				</div>
				<div class="  col-sm-6">
					<div class="card mb-1 h-100">
						<div class="card-header bg-success text-white">
							關鍵字查詢 (電話/電郵/姓名 )
						</div>
						<div class="card-body">
							<div class="d-flex">
								<input id="txtSearch" type="text" class="form-control">
								<a href="#" id="btnSearch"
									class=" text-nowrap ms-2 btn btn-primary-isre px-4 ">查詢</a>
							</div>

						</div>
					</div>
				</div>
			</div>

			<% }
				else
				{%>
			<div class="d-flex mt-5">
				<div class="text-nowrap">關鍵字：</div>
				<input type="text" class="form-control">
				<button class="text-nowrap btn btn-primary-isre mx-2">查詢</button>
			</div>

			<% }
			%>

			<%-- search bar end--%>





			<h3 class="text-center mt-5  ">報到人員管理  </h3>

			<% if (plan == "")
				{%>
			<!-- Nav tabs -->
			<ul class="nav nav-tabs nav-justified mt-1">

				<li class="nav-item  ">
					<div class="d-flex">
						<a class="nav-link active" data-bs-toggle="tab" href="#home">已報到
							  <span class="btn-primary-isre badge mx-1 mx-sm-2 ">9</span>
						</a>

					</div>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="tab" href="#menu1">未報到
						  <span class="bg-warning badge  mx-1 mx-sm-2">19</span>
					</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" data-bs-toggle="tab" href="#menu2">未確認
						  <span class="bg-danger badge  mx-1 mx-sm-2">29</span>
					</a>
				</li>


			</ul>



			<div class="tab-content">
				<!-- Tab panes 已報到-->
				<div class="tab-pane container active py-1 border" id="home">

					<div class="col m-2 ">最新報到⼈員：謝銀河 112/05/11 09:31</div>
					<div class="d-flex m-2">
						<div class="text-nowrap">報到掃描區：</div>
						<input type="text" class="form-control">
					</div>
					<div class="table-responsive">
						<table class="table table-striped" id="tblGroup1">
							<thead>
								<tr>
									<th>報名⽇期  </th>
									<th class="left">姓名  </th>
									<th>投保單位代號<br />
										單位名稱   </th>
									<th>連絡電話   	</th>
									<th class="left">電⼦郵件  </th>
									<th>餐飲習慣  </th>

									<th>報到時間  	</th>
									<th>編輯  </th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2023/05/11</td>
									<td>謝銀河</td>
									<td>12345678<br />
										資訊組</td>
									<td>0911222333</td>
									<td class="left">ga.yahoo.com</td>
									<td>葷食</td>

									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>黃必勝</td>
									<td>12345678<br />
										資訊組</td>

									<td>0911222333</td>
									<td class="left">galaxy.yahoo.com</td>
									<td>葷食</td>
									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>許明華</td>
									<td>12345678<br />
										資訊組</td>

									<td>0911222333</td>
									<td class="left">galaxy.yahoo.com</td>
									<td>葷食</td>
									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>謝銀河</td>
									<td>12345678<br />
										資訊組</td>
									<td>0911222333</td>
									<td class="left">ga.yahoo.com</td>
									<td>葷食</td>

									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>黃必勝</td>
									<td>12345678<br />
										資訊組</td>

									<td>0911222333</td>
									<td class="left">galaxy.yahoo.com</td>
									<td>葷食</td>
									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>許明華</td>
									<td>12345678<br />
										資訊組</td>

									<td>0911222333</td>
									<td class="left">galaxy.yahoo.com</td>
									<td>葷食</td>
									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>謝銀河</td>
									<td>12345678<br />
										資訊組</td>
									<td>0911222333</td>
									<td class="left">ga.yahoo.com</td>
									<td>葷食</td>

									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>黃必勝</td>
									<td>12345678<br />
										資訊組</td>

									<td>0911222333</td>
									<td class="left">galaxy.yahoo.com</td>
									<td>葷食</td>
									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>許明華</td>
									<td>12345678<br />
										資訊組</td>

									<td>0911222333</td>
									<td class="left">galaxy.yahoo.com</td>
									<td>葷食</td>
									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>謝銀河</td>
									<td>12345678<br />
										資訊組</td>
									<td>0911222333</td>
									<td class="left">ga.yahoo.com</td>
									<td>葷食</td>

									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>黃必勝</td>
									<td>12345678<br />
										資訊組</td>

									<td>0911222333</td>
									<td class="left">galaxy.yahoo.com</td>
									<td>葷食</td>
									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>許明華</td>
									<td>12345678<br />
										資訊組</td>

									<td>0911222333</td>
									<td class="left">galaxy.yahoo.com</td>
									<td>葷食</td>
									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>

				<!-- Tab panes 未報到-->
				<div class="tab-pane container fade py-1 border" id="menu1">

					<div class="table-responsive">
						<table class="table table-striped" id="tblGroup2">
							<thead>
								<tr>
									<th>報名⽇期  </th>
									<th>姓名  </th>
									<th>投保單位代號<br />
										單位名稱   </th>
									<th>連絡電話   	</th>
									<th class="left">電⼦郵件  </th>
									<th>餐飲習慣  </th>

									<th>報到時間  	</th>
									<th>編輯  </th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2023/05/11</td>
									<td>謝銀河</td>
									<td>12345678<br />
										資訊組</td>

									<td>0911222333</td>
									<td class="left">ga.yahoo.com</td>
									<td>葷食</td>

									<td>112/05/11 10:23</td>
									<td>
										<a href="" class="btn btn-primary-isre text-nowrap">編輯</a>

										<a href="#" class="btn btn-primary-isre text-nowrap">報到</a>

									</td>

								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>黃必勝</td>
									<td>12345678<br />
										資訊組</td>

									<td>0911222333</td>
									<td class="left">galaxy.yahoo.com</td>
									<td>葷食</td>
									<td>112/05/11 10:23</td>
									<td>
										<a href="" class="btn btn-primary-isre text-nowrap">編輯</a>

										<a href="#" class="btn btn-primary-isre text-nowrap">報到</a>

									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>許明華</td>
									<td>12345678<br />
										資訊組</td>

									<td>0911222333</td>
									<td class="left">galaxy.yahoo.com</td>
									<td>葷食</td>
									<td>112/05/11 10:23</td>
									<td>
										<a href="" class="btn btn-primary-isre text-nowrap">編輯</a>

										<a href="#" class="btn btn-primary-isre text-nowrap">報到</a>

									</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>

				<!-- Tab panes 未確認-->
				<div class="tab-pane container fade py-1 border" id="menu2">

					<div class="table-responsive">
						<table class="table table-striped" id="tblGroup3">
							<thead>
								<tr>
									<th>報名⽇期  </th>
									<th>姓名  </th>
									<th>投保單位代號<br />
										單位名稱   </th>
									<th>連絡電話   	</th>
									<th class="left">電⼦郵件  </th>
									<th>餐飲習慣  </th>

									<th>報到時間  	</th>
									<th>編輯  </th>

								</tr>
							</thead>
							<tbody>
								<tr>
									<td>2023/05/11</td>
									<td>謝銀河</td>
									<td>12345678<br />
										資訊組</td>

									<td>0911222333</td>
									<td class="left">ga.yahoo.com</td>
									<td>葷食</td>

									<td>112/05/11 10:23</td>

									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>黃必勝</td>
									<td>12345678<br />
										資訊組</td>
									<td>0911222333</td>
									<td class="left">galaxy.yahoo.com</td>
									<td>葷食</td>
									<td>112/05/11 10:23</td>

									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr>
									<td>2023/05/11</td>
									<td>許明華</td>
									<td>12345678<br />
										資訊組</td>
									<td>0911222333</td>
									<td class="left">galaxy.yahoo.com</td>
									<td>葷食</td>
									<td>112/05/11 10:23</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
							</tbody>
						</table>
					</div>

				</div>
			</div>
			<%}%>






			<% if (plan == "b")
				{%>
			<div class="card">
				<div class="card-header">
					<div class="d-flex justify-content-between align-items-center">
						<div>
							<button type="button" class="btn btn-info btn-label me-4 px-sm-4 mb-1">
								已報到 <span id="sumAttended" class="badge bg-success">24</span>
							</button>
							<button type="button" class="btn btn-info btn-label me-4 px-sm-4 mb-1">
								未報到 <span id="sumUnatended" class="badge bg-warning">164</span>
							</button>
							<button type="button" class="btn btn-info btn-label me-4 px-sm-4 mb-1">
								未確認 <span id="sumUnconfirm" class="badge bg-danger">20</span>
							</button>
							<a href="#" id="btnView" class="btn btn-info btn-label   me-4 px-sm-4 mb-1">
								<i class="fa-solid fa-eye-slash"></i>
							</a>
						</div>
						<div id="lastAttended">
							<div>最新報到⼈員 </div>
							<div>
								<span id="lastAttendant">謝銀河</span>
								<span id="lastAttendantDateTime">112/05/11 09:31</span>
							</div>
						</div>
					</div>

				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table id="tableList" class="table  table-sm">
							<thead>
								<tr>
									<th>報名⽇期  </th>
									<th class="left">姓名 </th>
									<th class="left">投保單位代號 
									</th>
									<th class="left">
										<div>單位名稱  </div>
									</th>
									<th class="left">連絡電話 </th>
									<th class="left">電⼦郵件</th>
									<th class="left">餐飲習慣</th>
									<th class="left">報到時間  	</th>
									<th>報到狀態</th>
									<th>編輯/報到</th>
								</tr>
							</thead>
							<tbody>
								<% if (guest == "")
									{%>
								<tr class="table-success">
									<td>2023/05/11</td>
									<td class="left">謝銀河  </td>
									<td class="left">12345678  </td>
									<td class="left">資訊組  </td>
									<td class="left">
										<div>0911222333</div>
									</td>
									<td class="left">
										<div>gatest2039.huang@yahoo.com</div>
									</td>
									<td class="left">葷食  </td>
									<td class="left">112/05/11<br>
										10:23</td>
									<td>
										<div class="badge bg-success">已報到</div>
									</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr class="table-warning">
									<td>2023/05/11</td>
									<td class="left">黃必勝 
									</td>
									<td class="left">12345678  </td>
									<td class="left">資訊組  </td>
									<td class="left">
										<div>0911222333</div>
									</td>
									<td class="left">
										<div>gatest2039.huang@yahoo.com</div>
									</td>
									<td class="left">葷食  </td>
									<td class="left">112/05/11<br>
										10:23</td>
									<td>
										<div class="badge bg-warning">未報到</div>
									</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr class=" ">
									<td>2023/05/11</td>
									<td class="left">許明華 
									</td>
									<td class="left">12345678  </td>
									<td class="left">資訊組  </td>
									<td class="left">
										<div>0911222333</div>
									</td>
									<td class="left">
										<div>gatest2039.huang@yahoo.com</div>
									</td>
									<td class="left">葷食  </td>
									<td class="left">112/05/11<br>
										10:23</td>
									<td>
										<div class="badge bg-danger">未確認</div>
									</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr class="table-success">
									<td>2023/05/11</td>
									<td class="left">謝銀河 
									</td>
									<td class="left">12345678  </td>
									<td class="left">資訊組  </td>
									<td class="left">
										<div>0911222333</div>
									</td>
									<td class="left">
										<div>gatest2039.huang@yahoo.com</div>
									</td>

									<td class="left">葷食  </td>
									<td class="left">112/05/11<br>
										10:23</td>
									<td>
										<div class="badge bg-success">已報到</div>
									</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr class="table-warning">
									<td>2023/05/11</td>
									<td class="left">黃必勝 
									</td>
									<td class="left">12345678  </td>
									<td class="left">資訊組  </td>
									<td class="left">
										<div>0911222333</div>
									</td>
									<td class="left">
										<div>gatest2039.huang@yahoo.com</div>
									</td>
									<td class="left">葷食  </td>
									<td class="left">112/05/11<br>
										10:23</td>
									<td>
										<div class="badge bg-warning">未報到</div>
									</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr class=" ">
									<td>2023/05/11</td>
									<td class="left">許明華 
									</td>
									<td class="left">12345678  </td>
									<td class="left">資訊組  </td>
									<td class="left">
										<div>0911222333</div>
									</td>
									<td class="left">
										<div>gatest2039.huang@yahoo.com</div>
									</td>
									<td class="left">葷食  </td>
									<td class="left">112/05/11<br>
										10:23</td>
									<td>
										<div class="badge bg-danger">未確認</div>
									</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr class="table-success">
									<td>2023/05/11</td>
									<td class="left">謝銀河 
									</td>
									<td class="left">12345678  </td>
									<td class="left">資訊組  </td>
									<td class="left">
										<div>0911222333</div>
									</td>
									<td class="left">
										<div>gatest2039.huang@yahoo.com</div>
									</td>

									<td class="left">葷食  </td>
									<td class="left">112/05/11<br>
										10:23</td>
									<td>
										<div class="badge bg-success">已報到</div>
									</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr class="table-warning">
									<td>2023/05/11</td>
									<td class="left">黃必勝 
									</td>
									<td class="left">12345678  </td>
									<td class="left">資訊組  </td>
									<td class="left">
										<div>0911222333</div>
									</td>
									<td class="left">
										<div>gatest2039.huang@yahoo.com</div>
									</td>
									<td class="left">葷食  </td>
									<td class="left">112/05/11<br>
										10:23</td>
									<td>
										<div class="badge bg-warning">未報到</div>
									</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<tr class=" ">
									<td>2023/05/11</td>
									<td class="left">許明華 
									</td>
									<td class="left">12345678  </td>
									<td class="left">資訊組  </td>
									<td class="left">
										<div>0911222333</div>
									</td>
									<td class="left">
										<div>gatest2039.huang@yahoo.com</div>
									</td>
									<td class="left">葷食  </td>
									<td class="left">112/05/11<br>
										10:23</td>
									<td>
										<div class="badge bg-danger">未確認</div>
									</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<%	}
									else
									{
										int guestNo = int.Parse(guest);
										string mobile6 = "096391";
										string mobile = "";
										string tableClass = "";
										string bgClass = ";";
										for (int i = 1; i <= guestNo; i++)
										{
											mobile = string.Concat("000", i.ToString());
											mobile = string.Concat(mobile6, mobile.Substring(mobile.Length - 4));
											tableClass = i > 50 ? "table-warning" : "";
											bgClass = i > 50 ? "bg-warning" : "bg-danger";
								%>
								<tr id="guid<%:mobile %>"
									class="<%:tableClass %>  "
									mobile="<%:mobile %>"
									name="來賓<%:i %>"
									email="guest<%:i %>.yahoo.com"
									status="<%: i<50 ? "0":"1" %>">
									<td>112/05/11</td>
									<td class="left">
										<div class="name">來賓<%:i %></div>
									</td>
									<td class="left">
										<div>12345678</div>

									</td>
									<td class="left">

										<div>資訊組</div>
									</td>
									<td class="left">
										<div class="mobile"><%:mobile %></div>
									</td>
									<td class="left">
										<div class="email">guest<%:i %>.yahoo.com</div>
									</td>
									<td class="left">
										<div>葷食</div>
									</td>
									<td class="left">
										<div class="attendDate"></div>
										<div class="attendTime"></div>
									</td>
									<td class="attendstatus">
										<% if (i < 50)
											{   %>
										<div class=" badge <%:bgClass %> ">未確認</div>
										<%	}
											else
											{ %>
										<div class="badge  <%:bgClass %> ">已確認</div>
										<% } %> 
									</td>
									<td>
										<a class="btn btnEdit btn-primary-isre text-nowrap mx-md-2 mb-1">編輯</a>
										<a class="btn btnAttend btn-primary-isre text-nowrap mx-md-2 mb-1">報到</a>
									</td>
								</tr>
								<%}
								%>


								<%
									} %>
							</tbody>

						</table>

					</div>

				</div>
			</div>
			<%}%>
		</div>

		<!-- The Modal -->
		<div class="modal" id="modalAttend">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">報到確認</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<div>Name: <span id="spName"></span></div>
						<div>Email: <span id="spEmail"></span></div>
						<div>Mobile: <span id="spMobile"></span></div>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer d-flex justify-content-between align-items-center">
						<button type="button" class="btn btn-light px-4" data-bs-dismiss="modal">取消</button>
						<button type="button" id="btnConfirm" class="btn btn-danger px-4">確認</button>
					</div>

				</div>
			</div>
		</div>


		<!-- The Modal -->
		<div class="modal" id="modalQRcode">
			<div class="modal-dialog modal-lg  modal-dialog-scrollable  modal-dialog-centered">
				<div class="modal-content ">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4>活動主題</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body   table-responsive">
						<table id="tablePDF" class="table table-borderless "  >
							<thead>
								<tr>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td></td>
									<td>活動主題</td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td>0524「東區第⼆、三類投保單位承保業務說明會」視訊會議  </td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td>
										<img class="img-fluid" src="Content/images/QR_Code.png" />
									</td>
									<td></td>
								</tr>
								<tr> 
									<td></td>
									<td  class="left " > <div class="ms20">活動日期：112/05/23</div>   </td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td class="left"><div class="ms20">活動時間：09:00~12:00</div> </td>
									<td></td>
								</tr>
								<tr> 
									<td></td>
									<td class="left">
										<div class="ms20">活動地點：(花蓮縣)MicrosoftTeams線上視訊會議-場次⼀</div></td>
									<td></td>
								</tr>
								<tr>
									<td></td>
									<td class="left"><div class="ms20">報到時間：112/05/23 08:30~112/05/23 12:00  </div></td>
									<td></td>
								</tr>
							</tbody>
						</table>


					</div>

					<!-- Modal footer -->
					<div class="modal-footer d-flex justify-content-between align-items-center">
						<button type="button" class="btn btn-primary-isre px-4" data-bs-dismiss="modal">Close</button>
						<button type="button" id="btnPDF" class="btn btn-primary  px-4">下載 PDF</button>

					</div>

				</div>
			</div>
		</div>

	</main>




	<script> 
		////// doing search job, return mobile/email/name matched tr
		var Process_Search = function (txtSearch) {
			let target = $('tr[mobile="' + txtSearch.trim() + '"]');
			if (target.length != 0) {  ////////// mobile   found 
				return target;
			}
			let target2 = $('tr[email="' + txtSearch.trim() + '"]');
			if (target2.length != 0) {  ////////// email   found 
				return target2;
			}
			let target3 = $('tr[name="' + txtSearch.trim() + '"]');
			if (target3.length != 0) {  ////////// name   found 
				return target3;
			}
			return null;
		};
		///////// Attend process
		var Process_Attend = function (trid) {
			////////// make ajax call here to connect db processing
			//////// after db process if successful
			//////// update status col and row class contextual
			let trTarget = $('tr[id="' + trid + '"');
			trTarget
				.removeClass('table-warning')
				.addClass('table-success')
				.find('.attendstatus').html('<div class="badge bg-success">已報到</div>');
			// update attendand and last attendant date/time
			let date = new Date();
			let attenddate = (date.getFullYear() - 1911)
				+ '/' + ('0' + (date.getMonth() + 1)).slice(-2)
				+ '/' + date.getDate();
			let attendtime = (date.getHours()) + ':' + ("0" + date.getUTCMinutes()).slice(-2);
			trTarget.find('.attendDate').html(attenddate);
			trTarget.find('.attendTime').html(attendtime);
			////////// make button disabled
			trTarget.find('.btnAttend')
				.addClass('disabled').removeClass('btnAttend');

			////////update last attend info 
			$('#lastAttendant').text(trTarget.attr('name'));
			$('#lastAttendantDateTime').text(attenddate + ' ' + attendtime);


			///////////update summary info
			let sumAttended = parseInt($('#sumAttended').text());
			let sumUnatended = parseInt($('#sumUnatended').text());
			let sumUnconfirm = parseInt($('#sumUnconfirm').text());
			$('#sumAttended').text(sumAttended + 1);
			(trTarget.attr('status') == '1')
				? $('#sumUnatended').text(sumUnatended - 1)
				: $('#sumUnconfirm').text(sumUnconfirm - 1);


			/////// update row status 
			trTarget.attr('status', '2');
			$("#modalAttend").modal('hide');
		};
		// Function to convert an img URL to data URL
		function getBase64FromImageUrl(url) {
			var img = new Image();
			img.crossOrigin = "anonymous";
			img.onload = function () {
				var canvas = document.createElement("canvas");
				canvas.width = this.width;
				canvas.height = this.height;
				var ctx = canvas.getContext("2d");
				ctx.drawImage(this, 0, 0);
				var dataURL = canvas.toDataURL("image/png");
				return dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
			};
			img.src = url;
		}
		$(document).ready(function () {

			$('#btnPDF').on('click', function (e) {
				e.preventDefault();
				if ($.fn.dataTable.isDataTable('#tablePDF')) { 
					let table = $('#tablePDF').DataTable();
					table.destroy(); 
				}


				let table = $('#tablePDF').DataTable({
					dom: 'Bfrtip', 
					buttons: [
						{
							//text: 'Custom PDF',
							extend: 'pdfHtml5',
							//filename: 'dt_custom_pdf',
							orientation: 'portrait',// 'landscape', //
							pageSize: 'A4', //A3 , A5 , A6 , legal , letter
							exportOptions: { 
								columns: ':visible',
								//search: 'applied',
								//order: 'applied'
							},
							customize: function (doc) {
								//Remove the title created by datatTables
								doc.content.splice(0, 1);
								//Create a date string that we use in the footer. Format is dd-mm-yyyy
								var now = new Date();
								var jsDate = now.getDate() + '-' + (now.getMonth() + 1) + '-' + now.getFullYear();
								// Logo converted to base64
								// var logo = getBase64FromImageUrl('https://datatables.net/media/images/logo.png');
								// The above call should work, but not when called from codepen.io
								// So we use a online converter and paste the string in.
								// Done on http://codebeautify.org/image-to-base64-converter
								// It's a LONG string scroll down to see the rest of the code !!!
								var logo = 'data:image/jpeg;base64,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ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA=';
								// A documentation reference can be found at
								// https://github.com/bpampuch/pdfmake#getting-started
								// Set page margins [left,top,right,bottom] or [horizontal,vertical]
								// or one number for equal spread
								// It's important to create enough space at the top for a header !!!
								doc.pageMargins = [80, 60, 80, 60];
								// Set the font size fot the entire document
								doc.defaultStyle.fontSize = 24;
								// Set the fontsize for the table header
								doc.styles.tableHeader.fontSize = 12;
								//doc.content[0].table.widths = ['5%', '*', '10%', '10%', '10%'];
								////////// table 3 columns
								 doc.content[0].table.widths = ['10%','*','10%'];
								/////////////// change data background color
								let data = table.column(2).data().toArray();
								for (var i = 0; i < data.length; i++) { 
									doc.content[0].table.body[i + 1][0].fillColor = '#fff';
									doc.content[0].table.body[i + 1][1].fillColor = '#fff';
									doc.content[0].table.body[i + 1][2].fillColor = '#fff';
									if (i < 2) {  ////// first 3 rows alignment center
										doc.content[0].table.body[i + 1][1].alignment = 'center';
									}
									else {
										//doc.content[0].table.body[i + 1][0].margin = [80, 0, 0, 0];  /// left, top, right, bottom
									}
								}

								 
								// Create a header object with 3 columns
								// Left side: Logo
								// Middle: brandname
								// Right side: A document title
								doc['header'] = (function () {
									return {
										columns: [{
											image: logo,
											width: 24
										},
										{
											alignment: 'left',
											italics: true,
											text: 'dataTables',
											fontSize: 18,
											margin: [10, 0]
										},
										{
											alignment: 'right',
											fontSize: 14,
											text: 'Custom PDF export with dataTables'
										}
										],
										margin: 20
									}
								});
								// Create a footer object with 2 columns
								// Left side: report creation date
								// Right side: current page and total pages
								doc['footer'] = (function (page, pages) {
									return {
										columns: [{
											alignment: 'left',
											text: ['Created on: ', {
												text: jsDate.toString()
											}]
										},
										{
											alignment: 'right',
											text: ['page ', {
												text: page.toString()
											}, ' of ', {
													text: pages.toString()
												}]
										}
										],
										margin: 20
									}
								});
								// Change dataTable layout (Table styling)
								// To use predefined layouts uncomment the line below and comment the custom lines below
							  //  doc.content[0].layout = 'lightHorizontalLines'; // noBorders , headerLineOnly
								//var objLayout = {};
								//objLayout['width'] = function (i) {
								//	return 800;
								//};
								//objLayout['backgroundColor'] = function (i) {
								//	return '#fff';
								//};
								//objLayout['hLineWidth'] = function (i) {
								//	return .5;
								//};
								//objLayout['vLineWidth'] = function (i) {
								//	return .5;
								//};
								//objLayout['hLineColor'] = function (i) {
								//	return '#fff';

								//	//return '#aaa';
								//};
								//objLayout['vLineColor'] = function (i) {
								//	return '#fff';
								//	//return '#aaa';
								//};
								//objLayout['paddingLeft'] = function (i) {
								//	return 4;
								//};
								//objLayout['paddingRight'] = function (i) {
								//	return 4;
								//};
								//doc.content[0].layout = objLayout;
							}
						}
					],
					'searching': false,
					'ordering': false,
					'paging': false,
					'info': false,
				});
				$('#tablePDF').parent().find('.buttons-pdf').click();

				 
			});



			$("#modalAttend").on('show.bs.modal', function () {
				let tr = $('tr[id="' + $("#modalAttend").attr('trid') + '"');
				$("#modalAttend").find('#spName').text(tr.attr('name'));
				$("#modalAttend").find('#spEmail').text(tr.attr('email'));
				$("#modalAttend").find('#spMobile').text(tr.attr('mobile'));
			});
			$("#modalAttend").on('hide.bs.modal', function () {
				$("#modalAttend").removeAttr(' trid ');
			});

			 
			$(document).on('blur', '#scanQRcode', function (e) {
				e.preventDefault();
				let txtSearch = $('#scanQRcode').val();
				if (txtSearch.trim().length == 0) return;
				let target = Process_Search(txtSearch);
				if (target == null) {
					alert('QRcode info not found!'); return;
				} else {
					let divToolHeight = $('#divTool').height();
					MoveTo(target, - divToolHeight);

					if (target.attr('status') != '2') {
						Process_Attend(target.attr('id'));
					}
				}

			});



			$(document).on('click', '#btnView', function (e) {
				e.preventDefault();
				if ($(this).children().hasClass('fa-eye-slash')) {
					$(this).children().removeClass('fa-eye-slash').addClass('fa-eye');
					$('.name').each(function () {
						// get element text
						var text = $(this).text();
						let char1 = text.substring(0, 1);
						let charLast = text.substring(text.length - 1); ///// to the end

						$(this).text(char1 + '*' + charLast);
					});
					$('.mobile').each(function () {
						// get element text
						var text = $(this).text();
						let char3 = text.substring(0, 3);
						let charLast3 = text.substring(text.length - 3); ///// to the end
						$(this).text(char3 + '***' + charLast3);
					});
					$('.email').each(function () {
						// get element text
						var text = $(this).text();
						let char3 = text.substring(0, 3);
						let charLast3 = text.substring(text.length - 3); ///// to the end
						$(this).text(char3 + '***' + charLast3);
					});
				}
				else {
					$(this).children().addClass('fa-eye-slash').removeClass('fa-eye');
					$('.name').each(function () {
						// get element text 
						$(this).text($(this).closest('tr').attr('name'));
					});
					$('.mobile').each(function () {
						// get element text 
						$(this).text($(this).closest('tr').attr('mobile'));
					});
					$('.email').each(function () {
						// get element text 
						$(this).text($(this).closest('tr').attr('email'));
					});
				}


			});

			$(document).on('click', '.btnAttend', function (e) {
				e.preventDefault();
				$("#modalAttend")
					.attr('trid', $(this).closest('tr').attr('id'))
					.modal('show');
			});

			$(document).on('click', '#btnConfirm', function (e) {
				e.preventDefault();
				let trid = $("#modalAttend").attr('trid');
				Process_Attend(trid);
			});


			$(document).on('click', '#btnQRcodePDF', function (e) {
				e.preventDefault();
				$("#modalQRcode").modal('show');
			});
			//$('#btnOnsiteRegister').on('click', function (e) {
			//	e.preventDefault();
			//	alert('產出空白完整報名表, 填完, 送出報到');
			//});
			//$('#btnQRcode').on('click', function (e) {
			//	e.preventDefault();
			//	alert('產出報到單, 輸入基本資料 (key information), 送出報到');
			//});
			$(document).on('click','#btnExportExcel', function (e) {
				e.preventDefault();
				 
				if ($.fn.dataTable.isDataTable('#tableList')) {
					let tableExcel = $('#tableList').DataTable();
					tableExcel.destroy();
				}

				$('#tableList').DataTable({
					dom: 'Bfrtip',
					buttons: [
						{
							extend: 'excelHtml5',
							text: 'Export Excel',
							exportOptions: {
								columns: [0, 1, 2, 3, 4, 5, 6, 7, 8]
							}
						} ,
						//{
						//	extend: 'pdfHtml5',
						//	text: 'Export pdf' 
						//} 
					],
					'searching': false,
					'ordering': false,
					'paging': false,
					'info': false,
				});
				$('#tableList').parent().find('.buttons-excel').click();

				//alert('匯出所有人員清單');
			});

		
			$(document).on('click','.btnReRegister', function (e) {
				e.preventDefault();
				alert('產出帶個資的報名表, 送出報名');
			});
			$(document).on('click', '#btnSearch', function (e) {
				e.preventDefault();

				let txtSearch = $('#txtSearch').val();
				if (txtSearch.trim().length == 0) return;
				let target = Process_Search(txtSearch);
				if (target == null) {
					alert('Not found!'); return;
				} else {
					let divToolHeight = $('#divTool').height();
					MoveTo(target, - divToolHeight);
				}
				return;
			});
		});

	</script>
</asp:Content>
