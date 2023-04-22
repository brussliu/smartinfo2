var scan_del = {};
scan_del.name = "商品スキャン削除ボタン押下";
scan_del.paramsFormat = {
	"listno": null
};

scan_del.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var listno =params["listno"];


	var selectResult = db.change(
		"SCAN",
		"delProductDetail",
		{
			"listno": listno,
			"shopid": getShopId()
		}
	);

	var selectResult = db.change(
		"SCAN",
		"delProduct",
		{
			"listno": listno,
			"shopid": getShopId()
		}
	);
 
	ret.eval('init();');
	ret.eval("choice('init');");
	return ret;
};