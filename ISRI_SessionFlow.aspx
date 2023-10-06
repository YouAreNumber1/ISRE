<placeholder id="flowPlaceHolder">

	<h3 class="text-center mt-5 ">場次流程</h3>

	<div class=" card">
		<div class=" py-3 px-4 ms-3 ms-lg-5">
			   <input id="flowStep"   
          data-value="1"
				   data-provide="slider"
         data-slider-ticks-labels='["<%:ISRE.Enum_SessionFlow.Session.GetDescription() %>",
"<%:ISRE.Enum_SessionFlow.RegistrationForm.GetDescription() %>",
"<%:ISRE.Enum_SessionFlow.Activate.GetDescription() %>"]'
        	data-slider-ticks="[1, 2, 3]" 
				     
         />


			<input type="text"
				id="flowStep2"
				<%--triggerchangeevent="true"--%>
				data-provide="slider"
				data-slider-ticks="[1, 2, 3]"
				data-slider-ticks-labels='["<%:ISRE.Enum_SessionFlow.Session.GetDescription() %>",
				"<%:ISRE.Enum_SessionFlow.RegistrationForm.GetDescription() %>",
				"<%:ISRE.Enum_SessionFlow.Activate.GetDescription() %>"]'
				data-slider-value="1"
				data-slider-tooltip="hide"
				<%-- data-slider-enabled="false"--%>>



			 
		</div>

	</div>
</placeholder>


