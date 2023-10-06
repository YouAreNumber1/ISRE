
$(function () {

    //$('#imgPreview').hide();
    //$('.msgWindow').hide();

    

    $('.popupImg').off().on('click', function () {
        url = $(this).attr('src');
        $('#imgPreviewContent').attr('src', url);

        $('#imgPreview').show();
    })

    //$('#imgPreview').off().on('click', function () {
    //    $(this).hide();
    //})

    $('.msgWindowClose').off().on('click', function () {
        $('.msgWindow').hide();
    })


    $('.DataField').each(function (index) {
        //preview(this);
    })


    

    // 使用者點選圖檔，程式縮圖，並轉成 Base64 的 JSON內容
    $('.UPLoader').on('change', function (e) {
        var dataField = '#' + $(this).attr('data-bind');
        var dataType = $(dataField).attr('data-type');
       // alert('here');
        
         console.log(dataType);
        if (dataType === 'img') {
           // console.log(e);
           // var fileObj = e.target.files[0];
           // console.log(fileObj);
            
           // let test = getBase64FromImageUrl(fileObj);
          //  console.log(test);
           // return;
            ShinkImage(e, dataField);
        } else {
            docToURI(e, dataField);
        }
    })


    // 載入時，顯示預覽圖片

    $('.DataField').off().on('change', function () {
        preview(this);
    })



    $('#Continent').off().on('change', function () {
        var ContinentId = $('#Continent option:selected').val();
        var url = '/Profile/MyProfile_CountryDropdownList';
        $.ajax({
            url: url,
            data:
            {
                ContinentId: ContinentId,
                CountryId: null
            },
            type: 'post',
            success: function (response, textStatus, jqXHR) {
                $('#Country_DropdownList').empty().append(response);
            }
        });
    })


    $('#MyProfileForm_save').off().on('click', function () {
        $('#MyProfileUpdate_Form').submit();
    })

    $('#MyProfileUpdate_Form').off().on('submit', function (event) {
        return ValidateForm();
    })
})


function ValidateForm() {
    var result = true;

    //var bankNation = $('input[name=BankNationality]:checked').val();
    //if (bankNation === 'F') {
    //    $('.BankTw').val('');
    //} else {
    //    $('.BankNotTw').val('');
    //}

    return result;
}

function preview(obj) {
    var dataType = $(obj).attr('data-type');
    var viewer = '#' + $(obj).attr('data-viewer');
    //console.log(dataType);
    if (dataType === 'img') {
        PreviewImage(obj, viewer);
    } else {
        showDownloadLink(obj, viewer);
    }
}


function showDownloadLink(dataFieldEle, linkEle) {
    var jsonStr = $(dataFieldEle).val();
    var content = '#';
    var target = '';
    var delbtn = '#' + $(linkEle).attr('data-delbtn');
    $(linkEle).empty();
    $(delbtn).hide();

    if (jsonStr !== undefined && jsonStr.length > 0) {
        try {
            var jsonObj = jQuery.parseJSON(jsonStr);
            content = 'data:' + jsonObj.fileType + ';base64,' + jsonObj.base64StringFile;
            target = '_blank';
            //var openfile = ' Open [' + jsonObj.fileName + '] ';
            var openfile =  jsonObj.fileName ;
            var fttag = FileTypeIcon(jsonObj.fileType);

            $(linkEle).append(fttag+ ' ').append(openfile);
            
            $(delbtn).show();
        } catch (e) {
            console.log('Error occur while Parsing Json Data. message =' + e)
        }
    }

    $(linkEle).attr('href', content).attr('target', target);

}

function FileTypeIcon(fType) {
    var fttag = '';
    switch (fType) {
        case 'application/pdf':
            fttag = '<i class="far fa-file-pdf w3-xlarge" title="PDF"></i>';
            break;
        case 'application/vnd.openxmlformats-officedocument.wordprocessingml.document':
            fttag = '<i class="far fa-file-word w3-xlarge" title="Word"></i>';
            break;
        case 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet':
            fttag = '<i class="far fa-file-excel w3-xlarge" title="Excel"></i>';
            break;
        case 'application/vnd.openxmlformats-officedocument.presentationml.presentation':
            fttag = '<i class="far fa-file-powerpoint w3-xlarge" title="Power Point"></i>';
            break;
        case 'image/jpeg':
            fttag = '<i class="far fa-file-image w3-xlarge" title="Image"></i>';
            break;
        case 'image/png':
            fttag = '<i class="far fa-file-image w3-xlarge" title="Image"></i>';
            break;
        case 'text/plain':
            fttag = '<i class="far fa-file-alt w3-xlarge" title="Plain Text"></i>';
            break;
        default:
            fttag = '<i class="far fa-file-alt w3-xlarge" ></i>';
            break;
    }

    return fttag;
}


