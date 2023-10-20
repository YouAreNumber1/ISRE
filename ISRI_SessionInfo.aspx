<%-- THIS IS SUB PAGE FOR SESSION INFO --%>
<%
	String SessionGUID = Request.QueryString["SessionGUID"];
	ISRE.ISRE_SESSION_MAIN Model = Process_SessionInfo(SessionGUID); 
     ///////GetHashCode() for an unassigned datetime Is always zero, use this to check null date 
%>

<div class="my-2">
	
	<h3 class="text-center mt-5 mb-2">場次資訊  </h3>


	<div class="  card p-2  my-2 d-none d-lg-block bg-ice      ">
		<div class="row text-center   d-flex align-items-center">
			<div class=" col-lg-1  ">
				場次
       
			</div>
			<div class=" col-lg-1 ">
				日期時間
       
			</div>
			<div class=" col-lg-1  ">
				地點
       
			</div>
			<div class=" col-lg-2 ">
				主辦單位
       
			</div>
			 
			<div class=" col-lg-2      ">
				報名截⽌⽇
       
			</div>

			<div class=" col-lg-2     ">
				可報名⼈數
       
			</div>
			<div class=" col-lg-2     ">
				已報名⼈數
       
			</div>
			<div class=" col-lg-1    ">
				尚餘名額 
			</div>

		</div>
	</div>


	<div class="    card p-2  my-2     ">
		<div class=" row  d-flex align-items-start  ">
			<div class="col-12 col-sm-5  col-lg-1 ">
				<div class="row  d-flex align-items-start">
					<span class="d-lg-none  col-4 col-sm-5     ">
						<span class="badge bg-info">場次</span>
					</span>
					<div class=" col-8 col-sm-7    col-lg-12 ">
						<div class="d-flex justify-content-lg-center">
						 <%:Model == null || Model.SESS_NO==null  ? "" : Model.SESS_NO %>
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-7  col-lg-1 ">
				<div class="row  d-flex align-items-start">
					<span class="d-lg-none   col-4 col-sm-5     ">
						<span class="badge bg-info">日期時間</span>
					</span>
					<div class=" col-8 col-sm-7    col-lg-12  text-center  ">
						<div class="d-flex justify-content-lg-center"> 
						 <%:Model == null ||  Model.SESS_DATE_S.GetHashCode()==0 
							? "" : Model.SESS_DATE_S.ToString("yyyy-MM-dd")	 %>
					  
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-5  col-lg-1 ">
				<div class="row  d-flex align-items-start">
					<span class="d-lg-none  col-4 col-sm-5      ">
						<span class="badge bg-info">地點</span>
					</span>
					<div class=" col-8 col-sm-7    col-lg-12   text-center  ">
						<div class="d-flex justify-content-lg-center">
							 <%:Model == null || Model.CITYNAME==null  ? "" : Model.CITYNAME %>  
						</div>
					</div>
				</div>
			</div>
			<div class="col-12 col-sm-7 col-lg-2 ">
				<div class="row  d-flex align-items-start">
					<span class="d-lg-none    col-4 col-sm-5      ">
						<span class="badge bg-info">主辦單位</span>
					</span>
					<div class=" col-8 col-sm-7    col-lg-12   text-center  ">
						<div class="d-flex justify-content-lg-center">
								 <%:Model == null || Model.ACT_HOST==null  ? "" : Model.ACT_HOST %> 
						</div>
					</div>
				</div>
			</div>
			 
			<div class="col-12 col-sm-5 col-lg-2 ">
				<div class="row  d-flex align-items-start">
					<div class="d-lg-none   col-4 col-sm-5       ">
						<span class="badge bg-info">報名截⽌⽇</span>
					</div>
					<div class=" col-8 col-sm-7    col-lg-12  text-center  ">
						<div class="d-flex justify-content-lg-center">
					 	<%:Model == null || Model.REG_DATE_E==null  ? "" : Model.REG_DATE_E.ToString("yyyy-MM-dd") %> 
						</div>
					</div>
				</div>
			</div>

			<div class="col-12 col-sm-7 col-lg-2 ">
				<div class="row  d-flex align-items-start">
					<div class="d-lg-none   col-4 col-sm-5     ">
						<span class="badge bg-info">可報名⼈數</span>
					</div>
					<div class=" col-8 col-sm-7    col-lg-12  text-center ">
						<div class="d-flex justify-content-lg-center">
							<div class="badge bg-primary mb-1">
								<%:Model == null || Model.REG_MAX_COUNT==null  ? "" : Model.REG_MAX_COUNT   %> 
					
                       
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12 col-sm-5 col-lg-2 ">
				<div class="row  d-flex align-items-start">
					<div class="d-lg-none   col-4 col-sm-5      ">
						<span class="badge bg-info">已報名⼈數</span>
					</div>
					<div class="  col-8 col-sm-7    col-lg-12  text-center ">
						<div class="d-flex justify-content-lg-center">
							<div class="badge bg-success mb-1">
							 <%:Model == null || Model.RegisterNo==null  ? "" : Model.RegisterNo   %> 
                       
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-12 col-sm-7 col-lg-1 ">
				<div class="row  d-flex align-items-start">
					<div class="d-lg-none   col-4 col-sm-5     ">
						<span class="badge bg-info">尚餘名額</span>
					</div>
					<div class="  col-8 col-sm-7     col-lg-12  text-center ">
						<div class="d-flex justify-content-lg-center">
							<div class="badge bg-dark">
								 <%:Model == null || Model.REG_MAX_COUNT==null || Model.RegisterNo==null  ? 0 : Int32.Parse(Model.REG_MAX_COUNT) - Int32.Parse(Model.RegisterNo)   %>  
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

</div>




<script>
	$(function () { 
		$("#flowStep").slider('setValue',  "<%:Model == null || Model.SESS_STATUS==null  ? "1" : Model.SESS_STATUS   %>" ); 
	});

</script>



