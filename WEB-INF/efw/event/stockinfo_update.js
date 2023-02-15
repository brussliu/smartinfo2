var stockinfo_update = {};
stockinfo_update.name = "在庫情報管理画面更新";
stockinfo_update.paramsFormat = {
	"alllocalArr": null
};

stockinfo_update.fire = function (params) {
	var ret = new Result();

	var alllocalArr = params["alllocalArr"];
	// セッションチェック
	sessionCheck(ret);


	for (var i = 0; i < alllocalArr.length; i++) {

		var localinfo = alllocalArr[i];
		var sku = localinfo[0];
		var asin = localinfo[1];
		var local = localinfo[2];
		var producttype = localinfo[3];
		var productno = localinfo[4];
		var preproduct = localinfo[5];
		var productsub1 = localinfo[6];
		var productsub2 = localinfo[7];
	 
		// ASIN，SKU为空时，表示暂定数据,更新local
		if (sku == '' ||sku == null && asin == '' || asin == null){
			var updateResult = db.change(
				"STOCK",
				"updatelocalstockflg1",
				{
					producttype: producttype,
					productno: productno,
					preproduct: preproduct,
					productsub1: productsub1,
					productsub2: productsub2,
					local: local,
					shopid: getShopId(),
				}
			);
			updateResult.debug("-------updatelocalstockflg1");
	}else if(sku != '' && sku != null && asin != '' && asin != null){
	// ASIN，SKU不为空时，表示非暂定数据,更新local
		var updateResult2 = db.change(
			"STOCK",
			"updatelocalstockflg0",
			{
				asin:asin,
				sku:sku,
				local: local,
				shopid: getShopId(),
			}
		);
		updateResult2.debug("-------updatelocalstockflg0");
	}
}


	// 画面へ結果を返す
	ret.eval("searchstockinfo();");
	return ret;
};