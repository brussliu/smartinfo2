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

		if(selectResult[0]["smartid"] == "STUDY"){

			session.create();

			session.set("SMART_ID", selectResult[0]["smartid"]);
			session.set("USER_ID", selectResult[0]["userid"]);
			session.set("SHOP_ID", selectResult[0]["shopid"]);

			session.set("ROLE", selectResult[0]["role"]);

			return ret.navigate("study_menu.jsp");

		}else{

			session.create();

			session.set("SMART_ID", selectResult[0]["smartid"]);
	
			session.set("USER_ID", selectResult[0]["userid"]);
	
			if(selectResult.length == 1){
	
				session.set("SHOP_ID", selectResult[0]["shopid"]);
				session.set("ROLE", selectResult[0]["role"]);
	
				var selectResult2 = db.select(
					"COMMON",
					"searchShopRoleInfoList",
					{
						role : selectResult[0]["role"],
						shopid : selectResult[0]["shopid"]
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
	
			}else{
	
				return ret.navigate("shoplist.jsp");
	
			}

		}


	}

};

