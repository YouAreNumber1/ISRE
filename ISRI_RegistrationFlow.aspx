  
<link href="Content/bootstrap-slider-11.0.2/dist/css/bootstrap-slider.css" rel="stylesheet" />	
<script src="Content/bootstrap-slider-11.0.2/dist/bootstrap-slider.js"></script>

 
	<h3 class="text-center mt-5 ">報名流程</h3>

	<div class=" card">
		<div class=" py-3 px-4 ms-3 ms-lg-5">
			<input id="flowStep"
				data-slider-value="1"
				data-provide="slider"
				data-slider-ticks-labels='["<%:ISRE.Enum_RegistrationFlow.Activity.GetDescription() %>"
				,"<%:ISRE.Enum_RegistrationFlow.Session.GetDescription() %>"
				,"<%:ISRE.Enum_RegistrationFlow.Registration.GetDescription() %>"
				,"<%:ISRE.Enum_RegistrationFlow.RegistrationComplete.GetDescription() %>"]'
				data-slider-ticks="[1, 2, 3,4]"
				data-slider-enabled="false" />
		</div>

	</div>
 



	<script>
		 
		$(document).ready(function () {
			let sLocation = window.location.href; 
			if (sLocation.indexOf("0000") > 0) $("#flowStep").slider('setValue', 1);
			if (sLocation.indexOf("0001") > 0) $("#flowStep").slider('setValue', 2);
			if (sLocation.indexOf("0002") > 0) $("#flowStep").slider('setValue', 3);
		});



	</script>