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
