var common_smartChoice={};
common_smartChoice.name="お店を選びます";//
common_smartChoice.paramsFormat={  


};

common_smartChoice.fire=function(params){   //

	var ret = new Result();
	
	
	
	session.create();
	// session.invalidate();
	
	session.set("User_ID", params['UserID']);
	
 

	
	
	return ret.navigate("menu.jsp");//跳转

};

