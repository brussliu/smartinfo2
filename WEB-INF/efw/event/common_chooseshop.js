var common_chooseshop={};
common_chooseshop.name="店舗選択";//
common_chooseshop.paramsFormat={  


};

common_chooseshop.fire=function(params){   //

	var ret = new Result();
	
	
	
	// session.create();
	// // session.invalidate();
	
	session.set("User_ID", params['UserID']);
	
	
	return ret.navigate("menu.jsp");//跳转

};

