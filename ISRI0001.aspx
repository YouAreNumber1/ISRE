<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master"
	AutoEventWireup="true" CodeBehind="ISRI0001.aspx.cs"
	Inherits="ISRE.ISRI0001" %>

<%--this page is for backend activity create/edit--%>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
	<link href="Scripts/jquery-ui-custom/jquery-ui-custom.css" rel="stylesheet" />

	<script src="Scripts/jquery-ui-custom/jquery-ui-custom.js"></script>
	<style>
		.note {
			color: red;
		}
	</style>
	<%
		string GUID = Request.QueryString["GUID"] ?? "";  /////////GUID=activity guid
		string ActioinName = (GUID == "") ? "新增" : "編輯";
		string sSelected = "";
		///////GetHashCode() for an unassigned datetime Is always zero, use this to check null date 
	%>
	

	<main aria-labelledby="title">
		<div class=" my-2">
			<%    
				dynamic Model = Process_ActivityDetail(GUID);
			%>


			<div class="   ">
				<h3 class="text-center my-2"><%: String.Concat(ActioinName, "活動資訊") %> </h3>

				<div class="  row     ">
					<div class=" bg-ice   py-3  col-lg-2 border  ">
						<span class="note">*</span><label>發布⽇期</label>
					</div>
					<div class="  py-3   col-lg-10 border">
						<div class="d-flex">
							<input type="text" id="PUB_DATE_S_DATE" name="PUB_DATE_S_DATE"
								placeholder="民國年/月/日"
								value="<%:Model == null || Model.PUB_DATE_S.GetHashCode()==0 
								?  string.Concat((Int32.Parse(DateTime.Now.ToString("yyyy"))-1911),"/" , DateTime.Now.ToString("MM"), "/", DateTime.Now.ToString("dd"))
								: string.Concat((Int32.Parse( Model.PUB_DATE_S.ToString("yyyy"))-1911),"/" , Model.PUB_DATE_S.ToString("MM"), "/", Model.PUB_DATE_S.ToString("dd"))%>"
								class="form-control mx-1 requiredInput">

							<input type="time" id="PUB_DATE_S_TIME" name="PUB_DATE_S_TIME"
								placeholder="HH:mm"
								value="<%:Model == null || Model.PUB_DATE_S.GetHashCode()==0  
								?   DateTime.Now.ToString("HH:mm") 
								:    Model.PUB_DATE_S.ToString("HH:mm")  %>"
								class="form-control mx-1 requiredInput">
							<span class="mx-2">~ </span>
							<input type="text" id="PUB_DATE_E_DATE" name="PUB_DATE_E_DATE"
								placeholder="民國年/月/日"
								value="<%:Model == null || Model.PUB_DATE_E.GetHashCode()==0 
								?  string.Concat((Int32.Parse(DateTime.Now.ToString("yyyy"))-1911),"/" , DateTime.Now.ToString("MM"), "/", DateTime.Now.ToString("dd"))
								: string.Concat((Int32.Parse( Model.PUB_DATE_E.ToString("yyyy"))-1911),"/" , Model.PUB_DATE_E.ToString("MM"), "/", Model.PUB_DATE_E.ToString("dd"))%>"
								class="form-control mx-1 requiredInput">

							<input type="time" id="PUB_DATE_E_TIME" name="PUB_DATE_E_TIME"
								placeholder="HH:mm"
								value="<%:Model == null || Model.PUB_DATE_E.GetHashCode()==0 
								?   DateTime.Now.ToString("HH:mm") 
								:    Model.PUB_DATE_E.ToString("HH:mm")  %>"
								class="form-control mx-1 requiredInput">
						</div>
					</div>
				</div>


				<div class="  row     ">
					<div class=" bg-ice   py-3  col-lg-2 border  ">
						<span class="note">*</span><b><label>活動⽇期</label></b>
					</div>
					<div class="  py-3   col-lg-10 border">
						<div class="d-flex">
							<input type="text" id="ACT_DATE_S_DATE" name="ACT_DATE_S_DATE"
								placeholder="民國年/月/日"
								value="<%:Model == null || Model.ACT_DATE_S.GetHashCode()==0   
							?  string.Concat((Int32.Parse(DateTime.Now.ToString("yyyy"))-1911),"/" , DateTime.Now.ToString("MM"), "/", DateTime.Now.ToString("dd"))
							: string.Concat((Int32.Parse( Model.ACT_DATE_S.ToString("yyyy"))-1911),"/" , Model.ACT_DATE_S.ToString("MM"), "/", Model.ACT_DATE_S.ToString("dd"))%>"
								class="form-control mx-1 requiredInput">

							<input type="time" id="ACT_DATE_S_TIME" name="ACT_DATE_S_TIME"
								placeholder="HH:mm"
								value="<%:Model == null || Model.ACT_DATE_S.GetHashCode()==0 
							?   DateTime.Now.ToString("HH:mm") 
							:    Model.ACT_DATE_S.ToString("HH:mm")  %>"
								class="form-control mx-1 requiredInput">


							<span class="mx-2">~ </span>
							<input type="text" id="ACT_DATE_E_DATE" name="ACT_DATE_E_DATE"
								placeholder="民國年/月/日"
								value="<%:Model == null || Model.ACT_DATE_E.GetHashCode()==0  
