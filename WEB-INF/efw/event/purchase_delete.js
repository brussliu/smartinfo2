var purchase_delete = {};
purchase_delete.name = "仕入情報管理画面削除";
purchase_delete.paramsFormat = {
	"no":null
};

purchase_delete.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	sessionCheck(ret);

	var no = params["no"];
	//  削除
	var selectResult = db.change(
		"PURCHASE",
		"deletepurchase",
		{
			shopid: getShopId(),
			no:no
		}
	)

	selectResult.debug("-------------deletepurchase")
	ret.eval("newdialog();");
	ret.eval("init();");
	// 画面へ結果を返す
	return ret;

};
