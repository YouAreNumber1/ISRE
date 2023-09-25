<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRI0005.aspx.cs"
	Inherits="ISRE.ISRI0005" %>

<%--this page is for backend to manage   register --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

	<style>
		.table td {
			text-align: center;
			vertical-align: central;
		}

			.table td.left, th.left {
				text-align: left;
			}

		table {
			border-collapse: collapse;
		}

		tr.searched {
			border: 4pt solid black;
		}
	</style>
	<%
		string GUID = Request.QueryString["GUID"] ?? "";  /////////GUID=session guid 
		string plan = Request.QueryString["plan"] ?? "";
		string guest = Request.QueryString["guest"] ?? "";
	%>

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
				<a href="#" id="btnOnsiteRegister" class=" btn btn-primary-isre mx-2 mx-sm-4  px-4">現場報名</a>
				<a href="#" id="btnQRcode" class=" btn btn-primary-isre mx-2 mx-sm-4">報到QRcode  </a>
				<a href="#" id="btnExport" class="btn btn-primary-isre mx-2  mx-sm-4">匯出報名清單</a>
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
				<div class="col-md-6">
					<div class="card mb-1">
						<div class="card-header bg-success text-white">
							報到掃描區
						</div>
						<div class="card-body">
							<input id="scanQRcode" type="text" class="form-control">
						</div>
					</div>
				</div>
				<div class="col-md-6">
					<div class="card mb-1">
						<div class="card-header bg-success text-white">
							關鍵字查詢 (電話/電⼦郵件/姓名 )
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
								已報到 <span id="spanSumAttended" class="badge bg-success">24</span>
							</button>
							<button type="button" class="btn btn-info btn-label me-4 px-sm-4 mb-1">
								未報到 <span id="spanSumUnatended" class="badge bg-warning">164</span>
							</button>
							<button type="button" class="btn btn-info btn-label me-4 px-sm-4 mb-1">
								未確認 <span id="spanSumUnconfirm" class="badge bg-danger">20</span>
							</button>
							<button type="button" class="btn btn-info btn-label me-4 px-sm-4 mb-1">
				  <i class="fa-solid fa-eye-slash"></i>
