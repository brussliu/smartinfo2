var commission_init = {};
commission_init.name = "手数料見積情報初期表示";
commission_init.paramsFormat = {

};
 
commission_init.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);

	// sl:商品管理番号初始化
	var selectResult1 = db.select(
		"COMMISSION",
		"searchproducno",
		{
			"shopId": getShopId(),
		}
	).getArray();

	var resultHTML1 = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#opt_productno").remove("option .option").append(resultHTML1).withdata(selectResult1);

	// sl:商品分类初始化
	var selectResult2 = db.select(
		"COMMISSION",
		"searchproducttype",
		{
			"shopId": getShopId(),
		}
	).getArray();

	var resultHTML2 = "<input type='checkbox' value='{value}'>&nbsp;{text}&nbsp;&nbsp;";

	ret.runat("#checkbox_producttype").remove("*").append(resultHTML2).withdata(selectResult2);

	return ret;
};