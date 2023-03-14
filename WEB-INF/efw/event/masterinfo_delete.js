var masterinfo_delete = {};
masterinfo_delete.name = "マスタ詳細情報削除";
masterinfo_delete.paramsFormat = {

	"oldtype": null,
	"oldno": null,
	"oldpreproduct": null,
	"oldsub1": null,
	"oldsub2": null,

};

masterinfo_delete.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var oldtype = params["oldtype"];
	var oldno = params["oldno"];
	var oldpreproduct = params["oldpreproduct"];
	var oldsub1 = params["oldsub1"];
	var oldsub2 = params["oldsub2"];

 
	var changeResult = db.change(
		"MASTER",
		"deletemasterinfo",
		{
			shopid: getShopId(),

			oldno: oldno,
			oldtype: oldtype,
			oldpreproduct: oldpreproduct,
			oldsub1: oldsub1,
			oldsub2: oldsub2
		}
	)


	// 画面へ結果を返す
	ret.eval("masterinfo_inputdialog.dialog('close');");
	ret.eval("searchmasterinfo();");
	
	return ret;

};

 