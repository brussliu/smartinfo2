var common_login={};
common_login.name="ログイン";//
common_login.paramsFormat={  


};

common_login.fire=function(params){   //

	var ret = new Result();
	
	session.create();
	// session.invalidate();
	
	session.set("SHOP_ID", "Smart-Bear");
	

	
	
	return ret.navigate("menu.jsp");

};

