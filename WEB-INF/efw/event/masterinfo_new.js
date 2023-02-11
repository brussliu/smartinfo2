var masterinfo_new = {};
masterinfo_new.name = "マスタ情報新規画面初期表示";
masterinfo_new.paramsFormat = {

};

masterinfo_new.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	sessionCheck(ret);

	// 商品管理番号初期化
	var selectResult1 = db.select(
		"MASTER",
		"searchproducno",
		{
			"shopId": getShopId(),
		}
	).getArray();

	var resultHTML1 = "<option value='{value}' class='option'>{text}</option>";

	ret.runat("#newproductno").remove(".option").append(resultHTML1).withdata(selectResult1);

	// 商品分類初期化
	var selectResult2 = db.select(
		"MASTER",
		"searchproducttype",
		{
			"shopId": getShopId(),
		}
	).getArray();

	var resultHTML2 = "<option value='{value}' class='option'>{value}</option>";

	ret.runat("#newproducttype").remove(".option").append(resultHTML2).withdata(selectResult2);

	ret.eval("preproductchange();");

	return ret.eval("masterinfo_inputdialog.dialog('open');");
};