var purchase_receive = {};
purchase_receive.name = "仕入受領ボタン押下";
purchase_receive.paramsFormat = {
	"purchaseno": null

};

purchase_receive.fire = function (params) {

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

	// 更新MST_在庫情報-加上LOCAL在庫数量
	for (var i = 0; i < selectNew.length; i++) {
		var update = db.change(
			"PURCHASE",
			"updateMSTLocalAdd",
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
		"updatepurchase3",
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
