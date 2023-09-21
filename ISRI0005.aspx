<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ISRI0005.aspx.cs" 
    Inherits="ISRE.ISRI0005" %>
<%--this page is for backend to manage   register --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
       <%
           string GUID = Request.QueryString["GUID"]??"";  /////////GUID=session guid 
           string ActioinName = (GUID == "") ?  "新增":"編輯" ;
  %>
    
            <main aria-labelledby="title">
         
        <div class="container">
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
                                   <span class="badge bg-primary card-header">活動主題</span> 
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
                         class="    px-4 py-2  me-3 mb-2 text-nowrap  btn-primary-isre btn ">
                     <span>產生報到QRcode</span>
                 </button>
                 <a href="#" class="btn btn-primary-isre    px-5 py-2  me-5 mb-2 ">匯出報名清單</a>

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
                <span>  場次 </span>
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

        <div class="border rounded my-1 py-1">
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
                    <div class="col-12 col-lg-1 ">
            <div class="row no-gutters">
                <span class="d-lg-none  col-4  col-sm-2   ">
                    <span class="badge bg-info"> 主辦單位</span>  
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

                        <div class="col-12 col-lg-2 ">
            <div class="row no-gutters">
                <div class="d-lg-none  col-4  col-sm-2   "> 
                    <span class="badge bg-info"> 可報名⼈數</span>
                </div> 
                <div class="col-8 col-lg-12  text-center ">  
                    <div class="d-flex justify-content-lg-center">   21  </div> 
                </div> 
            </div>
        </div>  

                        <div class="col-12 col-lg-2 ">
            <div class="row no-gutters">
                <div class="d-lg-none  col-4  col-sm-2   "> 
                    <span class="badge bg-info"> 已報名⼈數</span>
                </div> 
                <div class="col-8 col-lg-12  text-center ">  
                    <div class="d-flex justify-content-lg-center">   21  </div> 
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

                 
                </div>
            </div>

        </div> 

               



     <%-- search bar start  --%>
             <h3 class="text-center mt-5 mb-2"> 報到人員管理  </h3>
            
           

            <%-- search bar end--%>
<div class="d-flex my-1 align-items-center">
    <div class="text-nowrap">關鍵字：</div>
    <input type="text" class="form-control">
    <button class="text-nowrap btn btn-primary-isre px-5">查詢</button>
</div>

    <!-- Nav tabs -->
    <ul class="nav nav-tabs nav-justified mt-1">
        
        <li class="nav-item  ">
            <a class="nav-link active" data-bs-toggle="tab" href="#home">已報到人員</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" href="#menu1">未報到⼈員</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" data-bs-toggle="tab" href="#menu2">未確認通知信⼈員</a>
        </li>
    </ul>


    <!-- Tab panes -->
    <div class="tab-content">
        <div class="tab-pane container active py-1 border" id="home">
             
        </div>


        <div class="tab-pane container fade py-1 border" id="menu1">
             
        </div>

        <div class="tab-pane container fade py-1 border" id="menu2">
            <div class="card">
                <div class="card-header">
                    <b> 未確認通知信⼈數</b>  ：9         
                </div>
            </div>
        </div>
    </div>

       
    </div> 

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
