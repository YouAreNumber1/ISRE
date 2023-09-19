<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ISRI0000.aspx.cs" 
    Inherits="ISRE.ISRI0000" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  
       <main> 
           <section>  
                    <div class="d-flex  justify-content-between align-content-center m-2"> 
                        <div class="d-none d-sm-block"></div>
                         <div>
                             <h3 class="text-center my-3">活動清單</h3>
                         </div>
                        <div class="mt-2">
                            <a   class=" btn btn-primary  px-lg-4 "
                            data-bs-toggle="collapse">新增活動  
                            </a>
                        </div> 
                     </div> 
           </section>
 
     
 
<div class="  card m-2 d-none d-lg-block "> 
    <div class="card-header ">
        <div class="row no-gutters  ">
            <div class=" col-lg-4">
                <div class=" "> 活動主題 </div>
            </div>
            <div class=" col-lg-2">
                <div class=" text-center ">活動起訖⽇期</div>
            </div>
            <div class=" col-lg-1">
                <div class=" text-center ">總場次</div>
            </div>
            <div class=" col-lg-1 ">
                <div class=" text-center ">主辦單位</div>
            </div>
            <div class=" col-lg-2    ">
                <div class=" text-center ">發布起訖⽇期</div>
            </div>
             <div class=" col-lg-2">
                <div class=" text-center ">編輯/管理</div>
             </div>
             <%-- <div class=" col-lg-1">
                 <div class=" text-center ">場次管理</div>
              </div>--%>
        </div>
    </div>
</div>

        <% 
           dynamic List_Activities =  Process_ActivityList(  1,    1);  
             foreach (var item in List_Activities) 
           { 
         %>
            <div class="border rounded m-2 p-2">
      <div class="    card m-1 border-0   ">
          <div class=" row no-gutters  ">
              <div class="col-12 col-lg-4 "> 
                  <div class="row no-gutters"> 
                        <span class="d-lg-none col-5 col-sm-2   ">
                            <span class="badge bg-primary">活動主題</span> 
                        </span>
                        <span class="col-7 col-sm-10">
                            <a href="ISRE0001.aspx?GUID=<%:item.GUID %>"><%:item.ACT_NAME %></a>  
                        </span> 
                  </div>
              </div>
              <div class="col-12 col-lg-2 ">
                  <div class="row no-gutters">
                      <span class="d-lg-none  col-5   col-sm-2  ">
                          <span class="badge bg-info">活動起訖⽇期</span> 
                      </span>
                       <div class="col-7 col-sm-10 col-lg-12 "> 
                         <div class=" d-flex  d-lg-block">
                           <div class=" ">112/08/31-112/08/31</div> 
                         </div> 
                     </div>

                       
                  </div>
              </div>
              <div class="col-12 col-lg-1">
                  <div class="row no-gutters">
                      <div class="d-lg-none  col-5  col-sm-2   ">
                          <div class="badge bg-info"> 總場次</div>  
                      </div>
                       <div class="col-7 col-sm-10 col-lg-12 "> 
                         <div class=" d-flex  d-lg-block">
                           <div class="text-center">  
                               <div class="badge bg-info">12</div>  
                           </div> 
                         </div> 
                     </div> 
                  </div>
              </div>
              <div class="col-12 col-lg-1 ">
                  <div class="row no-gutters">
                      <div class="d-lg-none  col-5  col-sm-2   "> 
                          <div class="badge bg-info"> 主辦單位</div>
                      </div>
                      <div class="col-7 col-sm-10 col-lg-12 "> 
                          <div class=" d-flex  d-lg-block">
                            <div class="text-center"> 健保鼠 </div> 
                          </div> 
                      </div>
                  </div>
              </div> 

                 <div class="col-12 col-lg-2 ">
                   <div class="row no-gutters">
                       <span class="d-lg-none  col-5   col-sm-2  ">
                           <span class="badge bg-info">發布起訖⽇期</span> 
                       </span>
                        <div class="col-7 col-sm-10 col-lg-12 "> 
                          <div class=" d-flex  d-lg-block">
                            <div class=" ">112/08/31-112/08/31</div> 
                          </div> 
                      </div> 
                   </div>
               </div>


              
              
              <div class="col-12 col-lg-2">
                      <div class="row no-gutters">
                          <div class="col d-flex justify-content-around">  
                                 <a href="ISRE0001.aspx?GUID=<%:item.GUID %>" 
                                     class="btn btn-primary text-nowrap mx-1 px-3">編輯</a>  
                              <a href="ISRE0001.aspx?GUID=<%:item.GUID %>"  
                                  class="btn btn-primary text-nowrap mx-1">場次管理</a>  
                      
                        </div> 
                      </div>
            </div>
              
             <%-- <div class="col-12 col-lg-1 ">
                  <div class="row no-gutters">
                      <div class="col d-flex justify-content-around">  
                        <div class="d-flex">  
                             <a href="ISRE0001.aspx?GUID=<%:item.GUID %>"  class="btn btn-primary text-nowrap mx-1">場次管理</a>  
                        </div>
                    </div> 
                  </div>
              </div> --%>
          </div>
      </div>

  </div>
        <% } %>
 

       <%-- <div id="test"  >test test</div>--%>
    </main>

    <script>
    var controllerName = $('#controllerName').val();
    var formAction_Desktop = controllerName + "/QueryMobile";
    var formAction_Mobile = controllerName + "/QueryMobile";


   


    $(document).ready(function () {
        console.log("ready!");

        $('#MainContent_test').on('click', function () {
            var postData = { User: 'JOE', Phone: '0900222333' };
            alert('readt');
          
            var url = "https://localhost:44396/Default.aspx/GetData";
            alert(url);
            $.ajax({
                type: "POST",
                url: url,
             // url: "https://localhost:44396/Default.aspx/GetData",
                data: "{postData:'1'}", 
              //  data: JSON.stringify({ 'postData': postData }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    console.log(data.d);
                    //alert(data);
                }
            });
        });
        var SearchResult = $('#SearchResult');
        var thisForm = SearchResult.closest('form');
        //SearchResult.parent().find('form');

        //$(thisForm)
        //    .attr('data-ajax', 'true')
        //    .attr('data-ajax-method', 'GET')
        //    .attr('data-ajax-mode', 'replace')
        //    .attr('data-ajax-update', '#SearchResult')
        //    ;

        //var w = $(window).width();
        //var actionUrl = (w <= 576) ? formAction_Mobile : formAction_Desktop;
        //$("#clientScreenWidth").val(w);
        /////////// event handler
        ////////// must be on last
        //console.log(thisForm);
       // alert('here');
       // thisForm.attr('action', actionUrl).submit();
      //  thisForm.submit();

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
