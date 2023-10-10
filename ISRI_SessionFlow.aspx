	<script src="Content/bootstrap-slider-11.0.2/dist/bootstrap-slider.js"></script>
<placeholder id="flowPlaceHolder">

	<h3 class="text-center mt-5 ">場次流程</h3>

	<div class=" card">
		<div class=" py-3 px-4 ms-3 ms-lg-5">
			<input id="flowStep"
				data-slider-value="2"
				data-provide="slider"
				data-slider-ticks-labels='["<%:ISRE.Enum_SessionFlow.Session.GetDescription() %>",
				"<%:ISRE.Enum_SessionFlow.RegistrationForm.GetDescription() %>",
				"<%:ISRE.Enum_SessionFlow.Activate.GetDescription() %>"]'
				data-slider-ticks="[1, 2, 3]"
				data-slider-enabled="false" />
		</div>

	</div>
</placeholder>


