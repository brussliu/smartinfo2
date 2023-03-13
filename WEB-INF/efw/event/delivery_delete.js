var delivery_delete = {};
delivery_delete.name = "納品情報管理画面削除";
delivery_delete.paramsFormat = {
	"deliveryno":null
};

delivery_delete.fire = function (params) {

	var ret = new Result();
	
	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var deliveryno = params["deliveryno"];
	//  削除
	var selectResult = db.change(
		"DELIVERY",
		"deletedelivery",
		{
			shopid: getShopId(),
			no:deliveryno
		}
	)

	ret.eval("init();");

	// 画面へ結果を返す
	return ret;

};
