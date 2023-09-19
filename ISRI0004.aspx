<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ISRI0004.aspx.cs" 
    Inherits="ISRE.ISRI0004" %>
<%--this page is for backend to manage frontend registration form (show/required) --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <%
    string GUID = "";/////////GUID=activity guid
  %>
       <main aria-labelledby="title">
        

        <div class="container">
                 <h3 class="text-center my-4">活動內容</h3> 
                 <%
                       GUID = Request.QueryString["GUID"];  /////////GUID=activity guid
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
                    <div class="my-2">
                        <ol>
                            <li>
                                為利⼆三類業務承辦⼈員熟悉健保承保法規與業務，本組特以Microsoft Teams軟
                                體辦理視訊說明會，採網路報名⾄5⽉19⽇截⽌。
                            </li>
                            <li>
                                會議連結預計5⽉22⽇寄⾄您於報名網站登錄的電⼦郵件信箱，另將於5⽉23⽇
                                14:00~14:30召開測試會議，屆時請開啟郵件連結，以來賓⾝分登入並輸入【投保單位
                                代號+姓名】即可參與，務請撥宂參與測試。
                            </li>
                            <li>簡報資料預計5⽉23⽇上架，請⾄本報名系統下⽅之「活動資料」下載。</li>
                            <li>
                                說明會當⽇如遇颱風、豪雨或其他不可抗拒之因素，經轄區縣市政府宣布停班時，
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
                    <div class="my-2  px-3">
                        花蓮縣及台東縣⼆、三類投保單位業務承辦⼈員
                    </div>
                </div>

               <%-- @*活動內容*@--%>
                <div>
                    <div class="card  mt-4">
                        <div class="card-header ">活動內容</div>
                    </div>
                    <div class="my-2 px-3">
                         <div class=" d-flex">
                             <div class="">
                                  <span class="badge bg-info">112/05/24</span>  
                               </div>
                             <div class="ms-2">
                                    (花蓮縣)Microsoft Teams線上視訊會議  
                             </div>
                         </div>
                        <div class=" d-flex">
                            <div class="">
                                 <span class="badge bg-info">112/05/31</span>  
                              </div>
                            <div class="ms-2">
                                   (花蓮縣)Microsoft Teams線上視訊會議  
                            </div>
                        </div> 
                    </div>
                </div>


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
<div class="  card mt-4 m-2 d-none d-lg-block "> 
    <div class="card-header ">
        <div class="row no-gutters  ">
            <div class=" col-lg-1 text-center ">
                <span>  場次 </span>
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
                  <span> 報名</span>
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
          <div class="border rounded my-4 p-2">
        <div class="    card m-1 border-end-0 border-top-0 border-bottom-0 border-start-0   ">
            <div class=" row no-gutters  ">
                    <div class="col-12 col-lg-1 "> 
                        <div class="row no-gutters"> 
                              <span class="d-lg-none col-4 col-sm-2   ">
                                  <span class="badge bg-primary">場次</span> 
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
                                <div class="d-flex justify-content-lg-center"> 112/08/31 </div> 
                             </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-1 ">
                        <div class="row no-gutters">
                            <span class="d-lg-none  col-4  col-sm-2   ">
                                <span class="badge bg-info"> 地點</span>  
                            </span>
                            <div class="col-8 col-lg-12   text-center  "> 
                                <div class="d-flex justify-content-lg-center"> 台北市 </div>  
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-2 ">
                        <div class="row no-gutters">
                            <div class="d-lg-none  col-4  col-sm-2   "> 
                                <span class="badge bg-info"> 報名截⽌⽇</span>
                            </div>
                            <div class="col-8 col-lg-12  text-center  "> 
                                 <div class="d-flex justify-content-lg-center">   112/08/31  </div>  
                               </div>
                        </div>
                    </div>  

                   <div class="col-12 col-lg-1 ">
                    <div class="row no-gutters">
                        <div class="d-lg-none  col-4  col-sm-2   ">
                            <span class="badge bg-info"> 活動資料</span>  
                        </div>
                        <div class="col-8 col-lg-12 "> 
                            <div class="  text-center "> 
                                <div class="d-flex justify-content-lg-center">   21  </div>  
                            </div>
                        </div>
                    </div>
                </div>
                   <div class="col-12 col-lg-1 ">
                    <div class="row no-gutters">
                        <div class="d-lg-none  col-4  col-sm-2   "> 
                            <span class="badge bg-info"> 尚餘名額</span>
                        </div> 
                        <div class="col-8 col-lg-12  text-center ">  
                            <div class="d-flex justify-content-lg-center">   21  </div> 
                        </div> 
                    </div>
                </div>  

                    <div class="col-12 col-lg-4 mt-5 mt-lg-0 ">
                    <div class="row no-gutters  ">
                        <div class="col d-flex justify-content-around"> 
                            <div><a guid="<%:item.GUID %>" 
                                href="ISRE0002.aspx?guid=<%:item.GUID %>&RegisterMultiple=0"
                                class="btn btn-primary text-nowrap mx-1 btn-SessionSingleRegister">單人報名</a> </div>
                            <div> <a guid="<%:item.GUID %>"  
                                href="ISRE0002.aspx?guid=<%:item.GUID %>&RegisterMultiple=1"
                                class="btn btn-primary text-nowrap mx-1  btn-SessionMultipleRegister"> 多人報名   </a> </div>
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
