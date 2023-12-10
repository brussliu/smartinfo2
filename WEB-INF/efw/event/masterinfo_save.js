var masterinfo_save = {};
masterinfo_save.name = "マスタ詳細情報保存";
masterinfo_save.paramsFormat = {

	// 操作区分
	"#opt": null,

	// 画面項目
	"#asinselect": null,
	"#skuselect": null,

	"#newproducttype": null,
	"#newproducttype2": null,

	"#newproductno": null,
	"#newproductno2": null,

	"#preproduct": null,
	"#sub1": null,
	"#sub2": null,

	"#fba": null,

	"#price1": null,
	"#price2": null,
	"#price3": null,
	"#productname": null,

	// 暫定フラグ
	"#zt_flg": null,

	// 更新前項目
	// "oldasins": null,
	// "oldskus": null,

	"oldtype": null,
	"oldno": null,
	"oldpreproduct": null,

	"oldsub1": null,
	"oldsub2": null,
	"#cbox_suspend":null,
	"#purchase":null,
};

masterinfo_save.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// 操作区分
	var opt = params["#opt"];
	// 仕入中止
	var suspend = params["#cbox_suspend"];
	// 仕入先
	var purchase = params["#purchase"];
	// 新規保存の場合
	if (opt == "new") {

		var producttype = getValueFromTwoItem(params["#newproducttype"], params["#newproducttype2"]);
		var productno = getValueFromTwoItem(params["#newproductno"], params["#newproductno2"]);

		var fba = params["#fba"];
		var preproduct = params["#preproduct"];
		var sub1 = params["#sub1"];
		var sub2 = params["#sub2"];
		var price1 = params["#price1"];
		var price2 = params["#price2"];
		var price3 = params["#price3"];
		var productname = params["#productname"];

		// 获取MAX暂定值
		var queryMaxFlg = db.select(
			"MASTER",
			"maxFlg",
			{
				shopid: getShopId()
			}
		).getSingle();
		var flg = queryMaxFlg['maxflg'] + 1; 
		if (preproduct == '親商品') {

			var selectResult = db.change(
				"MASTER",
				"savemasterinfopre",
				{
					producttype: producttype,
					productno: productno,
					preproduct: preproduct,
					productname: productname,
					flg: flg,
					suspend: suspend,
					purchase: purchase,
					shopid: getShopId(),
				}
			); 

		} else if (preproduct == '子商品') {

			var selectResult = db.change(
				"MASTER",
				"savemasterinfosub",
				{
					producttype: producttype,
					productno: productno,

					fba: fba,
					preproduct: preproduct,
					sub1: sub1,
					sub2: sub2,
					price1: parseFloat(price1),
					price2: parseFloat(price2),
					price3: parseFloat(price3),
					productname: productname, 
					flg: flg,
					suspend: suspend,
					purchase: purchase,
					shopid: getShopId(),
				}
			);
		}

		// 在库
		var changeResult = db.change(
			"MASTER",
			"insertStockflg1sub2",
			{ 
				flg: flg,
				shopid: getShopId() 
			}
		)
	}


	// 既存更新の場合
	if (opt == "update") {

		var flg = parseInt(params["#zt_flg"]);

		var asin = params["#asinselect"];
		var sku = params["#skuselect"];

		var producttype = getValueFromTwoItem(params["#newproducttype"], params["#newproducttype2"]);
		var productno = getValueFromTwoItem(params["#newproductno"], params["#newproductno2"]);

		var preproduct = params["#preproduct"];
		var sub1 = params["#sub1"];
		var sub2 = params["#sub2"];
		var fba = params["#fba"];
		var price1 = params["#price1"];
		var price2 = params["#price2"];
		var price3 = params["#price3"];
		var productname = params["#productname"];

		var oldtype = params["oldtype"];
		var oldno = params["oldno"];
		var oldpreproduct = params["oldpreproduct"];
		var oldsub1 = params["oldsub1"];
		var oldsub2 = params["oldsub2"];

		// 非暫定データ
		if (flg == 0 && preproduct == '親商品') {
			// 当暂定为0，亲子区分为親商品时,更新
			var selectResult = db.change(
				"MASTER",
				"udatemasterinfoflg0pre",
				{
					producttype: producttype,
					productno: productno,
					productname: productname,
					shopid: getShopId(),
					oldasin: asin,
					oldsku: sku,
					purchase:purchase
				}
			);
			// 親商品时，更新子商品价格
			if (price1 != null && price1 != "" && price1 > 0) {
				var selectResult1 = db.change(
					"MASTER",
					"udatemasterinfosubprice1",
					{
						no: productno,
						price1: parseFloat(price1),
						shopid: getShopId(),
					}
				);
			}
			if (price2 != null && price2 != "" && price2 > 0) {
				var selectResult2 = db.change(
					"MASTER",
					"udatemasterinfosubprice2",
					{
						no: productno,
						price2: parseFloat(price2),
						shopid: getShopId(),
					}
				);
			}
			if (price3 != null && price3 != "" && price3 > 0) {
				var selectResult3 = db.change(
					"MASTER",
					"udatemasterinfosubprice3",
					{
						no: productno,
						price3: parseFloat(price3),
						shopid: getShopId(),
					}
				);
			}
			if (fba != null && fba != "") {
				var selectResult4 = db.change(
					"MASTER",
					"udatemasterinfosubfba",
					{
						no: productno,
						fba: fba,
						shopid: getShopId(),
					}
				);
			} 
			// 亲商品推荐仕入数量
			if (suspend != null && suspend != "" ) {
				// 更新仕入中止
				var updateResult2 = db.change(
					"MASTER",
					"updatemasterinfopresuspendstate",
					{ 
						shopid: getShopId(),
						no: productno,
						state: '1'
					}
				);
				// 重置推荐仕入数量
				var updateResult3 = db.change(
					"MASTER",
					"refreshrecommendnum",
					{ 
						shopid: getShopId()
					}
				);
			}
			if (suspend == null || suspend == "" ) {
				var updateResult2 = db.change(
					"MASTER",
					"updatemasterinfopresuspendstate",
					{ 
						shopid: getShopId(),
						no: productno,
						state: '0'
					}
				);
				// 重置推荐仕入数量
				var updateResult3 = db.change(
					"MASTER",
					"refreshrecommendnum",
					{ 
						shopid: getShopId()
					}
				);
			}
			// 亲商品仕入先
			if (purchase != null && purchase != "" ) {
				var updateResult3 = db.change(
					"MASTER",
					"updatemasterinfopurchasepre",
					{ 
						no: productno,
						purchase:purchase,
						shopid: getShopId()
					}
				);
			} 
			// 更新仕入明细价格
			var selectResult1 = db.change(
				"MASTER",
				"updatePurchasesubpriceflg0",
				{ 
					price1: parseFloat(price1),
					asin: asin,
					sku: sku, 
					shopid: getShopId(),
				}
			);
			 
		}

		if (flg == 0 && preproduct == '子商品') {

			// 当暂定为0，亲子区分为子商品时,更新
			var selectResult = db.change(
				"MASTER",
				"udatemasterinfoflg0sub",
				{
					producttype: producttype,
					productno: productno,
					fba: fba,

					sub1: sub1,
					sub2: sub2,

					price1: parseFloat(price1),
					price2: parseFloat(price2),
					price3: parseFloat(price3),

					productname: productname,
					shopid: getShopId(),

					oldasin: asin,
					oldsku: sku,
					purchase:purchase
				}
			);

			// 子商品推荐仕入数量
			if (suspend != null && suspend != "" ) {
				var selectResult2 = db.change(
					"MASTER",
					"updatemasterinfopresuspendstate",
					{ 
						shopid: getShopId(),
						oldasin: asin,
						oldsku: sku,
						state: '1'
					}
				);
				// 重置推荐仕入数量
				var updateResult3 = db.change(
					"MASTER",
					"refreshrecommendnum",
					{ 
						shopid: getShopId(),
						oldasin: asin,
						oldsku: sku
					}
				);
			}
			if(suspend == null || suspend == "" ) {
				var updateResult2 = db.change(
					"MASTER",
					"updatemasterinfopresuspendstate",
					{ 
						shopid: getShopId(),
						no: productno,
						state: '0'
					}
				);
				// 重置推荐仕入数量 
				var updateResult3 = db.change(
					"MASTER",
					"refreshrecommendnum",
					{ 
						shopid: getShopId(),
						oldasin: asin,
						oldsku: sku
					}
				);
			}
			// 子商品仕入先
			if (purchase != null && purchase != "" ) {
				var updateResult3 = db.change(
					"MASTER",
					"updatemasterinfopurchasesub",
					{ 
						oldasin: asin,
						oldsku: sku,
						purchase:purchase,
						shopid: getShopId()
					}
				);
			}
			// 更新仕入明细价格
			var selectResult1 = db.change(
				"MASTER",
				"updatePurchasesubpriceflg0",
				{ 
					price1: parseFloat(price1),
					asin: asin,
					sku: sku,  
					shopid: getShopId(),
				}
			);
			 
		}
		// 暫定データ
		if (flg > 0 && preproduct == '親商品') {

			var selectResult = db.change(
				"MASTER",
				"udatemasterinfoflg1pre",
				{
					producttype: producttype,
					productno: productno,

					productname: productname,
					shopid: getShopId(),
					flg :flg,
					purchase:purchase
				}
			);

			// 親商品时，更新子商品价格
			if (price1 != null && price1 != "" && price1 > 0) {
				var selectResult1 = db.change(
					"MASTER",
					"udatemasterinfosubprice1",
					{
						no: productno,
						price1: parseFloat(price1),
						shopid: getShopId(),
					}
				);
				
			}
			if (price2 != null && price2 != "" && price2 > 0) {
				var selectResult2 = db.change(
					"MASTER",
					"udatemasterinfosubprice2",
					{
						no: productno,
						price2: parseFloat(price2),
						shopid: getShopId(),
					}
				);
			}
			if (price3 != null && price3 != "" && price3 > 0) {
				var selectResult3 = db.change(
					"MASTER",
					"udatemasterinfosubprice3",
					{
						no: productno,
						price3: parseFloat(price3),
						shopid: getShopId(),
					}
				);
			}
			if (fba != null && fba != "") {
				var selectResult4 = db.change(
					"MASTER",
					"udatemasterinfosubfba",
					{
						no: productno,
						fba: fba,
						shopid: getShopId(),
					}
				);
			}

			if (asin != null && asin != "" && asin != "-" && sku != null && sku != "" && sku != "-") {
				
				var selectResult = db.select(
					"MASTER",
					"selectAsinSku",
					{
						asin: asin,
						sku: sku,
						shopid: getShopId(),
					}
				).getSingle();

				var label = null;
				if (selectResult != null) {
					label = selectResult["label"];
				}
				// 更新仕入明细价格
				var selectResult1 = db.change(
					"MASTER",
					"updatePurchasesubpriceflg1",
					{ 
						price1: parseFloat(price1),
						asin: asin,
						sku: sku,
						flg: flg,
						shopid: getShopId(),
					}
				); 
				// 合并
				var changeResult = db.change(
					"MASTER",
					"deleteByAsinSku",
					{
						asin: asin,
						sku: sku,
						shopid: getShopId(),
					}
				)
				var changeResult = db.change(
					"MASTER",
					"udatemasterinfoflg1sub2",
					{
						asin: asin,
						sku: sku,
						label: label,
						shopid: getShopId(), 
						flg:flg
					}
				)

 
				// 在库表
				var changeResult = db.change(
					"MASTER",
					"updateLocalNumForStock",
					{
						flg: flg,
						asin: asin,
						sku: sku,
						shopid: getShopId(),
					}
				) 

				var changeResult = db.change(
					"MASTER",
					"deleteByAsinSkuForStock",
					{
						flg: flg,
						shopid: getShopId(),
					}
				) 

				// MST_入庫仕入推奨数量情報 全体更新
				excute_m2_m4();

				// 亲商品推荐仕入数量
				if (suspend != null && suspend != "" ) {
					// 更新仕入中止
					var updateResult2 = db.change(
						"MASTER",
						"updatemasterinfopresuspendstate",
						{ 
							shopid: getShopId(),
							no: productno,
							state: '1'
						}
					);
					// 重置推荐仕入数量
					var updateResult3 = db.change(
						"MASTER",
						"refreshrecommendnum",
						{ 
							shopid: getShopId()
						}
					);
		 
				}
				//仕入中止
				if(suspend == null || suspend == "" ) {
					var updateResult2 = db.change(
						"MASTER",
						"updatemasterinfopresuspendstate",
						{ 
							shopid: getShopId(),
							no: productno,
							state: '0'
						}
					);
					// 重置推荐仕入数量
					var updateResult3 = db.change(
						"MASTER",
						"refreshrecommendnum",
						{ 
							shopid: getShopId()
						}
					);
				}
				// 亲商品仕入先
				if (purchase != null && purchase != "" ) {
					var updateResult3 = db.change(
						"MASTER",
						"updatemasterinfopurchasepre",
						{ 
							no: productno,
							purchase:purchase,
							shopid: getShopId()
						}
					);
				}
				
			}

		}
 
		if (flg > 0 && preproduct == '子商品') {

			// 当暂定为1,亲子区分为子商品时，更新
			var selectResult1 = db.change(
				"MASTER",
				"udatemasterinfoflg1sub1",
				{

					producttype: producttype,
					productno: productno,

					sub1: sub1,
					sub2: sub2,

					price1: parseFloat(price1),
					price2: parseFloat(price2),
					price3: parseFloat(price3),

					fba: fba,
					productname: productname,
					shopid: getShopId(),

					flg: flg,
					purchase:purchase
				}
			);


			if (asin != null && asin != "" && asin != "-" && sku != null && sku != "" && sku != "-") {
 
				var selectResult = db.select(
					"MASTER",
					"selectAsinSku",
					{
						asin: asin,
						sku: sku,
						shopid: getShopId(),
					}
				).getSingle();

				var label = null;
				if (selectResult != null) {
					label = selectResult["label"];
				}
				// 更新仕入明细价格
				var selectResult1 = db.change(
					"MASTER",
					"updatePurchasesubpriceflg1",
					{
						price1: parseFloat(price1),
						shopid: getShopId(), 
						flg: flg,
						asin: asin,
						sku: sku
					}
				);
			 
				var changeResult = db.change(
					"MASTER",
					"deleteByAsinSku",
					{
						asin: asin,
						sku: sku,
						shopid: getShopId(),
					}
				)

				var changeResult = db.change(
					"MASTER",
					"udatemasterinfoflg1sub2",
					{
						asin: asin,
						sku: sku,
						label: label,
						shopid: getShopId(), 
						flg:flg
					}
				)

				// 在库表
				var changeResult = db.change(
					"MASTER",
					"updateLocalNumForStock",
					{
						flg: flg,
						asin: asin,
						sku: sku,
						shopid: getShopId(),
					}
				) 

				var changeResult = db.change(
					"MASTER",
					"deleteByAsinSkuForStock",
					{
						flg: flg,
						shopid: getShopId(),
					}
				) 

				// MST_入庫仕入推奨数量情報 全体更新
				excute_m2_m4();

 
				// 子商品推荐仕入数量
				if (suspend != null && suspend != "" ) {
					// 更新仕入中止
					var updateResult2 = db.change(
						"MASTER",
						"updatemasterinfopresuspendstate",
						{ 
							shopid: getShopId(),
							oldasin: asin,
							oldsku: sku, 
							state: '1'
						}
					);
					// 重置推荐仕入数量
					var updateResult3 = db.change(
						"MASTER",
						"refreshrecommendnum",
						{ 
							shopid: getShopId(),
							oldasin: asin,
							oldsku: sku, 
						}
					);
		 
				}
				if(suspend == null || suspend == "" ) {
					var updateResult2 = db.change(
						"MASTER",
						"updatemasterinfopresuspendstate",
						{ 
							shopid: getShopId(),
							no: productno,
							state: '0'
						}
					);
					// 重置推荐仕入数量
					var updateResult3 = db.change(
						"MASTER",
						"refreshrecommendnum",
						{ 
							shopid: getShopId(),
							oldasin: asin,
							oldsku: sku, 
						}
					);
				}
				// 子商品仕入先
				if (purchase != null && purchase != "" ) {
					var updateResult3 = db.change(
						"MASTER",
						"updatemasterinfopurchasesub",
						{ 
							oldasin: asin,
							oldsku: sku,
							purchase:purchase,
							shopid: getShopId()
						}
					);
				}

			}
		}


	}

	// 画面へ結果を返す
	ret.eval("masterinfo_inputdialog.dialog('close');");
	ret.eval("searchmasterinfo();");

	return ret;

};

function getValueFromTwoItem(value1, value2) {
	if (value2 == "" || value2 == null) {
		return value1;
	} else {
		return value2;
	}
}