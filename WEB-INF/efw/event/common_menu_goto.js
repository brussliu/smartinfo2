var common_menu_goto = {};
common_menu_goto.name = "画面遷移";//せんい
common_menu_goto.paramsFormat = {
	page: null
};
var SHOP_ID = "";
common_menu_goto.fire = function (params) {
	SHOP_ID = session.get("SHOP_ID");
	var ret = new Result();
	if (SHOP_ID == null || SHOP_ID == "") {
		
		return ret.navigate("login.jsp");//跳转到登陆页面
		//return ret.navigate(params["page"]);
	}
	//var ret = new Result();

	
	return ret.navigate(params["page"]);
};
