var common_chooseshop={};
common_chooseshop.name="店舗選択";//
common_chooseshop.paramsFormat={  

	"shopid":null,
};

common_chooseshop.fire=function(params){   //

	var ret = new Result();
	
	// セッションチェック
	sessionCheckForShopList(ret);
	
	var selectResult1 = db.select(
		"COMMON",
		"searchShopRole",
		{
			userid : getUserId(),
			smartid : getSmartId(),
			shopid : params["shopid"],
			
		}
	).getSingle();
	
	session.set("SHOP_ID", selectResult1["shopid"]);
	session.set("ROLE", selectResult1["role"]);
	
	var selectResult2 = db.select(
		"COMMON",
		"searchShopRoleInfoList",
		{
			role : selectResult1["role"],
			shopid : selectResult1["shopid"]
		}
	).getArray();


	for (var i = 0; i < selectResult2.length; i++) {

		var authority_id = selectResult2[i]["authority_id"];
		var authority_type = selectResult2[i]["authority_type"];
		var authority_div = selectResult2[i]["authority_div"];

		var sessionContent = authority_type + "-" + authority_id + "-" + authority_div;

		session.set("authority" + i, sessionContent);

	}
	
	return ret.navigate("menu.jsp");

};

