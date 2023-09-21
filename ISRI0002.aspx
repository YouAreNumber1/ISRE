<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ISRI0002.aspx.cs" 
    Inherits="ISRE.ISRI0002" %>
<%--this page is for backend activity info and sesseion list--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <%
  string GUID = "";/////////GUID= activity guid
%>
    <main>
          <h3 class="text-center ">活動內容</h3> 
 <%
     GUID = Request.QueryString["GUID"];
       dynamic Model = Process_ActivityInfo(GUID);
      
%>

       <%-- activity info summary start --%>
         <%-- activity info summary title start --%>
         <div class="  card   d-none d-lg-block "> 
            <div class="card-header active ">
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
                                    <div class="d-flex justify-content-lg-center"> 
                                        <div class="badge bg-warning">5</div> </div>  
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


   
       <%--   session list   start--%>   
        <div class="d-flex  justify-content-between  align-items-center mt-5 "> 
            <div></div>
            <h3 class="text-center ">場次列表</h3>   
            <a href="ISRI0003.aspx" class="btn btn-Create btn-primary-isre px-3">新增場次</a>
        </div>
          
<%--session list title columns start --%>
<div class="  card   d-none d-lg-block "> 
    <div class="card-header ">
        <div class="row no-gutters  ">
            <div class=" col-lg-1 text-center ">
                <span>  場次 </span>
            </div>
            <div class=" col-lg-1 text-center ">
                <span>日期時間</span>
            </div>
            <div class=" col-lg-1 text-center ">
                <span>地點</span>
            </div>
            <div class=" col-lg-1   text-center   ">
                <span>報名截⽌⽇</span>
            </div>

            <div class=" col-lg-1   text-center   ">
                <span>可報名⼈數</span>
            </div>
             <div class=" col-lg-1   text-center   ">
                <span>已報名⼈數</span>
            </div>

            <div class=" col-lg-1 text-center ">
                 <span>活動資料</span>
             </div>
             <div class=" col-lg-1 text-center   ">
                 <span>尚餘名額</span>
             </div>
            
            <div class=" col-lg-4 text-center ">
                  <span> 編輯/管理</span>
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
    <div class="    card   border-end-0 border-top-0 border-bottom-0 border-start-0   ">
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
                <div class="col-12 col-lg-1 ">
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
            <span class="badge bg-info"> 可報名⼈數</span>
        </div> 
        <div class="col-8 col-lg-12  text-center ">  
            <div class="d-flex justify-content-lg-center">   21  </div> 
        </div> 
    </div>
</div>  

                <div class="col-12 col-lg-1 ">
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
                        <div> 
                            <a guid="<%:item.GUID %>"  
                            href="ISRI0003.aspx?guid=<%:item.GUID %>"
                            class="btn btn-primary-isre text-nowrap mx-1  px-4">編輯</a>  
                        </div> 
                        <div>
                            <a guid="<%:item.GUID %>" 
                            href="ISRI0004.aspx?guid=<%:item.GUID %>"
                            class="btn btn-primary-isre text-nowrap mx-1  px-2 ">前台設定</a>  
                        </div>
                        <div> 
                            <a guid="<%:item.GUID %>"  
                            href="ISRI0005.aspx?guid=<%:item.GUID %>"
                            class="btn btn-primary-isre text-nowrap mx-1  px-2">報到管理</a>  
                        </div>
                       
                    </div> 
                </div>
            </div>   
        </div>
    </div>

</div> 

        <%} %>
        
<%--  session list end  --%>





    <%--   session list   end--%>   
         
      
       
    </main>





        <script> 

$(document).ready(function () { 
 
    $(document).on('click', '#btn_Clear', function (e) {
        $('#cardInput').find('input[type=text]').val('');
    });
 

    
});
 
        </script>
</asp:Content>
