<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ISRI0005.aspx.cs" 
    Inherits="ISRE.ISRI0005" %>
<%--this page is for backend to manage   register --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
       <%
		   string GUID = Request.QueryString["GUID"] ?? "";  /////////GUID=session guid 
		   string ActioinName = (GUID == "") ? "新增" : "編輯";
  %>
    
            <main aria-labelledby="title">
          <div class=" my-2">

                 <h3 class="text-center  ">活動內容</h3> 
 <% 
	 dynamic Activity = Process_ActivityInfoBySession(GUID);
 %>  
     <%-- activity info summary title start --%>
 <div class="  card    d-none d-lg-block "> 
    <div class="card-header active">
        <div class="row no-gutters  ">
            <div class=" col-lg-3   ">
                <span>  活動主題 </span>
            </div>
            <div class=" col-lg-3 text-center ">
                <span>活動起訖⽇期</span>
            </div>
            <div class=" col-lg-1 text-center ">
                <span>總場次</span>
            </div>
            <div class=" col-lg-2   text-center   ">
                <span>主辦單位</span>
            </div>
            <div class=" col-lg-3 text-center ">
                    <span>發布起訖⽇期</span>
                </div>
                
        </div>
    </div>
</div>           
    
                      <%-- activity info summary title end --%>
       <%-- activity info summary content start --%>
      <div class="border rounded my-1 py-1">
         <div class="    card m-1 border-end-0 border-top-0 border-bottom-0 border-start-0   ">
             <div class=" row no-gutters  ">
                     <div class="col-12 col-lg-3 "> 
                         <div class="row no-gutters"> 
                               <span class="d-lg-none col-4 col-sm-2   ">
                                   <span class="badge bg-info card-header">活動主題</span> 
                               </span>
                               <div class="col-8 col-lg-12 ">
                                   <div >
                                        活動主題
                                   </div>  
                               </div> 
                         </div>
                     </div>
                     <div class="col-12 col-lg-3 ">
                         <div class="row no-gutters">
                             <span class="d-lg-none  col-4   col-sm-2  ">
                                 <span class="badge bg-info">活動起訖⽇期</span> 
                             </span>
                             <div class="col-8 col-lg-12  text-center  ">
                                 <div class="d-flex justify-content-lg-center"> 112/08/31-112/09/30 </div> 
                              </div>
                         </div>
                     </div>
                     <div class="col-12 col-lg-1 ">
                         <div class="row no-gutters">
                             <span class="d-lg-none  col-4  col-sm-2   ">
                                 <span class="badge bg-info"> 總場次</span>  
                             </span>
                             <div class="col-8 col-lg-12   text-center  "> 
                                 <div class="d-flex justify-content-lg-center">  <div class="badge bg-warning">5</div> </div>  
                             </div>
                         </div>
                     </div>
                     <div class="col-12 col-lg-2 ">
                         <div class="row no-gutters">
                             <div class="d-lg-none  col-4  col-sm-2   "> 
                                 <span class="badge bg-info"> 主辦單位</span>
                             </div>
                             <div class="col-8 col-lg-12  text-center  "> 
                                  <div class="d-flex justify-content-lg-center"> 主辦單位 </div>  
                                </div>
                         </div>
                     </div>  

                    <div class="col-12 col-lg-3 ">
                     <div class="row no-gutters">
                         <div class="d-lg-none  col-4  col-sm-2   ">
                             <span class="badge bg-info"> 發布起訖⽇期</span>  
                         </div>
                         <div class="col-8 col-lg-12 "> 
                             <div class="  text-center "> 
                                 <div class="d-flex justify-content-lg-center">   112/08/31-112/09/30  </div>  
                             </div>
                         </div>
                     </div>
                 </div>
                    
 
             </div>
         </div>

     </div>       
