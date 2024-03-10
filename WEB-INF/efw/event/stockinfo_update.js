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
		var local1 = localinfo[3] == null?0:localinfo[3];
		
		var producttype = localinfo[4];
		var productno = localinfo[5];
		var preproduct = localinfo[6];
		var productsub1 = localinfo[7];
		var productsub2 = localinfo[8];
		var put = localinfo[9] == null?0:localinfo[9];
		var purchase = localinfo[10] == null?0:localinfo[10];
		var local2 = localinfo[11] == null?0:localinfo[11];
		// 暫定データ
		if (flg > 0){
			var updateResult = db.change(
				"STOCK",
				"updatelocalstockflg1_local",
				{
					flg:flg,
					local1: parseInt(local1),
					local2: parseInt(local2),
					shopid: getShopId(),
				}
			);
			if(put != null){
				var updateResult = db.change(
					"STOCK",
					"updatelocalstockflg1_put",
					{
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
					local1: parseInt(local1),
					local2: parseInt(local2),
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