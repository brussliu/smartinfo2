var common_login={};
common_login.name="ログイン";//
common_login.paramsFormat={  


};

common_login.fire=function(params){   //

	var ret = new Result();
	
	session.create();
	// session.invalidate();
	
	session.set("SMART_ID", "23-A-001");

	session.set("USER_ID", "bruss_liu");

	session.set("SHOP_ID", "Smart-Bear");

	session.set("ROLE", "admin");

		// sl:登录时间
	SHOP_ID = session.get("SHOP_ID");
	var selectResult = db.change(
		"MASTER",
		"logintime",
		{
			shopid : SHOP_ID
		}
	);
	return ret.navigate("shoplist.jsp");

};

