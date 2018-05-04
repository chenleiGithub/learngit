/**
 * 
 * 取得一个querystring
 * 
 */
function Request(key) {
	var retValue = (window.location.search.match(new RegExp("(?:^\\?|&)" + key
			+ "=(.*?)(?=&|$)")) || [ '', null ])[1];
	return (retValue == null ? "" : retValue);
}

// 表单验证
function formValidation(formObj) {

	var errObj = "";
	errJson = [];
	var ids = "";
	formObj.validate({
		ignore : "",
		errorPlacement : function(error, element) {
			errObj = $(error)[0];
			errJson.push(errObj);
			/*
			 * layer.tips($(error).text(), element, { time: 2, guide: 1 });
			 */
			layer.tips($(error).text(), element);
		},
		onfocusin : function(element) {
			$(element).valid();
		},
		onkeyup : function(element) {
			var boolean = $(element).valid();
			if (boolean) {
				$(element).removeClass("infant-required");
			}
		},
		onfocusout : function(element) {
			var boolean = $(element).valid();
			if (boolean) {
				$(element).removeClass("infant-required");
			}
		}
	});
	var bFlag = $(formObj).valid();
	if (errJson.length > 0) {
		var idTemp = ($(errJson)[0].htmlFor);
		if (idTemp != null && idTemp != "") {
			eval("$('#" + idTemp + "').focus();");
		}
	}
	errJson = [];
	return bFlag;
}
