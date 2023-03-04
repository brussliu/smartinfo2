var purchase_delete = {};
purchase_delete.name = "仕入情報管理画面削除";
purchase_delete.paramsFormat = {
	"no":null
};

purchase_delete.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var no = params["no"];

	//  削除
	var selectResult = db.change(
		"PURCHASE",
		"deletepurchase",
		{
			purchaseno:no,
			shopid: getShopId()
		}
	)

	// 删除仕入明细
	var deleteResult = db.change(
		"PURCHASE",
		"deletePurchaseContent",
		{
			purchaseno: no,
			shopid: getShopId()
		}
	);

	ret.eval("init();");
	// 画面へ結果を返す
	return ret;

};
