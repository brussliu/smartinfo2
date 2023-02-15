var stockinfo_init = {};
stockinfo_init.name = "在庫情報管理画面初期表示";
stockinfo_init.paramsFormat = {

};
 
stockinfo_init.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	sessionCheck(ret);

	// タイトル情報設定
	setTitleInfo(ret);

	// sl:商品管理番号初始化
	var selectResult1 = db.select(
		"STOCK",
		"searchproducno",
		{
			"shopId": getShopId(),
		}
	).getArray();

	var resultHTML1 = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#opt_productno").remove("option .option").append(resultHTML1).withdata(selectResult1);
	selectResult1.debug("-------searchproducno---------");

	// sl:商品分类初始化
	var selectResult2 = db.select(
		"STOCK",
		"searchproducttype",
		{
			"shopId": getShopId(),
		}
	).getArray();

	var resultHTML2 = "<input type='checkbox' value='{value}'>&nbsp;{text}&nbsp;&nbsp;";

	ret.runat("#checkbox_producttype").remove("*").append(resultHTML2).withdata(selectResult2);
	selectResult2.debug("------searchproducttype----------")
	return ret;
};