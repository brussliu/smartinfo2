var purchase_send = {};
purchase_send.name = "仕入発送ボタン押下";
purchase_send.paramsFormat = {
	"purchaseno": null

};

purchase_send.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var purchaseno = params["purchaseno"];

	// 途中在庫へ計上
	var updateResult = db.change(
		"PURCHASE",
		"allocateStockToShip",
		{
			purchaseno: purchaseno,
			shopid: getShopId()
		}
	);

	// 更新ステータス
	var updateResult = db.change(
		"PURCHASE",
		"updatepurchaseStatus2",
		{
			purchaseno: purchaseno,
			shopid: getShopId()
		}
	);

	// MST_入庫仕入推奨数量情報 全体更新
	excute_m2_m4();

	// 画面へ結果を返す

	ret.eval("init();");
	// ret.eval("choice('');");
	return ret;

};
