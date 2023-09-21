<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ISRI0004.aspx.cs" 
    Inherits="ISRE.ISRI0004" %>
<%--this page is for backend to manage frontend registration form (show/required) --%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <%
       string GUID = Request.QueryString["GUID"] ?? "";  /////////GUID=session guid 
       string ActioinName = (GUID == "") ? "新增" : "編輯";
  %>
 
    
    <main aria-labelledby="title">
        

        <div class=" my-2 ">
                 <h3 class="text-center  ">活動內容</h3> 
 <% 
     dynamic Activity = Process_ActivityInfoBySession(GUID);
 %>  
     <%-- activity info summary title start --%>
 <div class="  card    d-none d-lg-block "> 
    <div class=" card-header  active">
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
         <div class="    card  m-1 border-end-0 border-top-0 border-bottom-0 border-start-0   ">
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

       
            
<div class="mt-5">

<h3 class="text-center">活動報名表</h3> 
<div class="card  ">
    <div class="card-header">報名表</div>
</div>


  <div class="my-1 py-1">
         <div class="d-flex justify-content-center">
             <span>報名⾝分：</span>
             <div class="form-check  form-check-inline">
                 <input type="radio" class="form-check-input " id="REMIND_MAIL_ENABLE1" name="REMIND_MAIL_ENABLE" value="1" checked>個人
                 <label class="form-check-label" for="REMIND_MAIL_ENABLE1"></label>
             </div>
             <div class="form-check  form-check-inline">
                 <input type="radio" class="form-check-input " id="REMIND_MAIL_ENABLE2" name="REMIND_MAIL_ENABLE" value="2">單位
                 <label class="form-check-label" for="REMIND_MAIL_ENABLE2"></label>
             </div>
         </div>


         <div class="  ">

              
               
                    <div class="row my-1 py-1  border border-end-0 border-top-0  border-start-0 ">
                         <div class="col-8"> <label>欄位</label> </div>
                         <div class="col-2 text-nowrap text-center"><label>顯示</label> </div>
                         <div class="col-2  text-nowrap text-center"> <label>必填</label></div>
                     </div>
                      <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
                          <div class="col-8  "><label>投保單位代號</label> </div>
                        <div class="col-2 text-center"><input type="checkbox"  ></div>
                    <div class="col-2 text-center"><input type="checkbox"  ></div>
                      </div>
                     <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
                          <div class="col-8"><label>醫療院所代號</label></div>
                         <div class="col-2 text-center"><input type="checkbox"  ></div>
                    <div class="col-2 text-center"><input type="checkbox"  ></div>
                      </div>
            <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
                  <div class="col-8"><label>統⼀編號</label></div>
                 <div class="col-2 text-center"><input type="checkbox"  ></div>
                <div class="col-2 text-center"><input type="checkbox"  ></div>
              </div>
             <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
                  <div class="col-8"><label>投保單位代號或統⼀編號</label></div>
                  <div class="col-2 text-center"><input type="checkbox"  ></div>
                  <div class="col-2 text-center"><input type="checkbox"  ></div>
              </div>

              <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
                  <div class="col-8"><label>指定單位代號</label></div>
                  <div class="col-2 text-center"><input type="checkbox"  ></div>
                  <div class="col-2 text-center"><input type="checkbox"  ></div>
              </div>

              <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
                 <div class="col-8"><label>單位名稱</label></div>
                 <div class="col-2 text-center"><input type="checkbox"  ></div>
                 <div class="col-2 text-center"><input type="checkbox"  ></div>
             </div>

              <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
    <div class="col-8"><label>⾝分證號/居留證號</label></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
</div>
                           <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
    <div class="col-8"><label>職稱</label></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
</div>

                                        <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
    <div class="col-8"><label>製作教師研習證明</label></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
</div>

                                                     <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
    <div class="col-8"><label>上傳公務⼈員訓練時數</label></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
</div>

   <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
    <div class="col-8"><label>參與⽅式</label></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
</div>

   <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
    <div class="col-8"><label>個資使⽤同意證明</label></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
</div>



   <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
    <div class="col-8"><label>餐飲習慣</label></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
</div>
   <div class="row  my-1 py-1   border border-end-0 border-top-0  border-start-0 ">
    <div class="col-8"><label>備註</label></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
    <div class="col-2 text-center"><input type="checkbox"  ></div>
</div>


</div>








<%--             <table class="table border table-registration">
                 <thead>
                     <tr>
                         <th>欄位</th>
                         <th>顯示</th>
                         <th>必填</th>
                     </tr>
                 </thead>
                 <tbody>
                     <tr>
                         <th class="note-g">投保單位代號</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td rowspan="5"><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                     </tr>
                     <tr>
                         <th class="note-g">醫療院所代號</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th class="note-g">統⼀編號</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th class="note-g">投保單位代號或統⼀編號</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th class="note-g">指定單位代號</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>單位名稱</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                    <%-- @*<tr>  must
                             <th>姓名</th>
                             <td><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                             <td><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                         </tr>*@ 
                     <tr>
                         <th>⾝分證號/居留證號</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>職稱</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                    <%-- @*<tr> must
                             <th>連絡電話</th>
                             <td><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                             <td><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                         </tr>
                         <tr>
                             <th>電⼦郵件信箱</th>
                             <td><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                             <td><label><input type="checkbox" checked><span class="checkbox-unit-disabled"></span></label></td>
                         </tr>*@ 
                     <tr>
                         <th>製作教師研習證明</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>上傳公務⼈員訓練時數</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>參與⽅式</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>個資使⽤同意證明</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>餐飲習慣</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                     <tr>
                         <th>備註</th>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                         <td><label><input type="checkbox"><span class="checkbox-unit"></span></label></td>
                     </tr>
                 </tbody>
             </table>
         --%>
         
         </div>

     </div>




     <div class="d-flex justify-content-center my-4">

         <button type="button" id="btn_Insert"
                 data-target=@string.Concat(ControllerName
                    ,"Insert"
             )
                 class="    px-4 py-2  me-5 mb-2 text-nowrap  btn-primary-isre btn ">
             <span>儲存</span>
         </button>
         <a href="#" class="btn btn-primary-isre    px-3 py-2  me-5 mb-2 ">回前頁</a>

     </div>
 

       
    </div> 




       </main>
    <script> 

		$(document).ready(function () {



		});

	</script>
</asp:Content>
