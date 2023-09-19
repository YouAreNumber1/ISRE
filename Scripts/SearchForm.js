
   
    $(document).on('click', '.btn_DeleteActivity, #btn_DeleteActivity', function (e) {
        e.preventDefault();
     
        var btn = $(this);
        var guid = btn.attr('guid');
        var target = btn.attr('data-target'); 
        var activity = btn.closest('tr').find('.activity').text();
       
        Swal.fire({
            title: 'Are you sure?',
            text: "確定要刪除 " + activity,
        //    type: 'warning',
            icon: 'question',
            showCancelButton: true,
            //confirmButtonColor: '#3085d6',
            //cancelButtonColor: '#d33',
            confirmButtonText: 'Yes'
        }).then((result) => {
            if (result.isConfirmed) { 
             
                $.ajax({
                    url: target,
                    data: {
                        guid: guid
                    },
                    type: 'post',
                    success: function (response, textStatus, jqXHR) { 
                        //console.log('deleted');
                        ShowToast(activity + ' 刪除成功!');
                       // btn.closest('tr').remove(); 
                        btn.removeClass('btn_DeleteActivity').attr('disabled', 'disabled');
                    }
                });
            } 
        }); 
    }); 
 

var HeaderSort = function (oTable, oForm) {
    oTable.on('click', 'th a', function (e) {
        e.preventDefault();
        var nthTh = $(this).parent().index() + 1;
        var oOrderIndex = $(oForm).find('#OrderIndex').first();
        var OrderIndex = oOrderIndex.val();

        if (Math.abs(OrderIndex) == Math.abs(nthTh))  //// same col
        {
            oOrderIndex.val(OrderIndex * (-1));
        }
        else {
            oOrderIndex.val(nthTh);
        }
        oForm.submit();
    });
};

var OrderArrow = function (oTable, oForm) {
    var oOrderIndex = $(oForm).find('#OrderIndex');
    var OrderIndex = oOrderIndex.val();
    var nthCol = Math.abs(OrderIndex) - 1;
    ///////// if nthCol <0, aTag will be the last a tag
    var aTag = oTable.find('th').eq(nthCol).find('a').first();
    console.log(nthCol);
    console.log(aTag);
    if (aTag.length > 0) {
        OrderIndex > 0
            ? aTag.parent().append('<i class="fas fa-long-arrow-alt-up mx-1"  style="color: #197584"></i>')
            : aTag.parent().append('<i class="fas fa-long-arrow-alt-down mx-1"  style="color: #197584"></i>')
            ;
    }
};
var MoveToTop = function (callback) {
    $('html, body').animate({
        scrollTop: 0
    }, {
        duration: 500,
        complete: function () {
            $('#backtotop').addClass('d-none');
            if (callback) {
                callback();
            }
        }
    });
};

var ShowToast = function (msg) {
    $(".toast-body").empty().append(msg);
    $(".toast").toast({ delay: 2000 }).toast('show');
}

 



