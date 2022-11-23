var menu_goto = {};
menu_goto.name = "画面遷移";//せんい
menu_goto.paramsFormat = {
	page: null
};
var SHOP_ID = "";
menu_goto.fire = function (params) {
	SHOP_ID = session.get("SHOP_ID");
	var ret = new Result();
	//SHOP_ID.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
	if (SHOP_ID == null || SHOP_ID == "") {
		params["page"].debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>")
		//return ret.navigate("login.jsp");//跳转到登陆页面
		return ret.navigate(params["page"]);
	}
	//var ret = new Result();

	
	return ret.navigate(params["page"]);
};
