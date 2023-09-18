<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="ISRE0002.aspx.cs" 
    Inherits="ISRE.ISRE0002" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <%
            String   GUID2 = Request.QueryString["GUID"];
            String   multiple = Request.QueryString["multiple"];
            dynamic Session = Process_Read("Session_ISRE_Session_MAIN", GUID2);
%>

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
        </div>
    </div>
</div>
         

         
<%--<div class="card my-3">
    <div class="card-header ">活動資訊</div>
</div>
<table class="  table table-bordered  ">
    <thead>
        <tr>
            <th class="bg-info"> 場次 </th>
            <th class="bg-info"> ⽇期時間 </th>
            <th class="bg-info"> 地點 </th>
            <th class="bg-info"> 報名截⽌⽇</th>

            <th class="bg-info"> 活動資料 </th>
            <th class="bg-info"> 尚餘名額  </th>

        </tr>
    </thead>
    <tbody>

        <tr>

            <td>        </td>
            <td>@Model.SESS_DATE_S     </td>
            <td>@Model.SESS_LOC</td>
            <td>@Model.CHK_DATE_E</td>


            <td> </td>
            <td> </td>
        </tr>
    </tbody>

</table>
--%>

    </main>

</asp:Content>
