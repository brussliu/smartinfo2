var purchase_output = {};
purchase_output.name = "仕入NOリンク押下";
purchase_output.paramsFormat = {
	"no": null
};

purchase_output.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
	var no = params["no"];
	no.debug('----no')
	var selectResult1 = db.select
		("PURCHASE",
			"selectpurchase_excel",
			{ 
				no:no,
				shopid: getShopId() 
			}
		).getArray();
		selectResult1.debug('-------selectpurchase_excel-----')
		var tempFilePathName = writeExcel( selectResult1);

		ret.attach(tempFilePathName)
		.saveas(getShopId()+"納品情報_" + no + ".xlsx")
		.deleteAfterDownload();
	// 画面へ結果を返す
	return ret;

};


// Excelファイル書き込み
function writeExcel(selectResult1) {

	var sheet1 = "DELIVERYLIST";
	var sheet2 = "PURCHASELIST";


	// テンプレートにより、EXCELオブジェクトを作成する
	var excel = new Excel("common/templates/PRODUCT_LIST.xlsx");
	var tempFilePathName = file.getTempFileName();
 
	var y_from = 3;
	var old_type = "";
	var new_type = "";
	var firstsheet = "";

	for (var i = 0; i < selectResult1.length; i++) {

		if (i == 0){
			firstsheet = selectResult1[i]["type"].replaceAll(':', '.');
		}

		new_type = selectResult1[i]["type"].replaceAll(':', '.');
	 
		if (new_type != old_type) {

			if(old_type != ""){
				excel.delRow(old_type, y_from - 1, 500 - y_from + 1);
			}

			excel.createSheet(new_type, sheet2);

			y_from = 3;

		} 
	 
		// 设定值
		setInfoToExcel(excel, selectResult1[i], new_type, y_from);
		old_type = new_type;
		y_from ++;

	}

 

	excel.hideSheet(sheet1).hideSheet(sheet2);
	excel.setActiveSheet(firstsheet).save(tempFilePathName);

	return tempFilePathName;
}


function setInfoToExcel(excel, selectRecord, sheetName, from) {


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
	var num = returnNumber(selectRecord["num"]);
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
	// 納品数量
	setExcelValue(excel, sheetName, COL_Z + from, num);

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