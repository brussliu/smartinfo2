var masterinfo_update0 = {};
masterinfo_update0.name = "インポート画面更新（非暫定データ）";
masterinfo_update0.paramsFormat = {

	"asin": null,
	"sku": null,

};

masterinfo_update0.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	var asin = params["asin"];
	var sku = params["sku"];

	// 非暫定データ
	var selectResult = db.select(
		"MASTER",
		"searchmasterinfoflg0",
		{
			shopid: getShopId(),
			oldasin: asin,
			oldsku: sku,
		}
	);
	var selectResultObj = selectResult.getSingle();
	var selectResultArray = selectResult.getArray();

	ret.runat("#asinselect").remove(".asin").append("<option value='{asin}' class='asin'>{asin}</option>").withdata(selectResultArray);
	ret.runat("#skuselect").remove(".sku").append("<option value='{sku}' class='sku'>{sku}</option>").withdata(selectResultArray);

	ret.runat("#masterinfo_inputdialog").withdata(
		{
			// 暫定フラグ
			"#zt_flg":selectResultObj["flg"],
			// ASIN
			"#asinselect":selectResultObj["asin"],
			// SKU
			"#skuselect":selectResultObj["sku"],
			// 商品種別
			"#newproducttype":selectResultObj["type"],
			// 商品種別2
			"#newproducttype2":"",
			// 商品管理番号
			"#newproductno":selectResultObj["no"],
			// 商品管理番号2
			"#newproductno2":"",
			// 親子区分
			"#preproduct":selectResultObj["preproduct"],
			// 分類１
			"#sub1":selectResultObj["sub1"],
			// 分類２
			"#sub2":selectResultObj["sub2"],
			// FBA発送方式
			"#fba":selectResultObj["fba"],
			// 仕入価格
			"#price1":selectResultObj["price1"],
			// 仕入申報価格（元）
			"#price2":selectResultObj["price2"],
			// 仕入申報価格（ドル）
			"#price3":selectResultObj["price3"],
			// 商品名称
			"#productname":selectResultObj["name"],
			// 仕入中止
			// "#cbox_suspend":selectResultObj["suspend"],
			// 仕入先
			"#purchase":selectResultObj["purchase"]
		}
	);
	
	if(selectResultObj["suspend"]  == '1'){
		ret.eval("$('#cbox_suspend').prop('checked',true)")
	}else{
		ret.eval("$('#cbox_suspend').prop('checked',false)")
	}
 
	ret.eval("preproductchange();");

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// 画面へ結果を返す
	return ret.eval("masterinfo_inputdialog.dialog('open');");

};