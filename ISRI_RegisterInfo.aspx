<%-- THIS IS SUB PAGE FOR SESSION INFO --%>


<div class="my-2">

	<h3 class="text-center mt-5 mb-2">場次資訊  </h3>


	<div class="  card p-2  my-2       ">
		<div class="row  px-sm-2  px-md-3 px-lg-2">
			<div class=" col-3 col-md-2 col-lg-1">
				活動名稱: 
			</div>
			<div class=" col-9 col-md-10  col-lg-11">
				<%:Model == null || Model.ACT_NAME==null? "" : Model.ACT_NAME  %>
			</div>
			<div class=" col-3 col-md-2  col-lg-1">
				場次:  
			</div>
			<div class=" col-9 col-md-10  col-lg-11">
			 <%:Model == null || Model.SESS_NO==null? "" : Model.SESS_NO  %>
			</div>

			<div class=" col-3 col-md-2  col-lg-1">
				日期時間: 
			</div>

			<div class=" col-9 col-md-10  col-lg-11">
				 <%:Model == null || Model.SESS_DATE_S==null? "" : Model.SESS_DATE_S  %>
			</div>
			<div class=" col-3 col-md-2  col-lg-1">
				地點: 
			</div>
			<div class=" col-9 col-md-10  col-lg-11">
				 <%:Model == null || Model.CITYNAME==null? "" : Model.CITYNAME  %>
			</div>
		</div>

	</div>




</div>




<script>


</script>



