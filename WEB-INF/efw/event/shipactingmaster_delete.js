var shipactingmaster_delete = {};
shipactingmaster_delete.name = "代行発送商品削除ボタン押下";
shipactingmaster_delete.paramsFormat = {
	"no": null
};

shipactingmaster_delete.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var no = params["no"];
	var selectResult = db.change(
		"SHIPACTINGMASTER",
		"delshipactingmaster",
		{
			"no" : parseInt(no),
			"shopid": getShopId()
		}
	);


 
	ret.eval("init();")
	//ret.eval("choice('init');");
	return ret;
};