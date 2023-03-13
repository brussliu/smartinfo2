var stockinfo_output = {};
stockinfo_output.name = "在庫補足";
stockinfo_output.paramsFormat = {
	"exl":null,
	"#text_date":null
};

stockinfo_output.fire = function (params) {

	var ret = new Result();
	
	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// 出力区分
	var exl = params["exl"];

	// 推奨日数
	var text_date = params["#text_date"];

	// 推奨数量出力区分
	var exl_flg = 0;

	if(text_date != null && text_date != ""){

		if(exl=='1'){
			// 更新納品推奨数量入り
			var update1 = db.change("STOCK",	"updatedeliverynumber",	{daycount:parseInt(text_date),	shopId: getShopId()});

			exl_flg = 1;
		}else{
			// 更新推奨数量入り
			var update2 = db.change("STOCK",	"updatepurchasenumber",	{daycount:parseInt(text_date),	shopId: getShopId()});

			exl_flg = 2;
		}

	}

	// 非暫定データ
	var selectResult0 = db.select("STOCK", "selectstockinfo0_excel", {shopid: getShopId()}).getArray();
	// 暫定データ
	var selectResult1 = db.select("STOCK", "selectstockinfo1_excel", {shopid: getShopId()}).getArray();

	var tempFilePathName = writeExcel(selectResult0, selectResult1, exl, exl_flg);

	if(exl=='1'){

		ret.attach(tempFilePathName)
		.saveas(getShopId()+"納品情報_" + (new Date()).format("yyyyMMdd") + ".xlsx")
		.deleteAfterDownload();

	}else{

		ret.attach(tempFilePathName)
		.saveas(getShopId()+"仕入情報_" + (new Date()).format("yyyyMMdd") + ".xlsx")
		.deleteAfterDownload();
	}

	return ret;
};