<%-- activity info summary content end --%>
     <%--   activity info summary end--%>     
             
             <div class="d-flex justify-content-center my-4">
                 <button type="button" id="btn_Insert"
                         data-target=@string.Concat(ControllerName
                                ,"Insert"
                         )
                         class="    px-2  px-lg-5 me-3 mb-2 text-nowrap  btn-primary-isre btn ">
                     <span>報到QRcode</span>
                 </button>
                 <a href="#" class="btn btn-primary-isre px-2   px-lg-5   me-5 mb-2 ">匯出報名清單</a>

             </div>
            <%--session   start  --%>
            <h3 class="text-center mt-5 mb-2"> 場次資訊  </h3>
         <%  
			 dynamic Model = Process_Session(GUID);

          %>    

<%--session   title columns start --%>
			  <div class="  card   d-none d-lg-block ">
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
						  <div class=" col-lg-1 text-center ">
							  <span>主辦單位</span>
						  </div>
						  <div class=" col-lg-2   text-center   ">
							  <span>報名截⽌⽇</span>
						  </div>
						  <div class=" col-lg-2   text-center   ">
							  <span>可報名⼈數</span>
						  </div>
						  <div class=" col-lg-2   text-center   ">
							  <span>已報名⼈數</span>
						  </div>


						  <div class=" col-lg-1 text-center   ">
							  <span>尚餘名額</span>
						  </div>

					  </div>
				  </div>
			  </div>

			  <%-- session   title columns end--%>
