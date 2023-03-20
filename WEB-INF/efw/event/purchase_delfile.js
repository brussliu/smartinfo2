var purchase_delfile = {};
purchase_delfile.name = "仕入詳細文件削除";
purchase_delfile.paramsFormat = {
	"filename": null,
	"purchaseno": null,

};

purchase_delfile.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// ファイル名
	var filename = params["filename"];
	// 仕入NO
	var purchaseno = params["purchaseno"];

	// // ファイル名称検索
	// var selectResult = db.select(
	// 	"PURCHASE",
	// 	"queryPurchaseFileForDataname",
	// 	{
	// 		dataname: dataname,
	// 		purchaseno: purchaseno,
	// 		shopid: getShopId()
	// 	}
	// ).getArray();
	
	// ファイル削除
	var files = getShopId() + "/purchasefile/" + purchaseno + "/" + filename;
	file.remove(files);

	// データ削除
	var selectResult = db.change(
		"PURCHASE",
		"deletePurchaseFile",
		{
			shopid: getShopId(),
			filename: filename,
			purchaseno: purchaseno
		}
	)

	// 添付ファイル表示
	ret.eval("showFileList('" + purchaseno + "');");
	
	// 画面へ結果を返す
	return ret;

};
