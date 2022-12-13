var import_initimport = {};
import_initimport.name = "インポート画面初期表示";
import_initimport.paramsFormat = {

};
var SHOP_ID ="";
import_initimport.fire = function (params) {

	var ret = new Result();

	SHOP_ID = session.get("SHOP_ID");
	if(SHOP_ID == null|| SHOP_ID == ""){
		return ret.navigate("login.jsp");
	}

	// 履歴テ―プルから前回導入日時と件数を取得する
	var selectResult = db.select(
		"IMPORT",//IMPORT.xml
		"selectInitInfo",
		{
			 "shopId": SHOP_ID
		}
	).getArray();

	var script = "";
	// 取得したデータを画面に表示する
	for (var i = 0; i < selectResult.length; i++) {

		var datatype = selectResult[i]["データ種別"];
		script = script + "setInit('" + datatype + "','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		
	}
	
	return ret.eval(script);
};

