var stockinfo_output = {};
stockinfo_output.name = "在庫補足";
stockinfo_output.paramsFormat = {
	"exl":null,
	"#text_date":null
};

stockinfo_output.fire = function (params) {

	var ret = new Result();
	
	// セッションチェック
	sessionCheck(ret);

	var exl = params["exl"];
	var text_date = params["#text_date"];

	// 非暫定データ
	var selectResult0 = db.select("STOCK", "selectstockinfo0_excel", {shopid: getShopId()}).getArray();
	// 暫定データ
	var selectResult1 = db.select("STOCK", "selectstockinfo1_excel", {shopid: getShopId()}).getArray();

	var tempFilePathName = writeExcel(selectResult0, selectResult1, exl , text_date );

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

// Excelファイル書き込み
function writeExcel(selectResult0, selectResult1, exl , text_date ) {

	var sheet1 = "DELIVERYLIST";
	var sheet2 = "PURCHASELIST";
	var sheet0 = "";
	if(exl == '1'){
		sheet0 = sheet1;
	}else{
		sheet0 = sheet2;
	}

	// テンプレートにより、EXCELオブジェクトを作成する
	var excel = new Excel("common/templates/PRODUCT_LIST.xlsx");
	var tempFilePathName = file.getTempFileName();

	var y_from = 3;
	var old_type = "";
	var new_type = "";
	var firstsheet = "";

	// 非暫定データ
	for (var i = 0; i < selectResult0.length; i++) {
		 
		if (i == 0){
			firstsheet = selectResult0[i]["type"].replaceAll(':', '.');
		}

		new_type = selectResult0[i]["type"].replaceAll(':', '.');

		if (new_type != old_type) {

			if(old_type != ""){
				excel.delRow(old_type, y_from - 1, 500 - y_from + 1);
			}

			excel.createSheet(new_type, sheet0);

			y_from = 3;

		} 
		// 设定值
		setInfoToExcel(excel, selectResult0[i], new_type, y_from , exl , text_date );
		old_type = new_type;
		y_from ++;

	}

	// 暫定データ
	if(selectResult1.length > 0){

		excel.createSheet("暫定データ", sheet0);
		y_from = 3;

		for (var i = 0; i < selectResult1.length; i++) {

			excel.delRow("暫定データ", y_from - 1, 500 - y_from + 1);

			// 设定值
			setInfoToExcel(excel, selectResult1[i], "暫定データ", y_from,exl , text_date );
			y_from ++;

		}

	}

	excel.hideSheet(sheet1).hideSheet(sheet2);
	excel.setActiveSheet(firstsheet).save(tempFilePathName);

	return tempFilePathName;
}


function setInfoToExcel(excel, selectRecord, sheetName, from , exl , text_date ) {


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
	var COL_Z = "Z";

	var no = returnNull(selectRecord["pno"]);
	var asin = returnNull(selectRecord["asin"]);

	var sku = returnNull(selectRecord["sku"]);
	var label = returnNull(selectRecord["label"]);

	var sub1 = returnNull(selectRecord["sub1"]);
	var sub2 = returnNull(selectRecord["sub2"]);
	var productname = returnNull(selectRecord["productname"]);

	var shippingway = returnNull(selectRecord["shippingway"]);
	var price = returnNumber(selectRecord["price"]);
	var fba = returnNull(selectRecord["fba"]);
	var fbm = returnNull(selectRecord["fbm"]);
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

	// 管理番号
	setExcelValue(excel, sheetName, COL_B + from, no);
	// ASIN番号
	setExcelValue(excel, sheetName, COL_C + from, asin);
	// SKU番号
	setExcelValue(excel, sheetName, COL_D + from, sku);
	// LABEL番号
	setExcelValue(excel, sheetName, COL_E + from, label);
	// 分類①
	setExcelValue(excel, sheetName, COL_F + from, sub1);
	// 分類②
	setExcelValue(excel, sheetName, COL_G + from, sub2);
	// 商品名
	setExcelValue(excel, sheetName, COL_H + from, productname);
	// 発送区分
	setExcelValue(excel, sheetName, COL_I + from, shippingway);
	// 価格
	setExcelValue(excel, sheetName, COL_J + from, price);
	// 在庫数量(FBA)
	setExcelValue(excel, sheetName, COL_K + from, fba);
	// 在庫数量(FBM)
	setExcelValue(excel, sheetName, COL_L + from, fbm);
	// 在庫数量(納品途中)
	setExcelValue(excel, sheetName, COL_M + from, put);
	// 在庫数量(LOCAL)
	setExcelValue(excel, sheetName, COL_N + from, local);
	// 在庫数量(仕入途中)
	setExcelValue(excel, sheetName, COL_O + from, purchase);
	// 販売数量(直近3日)
	setExcelValue(excel, sheetName, COL_R + from, selled3);
	// 販売数量(直近7日)
	setExcelValue(excel, sheetName, COL_S + from, selled7);
	// 販売数量(直近30日)
	setExcelValue(excel, sheetName, COL_T + from, selled30);
	// 販売数量(直近60日)
	setExcelValue(excel, sheetName, COL_U + from, selled60);
	// 販売数量(直近90日)
	setExcelValue(excel, sheetName, COL_V + from, selled90);
	// 販売数量(直近180日)
	setExcelValue(excel, sheetName, COL_W + from, selled180);
	// 販売数量(直近360日)
	setExcelValue(excel, sheetName, COL_X + from, selled360);
	// 販売数量(参照値)
	setExcelValue(excel, sheetName, COL_Y + from, dayaverage);

	
	if(exl == '1'){//纳品
		// 更新推奨数量入り
		var update = db.change(
			"STOCK",
			"updatedeliverynumber",
			{
				sku:sku,
				asin:asin,
				date:text_date,
				shopId: getShopId()
			});

 
		// 查询推奨数量入り
		var selectResult1 = db.select(
			"STOCK",
			"selectdeliverynumber",
			{
				sku:sku,
				asin:asin,
				shopId: getShopId()
			}).getSingle();

	
	//納品数量
	setExcelValue(excel, sheetName, COL_Z + from, selectResult1["num"]);

	}else{
	 		// 更新推奨数量入り
			 var update = db.change(
				"STOCK",
				"updatepurchasenumber",
				{
					sku:sku,
					asin:asin,
					date:text_date,
					shopId:  getShopId()
				});
			// 查询推奨数量入り
			var selectResult2 = db.select(
				"STOCK",
				"selectpurchasenumber",
				{
					sku:sku,
					asin:asin,
					shopId: getShopId()
				}).getSingle();
	
	
		//納品数量
		setExcelValue(excel, sheetName, COL_Z + from, selectResult2["num"]);


	}

}

function setExcelValue(excel, sheetName, station, value) {

	if (value != null && value != '') {
		excel.setCell(sheetName, station, value);
	}
}
function returnNull(val) {

	if (val == null || val == "" || val == "0" || val == 0) {
		return '';
	}
	return val;
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

// function returnJPPrice(price) {

// 	if (price == null || price == "" || price == "0" || price == 0) {
// 		return null;
// 	}
// 	return parseInt(price);
// }

// function returnType(type) {

// 	if (type == null || type == "" || type == "0") {
// 		return '空格';
// 	}
// 	return type.substring(3);
// }
