<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ISRI0003.aspx.cs" 
    Inherits="ISRE.ISRI0003" %>
<%--this page is for backend session create/edit--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<%
           string GUID = Request.QueryString["GUID"]??"";  /////////GUID=session guid
  
           string ActioinName = (GUID == "") ?  "新增":"編輯" ;
  %>
        
       <main aria-labelledby="title">
        

        <div class=" my-2">
                 <h3 class="text-center  ">活動內容</h3> 
                 <% 
                      dynamic Activity = Process_ActivityInfoBySession(GUID);
                 %>
                  <%-- activity info summary start --%>
      <%-- activity info summary title  rt --%>
      <div class="  card   d-none d-lg-block "> 
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
         <div class="    card m-1  border-end-0 border-top-0 border-bottom-0 border-start-0   ">
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
             
       
   

       
 
 <%--session   start  --%>
            <h3 class="text-center mt-5 mb-2"> <%: String.Concat(ActioinName, "場次資訊") %> </h3>
         <%  
             dynamic Model = Process_Session(GUID);
           string sSelected = "";
          %>
         
            <div class="m-2 p-2">

   <%   
          if (Model != null)
          { %>
              <div class="   row      ">
                  <div class="  bg-info   py-3   col-lg-2 border">
                      <b><label>場次 </label></b>
                  </div>
                  <div class="  py-3   col-lg-10 border">
                      <input type="text" name="SESS_NO" id="SESS_NO"
                          class="form-control mx-1 " readonly disabled
                           value="<%: (Model !=null &&  Model.SESS_NO!=null)
                          ? Model.SESS_NO
                          : "" %>" >
                  </div>
              </div>
        <%    }  %>


      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label>日期時間 </label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div class="d-flex">
                  <input type="text" id="SESS_DATE_S_DATE" name="SESS_DATE_S_DATE"
                      class="form-control mx-1 requiredInput"
                      placeholder="民國年/月/日" >
                  <input type="time" id="SESS_DATE_S_TIME" name="SESS_DATE_S_TIME" 
                      placeholder="HH:mm" 
                      class="form-control mx-1 requiredInput" >
                   <input type ="hidden" id="SESS_DATE_S" name="SESS_DATE_S"
                    value="<%: (Model !=null &&  Model.SESS_DATE_S!=null
                      ? Model.SESS_DATE_S 
                      : DateTime.Now )  %>" />    
                  <span> ~ </span>
                  <input type="text" id="SESS_DATE_E_DATE" name="SESS_DATE_E_DATE" 
                      class="form-control mx-1 requiredInput"
                         placeholder="民國年/月/日" >

                  <input type="time" id="SESS_DATE_E_TIME" name="SESS_DATE_E_TIME"
                      placeholder="HH:mm" class="form-control mx-1 requiredInput"  >
                    <input type ="hidden" id="SESS_DATE_E" name="SESS_DATE_E"
                       value="<%: (Model !=null &&  Model.SESS_DATE_E!=null
                         ? Model.SESS_DATE_E 
                         : DateTime.Now )  %>" />      
              </div>
          </div>
      </div>

      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label>地點 </label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>
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

      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 報名期間</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div class="d-flex">
                  <input type="text" id="REG_DATE_S" name="REG_DATE_S" 
                      placeholder="民國年/月/日" class="form-control  mx-1 requiredInput"
                        value="<%: (Model !=null &&  Model.REG_DATE_S!=null
                         ? Model.REG_DATE_S.ToString("yyyy-MM-dd") 
                         : ""  )  %>"   >
                  <span>~</span>
                  <input type="text" id="REG_DATE_E" name="REG_DATE_E" 
                      placeholder="民國年/月/日" class="form-control  mx-1 requiredInput"
                        value="<%: (Model !=null &&  Model.REG_DATE_E!=null
                        ? Model.REG_DATE_E.ToString("yyyy-MM-dd") 
                        : ""  )  %>" >
              </div>
          </div>
      </div>
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label>報到時間 </label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div class="d-flex">
                  <input type="text" id="CHK_DATE_S_DATE" name="CHK_DATE_S_DATE" 
                      placeholder="民國年/月/日" class="form-control  mx-1 requiredInput"
                       value="<%: (Model !=null &&  Model.CHK_DATE_S_DATE!=null
                     ? Model.CHK_DATE_S_DATE.ToString("yyyy-MM-dd") 
                     : ""  )  %>" >
                  <input type="time" id="CHK_DATE_S_TIME" name="CHK_DATE_S_TIME" placeholder="HH:mm" class="form-control mx-1 requiredInput"
                          value="<%: (Model !=null &&  Model.CHK_DATE_S_TIME!=null
                        ? Model.CHK_DATE_S_TIME.ToString("yyyy-MM-dd")  
                        : ""  )  %>"  >
                  <span>~</span>
                  <input type="text" id="CHK_DATE_E_DATE" name="CHK_DATE_E_DATE" placeholder="民國年/月/日" class="form-control  mx-1 requiredInput"
                        value="<%: (Model !=null &&  Model.CHK_DATE_E_DATE!=null
                        ? Model.CHK_DATE_E_DATE.ToString("yyyy-MM-dd") 
                        : ""  )  %>" >
                  <input type="time" id="CHK_DATE_E_TIME" name="CHK_DATE_E_TIME" placeholder="HH:mm" class="form-control mx-1 requiredInput"
                         value="<%: (Model !=null &&  Model.CHK_DATE_E_TIME!=null
                         ? Model.CHK_DATE_E_TIME 
                         : ""  )  %>"  >
              </div>
          </div>
      </div>
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 主辦單位</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>
                  <input type="text" class="form-control  mx-1 requiredInput" 
                      id="SESS_HOST" name="SESS_HOST"
                       value="<%: (Model !=null &&  Model.SESS_HOST!=null
                     ? Model.SESS_HOST : ""  )  %>" >
              </div>
          </div>
      </div>
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 協辦單位</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>
                  <input type="text" class="form-control  mx-1 requiredInput" id="SESS_CO_HOST" name="SESS_CO_HOST"
                        value="<%: (Model !=null &&  Model.SESS_CO_HOST!=null
                        ? Model.SESS_CO_HOST : ""  )  %>" >
              </div>
          </div>
      </div>
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 洽詢專線</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>
                  <input type="text" class="form-control  mx-1 requiredInput"
                      id="SESS_CONTACT_INFO" name="SESS_CONTACT_INFO"
                        value="<%: (Model !=null &&  Model.SESS_CONTACT_INFO!=null
                        ? Model.SESS_CONTACT_INFO : ""  )  %>" >
              </div>
          </div>
      </div>
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 報名⼈數上限</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>
                  <input type="number" class="form-control  mx-1 requiredInput" 
                      id="REG_MAX_COUNT" name="REG_MAX_COUNT"
                       value="<%: (Model !=null &&  Model.REG_MAX_COUNT!=null
                        ? Model.REG_MAX_COUNT : ""  )  %>" >
              </div>
          </div>
      </div>
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 候補⼈數</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>
                  <input type="number" class="form-control  mx-1 requiredInput" 
                      id="WAIT_NAX_COUNT" name="WAIT_NAX_COUNT"
                       value="<%: (Model !=null &&  Model.WAIT_NAX_COUNT!=null
                    ? Model.REG_MAX_COUNT : ""  )  %>" >
              </div>
          </div>
      </div>
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 單位報名⼈數上限</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>
                  <input type="number" class="form-control  mx-1 requiredInput" 
                      id="UNIT_NAX_COUNT" name="UNIT_NAX_COUNT"
                         value="<%: (Model !=null &&  Model.UNIT_NAX_COUNT!=null
                        ? Model.UNIT_NAX_COUNT : ""  )  %>"  >
              </div>
          </div>
      </div>
             
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 設定活動內容</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>
                  <table class="table border">
                      <thead>
                          <tr>
                              <th>時間</th>
                              <th>內容</th>
                              <th width="10%">刪除</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                              <!--<td><input type="datetime-local" class="medium"></td>-->
                              <td>
                                  <div class="d-flex">
                                      <input type="text" class="form-control    " 
                                          id="sch_s_datepicker" placeholder="民國年/月/日">
                                      <input type="time" placeholder="HH:mm" class="form-control">
                                      <span>~</span>
                                      <input type="text" id="sch_e_datepicker"
                                          class="form-control  " placeholder="民國年/月/日">
                                      <input type="time" placeholder="HH:mm" class="form-control">
                                  </div>

                              </td>
                              <td><textarea name="" id="" cols="30" rows="2" 
                                  class="form-control"></textarea></td>
                              <td><a href="#" class="btn form-control">刪除</a></td>
                          </tr>
                      </tbody>
                  </table>
                  <div class="d-flex">
                      <a href="#" class="btn btn-primary-isre px-4">+新增活動內容</a>
                  </div>
              </div>
          </div>
      </div>
             
    <%--  @*上傳活動資料*@--%>
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 上傳活動資料</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div class="d-flex">
                  <a href="#" class="btn btn-primary-isre px-5"> 選擇檔案</a>
              </div>
              <div>
                  <table class="table border">
                      <thead>
                          <tr>
                              <th>檔名</th>
                              <th>檔案大小</th>
                              <th width="10%">刪除</th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr>
                              <td>
                                  <div class="d-flex">
                                      交通資訊.pdf
                                  </div>

                              </td>
                              <td>1.35MB </td>
                              <td><a href="#" class="btn btn-primary-isre form-control">刪除</a></td>
                          </tr>
                      </tbody>
                  </table>

              </div>
          </div>
      </div>
 
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 上傳單位限定資料</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>

                  <div class="table-wrap">
                      <div class="note-b">
                          1.若無上傳資料，表此場次未限定特定參加單位。 <br>
                          2.若已有資料且再次上傳，則以最後⼀次上傳的資料為單位限定清單。<br>
                          3.「投保單位代號」、「統⼀編號」、「醫療院所代號」及「指定單位代號」擇⼀匯入。<br>
                          4.副檔名為.xlsx或.csv檔。<br>
                          5.檔案欄位依序為「單位名稱」、「單位代號」及「單位報名⼈數上限」。
                      </div>

                      <div class="d-flex">
                          <a href="#" class="btn btn-primary-isre px-5"> 選擇檔案</a>
                      </div>
                      <div>
                          <table class="table border">
                              <thead>
                                  <tr>
                                      <th>檔名</th>
                                      <th>檔案大小</th>
                                      <th width="10%">刪除</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <tr>
                                      <td>
                                          <div class="d-flex">
                                              交通資訊.pdf
                                          </div>

                                      </td>
                                      <td>1.35MB </td>
                                      <td><a href="#" class="btn btn-primary-isre form-control">刪除</a></td>
                                  </tr>
                              </tbody>
                          </table>

                      </div>
                       
                  </div>
              </div>
          </div>
      </div>

      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b> <label> 視訊會議</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>

                  <div>視訊連結</div>
                  <input type="text" class="form-control  mx-1 requiredInput" 
                      id="VIDEO_LINK" name="VIDEO_LINK"
                       value="<%: (Model !=null &&  Model.VIDEO_LINK!=null
                        ? Model.VIDEO_LINK : ""  )  %>"  >
                  <div class="unit-box">
                      <p>報名成功通知信是否附上視訊連結</p> 
                      <div>
                          <div class="form-check  form-check-inline">
                              <input type="radio" class="form-check-input   " 
                                  id="ATTACH_VIDEO_LINK1" name="ATTACH_VIDEO_LINK" value="1" checked>是
                              <label class="form-check-label" for="ATTACH_VIDEO_LINK1"></label>
                          </div>
                          <div class="form-check  form-check-inline">
                              <input type="radio" class="form-check-input   " 
                                  id="ATTACH_VIDEO_LINK2" name="ATTACH_VIDEO_LINK" value="2">否
                              <label class="form-check-label" for="ATTACH_VIDEO_LINK2"></label>
                          </div>
                      </div>

                  </div>
              </div>
          </div>
      </div>
 
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 報名確認信</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>
                  <div>文字敘述</div>
                  <textarea name="CONFIRM_MAIL" id="CONFIRM_MAIL" cols="30" rows="3"
                            class="form-control  requiredInput"><%: (Model !=null &&  Model.CONFIRM_MAIL!=null ? Model.CONFIRM_MAIL : ""  )  %></textarea>
                  <div class="d-flex">
                      <a href="#" class="btn btn-primary-isre px-4">預覽</a>
                  </div>

              </div>
          </div>
      </div>
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label>報名成功通知 </label>信</b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>
                  <div>文字敘述</div>
                  <textarea name="SUCCESS_MAIL" id="SUCCESS_MAIL" cols="30" rows="3"
                            class="form-control  requiredInput"><%: (Model !=null &&  Model.SUCCESS_MAIL!=null ? Model.SUCCESS_MAIL : ""  )  %> </textarea>
                  <div class="d-flex">
                      <a href="#" class="btn btn-primary-isre px-4">預覽</a>
                  </div>
              </div>
          </div>
      </div>
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 報名候補確認信</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>
                  <div>文字敘述</div>
                  <textarea name="WAIT_MAIL" id="WAIT_MAIL" cols="30" rows="3"
                    class="form-control  
                      requiredInput"> <%: (Model !=null &&  Model.WAIT_MAIL!=null ? Model.WAIT_MAIL : ""  )  %> </textarea>
                  <div class="d-flex">
                      <a href="#" class="btn btn-primary-isre px-4">預覽</a>
                  </div>
              </div>

          </div>
      </div>
 
      <div class="  row     ">
          <div class=" bg-info   py-3  col-lg-2 border  ">
              <span class="">*</span><b><label> 活動提醒通知信</label></b>
          </div>
          <div class="  py-3   col-lg-10 border">
              <div>
                  <div class="d-flex">
                      <div>
                          <div class="form-check  form-check-inline">
                              <input type="radio" class="form-check-input " id="REMIND_MAIL_ENABLE1"
                                  name="REMIND_MAIL_ENABLE" value="1" checked>啟用
                              <label class="form-check-label" for="REMIND_MAIL_ENABLE1"></label>
                          </div>
                          <div class="form-check  form-check-inline">
                              <input type="radio" class="form-check-input " id="REMIND_MAIL_ENABLE2" 
                                  name="REMIND_MAIL_ENABLE" value="2">停用
                              <label class="form-check-label" for="REMIND_MAIL_ENABLE2"></label>
                          </div>
                      </div>
                      <div class="ms-5 me-3 "><label> 寄送時間</label></div>
                      <div class="d-flex">
                          <input type="text" id="REMIND_MAIL_DATE" name="REMIND_MAIL_DATE"
                                 placeholder="民國年/月/日" class="form-control  mx-1    requiredInput"
                              value="<%: (Model !=null &&  Model.REMIND_MAIL_DATE!=null
                                ? Model.REMIND_MAIL_DATE.ToString("yyyy-MM-dd") : ""  )  %>"   >
                          <input type="time" id="REMIND_MAIL_TIME" name="REMIND_MAIL_TIME" placeholder="HH:mm"
                                 class="form-control mx-1 flex-grow-1 requiredInput"
                               value="<%: (Model !=null &&  Model.REMIND_MAIL_TIME!=null
                                ? Model.REMIND_MAIL_TIME : ""  )  %>" />

                                

                      </div>

                  </div>
                  <div>文字敘述</div>
                  <textarea name="REMIND_MAIL_TEXT" id="REMIND_MAIL_TEXT" cols="30" rows="3"
                            class="form-control requiredInput ">
                      <%: (Model !=null &&  Model.REMIND_MAIL_TEXT!=null ? Model.REMIND_MAIL_TEXT : ""  )  %> </textarea>
                  <div class="d-flex">
                      <a href="#" class="btn btn-primary-isre px-4">預覽</a>
                  </div>

              </div>
          </div>
      </div>
             
      <div class="d-flex justify-content-center mt-5 mb-3">
         <%-- @if (Model == null)
          {
              <button type="button" id="btn_Insert" guid="@ViewBag.ActivityGUID"
                      data-target=@string.Concat(ControllerName
                     ,"Insert"
              )
                      class="   px-sm-4 py-2  me-md-5 mb-2 text-nowrap  btn-primary-isre btn ">
                  <span>新增</span>
              </button>
          }
          else
          {
              <button type="button" id="btn_Insert" guid="@Model.GUID"
                      data-target=@string.Concat(ControllerName
                     ,"Save"
              )
                      class="   px-sm-4 py-2  me-md-5 mb-2  text-nowrap  btn-primary-isre btn ">
                  <span>儲存</span>
              </button>

              <button type="button" GUID="@Model.GUID"
                      data-target=@string.Concat(ControllerName
                 ,"Delete"
               )
                      class=" btn btn_Delete   btn-primary-isre   px-sm-4 py-2  me-md-5 mb-2 ">
                  刪除
              </button>

          }--%>
        <%--  @*<a href="#" class="btn btn-primary-isre  text-nowrap    px-sm-4 py-2  me-md-5 mb-2 ">回前一頁</a>*@--%>

          <a href="/Activity/ManageActivity?Guid=@ViewBag.ActivityGUID" class="btn btn-primary-isre  text-nowrap    px-sm-4 py-2  me-md-5 mb-2 ">回前一頁</a>

          <a href="/" class="btn btn-primary-isre  text-nowrap    px-sm-4 py-2  me-md-5 mb-2 ">回首頁</a>



      </div>
 
 

            </div>
  
        
<%--  session   end  --%>

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
