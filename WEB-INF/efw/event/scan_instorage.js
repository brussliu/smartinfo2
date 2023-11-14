var scan_instorage = {};
scan_instorage.name = "商品スキャン入庫";
scan_instorage.paramsFormat = {
	"listno" : null
};
 
scan_instorage.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var listno = params["listno"];

	
		var updateResultObj = db.change(
			"SCAN",
			"scanInstorage",
			{
				"listno" : listno,
				"shopid": getShopId()
			}
		);
	
		ret.eval("init();");
		ret.eval("choice('init');");
		return ret;
};