<%--session   CONTENTS start --%>
			  <div class="border rounded my-1 py-1">
				  <div class="    card m-1 border-end-0 border-top-0 border-bottom-0 border-start-0   ">
					  <div class=" row no-gutters  ">
						  <div class="col-12 col-lg-1 ">
							  <div class="row no-gutters">
								  <span class="d-lg-none col-4 col-sm-2   ">
									  <span class="badge bg-info">場次</span>
								  </span>
								  <div class="col-8 col-lg-12 ">
									  <div class="d-flex justify-content-lg-center">
										  4  
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
						  <div class="col-12 col-lg-1 ">
							  <div class="row no-gutters">
								  <span class="d-lg-none  col-4  col-sm-2   ">
									  <span class="badge bg-info">主辦單位</span>
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

						  <div class="col-12 col-lg-2 ">
							  <div class="row no-gutters">
								  <div class="d-lg-none  col-4  col-sm-2   ">
									  <span class="badge bg-info">可報名⼈數</span>
								  </div>
								  <div class="col-8 col-lg-12  text-center ">
									  <div class="d-flex justify-content-lg-center">21  </div>
								  </div>
							  </div>
						  </div>

						  <div class="col-12 col-lg-2 ">
							  <div class="row no-gutters">
								  <div class="d-lg-none  col-4  col-sm-2   ">
									  <span class="badge bg-info">已報名⼈數</span>
								  </div>
								  <div class="col-8 col-lg-12  text-center ">
									  <div class="d-flex justify-content-lg-center">21  </div>
								  </div>
							  </div>
						  </div>

						  <div class="col-12 col-lg-1 ">
							  <div class="row no-gutters">
								  <div class="d-lg-none  col-4  col-sm-2   ">
									  <span class="badge bg-info">尚餘名額</span>
								  </div>
								  <div class="col-8 col-lg-12  text-center ">
									  <div class="d-flex justify-content-lg-center">21  </div>
								  </div>
							  </div>
						  </div>


					  </div>
				  </div>

			  </div>

			  <%--session   CONTENTS END --%>             



     <%-- search bar start  --%>
             <h3 class="text-center mt-5 mb-2"> 報到人員管理  </h3>
             
            <%-- search bar end--%>
			  <div class="d-flex my-2 my-lg-4 mx-lg-5 align-items-center">
				  <div class="text-nowrap mx-2">關鍵字：</div>
				  <input type="text" class="form-control">
				  <button class="text-nowrap btn btn-primary-isre mx-1 px-2 px-lg-5 mx-lg-5">查詢</button>
			  </div>

			  <!-- Nav tabs -->
			  <ul class="nav nav-tabs nav-justified mt-1">

				  <li class="nav-item  ">
					  <div class="d-flex" >
						  <a class="nav-link active" data-bs-toggle="tab" href="#home">已報到
							  <span class="bg-primary badge mx-2">9</span>  
							 
							  <i id="refreshGroup1" group="1" 
								  class="refreshGroup fa-solid fa-arrows-rotate ms-4" ></i> 
						  </a>
						 
					  </div>
				  </li>
				  <li class="nav-item">
					  <a class="nav-link" data-bs-toggle="tab" href="#menu1">未報到
						  <span class="bg-warning badge mx-2">19</span>
						   <i id="refreshGroup2" group="2"
							   class="refreshGroup fa-solid fa-arrows-rotate ms-4" ></i>
					  </a>
				  </li>
				  <li class="nav-item">
					  <a class="nav-link" data-bs-toggle="tab" href="#menu2">未確認
						  <span class="bg-danger badge mx-2">29</span>
						   <i id="refreshGroup3" group="3"
							   class="refreshGroup fa-solid fa-arrows-rotate ms-4" ></i>
					  </a>
				  </li>
			  </ul>


			  <!-- Tab panes -->
			  <div class="tab-content">
				  <div class="tab-pane container active py-1 border" id="home">

					  <div class="col m-2 ">最新報到⼈員：謝銀河 112/05/11 09:31</div>
					  <div class=" d-flex">
						  <div class="mx-2 text-nowrap ">報到掃描區：</div>
						  <input type="text" class="form-control">
					  </div>




					  <div class="table-responsive">
						  <table class="table table-striped" id="tblGroup1">
							  <thead>
								  <tr>
									  <th>
										  <p align="center"><strong>報名⽇期</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>姓名</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>投保單位代號</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>單位名稱</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>連絡電話</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>電⼦郵件</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>餐飲習慣</strong></p>
									  </th>

									  <th>
										  <p align="center"><strong>報到時間</strong></p>
									  </th>
									  <th class="operate-td">
										  <p align="center"><strong>編輯</strong></p>
									  </th>
									  <th class="operate-td">
										  <p align="center"><strong>管理</strong></p>
									  </th>

								  </tr>
							  </thead>
							  <tbody>
								  <tr>
									  <td>2023/05/11</td>
									  <td>謝銀河</td>
									  <td>12345678</td>
									  <td>資訊組</td>
									  <td>0911222333</td>
									  <td>galaxy.yahoo.com</td>
									  <td>葷食</td>

									  <td>112/05/11 10:23</td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">編輯</a></td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">管理</a></td>
								  </tr>
								  <tr>
									  <td>2023/05/11</td>
									  <td>黃必勝</td>
									  <td>12345678</td>
									  <td>資訊組</td>
									  <td>0911222333</td>
									  <td>galaxy.yahoo.com</td>
									  <td>葷食</td>
									  <td>112/05/11 10:23</td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">編輯</a></td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">管理</a></td>
								  </tr>
								  <tr>
									  <td>2023/05/11</td>
									  <td>許明華</td>
									  <td>12345678</td>
									  <td>吳忠信</td>
									  <td>0911222333</td>
									  <td>galaxy.yahoo.com</td>
									  <td>葷食</td>
									  <td>112/05/11 10:23</td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">編輯</a></td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">管理</a></td>

								  </tr>
							  </tbody>
						  </table>
					  </div> 
					  
				  </div>


				  <div class="tab-pane container fade py-1 border" id="menu1">

					  <div class="table-responsive">
						  <table class="table table-striped" id="tblGroup2">
							  <thead>
								  <tr>
									  <th>
										  <p align="center"><strong>報名⽇期</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>姓名</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>投保單位代號</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>單位名稱</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>連絡電話</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>電⼦郵件</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>餐飲習慣</strong></p>
									  </th>

									  <th>
										  <p align="center"><strong>報到時間</strong></p>
									  </th>
									  <th class="operate-td">
										  <p align="center"><strong>編輯</strong></p>
									  </th>
									  <th class="operate-td">
										  <p align="center"><strong>管理</strong></p>
									  </th>

								  </tr>
							  </thead>
							  <tbody>
								  <tr>
									  <td>2023/05/11</td>
									  <td>謝銀河</td>
									  <td>12345678</td>
									  <td>資訊組</td>
									  <td>0911222333</td>
									  <td>galaxy.yahoo.com</td>
									  <td>葷食</td>

									  <td>112/05/11 10:23</td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">編輯</a></td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">管理</a></td>
								  </tr>
								  <tr>
									  <td>2023/05/11</td>
									  <td>黃必勝</td>
									  <td>12345678</td>
									  <td>資訊組</td>
									  <td>0911222333</td>
									  <td>galaxy.yahoo.com</td>
									  <td>葷食</td>
									  <td>112/05/11 10:23</td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">編輯</a></td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">管理</a></td>
								  </tr>
								  <tr>
									  <td>2023/05/11</td>
									  <td>許明華</td>
									  <td>12345678</td>
									  <td>吳忠信</td>
									  <td>0911222333</td>
									  <td>galaxy.yahoo.com</td>
									  <td>葷食</td>
									  <td>112/05/11 10:23</td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">編輯</a></td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">管理</a></td>

								  </tr>
							  </tbody>
						  </table>
					  </div>

				  </div>

				  <div class="tab-pane container fade py-1 border" id="menu2">

					  <div class="table-responsive">
						  <table class="table table-striped" id="tblGroup3">
							  <thead>
								  <tr>
									  <th>
										  <p align="center"><strong>報名⽇期</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>姓名</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>投保單位代號</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>單位名稱</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>連絡電話</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>電⼦郵件</strong></p>
									  </th>
									  <th>
										  <p align="center"><strong>餐飲習慣</strong></p>
									  </th>

									  <th>
										  <p align="center"><strong>報到時間</strong></p>
									  </th>
									  <th class="operate-td">
										  <p align="center"><strong>編輯</strong></p>
									  </th>
									  <th class="operate-td">
										  <p align="center"><strong>管理</strong></p>
									  </th>

								  </tr>
							  </thead>
							  <tbody>
								  <tr>
									  <td>2023/05/11</td>
									  <td>謝銀河</td>
									  <td>12345678</td>
									  <td>資訊組</td>
									  <td>0911222333</td>
									  <td>galaxy.yahoo.com</td>
									  <td>葷食</td>

									  <td>112/05/11 10:23</td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">編輯</a></td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">管理</a></td>
								  </tr>
								  <tr>
									  <td>2023/05/11</td>
									  <td>黃必勝</td>
									  <td>12345678</td>
									  <td>資訊組</td>
									  <td>0911222333</td>
									  <td>galaxy.yahoo.com</td>
									  <td>葷食</td>
									  <td>112/05/11 10:23</td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">編輯</a></td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">管理</a></td>
								  </tr>
								  <tr>
									  <td>2023/05/11</td>
									  <td>許明華</td>
									  <td>12345678</td>
									  <td>吳忠信</td>
									  <td>0911222333</td>
									  <td>galaxy.yahoo.com</td>
									  <td>葷食</td>
									  <td>112/05/11 10:23</td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">編輯</a></td>
									  <td><a href="" class="btn btn-primary-isre text-nowrap">管理</a></td>

								  </tr>
							  </tbody>
						  </table>
					  </div>

				  </div>
			  </div>


		  </div>
    

       </main>
    <script> 

		$(document).ready(function () {

			$('.refreshGroup ').on('click', function (e) {
				let btn = $(this);
				let group = btn.attr('group');
				console.log(group);
				alert(group);
				//////////// refresh tab-content content table based on group#
			});


		});

	</script>
</asp:Content>