?  string.Concat((Int32.Parse(DateTime.Now.ToString("yyyy"))-1911),"/" , DateTime.Now.ToString("MM"), "/", DateTime.Now.ToString("dd"))
: string.Concat((Int32.Parse( Model.ACT_DATE_E.ToString("yyyy"))-1911),"/" , Model.ACT_DATE_E.ToString("MM"), "/", Model.ACT_DATE_E.ToString("dd"))%>"
								class="form-control mx-1 requiredInput">

							<input type="time" id="ACT_DATE_E_TIME" name="ACT_DATE_E_TIME"
								placeholder="HH:mm"
								value="<%:Model == null || Model.ACT_DATE_E.GetHashCode()==0 
							?   DateTime.Now.ToString("HH:mm") 
							:    Model.ACT_DATE_E.ToString("HH:mm")  %>"
								class="form-control mx-1 requiredInput">
						</div>
					</div>
				</div>

				<div class="   row      ">
					<div class="  bg-ice   py-3   col-lg-2 border">
						<span class="note">*</span><b><label>活動⽣效註記</label></b>
					</div>
					<div class="  py-3   col-lg-10 border">
						<div class="form-check  form-check-inline">
							<input type="radio" class="form-check-input requiredInput"
								id="ACT_ENABLE1" name="ACT_ENABLE"
								<%: (Model != null && Model.ACT_ENABLE !=null && Model.ACT_ENABLE =="1" ) || Model==null
							?   "checked"
							:   ""  %>
								value="1">啟用
                    <label class="form-check-label" for="ACT_ENABLE1"></label>
						</div>
						<div class="form-check  form-check-inline">
							<input type="radio" class="form-check-input requiredInput"
								id="ACT_ENABLE2" name="ACT_ENABLE"
								<%:Model != null && Model.ACT_ENABLE !=null && Model.ACT_ENABLE =="2" 
								?   "checked"
								:   ""  %>
								value="2">停用
                    <label class="form-check-label" for="ACT_ENABLE2"></label>
						</div>
					</div>
				</div>

				<div class="    row ">
					<div class=" border  py-3    bg-ice  col-lg-2">
						<label>負責⼈</label>
					</div>
					<div class="  border  py-3     col-lg-10">
						A111888 王⼩明
					</div>
				</div>

				<%--  @*代理人員*@--%>
				<div class=" row   ">
					<div class="   border  py-3  bg-ice col-lg-2">
						<label>代理人員</label>
					</div>
					<div class=" border  py-3   col-lg-10">
						<div class="d-flex">
							<button type="button" class="btn bg-white border ">
								<span class="text-black-50">A111885 王大明</span>
								<span class="badge "><span class="fas  text-danger fa-times-circle  fa-2x"></span></span>
							</button>

							<button type="button" class="btn bg-white border ">
								<span class="text-black-50">A111880 王中明</span>
								<span class="badge "><span class="fas  text-danger fa-times-circle  fa-2x"></span></span>
							</button>
							<span>
								<button type="button" class="btn btn-primary-isre px-4">新增</button>
							</span>
						</div>
						<div class="py-2">代理人員最多設定10名</div>
					</div>
				</div>


				<div class=" row     ">
					<div class="  bg-ice  py-3  border col-lg-2">
						<span class="note">*</span><b><label>活動類別</label></b>
					</div>
					<div class="    py-3  border  col-lg-10">
						<select name="ACT_TYPE" id="ACT_TYPE" class="form-control form-select requiredInput">
							<option value="">請選擇</option>
							<% 

								dynamic List_ACT_TYPE = StaticQueryDB("Home_ISRE_ACTIVITY_MAIN", "ACT_TYPE");
								foreach (var item in List_ACT_TYPE)
								{
									sSelected = (Model != null && Model.ACT_TYPE.ToString() == item.SERIALID.ToString()) ? "selected" : "";
							%>
							<option value="<%: item.SERIALID %>" <%: sSelected %>><%: item.TYPE_NAME%> </option>
							<%
								}
							%>
						</select>
					</div>
				</div>
				<%--  @*主辦單位*@--%>
				<div class="  row   ">
					<div class="  border  bg-ice   py-3  col-lg-2">
						<span class="note">*</span><b><label>主辦單位</label></b>
					</div>
					<div class="  border    py-3  col-lg-10">
						<input type="text" id="ACT_HOST" name="ACT_HOST"
							class="form-control  requiredInput "
							value="<%:Model != null && Model.ACT_HOST !=null   
							?  Model.ACT_HOST 
							:   ""  %>">
					</div>
				</div>
				<div class="  row   ">
					<div class="  border  bg-ice   py-3  col-lg-2">
						<label>協辦單位</label>
					</div>
					<div class="  border    py-3  col-lg-10">
						<input type="text" id="ACT_CO_HOST" name="ACT_CO_HOST"
							class="form-control    "
							value="<%:Model != null && Model.ACT_CO_HOST !=null   
						?  Model.ACT_CO_HOST 
						:   ""  %>">
					</div>
				</div>
				<%-- @*活動主題*@--%>
				<div class="  row   ">
					<div class="  border  bg-ice   py-3  col-lg-2">
						<span class="note">*</span><b><label>活動主題</label></b>
					</div>
					<div class="  border    py-3  col-lg-10">
						<textarea name="ACT_NAME"
							id="ACT_NAME" rows="3"
							class="form-control requiredInput"><%: (Model !=null &&  Model.ACT_NAME!=null  ? Model.ACT_NAME   : ""  )  %></textarea>
					</div>
				</div>


				<%-- @*視覺圖檔*@--%>
				<div class="  row    ">
					<div class=" border  py-3 bg-ice   col-lg-2">
						<label>視覺圖檔</label>
					</div>
					<div class="   border  py-3    col-lg-10">

						<div class="note">上傳圖檔⼤⼩請勿超過2M，⻑寬比例在16:9~32:9較佳</div>
						<div class="imageHolder">
							<div class="custom-file mb-3">
								<label class="btn  btn-primary-isre px-4">
									檔案上傳
									<input type="file" class="d-none imgUpload " accept=".png, .tiff, .jpg, .bmp, .jfif" />
								</label>
							</div>
							<img class=" img-fluid"
								src="<%: (Model !=null &&  Model.ACT_IMG!=null  )  ? Model.ACT_IMG   : ""  %>" />
							<div class="imageInfo d-none "></div>
							<input type="hidden" name="ACT_IMG" id="ACT_IMG"
								value="<%: (Model !=null &&  Model.ACT_IMG!=null  )  ? Model.ACT_IMG   : ""  %>" />

						</div>
					</div>
				</div>
				<%--  @*活動說明*@--%>
				<div class=" row    ">
					<div class=" border py-3 bg-ice col-lg-2">
						<label>活動說明</label>
					</div>
					<div class="border  py-3    col-lg-10">
						<textarea name="ACT_DESC" id="ACT_DESC" rows="6"
							class="form-control   "><%: (Model !=null &&  Model.ACT_DESC!=null   ? Model.ACT_DESC   : ""  )  %> </textarea>
					</div>
				</div>
				<%-- @*參加對象*@--%>
				<div class="  row   ">
					<div class="  border  py-3  bg-ice    col-lg-2">
						<span class="note">*</span><b><label>參加對象</label></b>
					</div>
					<div class=" border  py-3     col-lg-10">


						<div class="">
							<label>說明文字：</label>

							<input type="text" id="OBJ_DESC" name="OBJ_DESC"
								class="form-control requiredInput  "
								value="<%: (Model !=null &&  Model.OBJ_DESC!=null
                     ? Model.OBJ_DESC   : ""  )  %>">
						</div>
					</div>
				</div>

				<div class="  row   ">
					<div class="  border  bg-ice   py-3  col-lg-2">
						<label>洽詢專線</label>
					</div>
					<div class="  border    py-3  col-lg-10">
						<input type="text" id="ACT_CONTACT_INFO" name="ACT_CONTACT_INFO"
							class="form-control    "
							value="<%:Model != null && Model.ACT_CONTACT_INFO !=null   
					?  Model.ACT_CONTACT_INFO
					:   ""  %>">
					</div>
				</div>


				<div class="d-flex justify-content-end ">
					<div class="text-black-50">
						<%: (GUID == "") ? "Created By:" : "Modified By:" %> <span>A111888 王⼩明</span>
					</div>
				</div>



				<div class="d-flex justify-content-center mt-5">
					<%--預覽 start from ISRe0000.aspx?preview=guid--%>
					<a id="btn_Preview" target="_blank" href="ISRE0000.ASPX?PREVIEW=<%:GUID %>&guid=<%:GUID %>"
						class="btn btn-primary-isre text-nowrap <%:GUID==""? "d-none":"" %>  px-sm-4 py-2  me-md-5 mb-2 ">預覽</a>


					<a href="#" id="btn_Save" guid="<%:GUID %>"
						data-target="ISRI0001.aspx/Process_Activity"
						class="    px-4 py-2  me-5 mb-2 text-nowrap  btn-primary-isre btn ">
						<span><%: (Model !=null   ?  "儲存"  : "新增活動"  ) %></span>
					</a>


					<a href="ISRI0000.ASPX" class="btn btn-primary-isre  text-nowrap    px-sm-4 py-2  me-md-5 mb-2 ">回首頁</a>

					<% if (Model != null)
						{
							if (Model == null || Model.TotalSessionNo == null || Model.TotalSessionNo == 0)
							{  %>
					<a href="#" id="btn_Delete"
						data-target="ISRI0001.aspx/Delete_Activity"
						guid="<%:GUID %>" class="btn   btn-primary-isre  text-nowrap     px-sm-4 py-2  me-md-5 mb-2">刪除  </a>
					<%}
					else
					{ %>
					<a title="這活動有場次"
						class="btn   btn-primary-isre  text-nowrap   disabled  px-sm-4 py-2  me-md-5 mb-2">刪除  </a>

					<%}
						}
					%>
				</div>



			</div>


			<%--  activity form end--%>
		</div>

	</main>


	<script> 

		let SaveForm = function (btn) {
			let guid = btn.attr('guid');
			let target = btn.attr('data-target');
			let thisForm = btn.closest('form');
			thisForm.find('.requiredCheck').prop("disabled", false);
			///////////// collect form input collection
			let formData = new FormData(thisForm.get(0));
			formData.delete("__VIEWSTATEGENERATOR");
			formData.delete("__VIEWSTATE");
			///	console.log(formData);

			////// convert formdata to jsonstring
			var object = {};
			formData.forEach((value, key) => {
				// Reflect.has in favor of: object.hasOwnProperty(key) 
				if (!Reflect.has(object, key)) {
					object[key] = value;
					return;
				}
				if (!Array.isArray(object[key])) {
					object[key] = [object[key]];
				}
				object[key].push(value);
			});
			////////// json = formdata data in json format
			var json = JSON.stringify(object);
			//console.log(json);
			//return;
			$.ajax({
				url: target,
				data: JSON.stringify({ 'formData': json, 'GUID': guid }),
				dataType: 'json', // 預期從server接收的資料型態
				//   contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				contentType: 'application/json; charset=utf-8', // 要送到server的資料型態
				type: 'POST',
				caches: false,
				async: false,
				enctype: 'multipart/form-data',
				// contentType: false, // Not to set any content header  //formdata required
				//	processData: false, // Not to process data  //formdata required
				success: function (response, textStatus, jqXHR) {
					thisForm.find('.requiredCheck').prop("disabled", true);
					console.log('success');
					//console.log(response);
					//console.log(response.d);
					//console.log(response.d.key['GUID']);
					var keys = response.d.map(function (o) { return o.Key; });
					//console.log(keys);
					var GUID = response.d[keys.indexOf("GUID")].Value;
					//console.log(GUID);
					//console.log($('#btn_Preview').attr('href'));
					if (response.d == null) {
						AlertAndMove('活動新增/修改失敗!');
					}
					else {
						guid == '' || guid == null
							? AlertAndMove('活動新增成功!  下一步: 新增場次!')
							: AlertAndMove('活動修改成功!');
						if (guid == '' || guid == null) {  ////////新增
							$('#btn_Preview').removeClass('d-none');
							let href = $('#btn_Preview').attr('href');
							$('#btn_Preview').attr('href', href + GUID);
							btn.removeAttr('id guid data-target').addClass('disabled').attr('disabled', 'disabled');

						}
					}
				}
				, fail: function (jqXHR, textStatus, errorThrown) {
					console.log('fail');
					console.log(errorThrown);
				}
				, error: function (data) {
					console.log('error');
					console.log(data);
					console.log(data.responseText);
					console.log(data.status);
					console.log(data.statusText);
					jQuery('<div/>', {
						id: 'errorDiv'
					}).html(data.responseText).appendTo($('.footer')).hide();
					var msg = $('#errorDiv').find('title').text();
					$('#errorDiv').remove();
					alert(msg);
				}
				, done: function (data) {
					console.log('done');
					console.log(data);

				}

			});
		};


		let ConvertImageToBase64 = function (obj, fileObj) {
			let canv = $('<canvas/>');
			let imageHolder = $(obj).closest('.imageHolder');
			let fileReader = new FileReader();
			fileReader.onload = function (e) {
				var img = new Image();
				img.onload = function () {
					canv.attr('width', img.width);
					canv.attr('height', img.height);

					canv[0].getContext('2d').drawImage(img, 0, 0, img.width, img.height, 0, 0, img.width, img.height);

					let imgDataURL = canv[0].toDataURL(fileObj.type);
					//var base64Enc = imgDataURL.split(',')[1];

					let imgobj = ({
						FileName: fileObj.name,
						FileType: fileObj.type,
						FileSize: fileObj.size / 1000 + ' KB'
					});

					imageHolder.find('img').attr('src', imgDataURL);
					imageHolder.find('input[type=hidden]').val(imgDataURL);
					imageHolder.find('.imageInfo')
						.html(JSON.stringify(imgobj)).removeClass('d-none');
				}
				img.src = e.target.result;
			}
			fileReader.readAsDataURL(fileObj);
		}


		let DeleteActivity = function (btn) {

			let guid = btn.attr('guid');
			let target = btn.attr('data-target');
			$.ajax({
				url: target,
				data: JSON.stringify({ 'GUID': guid }),
				dataType: 'json', // 預期從server接收的資料型態
				//   contentType: 'application/x-www-form-urlencoded; charset=UTF-8',
				contentType: 'application/json; charset=utf-8', // 要送到server的資料型態
				type: 'POST',
				caches: false,
				async: false,
				enctype: 'multipart/form-data',
				// contentType: false, // Not to set any content header  //formdata required
				//	processData: false, // Not to process data  //formdata required
				success: function (response, textStatus, jqXHR) {
					console.log('success');
					//var responseDOM = $(response);
					console.log(response);
					console.log(response.d);
					if (response.d == null) {
						AlertAndMove('活動新增/修改失敗!');
					}
					else {
						console.log(response.d);
						ShowToast('活動刪除成功!');
						$(document).delay(500).queue(function () {
							$(document).dequeue();
							window.location = 'ISRI0000.ASPX';
						});
						//window.location = 'ISRI0000.ASPX';
						//guid == '' || guid == null
						//	? AlertAndMove('活動新增成功!  下一步: 新增場次!')
						//	: AlertAndMove('活動修改成功!');
						//btn.removeAttr('id guid data-target').addClass('disabled').attr('disabled', 'disabled');
					}

					//AlertAndMove('報名表設定成功!', $('.display-1-5').first());

				}
				, fail: function (jqXHR, textStatus, errorThrown) {
					console.log('fail');
					console.log(errorThrown);
				}
				, error: function (data) {
					console.log('error');
					console.log(data);
					console.log(data.responseText);
					console.log(data.status);
					console.log(data.statusText);
					jQuery('<div/>', {
						id: 'errorDiv'
					}).html(data.responseText).appendTo($('.footer')).hide();
					var msg = $('#errorDiv').find('title').text();
					$('#errorDiv').remove();
					alert(msg);
				}
				, done: function (data) {
					console.log('done');
					console.log(data);

				}

			});
		};

		$(function () {
			let guid = "<%:GUID%>";
			$("#PUB_DATE_S_DATE , #PUB_DATE_E_DATE , #ACT_DATE_S_DATE , #ACT_DATE_E_DATE ")
				.datepicker($.datepicker.regional['zh-TW']);

			//$("#PUB_DATE_S_TIME , #PUB_DATE_E_TIME, #ACT_DATE_S_TIME, #ACT_DATE_E_TIME")
			//    .timepicker(
			// {
			//     'timeFormat': 'H: i',
			//     'step': 5,
			// });
			$(document).on('click', 'a#btn_Delete', function (e) {
				e.preventDefault();

				Swal.fire({
					title: "確定刪除此活動?",
					icon: 'question',
					//text: "刪除活動將無法還原!",
					showDenyButton: true,
					showCancelButton: false,
					confirmButtonText: '確定',
					denyButtonText: '取消',
				}).then((result) => {
					/* Read more about isConfirmed, isDenied below */
					if (result.isConfirmed) {
						DeleteActivity($(this));
						//Swal.fire('Saved!', '', 'success')
					} else if (result.isDenied) {
						//Swal.fire('Changes are not saved', '', 'info')
					}
				});
			});

			$(document).on('click', 'a#btn_Save', function (e) {
				e.preventDefault();
				var btn = $(this);
				let thisForm = btn.closest('form');
				var requiredInput = $(thisForm).find('.requiredInput');
				if (HasAllRequireValue(requiredInput) == false)
					return false;


				showModalAjax();

				$(document).delay(500).queue(function () {
					$(document).dequeue();
					SaveForm(btn);
				});

			});


			$(document).on('change', '.imgUpload', function (e) {
				var fileObj = e.target.files[0];
				if (fileObj.type.indexOf('image') < 0) {
					alert('Incorrect file type.');
					return;
				}
				ConvertImageToBase64($(this), fileObj);

			})

		});



	</script>
</asp:Content>


