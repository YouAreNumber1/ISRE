<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ISRI0002.aspx.cs" 
    Inherits="ISRE.ISRI0002" %>
<%--this page is for backend activity info and sesseion list--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <%
  string GUID = "";/////////GUID= activity guid
%>
    <main>
 <%
     GUID = Request.QueryString["GUID"];
       dynamic Model = Process_ActivityInfo(GUID);
      
%>

       <%-- activity info summary start --%>
         <%-- activity info summary title start --%>
         <div class="  card mt-4 m-2 d-none d-lg-block "> 
            <div class="card-header ">
                <div class="row no-gutters  ">
                    <div class=" col-lg-3   ">
                        <span>  活動主題 </span>
                    </div>
                    <div class=" col-lg-2 text-center ">
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
         <div class="border rounded m-2 p-2">
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
                        <div class="col-12 col-lg-2 ">
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
                                    <div class="d-flex justify-content-lg-center"> 4 </div>  
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
          <% 
       dynamic Sessions = Process_ActivityInfo(GUID); 
%>
           
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





    <%--   session list   end--%>   
         
      <%--  command buttons start--%>
      <div class="d-flex justify-content-between justify-content-md-center mx-2 my-5">
          <div>
            <button type="button" id="btn_Register"
                class="btn btn-primary px-3 mx-1 mx-md-4 px-md-4 text-nowrap"
                  data-target="/Session/Register">
                          送出
            </button>
          </div>
          
          <div>
            <button type="button" id="btn_Clear" 
                class="btn btn-primary  px-3 mx-1 mx-md-4 px-md-4 text-nowrap">清除</button>
          </div>
          <div>
                 <a href="\isre0000.aspx" class="btn btn-primary   mx-1 mx-md-4 px-md-4 text-nowrap">回首頁</a>
             </div>
        
      </div>
  
      <%--  command buttons end--%>
          
    
       
    </main>





        <script> 

$(document).ready(function () { 
 
    $(document).on('click', '#btn_Clear', function (e) {
        $('#cardInput').find('input[type=text]').val('');
    });
 

    
});
 
        </script>
</asp:Content>
