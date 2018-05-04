$(function () {
    var options =
    {
        thumbBox: '.thumbBox',
        spinner: '.spinner',
        imgSrc: ''
    };
    var cropper = $('.imageBox').cropbox(options);//初始渲染
    $('#imgFile').on('change', function () {
        var reader = new FileReader();
        reader.onload = function (e) {
            options.imgSrc = e.target.result;
            cropper = $('.imageBox').cropbox(options);//图片
        };
        reader.readAsDataURL(this.files[0]);
        this.files = [];
    });
    $('#btnCrop').on('click', function () {

        var file = $("#imgFile").val();
        if (file == null || file == "") {
            alert("没有选择图片！");
        } else if (!/.(gif|jpg|jpeg|png|JPG|GIF|JPEG|PNG)$/.test(file)) {
            alert("错误的文件类型！");
        } else {
            var img = cropper.getDataURL();
            $('.cropped').html('');
            $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:30px;margin-top:4px;border-radius:30px;box-shadow:0px 0px 12px #7E7E7E;" ><p>30px*30px</p>');
            $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:50px;margin-top:4px;border-radius:50px;box-shadow:0px 0px 12px #7E7E7E;"><p>50px*50px</p>');
            $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:180px;margin-top:4px;border-radius:180px;box-shadow:0px 0px 12px #7E7E7E;"><p>180px*180px</p>');
            var width = $('.thumbBox').width(),
                height = $('.thumbBox').height();
            var el = cropper.imageBox;
            var dim = el.css('background-position').split(' ');
            var dx = 0 - (parseInt(dim[0]) - el.width() / 2 + width / 2);
            var dy = 0 - (parseInt(dim[1]) - el.height() / 2 + height / 2);
            $("#x").val(dx);
            $("#y").val(dy);
            $("#w").val(180);
            $("#h").val(180);
            $("#ratio").val(cropper.ratio);

            $("#submithead").submit();
        }
    });
    $('#btnZoomIn').on('click', function () {
        cropper.zoomIn();
    });
    $('#btnZoomOut').on('click', function () {
        cropper.zoomOut();
    });
});