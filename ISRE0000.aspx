<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ISRE0000.aspx.cs" 
    Inherits="ISRE.ISRE0000" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
  <%
    string sSelected = "";
  %>
       <main> 
           <section> 

                    <div class="d-flex  justify-content-between align-content-center m-2"> 
                        <div class="d-none d-sm-block"></div>
                         <div>
                             <h3 class="text-center my-3">活動報名</h3>
                         </div>
                        <div class="mt-2">
                            <a id="aFilter" href="#Filter" class=" btn btn-primary  px-lg-4 "
                            data-bs-toggle="collapse">查詢條件 
                                <i class="fa-solid fa-chevron-down  text-white"></i>
                            </a>
                        </div> 
                     </div>
                 
      

                     <div id="Filter" class="collapse ">
                         <div class="card">
                             <div class="card-body  ">
                                 <div class="">
                                     <div class="      row  ">
                                         <div class="    col-lg-4">
                                             <div class="row d-flex align-items-center p-2">
                                                 <div class="col-4">
                                                     <div class="    ">
                                                         <label class="text-nowrap"> 辦理縣市</label>
                                                     </div>
                                                 </div>
                                                 <div class="col-8">
                                                     <div class="  flex-grow-1 ">
                                                         <select name="SESS_LOC" id="SESS_LOC" class="form-control form-select">
                                                             <option value="">請選擇</option>
                                                              <% 
                                                                  dynamic SESS_LOC = Request["SESS_LOC"]??"";
                                                                  dynamic List_CityList = StaticQueryDB("Home_ISRE_ACTIVITY_MAIN", "CityList");
                                                                  foreach (var item in List_CityList)
                                                                  {
                                                                      sSelected =  (SESS_LOC.ToString()  == item.CityNo.ToString() ) ? "selected": "";
                                                                      %>
                                                                     <option value="<%: item.CityNo %>"   <%: sSelected %>
                                                                         > <%: item.CityName %> </option>
                                                                     <%
                                                                     }
                                                                     %>  
                                                         </select>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>

                                         <div class="    col-lg-4">
                                             <div class="row d-flex align-items-center p-2">
                                                 <div class="col-4">
                                                     <div class="    ">
                                                         <label class="text-nowrap"> 身分別</label>
                                                     </div>
                                                 </div>
                                                 <div class="col-8">
                                                     <div class="  flex-grow-1 ">
                                                         <select name="OBJ_NO" id="OBJ_NO" class="form-control form-select">
                                                             <option value="">請選擇</option>
                                                               <%  
                                                                     dynamic OBJ_NO = Request["OBJ_NO"]??"";
                                                                    dynamic List_OBJ_NO =  StaticQueryDB("Home_ISRE_ACTIVITY_MAIN", "OBJ_NO"); 
                                                                     foreach (var item in List_OBJ_NO)
                                                                    { 
                                                                          sSelected =  (OBJ_NO.ToString() == item.SerialID.ToString()) ? "selected": "";
                                                                       %>
                                                                    <option value="<%: item.SerialID %>"   <%: sSelected %>> <%: item.OBJ_NO_NAME%> </option>
                                                                    <%
                                                                    }
                                                                    %>  
                                                         </select>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>

                                         <div class="    col-lg-4">
                                             <div class="row d-flex align-items-center p-2">
                                                 <div class="col-4">
                                                     <div class="    ">
                                                         <label class="text-nowrap"> 活動類別</label>
                                                     </div>
                                                 </div>
                                                 <div class="col-8">
                                                     <div class="  flex-grow-1 ">
                                                         <select name="ACT_TYPE" id="ACT_TYPE" class="form-control form-select">
                                                             <option value="">請選擇</option>
                                                               <% 
                                                                   dynamic TYPE_NAME = Request["TYPE_NAME"]??""; 
                                                                   dynamic List_ACT_TYPE =  StaticQueryDB("Home_ISRE_ACTIVITY_MAIN", "ACT_TYPE");
                                                                   foreach (var item in List_ACT_TYPE)
                                                                   {
                                                                       sSelected =  (OBJ_NO.ToString()  == item.SerialID.ToString() ) ? "selected": "";
                                                                       %>
                                                                      <option value="<%: item.SerialID %>"   <%: sSelected %>> <%: item.TYPE_NAME%> </option>
                                                                      <%
                                                                      }
                                                                      %>  
                                                         </select>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>












                                     <div class="      row  ">
                                         <div class="    col-lg-8">
                                             <div class="row d-flex align-items-center p-2">
                                                 <div class="col-4 col-lg-2">
                                                     <div class="    ">
                                                         <label class="text-nowrap">活動名稱</label>
                                                     </div>
                                                 </div>
                                                 <div class="col-8 col-lg-10">
                                                     <div class="  flex-grow-1 ">
                                                         <input type="text" class="form-control" name="ACT_NAME" id="ACT_NAME"
                                                             value="<%:  Request["ACT_NAME"] %>" >
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>

                                         <div class="    col-lg-4">
                                             <div class="row d-flex align-items-center p-2">
                                                 <div class="col-4">
                                                     <div class="    ">
                                                         <label class="text-nowrap">主辦單位</label>
                                                     </div>
                                                 </div>
                                                 <div class="col-8">
                                                     <div class="  flex-grow-1 ">
                                                         <input type="text" class="form-control" name="ACT_HOST" id="ACT_HOST"
                                                               value="<%:  Request["ACT_HOST"] %>" >
                                                     </div>
                                                 </div>
                                             </div>
                                         </div> 
                                     </div>



                                     <div class="      row  ">
                                         <div class="    col-lg-8">
                                             <div class="row d-flex align-items-center p-2">
                                                 <div class="col-4 col-lg-2">
                                                     <div class="    ">
                                                         <label class="text-nowrap"> 活動時間</label>
                                                     </div>
                                                 </div>
                                                 <div class="col-8 col-lg-10">
                                                     <div class="d-lg-flex">
                                                         <div class="d-lg-flex   flex-grow-1">
                                                             <input type="text" id="ACT_DATE_S_DATE" name="ACT_DATE_S_DATE" 
                                                                 class="form-control " placeholder="民國年/月/日"
                                                                     value="<%:  Request["ACT_DATE_S_DATE"] %>" >
                                                             <input type="hidden"   id="ACT_DATE_S" name="ACT_DATE_S" />
                                                             <span class="mx-1">~</span>
                                                         </div>
                                                         <div class="d-lg-flex  flex-grow-1">
                                                             <input type="text" id="ACT_DATE_E_DATE" name="ACT_DATE_E_DATE" 
                                                                 class="form-control " placeholder="民國年/月/日"
                                                                       value="<%:  Request["ACT_DATE_E_DATE"] %>">
                                                              <input type="hidden"   id="ACT_DATE_E" name="ACT_DATE_E" />
                                                         </div>
                                                     </div> 
                                                 </div>
                                             </div>
                                         </div> 
                                     </div> 
                                 </div> 
                                 </div>
                             </div>
                             <div class="card-footer d-flex justify-content-center m-4">
                                 <button type="submit" class="btn btn-primary px-5 text-nowrap">
                                     查詢 
                                     <i class="fa-solid fa-magnifying-glass text-white"></i> 
                                 </button>
                             </div>
                         </div>

 

                   <%--   <div id="SearchResult" class="my-4"> </div> --%>
                
           </section>
 
     
 
