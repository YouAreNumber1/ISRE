<%-- THIS IS SUB PAGE FOR ACTIVITY INFO --%>
<%

	String Guid = Request.QueryString["GUID"];
	ISRE.ISRE_ACTIVITY_MAIN Model = Process_ActivityInfo(Guid); 

%>
 
<div class="my-2">

	<h3 class="text-center mt-3 ">活動內容</h3>

	<div class="    card p-2  my-2 d-none d-lg-block bg-ice    ">
		<div class="row text-center  ">
			<div class=" col-lg-3   text-start">
				活動主題 
			</div>
			<div class=" col-lg-3  ">
				⽇期 
			</div>
			 
			<div class=" col-lg-1  "> 
				總場次 
			</div>
		 
			<div class=" col-lg-2    ">
				主辦單位
       
			</div>
			<div class=" col-lg-3   ">
				發布⽇期
       
			</div>

		</div>

	</div>

	<div class="    card p-2  my-2     ">
		<div class=" row    d-flex align-items-start ">
			<div class="col-12 col-sm-5 col-lg-3 ">
				<div class="row   ">
					<span class="d-lg-none col-3 col-sm-4   ">
						<span class="badge bg-info  ">活動主題</span>
					</span>
					<div class="col-9 col-sm-8 col-lg-12 ">
						<div>
							<%:(Model == null || Model.ACT_NAME==null) ? "" : Model.ACT_NAME %>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-7 col-lg-3 ">
				<div class="row  d-flex align-items-start ">
					<span class="d-lg-none  col-3 col-sm-4    ">
						<span class="badge bg-info">⽇期</span>
					</span>
					<div class="col-9 col-sm-8 col-lg-12    ">
						<div class="d-flex justify-content-lg-center">
							<%:(Model == null || Model.ACT_DATE_S.GetHashCode()==0 ) ? "" : Model.ACT_DATE_S.ToString("yyyy-MM-dd") %>
							~ <%:(Model == null || Model.ACT_DATE_E.GetHashCode()==0 ) ? "" : Model.ACT_DATE_E.ToString("yyyy-MM-dd") %>
						
						</div>
					</div>
				</div>
			</div>
			<div class="col-12  col-sm-5  col-lg-1 ">
				<div class="row  d-flex align-items-start ">
					<span class="d-lg-none  col-3  col-sm-4  ">
						<span class="badge bg-info">總場次</span>
					</span>
					<div class="col-9 col-sm-8 col-lg-12   text-center  ">
						<div class="d-flex justify-content-lg-center">
							<div class="badge bg-warning">
							 
								<%:(Model == null || Model.TotalSessionNo==null) ? "0" : Model.TotalSessionNo %>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12  col-sm-7  col-lg-2 ">
				<div class="row  d-flex align-items-start ">
					<div class="d-lg-none  col-3  col-sm-4   ">
						<span class="badge bg-info">主辦單位</span>
					</div>
					<div class="col-9 col-sm-8 col-lg-12  text-center  ">
						<div class="d-flex justify-content-lg-center">
							<%:(Model == null || Model.ACT_HOST==null) ? "" : Model.ACT_HOST %>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12  col-sm-5 col-lg-3 ">
				<div class="row  d-flex align-items-start ">
					<div class="d-lg-none  col-3  col-sm-4   ">
						<span class="badge bg-info">發布⽇期</span>
					</div>
					<div class="col-9 col-sm-8 col-lg-12 ">
						<div class="  text-center ">
							<div   class="d-flex justify-content-lg-center ">
							 <%:Model == null || Model.PUB_DATE_S.GetHashCode()==0 
							 ? "" : String.Concat(  (Int32.Parse(Model.PUB_DATE_S.ToString("yyyy")) - 1911), "/", Model.PUB_DATE_S.ToString("MM"), "/", Model.PUB_DATE_S.ToString("dd") ) %>
							</div>
						</div>
					</div>
				</div>
			</div>


		</div>

	</div>


</div>


 



