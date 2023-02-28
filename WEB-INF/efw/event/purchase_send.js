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
