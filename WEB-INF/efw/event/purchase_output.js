var purchase_output = {};
purchase_output.name = "仕入NOリンク押下";
purchase_output.paramsFormat = {
	"purchaseno": null
};

purchase_output.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var purchaseno = params["purchaseno"];

	// 非暫定データ
	var selectResult0 = db.select("PURCHASE", "selectpurchase0_excel", {no:purchaseno,shopid: getShopId()}).getArray();
	// 暫定データ
	var selectResult1 = db.select("PURCHASE", "selectpurchase1_excel", {no:purchaseno,shopid: getShopId()}).getArray();

	// Excelファイル書き込み
	var tempFilePathName = writeExcel(selectResult0, selectResult1, 2, 2);

	ret.attach(tempFilePathName)
	.saveas(getShopId()+"仕入情報_" + purchaseno + ".xlsx")
	.deleteAfterDownload();

	// 画面へ結果を返す
	return ret;

};