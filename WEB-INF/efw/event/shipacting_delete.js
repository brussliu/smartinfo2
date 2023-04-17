var shipacting_delete = {};
shipacting_delete.name = "代行発送商品削除ボタン押下";
shipacting_delete.paramsFormat = {
	"no": null
};

shipacting_delete.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var no = params["no"];
	var shopid = getShopId();
 
		var delResult = db.change(
			"SHIPACTING",
			"delshipacting",
			{
				"no" : no,
				"shopid": shopid
			}
		);

	ret.eval("init();")
	//ret.eval("choice('init');");
	return ret;
};