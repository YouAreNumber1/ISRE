  
<link href="Content/bootstrap-slider-11.0.2/dist/css/bootstrap-slider.css" rel="stylesheet" />	
<script src="Content/bootstrap-slider-11.0.2/dist/bootstrap-slider.js"></script>

 
	<h3 class="text-center mt-5 ">報名流程</h3>

	<div class=" card">
		<div class=" py-3 ps-2 ps-sm-4 ms-3 ms-lg-5">
			<input id="flowStep"
				data-slider-value="1"
				data-provide="slider"
				data-slider-ticks-labels='["<%:ISRE.Enum_RegistrationFlow.Activity.GetDisplayName() %>"
				,"<%:ISRE.Enum_RegistrationFlow.Session.GetDisplayName() %>"
				,"<%:ISRE.Enum_RegistrationFlow.Registration.GetDisplayName() %>"
				,"<%:ISRE.Enum_RegistrationFlow.EmailConfirm.GetDisplayName() %>"
				,"<%:ISRE.Enum_RegistrationFlow.RegistrationComplete.GetDisplayName() %>"]'
				data-slider-ticks="[1, 2, 3,4,5]"
				data-slider-enabled="false" />
		</div>

	</div>
 



	<script>
		$(function () {
			 let w = window.innerWidth;
			//console.log(w);
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
			if (sLocation.indexOf("0004") > 0) $("#flowStep").slider('setValue', 4);
			if (sLocation.indexOf("0005") > 0) $("#flowStep").slider('setValue', 5);
			if (sLocation.indexOf("0006") > 0) $("#flowStep").slider('setValue', 5);
		});
		 



	</script>