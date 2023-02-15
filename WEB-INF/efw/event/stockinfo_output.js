var stockinfo_output = {};
stockinfo_output.name = "在庫補足";
stockinfo_output.paramsFormat = {

};

stockinfo_output.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	sessionCheck(ret);
	var selectResult = db.select(
		"STOCK",
		"selectstock",
		{
			shopid: getShopId(),

		}
	).getArray();

	selectResult.debug("------------selectstock---")
	// var excel = new Excel("../../../../OTHERS/DOC/PRODUCT_LIST.xlsx");
	// excel.save("my.xlsx");
	var tempFilePathName = outputProductForSmartBear(selectResult);
	ret.attach(tempFilePathName)
		.saveas("Smart-Bear在庫補足_" + (new Date()).format("yyyyMMdd") + ".xlsx")
		.deleteAfterDownload();
	return ret;
};


function outputProductForSmartBear(selectResult) {

	// テンプレートにより、EXCELオブジェクトを作成する
	var excel = new Excel("templates/PRODUCT_LIST.xlsx");
	// sl:克隆分页
	excel.createSheet("Sheet1Clone", "DELIVERYLIST");
	var tempFilePathName = file.getTempFileName();
selectResult.length.debug("------selectResult.length------");
	for (var i = 0; i < selectResult.length; i++) {

		var outputflg = false;

		// 情報設定
		outputflg = setInfoToExcel(excel, selectResult[i], "DELIVERYLIST");

	}

	excel.setActiveSheet("DELIVERYLIST").save(tempFilePathName);

	return tempFilePathName;

}

function setInfoToExcel(excel, selectRecord, sheetName) {
	var Y_from = 3;
	var Y_to = 999;

	var COL_B = "B";
	var COL_C = "C";
	var COL_D = "D";
	var COL_E = "E";
	var COL_F = "F";
	var COL_G = "G";
	var COL_H = "H";
	var COL_I = "I";
	var COL_J = "J";
	var COL_K = "K";
	var COL_L = "L";
	var COL_M = "M";
	var COL_N = "N";
	var COL_O = "O";
	var COL_R = "R";
	var COL_S = "S";
	var COL_T = "T";
	var COL_U = "U";
	var COL_V = "V";
	var COL_W = "W";
	var COL_X = "X";
	var COL_Y = "Y";


	var no = returnQuantity(selectRecord["no"]);
	var asin = selectRecord["asin"];
	var sku = selectRecord["sku"];
	var label = selectRecord["label"];

	var sub1 = returnQuantity(selectRecord["sub1"]);
	var sub2 = returnQuantity(selectRecord["sub2"]);
	var productname = returnQuantity(selectRecord["productname"]);

	var send = returnQuantity(selectRecord["send"]);
	var price = returnQuantity(selectRecord["price"]);
	var fba = returnQuantity(selectRecord["fba"]);
	var fbm = returnQuantity(selectRecord["fbm"]);
	var put = returnQuantity(selectRecord["put"]);
	var local = returnQuantity(selectRecord["local"]);
	var purchase = returnQuantity(selectRecord["purchase"]);

	var selled3 = returnQuantity(selectRecord["selled3"]);
	var selled7 = returnQuantity(selectRecord["selled7"]);
	var selled30 = returnQuantity(selectRecord["selled30"]);
	var selled60 = returnQuantity(selectRecord["selled60"]);
	var selled90 = returnQuantity(selectRecord["selled90"]);
	var selled180 = returnQuantity(selectRecord["selled180"]);
	var selled360 = returnQuantity(selectRecord["selled360"]);
	var dayaverage = returnNumber(selectRecord["dayaverage"]);


	// 在庫情報シート
	for (var y = Y_from; y <= Y_to; y++) {



		// 管理番号
		setExcelValue(excel, sheetName, COL_B + y, no);
		// ASIN番号
		setExcelValue(excel, sheetName, COL_C + y, asin);
		// SKU番号
		setExcelValue(excel, sheetName, COL_D + y, sku);
		// LABEL番号
		setExcelValue(excel, sheetName, COL_E + y, label);
		// 分類①
		setExcelValue(excel, sheetName, COL_F + y, sub1);
		// 分類②
		setExcelValue(excel, sheetName, COL_G + y, sub2);
		// 商品名
		setExcelValue(excel, sheetName, COL_H + y, productname);
		// 発送区分
		setExcelValue(excel, sheetName, COL_I + y, send);
		// 価格
		setExcelValue(excel, sheetName, COL_J + y, price);
		// 在庫数量(FBA)
		setExcelValue(excel, sheetName, COL_K + y, fba);
		// 在庫数量(FBM)
		setExcelValue(excel, sheetName, COL_L + y, fbm);
		// 在庫数量(納品途中)
		setExcelValue(excel, sheetName, COL_M + y, put);
		// 在庫数量(LOCAL)
		setExcelValue(excel, sheetName, COL_N + y, local);
		// 在庫数量(仕入途中)
		setExcelValue(excel, sheetName, COL_O + y, purchase);
		// 販売数量(直近3日)
		setExcelValue(excel, sheetName, COL_R + y, selled3);
		// 販売数量(直近7日)
		setExcelValue(excel, sheetName, COL_S + y, selled7);
		// 販売数量(直近30日)
		setExcelValue(excel, sheetName, COL_T + y, selled30);
		// 販売数量(直近60日)
		setExcelValue(excel, sheetName, COL_U + y, selled60);
		// 販売数量(直近90日)
		setExcelValue(excel, sheetName, COL_V + y, selled90);
		// 販売数量(直近180日)
		setExcelValue(excel, sheetName, COL_W + y, selled180);
		// 販売数量(直近360日)
		setExcelValue(excel, sheetName, COL_X + y, selled360);
		// 販売数量(参照値)
		setExcelValue(excel, sheetName, COL_Y + y, dayaverage);

	}

	return true;

}

function setExcelValue(excel, sheetName, station, value) {

	if (value != null) {
		excel.setCell(sheetName, station, value);
	}

}


function returnQuantity(quantity) {

	if (quantity == null || quantity == "" || quantity == "0" || quantity == 0) {
		return null;
	}
	return parseInt(quantity);
}


function returnNumber(decimalNumber) {

	if (decimalNumber == null || decimalNumber == "") {
		return null;
	}

	return parseFloat(decimalNumber);
}

function returnJPPrice(price) {

	if (price == null || price == "" || price == "0" || price == 0) {
		return null;
	}
	return parseInt(price);
}
