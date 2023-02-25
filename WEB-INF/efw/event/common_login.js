var common_login={};
common_login.name="ログイン";//
common_login.paramsFormat={ 
	"#txt_userid": null,
	"#txt_userpassword": null,

};

common_login.fire=function(params){   //

	var ret = new Result();

	var selectResult = db.select(
		"COMMON",
		"searchUserInfo",
		{
			userid : params["#txt_userid"],
			passwword : params["#txt_userpassword"],
			
		}
	).getArray();

	if(selectResult.length <= 0){

		ret.alert("ログイン失敗しました。");
		return ret.navigate("login.jsp");

	}else{

		session.create();

		session.set("SMART_ID", selectResult[0]["smartid"]);

		session.set("USER_ID", selectResult[0]["userid"]);

		if(selectResult.length == 1){

			session.set("SHOP_ID", selectResult[0]["shopid"]);
			session.set("ROLE", selectResult[0]["role"]);

			return ret.navigate("menu.jsp");

		}else{

			selectResult.debug("--------------------------------------------");

			return ret.navigate("shoplist.jsp");

		}

	}

};

