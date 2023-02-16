var common_menu_goto = {};
common_menu_goto.name = "画面遷移";//せんい
common_menu_goto.paramsFormat = {
	page: null
};
 
common_menu_goto.fire = function (params) {


	var ret = new Result();
		// セッションチェック
		sessionCheck(ret);

		// タイトル情報設定
		setTitleInfo(ret);
	if (SHOP_ID == null || SHOP_ID == "") {
		
		return ret.navigate("login.jsp");//跳转到登陆页面
		//return ret.navigate(params["page"]);
	}
	//var ret = new Result();

	
	return ret.navigate(params["page"]);
};