</button>
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
						<table class="table  table-sm">
							<thead>
								<tr>
									<th>報名⽇期  </th>
									<th class="left">姓名<div>餐飲習慣</div>
									</th>
									<th class="left">投保單位代號<div>單位名稱  </div>
									</th>
									<th class="left">連絡電話<div>電⼦郵件</div>
									</th>
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
									<td class="left">謝銀河<div>葷食</div>
									</td>
									<td class="left">12345678<div>資訊組</div>
									</td>
									<td class="left">
										<div>0911222333</div>
										<div>ga.yahoo.com</div>
									</td>

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
									<td class="left">黃必勝<div>葷食</div>
									</td>
									<td class="left">12345678<div>資訊組</div>
									</td>
									<td class="left">
										<div>0911222333</div>
										<div>ga.yahoo.com</div>
									</td>

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
									<td class="left">許明華<div>葷食</div>
									</td>
									<td class="left">12345678<div>資訊組</div>
									</td>
									<td class="left">
										<div>0911222333</div>
										<div>ga.yahoo.com</div>
									</td>

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
									<td class="left">謝銀河<div>葷食</div>
									</td>
									<td class="left">12345678<div>資訊組</div>
									</td>
									<td class="left">
										<div>0911222333</div>
										<div>ga.yahoo.com</div>
									</td>


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
									<td class="left">黃必勝<div>葷食</div>
									</td>
									<td class="left">12345678<div>資訊組</div>
									</td>
									<td class="left">
										<div>0911222333</div>
										<div>ga.yahoo.com</div>
									</td>

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
									<td class="left">許明華<div>葷食</div>
									</td>
									<td class="left">12345678<div>資訊組</div>
									</td>
									<td class="left">
										<div>0911222333</div>
										<div>ga.yahoo.com</div>
									</td>

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
									<td class="left">謝銀河<div>葷食</div>
									</td>
									<td class="left">12345678<div>資訊組</div>
									</td>

									<td class="left">
										<div>0911222333</div>
										<div>ga.yahoo.com</div>
									</td>


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
									<td class="left">黃必勝<div>葷食</div>
									</td>
									<td class="left">12345678<div>資訊組</div>
									</td>
									<td class="left">
										<div>0911222333</div>
										<div>ga.yahoo.com</div>
									</td>

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
									<td class="left">許明華<div>葷食</div>
									</td>
									<td class="left">12345678
										<div>資訊組</div>
									</td>
									<td class="left">
										<div>0911222333</div>
										<div>ga.yahoo.com</div>
									</td>
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
										<div>來賓<%:i %></div>
										<div>葷食</div>
									</td>
									<td class="left">
										<div>12345678</div>
										<div>資訊組</div>
									</td>
									<td class="left">
										<div><%:mobile %></div>
										<div>guest<%:i %>.yahoo.com</div>
									</td>
									<td class="left">
										<div class="AttendDate"></div>
										<div class="AttendTime"></div>
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

	</main>




	<script> 

		$(document).ready(function () {
			$("#modalAttend").on('show.bs.modal', function () {
				$("#modalAttend").find('#spName').text($("#modalAttend").attr('name'));
				$("#modalAttend").find('#spEmail').text($("#modalAttend").attr('email'));
				$("#modalAttend").find('#spMobile').text($("#modalAttend").attr('mobile'));
			});
			$("#modalAttend").on('hide.bs.modal', function () {
				$("#modalAttend").removeAttr('name email mobile guid status');
			});


			$(document).on('click', '.btnAttend', function (e) {
				e.preventDefault();
				$("#modalAttend").attr('name', $(this).closest('tr').attr('name'));
				$("#modalAttend").attr('email', $(this).closest('tr').attr('email'));
				$("#modalAttend").attr('mobile', $(this).closest('tr').attr('mobile'));
				$("#modalAttend").attr('status', $(this).closest('tr').attr('status'));
				$("#modalAttend").attr('guid', $(this).closest('tr').attr('id'));
				$("#modalAttend").modal('show');
			});

			$(document).on('click', '#btnConfirm', function (e) {
				e.preventDefault();
				let guid = $("#modalAttend").attr('guid');
				let status = $("#modalAttend").attr('status');
				let name = $("#modalAttend").attr('name');
				//////// update status col and row class 
				$('#' + guid)
					.removeClass('table-warning')
					.addClass('table-success')
					.find('.attendstatus').html('<div class="badge bg-success">已報到</div>');
				// update attend date/time
				let date = new Date();
				let attenddate = (date.getFullYear() - 1911)
					+ '/' + '0' + (date.getMonth() + 1)
					+ '/' + date.getDate();
				let attendtime = (date.getHours()) + ':' + (date.getMinutes());
				$('#' + guid).find('.AttendDate').html(attenddate);
				$('#' + guid).find('.AttendTime').html(attendtime);
				$('#' + guid).find('.btnAttend')
					.addClass('disabled').removeClass('btnAttend');

				///////////update summary info
				let SumAttended = parseInt($('#spanSumAttended').text());
				let SumUnatended = parseInt($('#spanSumUnatended').text());
				let SumUnconfirm = parseInt($('#spanSumUnconfirm').text());
				$('#spanSumAttended').text(SumAttended + 1);
				(status == '1')
					? $('#spanSumUnatended').text(SumUnatended - 1)
					: $('#spanSumUnconfirm').text(SumUnconfirm - 1);

				////////update last attend info
				$('#lastAttendant').text(name);
				$('#lastAttendantDateTime').text(attenddate + ' ' + attendtime);

				/////// update row status 
				$('#' + guid).attr('status', '2');
				$("#modalAttend").modal('hide');
			});



			$('#btnOnsiteRegister').on('click', function (e) {
				e.preventDefault();
				alert('產出空白完整報名表, 填完, 送出報到');
			});
			$('#btnQRcode').on('click', function (e) {
				e.preventDefault();
				alert('產出報到單, 輸入基本資料 (key information), 送出報到');
			});
			$('#btnExport').on('click', function (e) {
				e.preventDefault();
				alert('匯出所有人員清單');
			});

			$('.btnReRegister').on('click', function (e) {
				e.preventDefault();
				alert('產出帶個資的報名表, 送出報到');
			});
			$(document).on('click', '#btnSearch', function (e) {
				e.preventDefault();
				let divToolHeight = $('#divTool').height();
				let txtSearch = $('#txtSearch').val();
				if (txtSearch.trim() == '') return;

				let target = $('tr[mobile="' + txtSearch.trim() + '"]');
				if (target.length == 0) {  ////////// mobile not found 
					let target2 = $('tr[email="' + txtSearch.trim() + '"]');
					if (target2.length == 0) {///////// email not found
						let target3 = $('tr[name="' + txtSearch.trim() + '"]');
						if (target3.length == 0) {////// name not found
							alert('Not found!'); return;
						} else {
							MoveTo(target3, - divToolHeight);
						}
					}
					else {
						MoveTo(target2, - divToolHeight);
					}
				}
				else {
					MoveTo(target, - divToolHeight);
				}
			});
		});

	</script>
</asp:Content>
