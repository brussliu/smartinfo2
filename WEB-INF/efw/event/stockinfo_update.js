var stockinfo_update = {};
stockinfo_update.name = "在庫情報管理画面更新";
stockinfo_update.paramsFormat = {
	"alllocalArr": null
};

stockinfo_update.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	sessionCheck(ret);

	var alllocalArr = params["alllocalArr"];

	for (var i = 0; i < alllocalArr.length; i++) {

		var localinfo = alllocalArr[i];

		var flg =parseInt(localinfo[0]);
		var sku = localinfo[1];
		var asin = localinfo[2];
		var local = localinfo[3];
		var producttype = localinfo[4];
		var productno = localinfo[5];
		var preproduct = localinfo[6];
		var productsub1 = localinfo[7];
		var productsub2 = localinfo[8];
		var put = localinfo[9];
		var purchase = localinfo[10];
	 
		// 暫定データ
		if (flg > 0){
			var updateResult = db.change(
				"STOCK",
				"updatelocalstockflg1_local",
				{
					// producttype: producttype,
					// productno: productno,
					// preproduct: preproduct,
					// productsub1: productsub1,
					// productsub2: productsub2,
					flg:flg,
					local: parseInt(local),
					shopid: getShopId(),
				}
			);
			if(put != null){
				var updateResult = db.change(
					"STOCK",
					"updatelocalstockflg1_put",
					{
						// producttype: producttype,
						// productno: productno,
						// preproduct: preproduct,
						// productsub1: productsub1,
						// productsub2: productsub2,
						flg:flg,
						put: parseInt(put),
						shopid: getShopId(),
					}
				);
			}
			if(purchase != null){
				var updateResult = db.change(
					"STOCK",
					"updatelocalstockflg1_purchase",
					{
						// producttype: producttype,
						// productno: productno,
						// preproduct: preproduct,
						// productsub1: productsub1,
						// productsub2: productsub2,
						flg:flg,
						purchase: parseInt(purchase),
						shopid: getShopId(),
					}
				);
			}
	
		// 非暫定データ
		}else if(flg == 0){

			var updateResult2 = db.change(
				"STOCK",
				"updatelocalstockflg0_local",
				{
					asin:asin,
					sku:sku,
					local: parseInt(local),
					shopid: getShopId(),
				}
			);
			if(put != null){
				var updateResult2 = db.change(
					"STOCK",
					"updatelocalstockflg0_put",
					{
						asin:asin,
						sku:sku,
						put: parseInt(put),
						shopid: getShopId(),
					}
				);
			}
			if(purchase != null){
				var updateResult2 = db.change(
					"STOCK",
					"updatelocalstockflg0_purchase",
					{
						asin:asin,
						sku:sku,
						purchase: parseInt(purchase),
						shopid: getShopId(),
					}
				);
			}
		}
	}


	// 画面へ結果を返す
	ret.eval("searchstockinfo();");

	return ret;
};