var login={};
login.name="ログイン";//
login.paramsFormat={  


};

login.fire=function(params){   //

	var ret = new Result();
	
	
	session.create();
	// session.invalidate();
	
	session.set("SHOP_ID", "Smart-Bear");
	


	return ret.navigate("menu.jsp");//跳转

};

