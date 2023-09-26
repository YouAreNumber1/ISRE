<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ISRE0000.aspx.cs"
    Inherits="ISRE.ISRE0000" %>

<%--this page is for frontend activity list--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<%--    <%   
		//string colorName = ShowAssumptions.Items[ShowAssumptions.SelectedIndex].Text;
		//Response.Write(colorName);
		string sSelected = "";
		string SESS_LOC = Request["SESS_LOC"] ?? "";
		

		string OBJ_NO = Request["OBJ_NO"] ?? "";
		string ACT_TYPE = Request["ACT_TYPE"] ?? "";
		string ACT_NAME = Request["ACT_NAME"] ?? "";
		string ACT_HOST = Request["ACT_HOST"] ?? "";
		string ACT_DATE_S_DATE = Request["ACT_DATE_S_DATE"] ?? "";
		string ACT_DATE_E_DATE = Request["ACT_DATE_E_DATE"] ?? "";
		StringBuilder sb = new StringBuilder();
		bool bSearch = false;
		if (SESS_LOC != "" || OBJ_NO != "" || ACT_TYPE != "" || ACT_NAME != "" || ACT_HOST != "" || ACT_DATE_S_DATE != "" || ACT_DATE_E_DATE != "")
		{
			bSearch = true;
		}
    %>
--%>


    <%--<%: SESS_LOC  %>
