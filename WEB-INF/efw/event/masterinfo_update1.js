var masterinfo_update1 = {};
masterinfo_update1.name = "インポート画面更新（暫定データ）";
masterinfo_update1.paramsFormat = {

	"type": null,
	"no": null,
	"preproduct": null,
	"sub1": null,
	"sub2": null,

	// "#flg": null,
	// "#asin": null,
	// "#sku": null,
	// "#label": null,

	// "#newproducttype": null,
	// "#newproducttype2": null,

	// "#newproductno": null,
	// "#newproductno2": null,
	// "#fba": null,

	// "#pre": null,
	// "#sub1": null,
	// "#sub2": null,

	// "#price1": null,
	// "#price2": null,
	// "#price3": null,

	// "#productname": null,


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

	var oldtype = params["type"];
	var oldno = params["no"];
	var oldpreproduct = params["preproduct"];
	var oldsub1 = params["sub1"];
	var oldsub2 = params["sub2"];

	// ASIN,SKU初期化
	var selectResult = db.select(
		"MASTER",
		"searchAsinSku",
		{
			"shopid": getShopId(),
			"productno": oldno,
		}
	).getArray();

	var resultHTML3 = "<option value='{asin}' class='asin'>{asin}</option>";
	ret.runat("#asinselect").remove("option .asin").append(resultHTML3).withdata(selectResult);

	var resultHTML4 = "<option value='{sku}' class='sku'>{sku}</option>";
	ret.runat("#skuselect").remove("option .sku").append(resultHTML4).withdata(selectResult);
	
	var selectResultObj = db.select(
		"MASTER",
		"searchmasterinfoflg1",
		{
			shopid :	getShopId(),
			oldtype :	oldtype,
			oldno :		oldno,
			oldpreproduct :	oldpreproduct,
			oldsub1 :	oldsub1,
			oldsub2 :	oldsub2

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
	 
	if(selectResult.length > 0){
		ret.eval("$('#asinselect').removeAttr('disabled').css('background', 'lightcyan');");
		ret.eval("$('#skuselect').removeAttr('disabled').css('background', 'lightcyan');");
	}else{
		ret.eval("$('#asinselect').attr('disabled', 'disabled').css('background', 'lightgray')");
		ret.eval("$('#skuselect').attr('disabled', 'disabled').css('background', 'lightgray')");
	}

		// var label = "$('#label').html('" + isNULL(selectResult1[0].label) + "'); ";
		// ret.eval(label);




	// var asin = params["#asin"];
	// var sku = params["#sku"];
	// var label = params["#label"];

	// var newproducttype = params["#newproducttype"];
	// var newproducttype2 = params["#newproducttype2"];
	// var type = "";
	// if (newproducttype2 == "") {
	// 	type = newproducttype;
	// } else {
	// 	type = newproducttype2;
	// }
	// var newproductno = params["#newproductno"];
	// var newproductno2 = params["#newproductno2"];
	// var no = "";

	// if (newproductno2 == "") {
	// 	no = newproductno;
	// } else {
	// 	no = newproductno2;
	// }
	// var fba = params["#fba"];

	// var preproduct = params["#pre"];
	// var sub1 = params["#sub1"];
	// var sub2 = params["#sub2"];

	// var price1 = params["#price1"];
	// var price2 = params["#price2"];
	// var price3 = params["#price3"];

	// var productname = params["#productname"];



	// 存放更新前商品分类，管理番号，亲子区分，分类一，分类二数据
	// var oldtype = "$('#newproducttype2').data('oldtype','" + selectResult1[0].type + "'); ";
	// ret.eval(oldtype);
	// var oldno = "$('#newproductno2').data('oldno','" + selectResult1[0].no + "'); ";
	// ret.eval(oldno);
	// var oldpreproduct = "$('#preproduct').data('oldpreproduct','" + selectResult1[0].preproduct + "'); ";
	// ret.eval(oldpreproduct);
	// var oldsub1 = "$('#sub1').data('oldsub1','" + selectResult1[0].sub1 + "'); ";
	// ret.eval(oldsub1);
	// var oldsub2 = "$('#sub2').data('oldsub2','" + selectResult1[0].sub2 + "'); ";
	// ret.eval(oldsub2);



	// 为dialog赋值
	// var newproducttype = "$('#newproducttype').val('" + selectResult1[0].type + "'); ";
	// ret.eval(newproducttype);

	// var newproductno = "$('#newproductno').val('" + selectResult1[0].no + "'); ";
	// ret.eval(newproductno);

	// var preproduct = "$('#preproduct').val('" + selectResult1[0].preproduct + "');";
	// ret.eval(preproduct);

	// var fba = "$('#fba').val('" + selectResult1[0].fba + "'); ";
	// ret.eval(fba);

	// var sub1 = "$('#sub1').val('" + isNULL(selectResult1[0].sub1) + "'); ";
	// ret.eval(sub1);

	// var sub2 = "$('#sub2').val('" + isNULL(selectResult1[0].sub2) + "'); ";
	// ret.eval(sub2);

	// var price1 = "$('#price1').val('" + Number(selectResult1[0].price1) + "'); ";
	// ret.eval(price1);

	// var price2 = "$('#price2').val('" + Number(selectResult1[0].price2) + "'); ";
	// ret.eval(price2);

	// var price3 = "$('#price3').val('" + Number(selectResult1[0].price3) + "'); ";
	// ret.eval(price3);

	// var productname = "$('#productname').val('" + selectResult1[0].name + "'); ";
	// ret.eval(productname);

	ret.eval("preproductchange();");

	////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	// 画面へ結果を返す
	return ret.eval("masterinfo_inputdialog.dialog('open');");

};

// function isNULL(value) {
// 	if (value == null) {
// 		return "";
// 	}
// 	return value;
// }
