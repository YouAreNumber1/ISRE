  
<link href="Content/bootstrap-slider-11.0.2/dist/css/bootstrap-slider.css" rel="stylesheet" />	
<script src="Content/bootstrap-slider-11.0.2/dist/bootstrap-slider.js"></script>

 
	<h3 class="text-center mt-5 ">報名流程</h3>

	<div class=" card">
		<div class=" py-3 ps-2 ms-3 ms-lg-5">
			<input id="flowStep"
				data-slider-value="1"
				data-provide="slider"
				data-slider-ticks-labels='["選擇<br/>活動"
				,"選擇<br/>場次"
				,"填寫<br />報名單"
				,"Email<br />確認"
				,"報名<br />完成"]'
				data-slider-ticks="[1, 2, 3,4,5]"
				data-slider-enabled="false" />
		</div>

	</div>
 



	<script>
		 
		$(document).ready(function () {
			let w = window.innerWidth;
			console.log(w);
			if (w >= 768) {
				$('.slider-tick-label-container').find('.slider-tick-label').each(function (index) {
					//$(this).remove();
					$(this).html(($(this).html().replace('<br>', '')));
					//console.log($(this).html().replace('<br>',''));
				}) 
			}
			let sLocation = window.location.href; 
			if (sLocation.indexOf("0000") > 0) $("#flowStep").slider('setValue', 1);
			if (sLocation.indexOf("0001") > 0) $("#flowStep").slider('setValue', 2);
			if (sLocation.indexOf("0002") > 0) $("#flowStep").slider('setValue', 3);
		});



	</script>