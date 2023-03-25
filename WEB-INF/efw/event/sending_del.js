var sending_del = {};
sending_del.name = "発送情報削除ボタン押下";
sending_del.paramsFormat = {
	"orderno": null
};

sending_del.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var orderno =parseInt( params["orderno"]);


	var selectResult = db.change(
		"SENDING",
		"delbyorderno",
		{
			"orderno": orderno,
			"shopid": getShopId(),
		}
	);
 
	ret.eval('init();');
	return ret;
};