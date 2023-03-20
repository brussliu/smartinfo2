var common_menu_goto = {};
common_menu_goto.name = "画面遷移";//せんい
common_menu_goto.paramsFormat = {
	page: null
};
 
common_menu_goto.fire = function (params) {


	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	
	return ret.navigate(params["page"]);

};
