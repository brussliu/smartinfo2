var delivery_output = {};
delivery_output.name = "納品NOリンク押下";
delivery_output.paramsFormat = {
	"deliveryno": null
};

delivery_output.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var deliveryno = params["deliveryno"];
 
	var selectResult = db.select(
		"DELIVERY",
		"selectdelivery_excel",
		{ 
			no:deliveryno,
			shopid: getShopId() 
		}
	).getArray();
	
	// ファイル出力
	var tempFilePathName = writeExcel(selectResult, null, 1, 1);

	ret.attach(tempFilePathName)
	.saveas(getShopId()+"納品情報_" + deliveryno + ".xlsx")
	.deleteAfterDownload();

	// 画面へ結果を返す
	return ret;

};

