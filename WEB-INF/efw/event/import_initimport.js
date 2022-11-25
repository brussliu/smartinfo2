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
		var datetype = selectResult[i]["データ種別"];
		if (datetype == "file01") {
			script = script + "setInit('file01','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file02") {
			script = script + "setInit('file02','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file03") {
			script = script + "setInit('file03','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file04") {
			script = script + "setInit('file04','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file05") {
			script = script + "setInit('file05','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file06") {
			script = script + "setInit('file06','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file07") {
			script = script + "setInit('file07','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file08") {
			script = script + "setInit('file08','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file09") {
			script = script + "setInit('file09','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file10") {
			script = script + "setInit('file10','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file11") {
			script = script + "setInit('file11','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file12") {
			script = script + "setInit('file12','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file13") {
			script = script + "setInit('file13','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file14") {
			script = script + "setInit('file14','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file15") {
			script = script + "setInit('file15','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file16") {
			script = script + "setInit('file16','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file17") {
			script = script + "setInit('file17','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
		if (datetype == "file18") {
			script = script + "setInit('file18','" + selectResult[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult[i]["導入件数"] + "');";
		}
	}
	return ret.eval(script);
};