<%: OBJ_NO  %>
<%: ACT_TYPE  %>
<%: ACT_NAME  %>
<%: ACT_HOST  %>
<%: ACT_DATE_S_DATE  %>
<%: ACT_DATE_E_DATE  %>--%>
 <%--   <%
        if (bSearch)
        {
            //if (ACT_NAME != "")
            //{
            //	sb.Append("<h6>活動名稱 <span class='");
            //	sb.Append("badge bg-secondary'>");
            //	sb.Append(ACT_NAME);
            //	sb.Append("</span></h6>");
            //}
            //if (OBJ_NO != "")
            //{
            //	sb.Append("<h6>身分別 <span class='badge bg-secondary'>");
            //	sb.Append(OBJ_NO);
            //	sb.Append("</span></h6>");
            //}
            //if (ACT_TYPE != "")
            //{
            //	sb.Append("<h6>活動類別 <span class='badge bg-secondary'>");
            //	sb.Append(ACT_TYPE);
            //	sb.Append("</span></h6>");
            //}
            //if (ACT_NAME != "")
            //{
            //	sb.Append("<h6>活動名稱 <span class='badge bg-secondary'>");
            //	sb.Append(ACT_NAME);
            //	sb.Append("</span></h6>");
            //}
            //if (ACT_HOST != "")
            //{
            //	sb.Append("<h6>主辦單位 <span class='badge bg-secondary'>");
            //	sb.Append(ACT_HOST);
            //	sb.Append("</span></h6>");
            //}
            //if (ACT_DATE_S_DATE != "")
            //{
            //	sb.Append("<h6>活動時間起日 <span class='badge bg-secondary'>");
            //	sb.Append(ACT_DATE_S_DATE);
            //	sb.Append("</span></h6>");
            //}
            //if (ACT_DATE_S_DATE != "")
            //{
            //	sb.Append("<h6>活動時間迄日 <span class='badge bg-secondary'>");
            //	sb.Append(ACT_DATE_E_DATE);
            //	sb.Append("</span></h6>");
            //}
        }
    %>--%>






    <main>
        <section>
            <div class="d-flex  justify-content-between align-content-center  ">
                <div class="d-none d-sm-block"></div>
                <div>
                    <h3 class="text-center my-3">活動報名</h3>
                </div>
                <div class="mt-2">
                    <a id="aFilter" href="#Filter" class=" btn btn-primary-isre  px-lg-4 "
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
                                                <label class="text-nowrap">辦理縣市</label>
                                            </div>
                                        </div>
                                        <div class="col-8">
                                            <div class="  flex-grow-1 ">  
                                                <asp:DropDownList ID="SESS_LOC" runat="server" CssClass="form-control form-select"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="    col-lg-4">
                                    <div class="row d-flex align-items-center p-2">
                                        <div class="col-4">
                                            <div class="    ">
                                                <label class="text-nowrap">身分別</label>
                                            </div>
                                        </div>
                                        <div class="col-8">
                                            <div class="  flex-grow-1 ">                
                                                <asp:DropDownList ID="OBJ_NO" runat="server" CssClass="form-control form-select"></asp:DropDownList>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="    col-lg-4">
                                    <div class="row d-flex align-items-center p-2">
                                        <div class="col-4">
                                            <div class="    ">
                                                <label class="text-nowrap">活動類別</label>
                                            </div>
                                        </div>
                                        <div class="col-8">
                                            <div class="  flex-grow-1 ">                                              
                                                <asp:DropDownList ID="ACT_TYPE" runat="server" CssClass="form-control form-select"></asp:DropDownList>
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
                                                <asp:TextBox ID="ACT_NAME" runat="server" CssClass="form-control"></asp:TextBox>
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
                                                    value="<%:  Request["ACT_HOST"] %>">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class=" row  ">
                                <div class="    col-lg-8">
                                    <div class="row d-flex align-items-center p-2">
                                        <div class="col-4 col-lg-2">
                                            <div class="    ">
                                                <label class="text-nowrap">活動時間</label>
                                            </div>
                                        </div>
                                        <div class="col-8 col-lg-10">
                                            <div class="d-lg-flex">
                                                <div class="d-lg-flex   flex-grow-1">
                                                    <input type="text" id="ACT_DATE_S_DATE" name="ACT_DATE_S_DATE"
                                                        class="form-control " placeholder="民國年/月/日"
                                                        value="<%:  Request["ACT_DATE_S_DATE"] %>">
                                                    <input type="hidden" id="ACT_DATE_S" name="ACT_DATE_S" />
                                                    <span class="mx-1">~</span>
                                                </div>
                                                <div class="d-lg-flex  flex-grow-1">
                                                    <input type="text" id="ACT_DATE_E_DATE" name="ACT_DATE_E_DATE"
                                                        class="form-control " placeholder="民國年/月/日"
                                                        value="<%:  Request["ACT_DATE_E_DATE"] %>">
                                                    <input type="hidden" id="ACT_DATE_E" name="ACT_DATE_E" />
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="  d-lg-none  col-lg-4">
                                    <div class="row d-flex align-items-center p-2">
                                        <div class="col-4">
                                            <div class="    ">
                                                <label class="text-nowrap">排序</label>
                                            </div>
                                        </div>
                                        <div class="col-8">
                                            <div class="  flex-grow-1 ">
                                                <select class="form-control form-select">
                                                    <option>活動主題</option>
                                                    <option>日期時間</option>
                                                    <option>發布⽇期</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-center m-4">
                    <button type="button" id="BtnQuery" name="BtnQuery" class="btn btn-primary-isre px-5 text-nowrap" runat="server"                          
                        onserverclick="BtnQuery_Click">
                        查詢 <i class="fa-solid fa-magnifying-glass text-white"></i>                      
                    </button>
                </div>
            </div>
        </section>

        <asp:Literal ID="cardSearch" runat="server" />
        
        <div 
            runat="server"
            ID="SearchCriteria"
            class="card mb-2" >
            <div class="card-body">
                <div class="badge bg-info">搜尋條件</div>
                <h6>
                    <!--earch criteria-->
                    <asp:Literal ID="LtlSearchCriteriaData" runat="server"></asp:Literal>
                </h6>
                
            </div>
        </div>        
 
        <asp:Literal ID="ltTable3" runat="server" />

      

        <h5 class="my-2  text-center" runat="server" id="SearchResult">查詢結果</h5>
        <div class="  card  d-none d-lg-block ">
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
                        <div class=" text-center ">
                            發布⽇期
                            <i class="fas fa-long-arrow-alt-down mx-1" style="color: #197584"></i>
                        </div>
                    </div>
                    <div class=" col-lg-2"></div>

                </div>
            </div>
        </div>

        <% 
			dynamic List_Activities = Process_ActivityList(1, 1);
			foreach (var item in List_Activities)
			{
        %>
        <div class="border rounded my-1 py-1">
            <div class="    card m-1 border-0   ">
                <div class=" row no-gutters  ">
                    <div class="col-12 col-lg-5 ">
                        <div class="row no-gutters">
                            <span class="d-lg-none col-4 col-sm-2   ">
                                <span class="badge bg-info">活動主題</span>
                            </span>
                            <span class="col-8 col-sm-10">
                                <a href="ISRE0001.aspx?GUID=<%:item.GUID %>&plan=b"><%:item.ACT_NAME %></a>
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
                                    <div class="text-center">112/08/31 </div>
                                </div>
                            </div>


                        </div>
                    </div>
                    <div class="col-12 col-lg-1 d-none d-lg-block">
                        <div class="row no-gutters">
                            <div class="d-lg-none  col-4  col-sm-2   ">
                                <div class="badge bg-info">總場次</div>
                            </div>
                            <div class="col-8 col-sm-10 col-lg-12 ">
                                <div class=" d-flex  d-lg-block">
                                    <div class="text-center">
                                        <div class="badge bg-warning">
                                            <%:item.TotalSessionNo %>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-2 ">
                        <div class="row no-gutters">
                            <div class="d-lg-none  col-4  col-sm-2   ">
                                <div class="badge bg-info">發布⽇期</div>
                            </div>
                            <div class="col-8 col-sm-10 col-lg-12 ">
                                <div class=" d-flex  d-lg-block">
                                    <div class="text-center">112/08/31 </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-12 col-lg-2 mt-3 mt-lg-0">
                        <div class="row no-gutters">
                            <div class="col d-flex justify-content-around">
                                <div class="d-flex">
                                    <%-- <a href="/isre0001.aspx?guid=this&multiple=1"  class="btn btn-primary-isre text-nowrap mx-1"> 查場次  </a> --%>
                                    <a href="ISRE0001.aspx?GUID=<%:item.GUID %>&plan=a"
                                        class="btn btn-primary-isre text-nowrap mx-1 px-3">檢視場次<span class="d-lg-none badge bg-warning mx-1"><%:item.TotalSessionNo %></span>

                                    </a>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>

        </div>
        <% } %>


        <%-- <div id="test"  >test test</div>--%>
    </main>

    <script> 
        $(document).ready(function () {

            $("#ACT_DATE_S_DATE, #ACT_DATE_E_DATE").datepicker($.datepicker.regional['zh-TW']);

            $(".collapse").on('show.bs.collapse', function () {
                $('#aFilter').children().addClass('fa-chevron-up').removeClass('fa-chevron-down');
            });

            $(".collapse").on('hide.bs.collapse', function () {
                $('#aFilter').children().addClass('fa-chevron-down').removeClass('fa-chevron-up');
            });

            // event
            //$("button").on("click", function () {
            //    alert(1);
            //    alert(this.id);
            //    alert(this.name);
            //    $("#aFilter").attr("aria-expanded", "true");

            //    alert($('select[id*=ddlCityList]').val());
            //    alert($('select[id*=ddlCityList]').find(':selected').text());

            //});

            //$("#Button1").on("click", function () {
            //    //alert(1);
            //    //alert(this.id);
            //    //alert(this.name);
            //    $("#aFilter").attr("aria-expanded", "true");

            //    //alert($('select[id*=ddlCityList]').val());
            //    //alert($('select[id*=ddlCityList]').find(':selected').text());

            //});
            

            //$("select[id*=ddlCityList]").on("change", function () {
            //    //alert(this.value);
            //    var GetDdlText = $('select[id*=ddlCityList]').find(':selected').text();
            //    if (this.value == undefined || this.value == '') {
            //        GetDdlText = "";
            //    }  
            //    $('#ddlCitySelectFont').text(GetDdlText);

            //});

            //$("select[id*=ddlNOList]").on("change", function () {
            //    var GetDdlText = $('select[id*=ddlNOList]').find(':selected').text();

            //    if (this.value == undefined || this.value == '') {
            //        GetDdlText = "";
            //    }               
            //    $('#ddlNOSelectFont').text(GetDdlText);
            //});
            //$("select[id*=ddlActTypeList]").on("change", function () {
            //    var GetDdlText = $('select[id*=ddlActTypeList]').find(':selected').text();
            //    if (this.value == undefined || this.value == '') {
            //        GetDdlText = "";
            //    }  
            //    $('#ddlActTypeSelectFont').text(GetDdlText);
            //});
            //$("#aFilter").on("click", function () {

            //    alert(1);
            //    alert(this.);
            //    alert(this.name);
            //});

        });
    </script>
</asp:Content>
