//获取项目url（含端口）
var serverUrl = window.location.host;
// 获取项目名称
var serverProPath = window.location.pathname;
var serverProName = serverProPath.split("/")[1];
// 拼接项目访问地址
var projectUrl = "http://" + serverUrl + "/" + serverProName;

var userMenus = {
    //权限管理
    userInfo: "page/root",
    //修改密码
    pwdUrl: "page/changepwd",
    //楼栋管理
    buildManage: "page/buildManage",
    //公共财产管理
    assetManage: "page/assetManage",
    //服务投诉管理
    serviceComplain: "page/serviceComplain",
    //投诉处理管理
    handleComplain: "page/handleComplain",
    //水电费
    gathering: "page/gathering",
    //物管费
    goodMoney: "page/goodMoney",
    //业主迁出信息管理
    moveInfo: "page/moveInfo",
    //业主私人财物报修管理
    privateRepair:"page/privateRepair",
    //公共财物报修管理
    publicRepair:"page/publicRepair",
    //车位使用管理
    parkPlace:"page/parkPlace",
    //突发事件管理
    emergency:"page/emergency",
    //业主私人财物报修处理
    privateRepairHandle:"page/privateRepairHandle",
    //公共财物报修处理
    publicRepairHandle:"page/publicRepairHandle"
    
};

var _i = /*"<li class=\"header\">栏目菜单</li>"*/"";
/*var _a1="<li class=\"treeview active\"><a href=\"page/headImage \"><i class=\"fa fa-link\"></i><span>";*/
var _a = "<li class=\"treeview\"><a href=\"\"><i class=\"fa fa-link\"></i><span>";
//var _b="</span><i class=\"fa fa-angle-left pull-right\"></i></a><ul class=\"treeview-menu\"><li><a href=\"";
var _b2 = "</span><i class=\"fa fa-angle-left pull-right\"></i></a>";
var _b1 = "<ul class=\"treeview-menu\"><li><a href=\"";
var _c = "\"><span>";
//var _d="</a></li></ul></li>";
var _d1 = "</span></a></li></ul>";
var _d2 = "</li>";
var _e = "<li class=\"treeview\"><a href=\"";
var _f = "\"><i class=\"fa fa-link\"></i><span>";
var _g = "</span></a></li>";
var _h = "<li class=\"active treeview\"><a href=\"\"><i class=\"fa fa-link\"></i><span>";
var userType = {
    path: '',
    init: function (url) {
    	queryPltMenu();
    }
};


// 拼接左侧菜单
function queryPltMenu() {
	if(Cookies.get("token") && Cookies.get("token")!="undefined") {
		var data = eval("(" + Cookies.get("token")+ ")");
		if (data && data!="undefined") {
		            /*var organizationId = "?schoolId=" + data.organizationId;*/
		            if (data.userType ==0) { //超级管理员
		                    var html = _i
		                    + _e + userMenus.userInfo + _f + "业主基本信息登记管理" + _g
                            + _e + userMenus.pwdUrl + _f + "修改密码" + _g
                            + _a + "业主基本信息管理" + _b2
                            + _b1 + userMenus.buildManage  + _c + "楼栋相关信息管理" + _d1
                            + _b1 + userMenus.moveInfo + _c + "业主迁出信息管理" + _d1
                            + _b1 + userMenus.assetManage + _c + "公共财产管理" + _d1
                            + _b1 + userMenus.serviceComplain + _c + "服务投诉管理" + _d1
                            + _b1 + userMenus.handleComplain + _c + "服务投诉处理管理" + _d1
                            + _b1 + userMenus.parkPlace + _c + "车位使用管理" + _d1
                            + _b1 + userMenus.emergency + _c + "突发事件管理" + _d1
                            + _a + "费用管理" + _b2
                            + _b1 + userMenus.gathering  + _c + "水电费管理" + _d1
                            + _b1 + userMenus.goodMoney + _c + "物管费管理" + _d1
                            + _a + "物业管理" + _b2
                            + _b1 + userMenus.privateRepair  + _c + "业主私人财物报修管理" + _d1
                            + _b1 + userMenus.publicRepair + _c + "公共财物报修管理" + _d1
                            + _b1 + userMenus.privateRepairHandle  + _c + "业主私人财物报修处理" + _d1
                            + _b1 + userMenus.publicRepairHandle + _c + "公共财物报修处理" + _d1
		                    $(".sidebar-menu").append(html);
		              
		            } else {
		                	var html = _i
                            + _e + userMenus.pwdUrl + _f + "修改密码" + _g
                            + _a + "业主基本信息管理" + _b2
                            + _b1 + userMenus.serviceComplain + _c + "服务投诉管理" + _d1
                            + _b1 + userMenus.parkPlace + _c + "车位使用管理" + _d1
                            + _b1 + userMenus.emergency + _c + "突发事件管理" + _d1
                            + _a + "费用管理" + _b2
                            + _b1 + userMenus.gathering  + _c + "水电费管理" + _d1
                            + _b1 + userMenus.goodMoney + _c + "物管费管理" + _d1
                            + _a + "物业管理" + _b2
                            + _b1 + userMenus.privateRepair  + _c + "业主私人财物报修管理" + _d1
                            + _b1 + userMenus.publicRepair + _c + "公共财物报修管理" + _d1
		                    $(".sidebar-menu").append(html);
		                
		            }
		}
	}
    
}


