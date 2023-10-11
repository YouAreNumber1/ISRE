<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRI0000.aspx.cs"
	Inherits="ISRE.ISRI0000" %>

<%--this page is for backend activity list--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
<% 
	 ///////GetHashCode() for an unassigned datetime Is always zero, use this to check null date 
%> 
  
	<main>
		
	 
		<section class="mb-2 my-2">
			<div class="d-flex  justify-content-between align-items-center  ">
				<div class="d-none d-sm-block"></div>
				<h3 class="  ">活動清單</h3>

				<a href="ISRI0001.aspx" class=" btn btn-primary-isre   ">新增活動  
				</a>
			</div>
			<div class="d-flex">
				<div class="  ">
					<div>代理人員：</div>
					<select name="agentName" id="agentName" class="form-control form-select">

						<option value=""></option>
						<option value="">王大頭</option>
					</select>
				</div>
				<div class="mx-1 mx-sm-3">
					<div>查詢條件：</div>
					<select name="pagesize" id="pagesize" class="form-control form-select">
						<option value="">最近20筆</option>
						<option value="">全部</option>
					</select>
				</div>
			</div>
		</section>



		<div class="    card p-2  my-2 d-none d-lg-block bg-ice ">

			<div class="row  text-center  ">
				<div class=" col-lg-3">
					<div class=" text-start">活動主題 </div>
				</div>
				<div class=" col-lg-3">
					<div class=" ">活動⽇期區間</div>
				</div>
				<div class=" col-lg-1">
					<div class="   ">總場次</div>
				</div>
				<div class=" col-lg-1 ">
					<div class="   ">主辦單位</div>
				</div>
				<div class=" col-lg-2 ">
					發布⽇期 
					<i class="fas fa-long-arrow-alt-down ms-1 color-isre "></i>
				</div>
				<div class=" col-lg-2">
					<div class="   ">編輯/管理</div>
				</div>

			</div>

		</div>

		<% 
			dynamic Model = Process_ActivityList(1, 1);
			foreach (var item in Model)
			{
		%>

		<div class="    card p-2  my-2   ">
			<div class=" row  d-flex align-items-center  ">
				<div class="col-12 col-lg-3 ">
					<div class="row      ">
						<span class="d-lg-none col-3 col-sm-2   ">
							<span class="badge bg-info">活動主題</span>
						</span>
						<span class="col-9 col-sm-10 col-lg-12 ">
							<%:(item == null || item.ACT_NAME ==null) ? "" : item.ACT_NAME %>
						</span>
					</div>
				</div>
				<div class="col-12 col-lg-3 ">
					<div class="row  d-flex align-items-center ">
						<span class="d-lg-none  col-3   col-sm-2  ">
							<span class="badge bg-info">活動⽇期區間</span>
						</span>
						<div class="col-9 col-sm-10 col-lg-12 ">
							<div class="d-block  d-lg-flex     justify-content-lg-center">
								<div class=" ">
									<%:item == null || item.ACT_DATE_S.GetHashCode()==0 
								?  ""
								: string.Concat(
									(Int32.Parse( item.ACT_DATE_S.ToString("yyyy"))-1911),"/" , item.ACT_DATE_S.ToString("MM"), "/", item.ACT_DATE_S.ToString("dd")
									," ~ "
									,(Int32.Parse( item.ACT_DATE_E.ToString("yyyy"))-1911),"/" , item.ACT_DATE_E.ToString("MM"), "/", item.ACT_DATE_E.ToString("dd")
									)
								
									%> 
								</div>
							</div>
						</div>


					</div>
				</div>
				<div class="col-12 col-lg-1">
					<div class="row  d-flex align-items-center ">
						<div class="d-lg-none  col-3  col-sm-2   ">
							<div class="badge bg-info">總場次</div>
						</div>
						<div class="col-9 col-sm-10 col-lg-12 ">
							<div class=" d-block  d-lg-flex   justify-content-lg-center">
								<div class="badge bg-warning">
									<%: item.TotalSessionNo%>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-12 col-lg-1 ">
					<div class="row  d-flex align-items-center ">
						<div class="d-lg-none  col-3  col-sm-2   ">
							<div class="badge bg-info">主辦單位</div>
						</div>
						<div class="col-9 col-sm-10 col-lg-12 ">
							<div class="d-block  d-lg-flex   justify-content-lg-center">
								<div class=" ">
									<%:(item == null || item.ACT_HOST ==null) ? "" : item.ACT_HOST %>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-12 col-lg-2 ">
					<div class="row  d-flex align-items-center ">
						<span class="d-lg-none  col-3   col-sm-2  ">
							<span class="badge bg-info">發布⽇期</span>
						</span>
						<div class="col-9 col-sm-10 col-lg-12 ">
							<div class=" d-block  d-lg-flex   justify-content-lg-center">
								<div class="  ">
									<%:item == null || item.PUB_DATE_S.GetHashCode()==0 
								?  ""
								: string.Concat(
									(Int32.Parse( item.PUB_DATE_S.ToString("yyyy"))-1911),"/" , item.PUB_DATE_S.ToString("MM"), "/", item.PUB_DATE_S.ToString("dd")
									 ) 
									%>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="col-12 col-lg-2">
					<div class=" d-flex justify-content-between mt-3 mt-lg-0 mx-2 mx-sm-5 mx-lg-0">
						<a href="ISRI0001.aspx?GUID=<%:item.GUID %>"
							class="btn btn-primary-isre text-nowrap px-4 px-lg-2 ">編輯
							<i class="fa-solid fa-pen-to-square"></i>
						</a>
						<a href="ISRI0002.aspx?GUID=<%:item.GUID %>"
							class="btn btn-primary-isre text-nowrap px-4 px-lg-2 ">場次 
							<i class="fa-solid fa-bars-progress"></i>
						</a>
					</div>
				</div>

			</div>
		</div>


		<% } %>
	</main>

	<script>  

		$(function () {

			$(".collapse").on('show.bs.collapse', function () {
				$('#aFilter').children().addClass('fa-chevron-up').removeClass('fa-chevron-down');
			});

			$(".collapse").on('hide.bs.collapse', function () {
				$('#aFilter').children().addClass('fa-chevron-down').removeClass('fa-chevron-up');
			});
		});



	</script>
</asp:Content>
