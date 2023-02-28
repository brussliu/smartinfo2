var purchase_send = {};
purchase_send.name = "仕入発送ボタン押下";
purchase_send.paramsFormat = {
	"purchaseno": null

};

purchase_send.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	sessionCheck(ret);


	var purchaseno = params["purchaseno"];
	// 检索仕入明细所有sku,asin,数量
	var selectNew = db.select(
		"PURCHASE",
		"queryPurchaseCount",
		{
			purchaseno: purchaseno,
			shopid: getShopId()
		}
	).getArray();

	for (var i = 0; i < selectNew.length; i++) {
		// 更新途中在庫_仕入数量
		var update = db.change(
			"PURCHASE",
			"updateMSTPurAdd",
			{
				asin: selectNew[i]['asin'],
				sku: selectNew[i]['sku'],
				count: selectNew[i]['count'],
				purchaseno: purchaseno,
				shopid: getShopId()
			}
		);
	}
	// 更新ステータス
	var updateResult = db.change(
		"PURCHASE",
		"updatepurchase2",
		{
			purchaseno: purchaseno,
			shopid: getShopId()
		}
	);


	// 画面へ結果を返す

	ret.eval("init();");
	ret.eval("choice('');");
	return ret;

};
