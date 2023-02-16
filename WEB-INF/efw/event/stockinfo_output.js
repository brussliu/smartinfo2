var stockinfo_output = {};
stockinfo_output.name = "在庫補足";
stockinfo_output.paramsFormat = {
	"exl":null
};

stockinfo_output.fire = function (params) {
	var ret = new Result();
	var exl = params["exl"];
	// セッションチェック
	sessionCheck(ret);
	var selectResult = db.select(
		"STOCK",
		"selectstock",
		{
			shopid: getShopId(),

		}
	).getArray();

		if(exl=='1'){
			var tempFilePathName = deliver(selectResult);
		}else{
			var tempFilePathName = receiving(selectResult);
		}
	
	ret.attach(tempFilePathName)
		.saveas(getShopId()+"在庫補足_" + (new Date()).format("yyyyMMdd") + ".xlsx")
		.deleteAfterDownload();
	return ret;
};

// 納品EXCEL
function deliver(selectResult) {
	// テンプレートにより、EXCELオブジェクトを作成する
	var excel = new Excel("templates/PRODUCT_LIST.xlsx");
	var tempFilePathName = file.getTempFileName();
	var Y_from = 3;//EXCEL数据起始行
	var type_no = 0;//商品分类数组序号
	var typearray = new Array();//所有商品类别

	// sl:检索所有分类，存放数组中
	typearray.push(returnType(selectResult[0]["type"]));
	for (var j = 1; j < selectResult.length; j++) {
		if (selectResult[j]["type"] != selectResult[j - 1]["type"]) {
			typearray.push(returnType(selectResult[j]["type"]))
		}
	}
		// 循环插入数据
	for (var i = 0; i < selectResult.length; i++) {

		if (i == 0) {//第一个商品分类
			// sl:克隆分页
			excel.createSheet(typearray[type_no], "DELIVERYLIST");

		} else {
			// 判断与上一条数据的类别是否相等，相等则创建新分页
			if (selectResult[i - 1]["type"] != selectResult[i]["type"]) {
				type_no++;//下一个商品分类
				excel.createSheet(typearray[type_no], "DELIVERYLIST");
				Y_from = 3;//重新从第三行开始插入数据
			}
		}
		// 设定值
		setInfoToExcel(excel, selectResult[i], typearray[type_no], Y_from);
		Y_from++;//下一行
	}

	excel.hideSheet("DELIVERYLIST").hideSheet("PURCHASELIST");
	excel.setActiveSheet(typearray[0]).save(tempFilePathName);
	return tempFilePathName;
}
// 仕入EXCEL
function receiving(selectResult) {
	// テンプレートにより、EXCELオブジェクトを作成する
	var excel = new Excel("templates/PRODUCT_LIST.xlsx");
	var tempFilePathName = file.getTempFileName();
	var Y_from = 3;//EXCEL数据起始行
	var type_no = 0;//商品分类数组序号
	var typearray = new Array();//所有商品类别

	// sl:检索所有分类，存放数组中
	typearray.push(returnType(selectResult[0]["type"]));
	for (var j = 1; j < selectResult.length; j++) {
		if (selectResult[j]["type"] != selectResult[j - 1]["type"]) {
			typearray.push(returnType(selectResult[j]["type"]))
		}
	}
		// 循环插入数据
	for (var i = 0; i < selectResult.length; i++) {

		if (i == 0) {//第一个商品分类
			// sl:克隆分页
			excel.createSheet(typearray[type_no], "PURCHASELIST");
		} else {
			// 判断与上一条数据的类别是否相等，相等则创建新分页
			if (selectResult[i - 1]["type"] != selectResult[i]["type"]) {
				type_no++;//下一个商品分类
				excel.createSheet(typearray[type_no], "PURCHASELIST");
				Y_from = 3;//重新从第三行开始插入数据
			}
		}
		// 设定值
		setInfoToExcel(excel, selectResult[i], typearray[type_no], Y_from);
		Y_from++;//下一行
	}
	
	excel.hideSheet("DELIVERYLIST").hideSheet("PURCHASELIST");
	excel.setActiveSheet(typearray[0]).save(tempFilePathName);
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


	var no = returnNull(selectRecord["no"]);
	var asin = returnNull(selectRecord["asin"]);

	var sku = returnNull(selectRecord["sku"]);
	var label = returnNull(selectRecord["label"]);

	var sub1 = returnNull(selectRecord["sub1"]);
	var sub2 = returnNull(selectRecord["sub2"]);
	var productname = returnNull(selectRecord["productname"]);

	var send = returnNull(selectRecord["send"]);
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
	setExcelValue(excel, sheetName, COL_I + from, send);
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

function returnJPPrice(price) {

	if (price == null || price == "" || price == "0" || price == 0) {
		return null;
	}
	return parseInt(price);
}

function returnType(type) {

	if (type == null || type == "" || type == "0") {
		return '空格';
	}
	return type.substring(3);
}
