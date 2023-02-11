var masterinfo_init = {};
masterinfo_init.name = "インポート画面初期表示";
masterinfo_init.paramsFormat = {

};

masterinfo_init.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	sessionCheck(ret);

	// タイトル情報設定
	setTitleInfo(ret);

	// sl:商品管理番号初始化
	var selectResult1 = db.select(
		"MASTER",
		"searchproducno",
		{
			"shopId": getShopId(),
		}
	).getArray();

	var resultHTML1 = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#productno").remove("option .option").append(resultHTML1).withdata(selectResult1);


	// sl:商品分类初始化
	var selectResult2 = db.select(
		"MASTER",
		"searchproducttype",
		{
			"shopId": getShopId(),
		}
	).getArray();

	var resultHTML2 = "<input type='checkbox' value='{value}'>&nbsp;{text}&nbsp;&nbsp;";

	ret.runat("#producttype").remove("*").append(resultHTML2).withdata(selectResult2);

	return ret;
};