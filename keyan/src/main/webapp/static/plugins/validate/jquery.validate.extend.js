/**
 * Created by Dh on 2015/1/19.
 * jQuery.validate.js
 */

/**messages中文提示 */
jQuery.extend(jQuery.validator.messages,{
    required:"必填",
    email:"请输入正确格式的电子邮件",
    url:"请输入正确的网址",
    date:"请输入合法的日期",
    dateISO:"请输入合法的日期(ISO)",
    number:"请输入合法的数字",
    digits:"只能输入整数",
    creditcard:"请输入合法的银行卡号",
    equalTo:"请再次输入相同的值",
    accept:"请输入拥有合法后缀名的字符串",
    maxlength: $.validator.format("请输入一个长度最多是{0}的字符串"),
    minlength: $.validator.format("请输入一个长度最少是{0}的字符串"),
    rangelength: $.validator.format("请输入一个长度介于{0}和{1}之间的字符串"),
    range: $.validator.format("请输入一个介于{0}和{1}之间的值"),
    max: $.validator.format("请输入一个最大为{0}的值"),
    min: $.validator.format("请输入一个最小为{0}的值")
});
/**添加验证方法 */

jQuery.validator.addMethod("mobile",function(value,element){
    var length = value.length;
    var mobile = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1})|(17[0-9]{1}))+\d{8})$/
    return this.optional(element)||(length == 11 && mobile.test(value));
},"手机号码格式错误");

jQuery.validator.addMethod("chinese",function(value,element){
	var chinese =  /^[\u4e00-\u9fa5]+$/ ; 
	return this.optional(element)||(chinese.test(value));
},"请输入中文");

jQuery.validator.addMethod("chinesezimu",function(value,element){
	var chinesezimu =  /^[a-zA-Z0-9\u4e00-\u9fa5]+$/ ; 
	return this.optional(element)||(chinesezimu.test(value));
},"含有非法字符");

jQuery.validator.addMethod("character",function(value,element){
	var character =  /^[a-zA-Z0-9]+$/ ; 
	return this.optional(element)||(character.test(value));
},"只能输入数字及大小写的英文字母");

jQuery.validator.addMethod("uppercase",function(value,element){
	var uppercase =  /[A-Z]$/ ; 
	return this.optional(element)||(uppercase.test(value));
},"只能输入大写英文字母");


jQuery.validator.addMethod("nospace",function(value,element){
	var nospace =  /^[/S]+$/ ; 
	return this.optional(element)||(nospace.test(value));
},"不能有空格");

jQuery.validator.addMethod("chineseRemovebracket",function(value,element){
	var chineseRemovebracket =  /^[a-zA-Z0-9\u4e00-\u9fa5\\(\\)\\（\\）\\{\\}]+$/ ; 
	return this.optional(element)||(chineseRemovebracket.test(value));
},"请输入正确字符");

jQuery.validator.addMethod("shuzi",function(value,element){
	var shuzi =  /^[0-9]+$/ ; 
	return this.optional(element)||(shuzi.test(value));
},"请输入数字");

jQuery.validator.addMethod("emails",function(value,element){
	var emails =  /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$/ ; 
	return this.optional(element)||(emails.test(value));
},"请输入正确格式的电子邮件");

jQuery.validator.addMethod("fax",function(value,element){
	var fax = /^((0\d{2,3}-)?\d{7,8})$/ ; 
	return this.optional(element)||(fax.test(value));
},"请输入正确格式的传真号码");

jQuery.validator.addMethod("zipcode",function(value,element){
	var zipcode = /^[1-9]\d{5}$/ ; 
	return this.optional(element)||(zipcode.test(value));
},"请输入正确格式的邮政编码");

jQuery.validator.addMethod("identityCard",function(value,element){
	var identityCard = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/ ; 
	return this.optional(element)||(identityCard.test(value));
},"请输入正确格式的身份账号");