function PreviewImage(dataFieldEle, previewEle) {
    var jsonStr = $(dataFieldEle).val();
    var content = '';
    var delbtn = '#' + $(previewEle).attr('data-delbtn');
    $(previewEle).hide();
    $(delbtn).hide();

    var imgMask = '#' + $(previewEle).attr('data-mask');
    $(imgMask).hide();

    if (jsonStr === undefined || jsonStr.length < 1) {
        $(imgMask).show();
    } else {
        try {
            var jsonObj = jQuery.parseJSON(jsonStr);
            content = 'data:' + jsonObj.fileType + ';base64,' + jsonObj.base64StringFile;
            $(previewEle).show();
            $(delbtn).show();
        } catch (e) {
            console.log('Error occur while Parsing Json Data. message =' + e)
            $(imgMask).show();
        }
    }

    $(previewEle).attr('src', content);
}


function ShowBankFields(sw) {
    var bankTw = '.BankTw';
    var bankNTw = '.BankNotTw';
    var dsbCls = 'w3-disabled';
    var dsbAtr = 'disabled';
    var psbkBtn = '#Local_Bank_Passbook_Btn';
    var psbkIpt = '#LocalBankPassbookInput';

    if (sw === 'L') {
        $(bankNTw).attr(dsbAtr, true);
        $(bankNTw).val('');
        $(bankTw).attr(dsbAtr, false);
        $(psbkBtn).removeClass(dsbCls);
        $(psbkIpt).attr(dsbAtr, false);
    } else {
        $(bankTw).attr(dsbAtr, true);
        $(bankTw).val('');
        $(bankNTw).attr(dsbAtr, false);
        $(psbkBtn).addClass(dsbCls);
        $(psbkIpt).attr(dsbAtr, true);
    }

}

function MyProfileUpdate_Success() {
    //  var info = 'Attached files upload success.  \n\nProfile save success.';
    alert('Profile has been submitted successly.');
    //showMsgBox(info);
}

function MyProfileUpdate_Failure(data) {
    console.log(data);
    //console.log(data.responseText);
    console.log($(data.responseText)[1].innerText);
    var error = $(data.responseText)[1].innerText;
    var info = 'Error occur while saving profile, please try again later. Message :' + error;
    // showMsgBox(info);
    alert(info);
}

function isImageFile(fileObj) {
    var ft = fileObj.type;
    var result = false;
    result = ft.indexOf('image') > -1;
    if (!result) {
        alert('Incorrect file type.');
    }
    return result;
}

function ShinkImage(file, fieldEle) {
    console.log(file);

    var fileObj = file.target.files[0];
    console.log(fileObj);
    var IsValidFile = isImageFile(fileObj);
    if (!IsValidFile) {
        return -1;
    }
    var MAX_WIDTH = 800;
    var MAX_HEIGHT = 600;
    var canv = $('<canvas/>');

    var fileReader = new FileReader();
    console.log(fileReader);
    fileReader.onload = function (e) {
        var img = new Image();
        img.onload = function () {
            var r_width = img.width;
            var r_height = img.height;
            var o_width = img.width;
            var o_height = img.height;

            if (r_width > r_height) {
                if (r_width > MAX_WIDTH) {
                    r_height = parseInt((MAX_WIDTH / r_width) * r_height);
                    r_width = MAX_WIDTH;
                }
            } else {
                if (r_height > MAX_HEIGHT) {
                    r_width = parseInt((MAX_HEIGHT / r_height) * r_width);
                    r_height = MAX_HEIGHT;
                }
            }
            canv.attr('width', r_width);
            canv.attr('height', r_height);
            canv[0].getContext('2d').drawImage(img, 0, 0, o_width, o_height, 0, 0, r_width, r_height);

            var imgDataURL = canv[0].toDataURL(fileObj.type);
            var base64Enc = imgDataURL.split(',')[1];
            console.log(imgDataURL);
            console.log(base64Enc);
            var imgobj = ({
                base64StringFile: base64Enc,
                imgDataURL: imgDataURL,
                fileName: fileObj.name,
                fileType: fileObj.type
            });
            console.log(imgobj);
            var jsonStr = JSON.stringify(imgobj);
            $(fieldEle).val(jsonStr);
            $('#ACT_IMG').val(imgDataURL);
           $(fieldEle).trigger('change');
        }
        img.src = e.target.result;
    }
    fileReader.readAsDataURL(fileObj);
}


function docToURI(file, fieldEle) {
    var MAX_FILESIZE = 999999999;
    var file = file.target.files[0];
    var filesize = file.size;
    if (filesize > MAX_FILESIZE) {

        var info = 'System can not upload file size larger than 500KB.  Please check file size and upload again later.';
        alert(info);

    } else {
        getFile(file).then((customJsonFile) => {
            $(fieldEle).val(JSON.stringify(customJsonFile));
            $(fieldEle).trigger('change');
        });
    }
}



function getFile(file) {
    var reader = new FileReader();
    return new Promise((resolve, reject) => {
        reader.onerror = () => { reader.abort(); reject(new Error("Error parsing file")); }
        reader.onload = function () {

            //This will result in an array that will be recognized by C#.NET WebApi as a byte[]
            let bytes = Array.from(new Uint8Array(this.result));

            //if you want the base64encoded file you would use the below line:
            let base64StringFile = btoa(bytes.map((item) => String.fromCharCode(item)).join(""));

            //Resolve the promise with your custom file structure
            resolve({
                base64StringFile: base64StringFile,
                fileName: file.name,
                fileType: file.type
            });
        }
        reader.readAsArrayBuffer(file);
    });
}

