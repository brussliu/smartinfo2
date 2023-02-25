var common_chooseshop={};
common_chooseshop.name="店舗選択";//
common_chooseshop.paramsFormat={  

	"shopid":null,
};

common_chooseshop.fire=function(params){   //

	var ret = new Result();
	
	// セッションチェック
	sessionCheckForShopList(ret);
	
	var selectResult = db.select(
		"COMMON",
		"searchShopRoleInfo",
		{
			userid : getUserId(),
			smartid : getSmartId(),
			shopid : params["shopid"],
			
		}
	).getSingle();
	
	session.set("SHOP_ID", selectResult["shopid"]);
	session.set("ROLE", selectResult["role"]);
	
	
	return ret.navigate("menu.jsp");

};

