var keymonitor={};
keymonitor.POST=function(keys,params){//新規作成
	// var token=Packages.efw.framework.getRequest().getHeader("token");
	// if("1234567890"!=token){throw new Error("セキュリティエラー");}
	//db.change("helloRestAPI","insertRow",{"id":params.id,"name":params.nm});
	//return {url:"efwRestAPI/customer/"+params.id}

	return null
};
keymonitor.PUT=function(keys,params){//更新
	// var token=Packages.efw.framework.getRequest().getHeader("token");
	// if("1234567890"!=token){throw new Error("セキュリティエラー");}
	//var rt=db.change("helloRestAPI","updateRow",{"id":keys[0],"name":params.nm});
	//if (rt==0) throw new Error("更新対象のデータは存在しません。");
	
	return null;
};
keymonitor.DELETE=function(keys){//削除
	// var token=Packages.efw.framework.getRequest().getHeader("token");
	// if("1234567890"!=token){throw new Error("セキュリティエラー");}
	//var rt=db.change("helloRestAPI","deleteRow",{"id":keys[0]});
	//if (rt==0) throw new Error("削除対象のデータは存在しません。");
	
	return null;
};
keymonitor.GET=function(keys){//取得
	// var token=Packages.efw.framework.getRequest().getHeader("token");
	// if("1234567890"!=token){throw new Error("セキュリティエラー");}
	//return db.select("helloRestAPI","selectRow",{"id":keys[0]}).getSingle();

	//keys.debug("asdfghbvcxza");

	var files = absfile.list("D://apache-tomcat-9.0.30/webapps/smartinfo2/key/");

	if(files == null || files.length == 0){
		
		return null;

	}else{

		var fn = files[0]["name"]
		var keycode = fn.replaceAll(".key","");

		absfile.remove("D://apache-tomcat-9.0.30/webapps/smartinfo2/key/" + fn);

		return keycode;
	}

};