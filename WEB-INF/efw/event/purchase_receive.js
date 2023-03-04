var purchase_receive = {};
purchase_receive.name = "仕入受取ボタン押下";
purchase_receive.paramsFormat = {
	"purchaseno": null

};

purchase_receive.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var purchaseno = params["purchaseno"];

	// 途中在庫から除く
	var updateResult = db.change(
		"PURCHASE",
		"removeStockFromShip",
		{
			purchaseno: purchaseno,
			shopid: getShopId()
		}
	);

	// LOCAL在庫計上
	var updateResult = db.change(
		"PURCHASE",
		"allocateStockToLocal",
		{
			purchaseno: purchaseno,
			shopid: getShopId()
		}
	);


	// 更新ステータス
	var updateResult = db.change(
		"PURCHASE",
		"updatepurchaseStatus3",
		{
			purchaseno: purchaseno,
			shopid: getShopId()
		}
	);


	// 画面へ結果を返す

	ret.eval("init();");
	// ret.eval("choice('');");
	return ret;

};
