var masterinfo_update1 = {};
masterinfo_update1.name = "インポート画面更新（暫定データ）";
masterinfo_update1.paramsFormat = {

	"flg": null, 
	"#sub1": null,
	"#sub2": null,
	"#newproductno": null,
};

masterinfo_update1.fire = function (params) {

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

	var flg = params["flg"];
	
	var selectResultObj = db.select(
		"MASTER",
		"searchmasterinfoflg1",
		{
			shopid :getShopId(),
			flg :flg 

		}
	).getSingle();

	ret.runat("#masterinfo_inputdialog").withdata(
		{
			// 暫定フラグ
			"#zt_flg":selectResultObj["flg"],
			// ASIN
			"#asinselect":"-",
			// SKU
			"#skuselect":"-",
			// LABEL
			"#label":"-",
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
			// FBA発送方式
			"#fba":selectResultObj["fba"],
			// 分類１
			"#sub1":selectResultObj["sub1"],
			// 分類２
			"#sub2":selectResultObj["sub2"],
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


	var productno = selectResultObj["no"];

	var sub1 = selectResultObj["sub1"];
	var sub2 = selectResultObj["sub2"];


	
	// ASIN,SKU初期化
	var selectResult = db.select(
		"MASTER",
		"searchAsinSku",
		{  
			"shopid": getShopId(),
			"sub1": sub1,
			"sub2": sub2,
			"productno": productno,
		}
	).getArray();

	if(selectResult.length == 0){
		selectResult = db.select(
			"MASTER",
			"searchAsinSku",
			{  
				"shopid": getShopId(),
				"sub1": "",
				"sub2": "",
				"productno": productno,
			}
		).getArray();
	}

	var resultHTML3 = "<option value='{asin}' class='asin'>{asin}</option>";
	ret.runat("#asinselect").remove(".asin").append(resultHTML3).withdata(selectResult);

	var resultHTML4 = "<option value='{sku}' class='sku'>{sku}</option>";
	ret.runat("#skuselect").remove(".sku").append(resultHTML4).withdata(selectResult);

	if(selectResult.length > 0){
		ret.eval("$('#asinselect').removeAttr('disabled').css('background', 'lightcyan');");
		ret.eval("$('#skuselect').removeAttr('disabled').css('background', 'lightcyan');");
	}else{
		ret.eval("$('#asinselect').attr('disabled', 'disabled').css('background', 'lightgray')");
		ret.eval("$('#skuselect').attr('disabled', 'disabled').css('background', 'lightgray')");
	}

	ret.eval("preproductchange();");

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// 画面へ結果を返す
	return ret.eval("masterinfo_inputdialog.dialog('open');");

};

