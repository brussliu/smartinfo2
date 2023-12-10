var masterinfo_delete = {};
masterinfo_delete.name = "マスタ詳細情報削除";
masterinfo_delete.paramsFormat = {

	"flg": null, 

};

masterinfo_delete.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var flg = params["flg"]; 

 
	var changeResult = db.change(
		"MASTER",
		"deletemasterinfo",
		{
			shopid: getShopId(), 
			flg: flg, 
		}  
	)


	// 画面へ結果を返す
	ret.eval("masterinfo_inputdialog.dialog('close');");
	ret.eval("searchmasterinfo();");
	
	return ret;

};

 