<div class="  card m-2 d-none d-lg-block "> 
    <div class="card-header ">
        <div class="row no-gutters  ">
            <div class=" col-lg-5">
                <div class=" ">
                    活動主題
                </div>
            </div>
            <div class=" col-lg-2">
                <div class=" text-center ">日期時間</div>
            </div>
            <div class=" col-lg-1">
                <div class=" text-center ">場次</div>
            </div>
            <div class=" col-lg-2    ">
                <div class=" text-center ">發布⽇期</div>
            </div>
             <div class=" col-lg-2">
     
             </div>
            
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
              <div class="col-12 col-lg-5 "> 
                  <div class="row no-gutters"> 
                        <span class="d-lg-none col-4 col-sm-2   ">
                            <span class="badge bg-primary">活動主題</span> 
                        </span>
                        <span class="col-8 col-sm-10">
                            <a href="ISRE0001.aspx?GUID=<%:item.GUID %>"><%:item.ACT_NAME %></a>  
                        </span> 
                  </div>
              </div>
              <div class="col-12 col-lg-2 ">
                  <div class="row no-gutters">
                      <span class="d-lg-none  col-4   col-sm-2  ">
                          <span class="badge bg-info">日期時間</span> 
                      </span>
                       <div class="col-8 col-sm-10 col-lg-12 "> 
                         <div class=" d-flex  d-lg-block">
                           <div class="text-center">  112/08/31 </div> 
                         </div> 
                     </div>

                       
                  </div>
              </div>
              <div class="col-12 col-lg-1">
                  <div class="row no-gutters">
                      <div class="d-lg-none  col-4  col-sm-2   ">
                          <div class="badge bg-info"> 總場次</div>  
                      </div>
                       <div class="col-8 col-sm-10 col-lg-12 "> 
                         <div class=" d-flex  d-lg-block">
                           <div class="text-center">  
                               <div class="badge bg-info">12</div>  
                           </div> 
                         </div> 
                     </div> 
                  </div>
              </div>
              <div class="col-12 col-lg-2 ">
                  <div class="row no-gutters">
                      <div class="d-lg-none  col-4  col-sm-2   "> 
                          <div class="badge bg-info"> 發布⽇期</div>
                      </div>
                      <div class="col-8 col-sm-10 col-lg-12 "> 
                          <div class=" d-flex  d-lg-block">
                            <div class="text-center">  112/08/31 </div> 
                          </div> 
                      </div>
                  </div>
              </div> 
                 <div class="col-12 col-lg-2 mt-5 mt-lg-0">
                 <div class="row no-gutters">
                       <div class="col d-flex justify-content-around">  
                          <div class="d-flex"> 
                             <%-- <a href="/isre0001.aspx?guid=this&multiple=1"  class="btn btn-primary text-nowrap mx-1"> 查場次  </a> --%>
                               <a href="ISRE0001.aspx?GUID=<%:item.GUID %>"  class="btn btn-primary text-nowrap mx-1">看場次</a>  
                          </div>
                      </div> 
        <%--              <div class="d-lg-none  col-1    ">
                          <div class=""> </div>  
                      </div>
                       <div class="col-11   col-lg-12 "> 
                         <div class=" d-flex  d-lg-block">
                           <div class=" d-flex justify-content-center">  
                               <div>
                                    <a   class="btn btn-primary  px-2">查場次</a>
                               </div>
                   
                           </div> 
                         </div> 
                     </div> --%>
      </div>
  </div>

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



        $(".collapse").on('show.bs.collapse', function () {
            $('#aFilter').children().addClass('fa-chevron-up').removeClass('fa-chevron-down');
        });

        $(".collapse").on('hide.bs.collapse', function () {
            $('#aFilter').children().addClass('fa-chevron-down').removeClass('fa-chevron-up');
        });
    });

     

    </script>
</asp:Content>
