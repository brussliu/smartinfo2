var global = {};
global.name = "システム初期化";

/**
 * グローバルイベント実行関数
 */
global.fire = function () {



};


function setTitleInfo(ret){

	ret.runat("#sessioninfo").withdata(
		{
			"#shopid":getShopId(),
			"#userid":getUserId()
		}
	);

}

function setTitleInfoForShopList(ret){

	ret.runat("#sessioninfo").withdata(
		{
			"#shopid":"未選択",
			"#userid":getUserId()
		}
	);

}

function setAuthorityInfo(ret, pageid){

	for (var i = 0; i < 9999; i++) {

		var sessionname = "authority" + i;

		var sessioncontent = session.get(sessionname);

		if(sessioncontent == null){
			return;
		}
		// btn-0201_01-normal

		var sessioncontentArr = sessioncontent.split("-");

		var authority_type = sessioncontentArr[0];
		var authority_id = sessioncontentArr[1];
		var authority_div = sessioncontentArr[2];

		if(authority_id.startsWith(pageid)){

			var script = "";

			var classname = authority_type + "-" + authority_id;

			if(authority_div == "normal"){

				if(authority_type == "btn"){
					script = 
							"$('." + classname + "').show();" + 
							"$('." + classname + "').attr('disabled', false);";
				}else if(authority_type == "div"){
					script = "$('." + classname + "').show();";
				}
				
			}else if(authority_div == "disable"){

				if(authority_type == "btn"){
					script = 
							"$('." + classname + "').show();" + 
							"$('." + classname + "').attr('disabled', true);" +
							"$('." + classname + "').off('click');";

				}else if(authority_type == "div"){
					script = "$('." + classname + "').show();";
				}
				
			}else if(authority_div == "hidden"){

				if(authority_type == "btn"){
					script = 
						"$('." + classname + "').hide();" + 
						"$('." + classname + "').attr('disabled', true);" +
						"$('." + classname + "').off('click');";

				}else if(authority_type == "div"){

					script = "$('." + classname + "').hide();";
				}

			}
			ret.eval(script);

		}

	}


}

function getAuthorityInfo(shopid,btnid){
	
	if(shopid == 'Smart-Bear'){
	 	return	true;
	}
	if(shopid == 'zhixun'){

		for (var i = 0; i < 9999; i++) {

			var sessionname = "authority" + i;

			var sessioncontent = session.get(sessionname);

			if(sessioncontent == null){
				return false;
			}

			var sessioncontentArr = sessioncontent.split("-");

			// var authority_type = sessioncontentArr[0];
			var authority_id = sessioncontentArr[1];
			var authority_div = sessioncontentArr[2];

			if(authority_id == btnid){
				if(authority_div == "normal"){
					return true;
				}else{
					return false;	
				}
			}
		}
		
	}
}

function sessionCheck(ret){

	var smartId = getSmartId();
	if(smartId == null || smartId == ""){
		ret.navigate("login.jsp");
		return false;
	}
	var userId = getUserId();
	if(userId == null || userId == ""){
		ret.navigate("login.jsp");
		return false;
	}
	var shopId = getShopId();
	if(shopId == null || shopId == ""){
		ret.navigate("login.jsp");
		return false;
	}
	var role = getRole();
	if(role == null || role == ""){
		ret.navigate("login.jsp");
		return false;
	}
	return true;
}

function sessionCheckForShopList(ret){

	var smartId = getSmartId();
	if(smartId == null || smartId == ""){
		ret.navigate("login.jsp");
		return false;
	}
	var userId = getUserId();
	if(userId == null || userId == ""){
		ret.navigate("login.jsp");
		return false;
	}
	return true;

}

function clearSessionForShopList(){

	session.set("SHOP_ID", null);

	session.set("ROLE", null);

}


function getSmartId(){

	return session.get("SMART_ID");

}

function getUserId(){

	return session.get("USER_ID");

}

function getShopId(){

	return session.get("SHOP_ID");

}

function getRole(){

	return session.get("ROLE");

}

function excute(flg_file01, flg_file02, flg_file03, flg_file04, flg_file05, flg_file06,
	flg_file07, flg_file08, flg_file09, flg_file10, flg_file11, flg_file12,
	flg_file13, flg_file14, flg_file15, flg_file16, flg_file17, flg_file18, flg_file19) {
		
		// --------------------------------↓↓↓確認済↓↓↓--------------------------------
		var flg_h1 = false;
		var flg_h2 = false;
		var flg_h3 = false;
		var flg_h4 = false;
		var flg_h5 = false;

		var flg_r1 = false;
		var flg_r2 = false;
		var flg_r3 = false;
		var flg_r4 = false;
		var flg_r5 = false;

		var flg_m1 = false;
		var flg_m2 = false;
		var flg_m3 = false;
		var flg_m4 = false;

		var flg_t1 = false; 

		if(flg_file02){
			excute_02_h1();	flg_h1 = true;
		}
		if(flg_file04){
			excute_04_h2();	flg_h2 = true;
		}
		if(flg_file14){
			excute_14_h3();	flg_h3 = true;
		}
		if(flg_file15){
			excute_15_h4();	flg_h4 = true;
		}
		
		if(flg_file02){
			excute_02_r1();	flg_r1 = true;
		}
		if(flg_file11){
			excute_11_r1();	flg_r1 = true;
		}
		if(flg_file12){
			excute_12_r1();	flg_r1 = true;
		}
		
		if(flg_file04){
			excute_04_r2();	flg_r2 = true;
		}

		if(flg_file04){
			excute_04_r3();	flg_r3 = true;
		}
		if(flg_file13){
			excute_13_m5();	flg_m5 = true;
		}
		if(flg_file14){
			excute_14_r4();	flg_r4 = true;
		}
		if(flg_file15){
			excute_15_r5();	flg_r5 = true;
		}
		
		if(flg_file01){
			excute_01_m1();	flg_m1 = true;
		}
		if(flg_file03){
			excute_03_m1(); flg_m1 = true;
		}

		if(flg_file05){
			excute_05_t1(); flg_t1 = true;
		}

		if(flg_file06){
			excute_06_h5(); flg_h5 = true;
			excute_06_t1(); flg_t1 = true;
		}

		if(flg_m1){
			excute_m1_m2();	flg_m2 = true;
		}
		if(flg_file01){
			excute_01_m2();	flg_m2 = true;
		}
		if(flg_file03){
			excute_03_m2();	flg_m2 = true;
		}
		
		if(flg_m1){
			excute_m1_m3();	flg_m3 = true;
		}
		if(flg_r1){
			excute_r1_m3();	flg_m3 = true;
		}
		if(flg_m1){
			excute_m1_m4();	flg_m4 = true;
		}
		if(flg_m2 || flg_m3){
			excute_m2_m4();	flg_m4 = true;
		}
					// if(flg_m1){
					// 	excute_m1_m5();	flg_m5 = true;
					// }
		if(flg_file19){
			excute_19_r6();
		}
		// --------------------------------↑↑↑確認済↑↑↑--------------------------------

		// --------------------------------↓↓↓実装中↓↓↓--------------------------------




				
}

function excute_19_r6() {
	var deleteResult = db.change("IMPORT", "delete_19_r6", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insert_19_r6", {"shopId": getShopId()});
}
function excute_05_t1() {
	var insertResult = db.change("IMPORT", "insert_05_t1", {"shopId": getShopId()});
}

function excute_06_t1() {
	var insertResult = db.change("IMPORT", "insert_06_t1", {"shopId": getShopId()});
}

function excute_06_h5() {
	var insertResult = db.change("IMPORT", "insert_06_h5", {"shopId": getShopId()});
}

function excute_15_r5() {

	var updateResult = db.change("IMPORT", "update_15_r5", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insert_15_r5", {"shopId": getShopId()});

}

function excute_14_r4() {

	var updateResult = db.change("IMPORT", "update_14_r4", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insert_14_r4", {"shopId": getShopId()});

}

function excute_13_m5() {

	var updateResult = db.change("IMPORT", "excute_13_m5_01", {"shopId": getShopId()});
	var updateResult = db.change("IMPORT", "excute_13_m5_02", {"shopId": getShopId()});
	var updateResult = db.change("IMPORT", "excute_13_m5_03", {"shopId": getShopId()});

}

function excute_m1_m5() {

	var updateResult = db.change("IMPORT", "excute_m1_m5_01", {"shopId": getShopId()});
	var updateResult = db.change("IMPORT", "excute_m1_m5_02", {"shopId": getShopId()});

}


function excute_m1_m3() {

	var updateResult = db.change("IMPORT", "excute_m1_m3_01", {"shopId": getShopId()});
	var updateResult = db.change("IMPORT", "excute_m1_m3_02", {"shopId": getShopId()});

}

function excute_m1_m4() {

	var updateResult = db.change("IMPORT", "excute_m1_m4_01", {"shopId": getShopId()});
	var updateResult = db.change("IMPORT", "excute_m1_m4_02", {"shopId": getShopId()});

}

function excute_m2_m4() {

	var updateResult = db.change("IMPORT", "excute_m2_m4", {"shopId": getShopId()});

}


function excute_r1_m3() {

	var updateResult1 = db.change("IMPORT", "excute_r1_m3_01", {"shopId": getShopId()});
	var updateResult2 = db.change("IMPORT", "excute_r1_m3_02", {"shopId": getShopId()});
	var updateResult3 = db.change("IMPORT", "excute_r1_m3_03", {"shopId": getShopId()});
	var updateResult4 = db.change("IMPORT", "excute_r1_m3_04", {"shopId": getShopId()});
	var updateResult5 = db.change("IMPORT", "excute_r1_m3_05", {"shopId": getShopId()});
	var updateResult6 = db.change("IMPORT", "excute_r1_m3_06", {"shopId": getShopId()});
	var updateResult7 = db.change("IMPORT", "excute_r1_m3_07", {"shopId": getShopId()});

	var updateResult8 = db.change("IMPORT", "excute_r1_m3_08", {"shopId": getShopId()});

}

function excute_m1_m2() {

	var updateResult = db.change("IMPORT", "excute_m1_m2_01", {"shopId": getShopId()});
	var updateResult = db.change("IMPORT", "excute_m1_m2_02", {"shopId": getShopId()});
	//var updateResult = db.change("IMPORT", "excute_m1_m2_03", {"shopId": getShopId()});

}

function excute_01_m2() {

	var updateResult = db.change("IMPORT", "excute_01_m2", {"shopId": getShopId()});

}

function excute_03_m2() {

	var updateResult = db.change("IMPORT", "excute_03_m2", {"shopId": getShopId()});

}

function excute_03_m1() {

	var updateResult = db.change("IMPORT", "excute_03_m1", {"shopId": getShopId()});

}

function excute_01_m1() {

	var updateResult01 = db.change("IMPORT", "excute_01_m1_01", {"shopId": getShopId()});
	var updateResult02 = db.change("IMPORT", "excute_01_m1_02", {"shopId": getShopId()});
	var updateResult03 = db.change("IMPORT", "excute_01_m1_03", {"shopId": getShopId()});
	var updateResult04 = db.change("IMPORT", "excute_01_m1_04", {"shopId": getShopId()});
	var updateResult05 = db.change("IMPORT", "excute_01_m1_05", {"shopId": getShopId()});

}


// function excute_15_r3() {

// 	var updateResult = db.change("IMPORT", "update_15_r3", {"shopId": getShopId()});
// 	var insertResult = db.change("IMPORT", "insert_15_r3", {"shopId": getShopId()});

// }


//function excute_14_r2() {
//
//	var updateResult = db.change("IMPORT", "update_14_r2", {"shopId": getShopId()});
//	var insertResult = db.change("IMPORT", "insert_14_r2", {"shopId": getShopId()});
//}


function excute_04_r2() {

	var updateResult = db.change("IMPORT", "update_04_r2", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insert_04_r2", {"shopId": getShopId()});

}

function excute_04_r3() {

	var insertResult = db.change("IMPORT", "insert_04_r3", {"shopId": getShopId()});

}


function excute_02_r1() {

	var updateResult = db.change("IMPORT", "update_02_r1", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insert_02_r1", {"shopId": getShopId()});

}

function excute_11_r1() {

	var updateResult = db.change("IMPORT", "update_11_r1", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insert_11_r1", {"shopId": getShopId()});

}

function excute_12_r1() {

	var updateResult = db.change("IMPORT", "update_12_r1", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insert_12_r1", {"shopId": getShopId()});

}

function excute_02_h1() {

	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var deleteResult = db.change("IMPORT", "deleteFile_02_h1", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insertFile_02_h1", {"shopId": getShopId(), "nowTime": nowTime});

}

function excute_04_h2() {

	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var deleteResult = db.change("IMPORT", "deleteFile_04_h2", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insertFile_04_h2", {"shopId": getShopId(), "nowTime": nowTime});

}

function excute_14_h3() {

	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var deleteResult = db.change("IMPORT", "deleteFile_14_h3", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insertFile_14_h3", {"shopId": getShopId(), "nowTime": nowTime});

}

function excute_15_h4() {

	var today = new Date();
	var nowTime = today.format("yyyy-MM-dd HH:mm:ss");

	var deleteResult = db.change("IMPORT", "deleteFile_15_h4", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insertFile_15_h4", {"shopId": getShopId(), "nowTime": nowTime});

}


function checkUpladFileExsits(foldername){

	var returnValue = false;

	returnValue = returnValue || checkFile(foldername, "01");
	returnValue = returnValue || checkFile(foldername, "02");
	returnValue = returnValue || checkFile(foldername, "03");
	returnValue = returnValue || checkFile(foldername, "04");
	returnValue = returnValue || checkFile(foldername, "05");
	returnValue = returnValue || checkFile(foldername, "06");
	returnValue = returnValue || checkFile(foldername, "07");
	returnValue = returnValue || checkFile(foldername, "08");
	returnValue = returnValue || checkFile(foldername, "09");
	returnValue = returnValue || checkFile(foldername, "10");
	returnValue = returnValue || checkFile(foldername, "11");
	returnValue = returnValue || checkFile(foldername, "12");
	returnValue = returnValue || checkFile(foldername, "13");
	returnValue = returnValue || checkFile(foldername, "14");
	returnValue = returnValue || checkFile(foldername, "15");
	returnValue = returnValue || checkFile(foldername, "16");
	returnValue = returnValue || checkFile(foldername, "17");
	returnValue = returnValue || checkFile(foldername, "18");
	returnValue = returnValue || checkFile(foldername, "19");
	
	return returnValue;

}

function checkFile(foldername, fileno){

	var filefoldername = "";
	eval('filefoldername = FILE' + fileno + '_NAME;');

	var filelist = file.list(foldername + "\\" + filefoldername);

	if(filelist.length == 0){
		return false;
	}else{
		return true;
	}
}


/////////////////////////////////////////////////////////////Excel書き込み/////////////////////////////////////////////////////////////

// Excelファイル書き込み
function writeExcel(selectResult0, selectResult1, exl, exl_flg) {

	var sheet1 = "DELIVERYLIST";
	var sheet2 = "PURCHASELIST";
	var sheet0 = "";

	// exl(1：納品シート出力　2：仕入シート出力)
	if(exl == '1'){
		sheet0 = sheet1;
	}else{
		sheet0 = sheet2;
	}
	// exl_flg(1：納品数量出力　2：仕入数量出力　0：数量出力しない)
	var writeCount = false;
	if(exl_flg == '1' || exl_flg == '2'){
		writeCount = true;
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
		setInfoToExcel(excel, selectResult0[i], new_type, y_from, exl_flg);
		old_type = new_type;
		y_from ++;

	}

	// 暫定データ
	if(selectResult1 != null && selectResult1.length > 0){

		excel.createSheet("暫定データ", sheet0);
		y_from = 3;

		for (var i = 0; i < selectResult1.length; i++) {

			// 设定值
			setInfoToExcel(excel, selectResult1[i], "暫定データ", y_from, exl_flg);
			y_from ++;

		}
		excel.delRow("暫定データ", y_from - 1, 500 - y_from + 1);

	}

	excel.hideSheet(sheet1).hideSheet(sheet2);
	excel.setActiveSheet(firstsheet).save(tempFilePathName);

	return tempFilePathName;
}


function setInfoToExcel(excel, selectRecord, sheetName, from, exl_flg) {

	var COL_A = "A";
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
	var COL_AC = "AC";
	
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

	if(exl_flg == '1'){
		var num = returnNumber(selectRecord["deliveryquantity"]);
	}else if(exl_flg == '2'){
		var num = returnNumber(selectRecord["purchasequantity"]);
	}
	var amountrequested = returnQuantity(selectRecord["amountrequested"]);
	var zt_flg = returnQuantity(selectRecord["zt_flg"]);

	// 暫定フラグ
	setExcelValue(excel, sheetName, COL_A + from, zt_flg);
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
	if(exl_flg == '1' || exl_flg == '2'){
		setExcelValue(excel, sheetName, COL_Z + from, num);
	}
	// 請求金額 
	setExcelValue(excel, sheetName, COL_AC + from, amountrequested);
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


/////////////////////////////////////////////////////////////Excel書き込み/////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////Excel読み取り/////////////////////////////////////////////////////////////

function importProContent(proContent, no, flg) {

	deleteProContent(no, flg);

	// ファイル
	file.saveUploadFiles(getShopId() + "/upload");
	var fa = proContent.split("\\");
	var f = fa[fa.length - 1];

	// Excelファイル
	var exl = new Excel(getShopId() + "/upload/" + f);

	// excelシート名
	var exlarray = exl.getSheetNames();

	// 列名
	var COL_A = "A";//暫定フラグ
	var COL_B = "B";//商品管理番号
	var COL_C = "C";//ASIN番号
	var COL_D = "D";//SKU番号
	var COL_F = "F";//分類１
	var COL_G = "G";//分類２
	var COL_Z = "Z";//仕入数量
	var Y_from = 3;//EXCEL開始行
	var Y_to = 9999;//EXCEL終了行

	for (var i = 0; i < exlarray.length; i++) {

		var sheetName = exlarray[i];

		if (sheetName == "暫定データ") {

			if (flg == 2) {
				// ループ
				for (var y = Y_from; y <= Y_to; y++) {

					// 暫定フラグ
					var zt_flg = exl.getValue(sheetName, COL_A + y);
					// 商品管理番号
					var pno = exl.getValue(sheetName, COL_B + y);
					// 分類１
					var sub1 = exl.getValue(sheetName, COL_F + y);
					// 分類２
					var sub2 = exl.getValue(sheetName, COL_G + y);
					// 仕入数量
					var count = exl.getValue(sheetName, COL_Z + y);

					if ((pno == null || pno == '') &&
						(sub1 == null || sub1 == '') &&
						(sub2 == null || sub2 == '')) {

						break;

					} else {

						if (count != null && count != '' && parseInt(count) > 0) {

							// 新規TRN_仕入明細（暫定データ）
							var selectResult2 = db.change(
								"PURCHASE",
								"insertpurchasedata2",
								{
									purchaseno: no,
									zt_flg: zt_flg,
									pno: pno,
									sub1: sub1,
									sub2: sub2,
									num: parseInt(count),
									shopid: getShopId()
								}
							);
						}

					}
				}
			}
		} else if (sheetName == "DELIVERYLIST") {


		} else if (sheetName == "PURCHASELIST") {


		} else {

			// ループ
			for (var y = Y_from; y <= Y_to; y++) {

				// ASIN番号
				var asin = exl.getValue(sheetName, COL_C + y);
				// SKU番号
				var sku = exl.getValue(sheetName, COL_D + y);
				// 仕入数量
				var count = exl.getValue(sheetName, COL_Z + y);

				if (sku == null || sku == '' || asin == null || asin == '') {

					break;

				} else {

					if (count != null && count != '' && parseInt(count) > 0) {
						if (flg == 1) {

							// 新规TRN_納品明細
							var selectResult2 = db.change(
								"DELIVERY",
								"insertdeliverydata",
								{
									no: no,
									asin: asin,
									sku: sku,
									num: count,
									shopid: getShopId()
								}
							);

						}
						
						if (flg == 2) {

							// 新規TRN_仕入明細（非暫定データ）
							var selectResult2 = db.change(
								"PURCHASE",
								"insertpurchasedata",
								{
									purchaseno: no,
									asin: asin,
									sku: sku,
									num: parseInt(count),
									shopid: getShopId()
								}
							);

						}


					}

				}
			}

		}

	}

}


function deleteProContent(no, flg) {

	if (flg == 1) {
		// 纳品明細削除
		var deleteResult = db.change(
			"DELIVERY",
			"deleteDeliveryContent",
			{
				no: no,
				shopid: getShopId()
			}
		);
	}
	if (flg == 2) {
		// 仕入明細削除
		var deleteResult = db.change(
			"PURCHASE",
			"deletePurchaseContent",
			{
				purchaseno: no,
				shopid: getShopId()
			}
		);
	}
}

function writeEcl(form, colName, colData){
	var  COL_A = 65;
	var exl =  new Excel("common/templates/EXCEL.xlsx");
	exl.createSheet(form,'Sheet1'); 
	var tempFilePathName = file.getTempFileName();
   // 行头
	for(var i=0; i< colName.length; i++){
		if(COL_A + i > 90){
			var COL = 'A'+String.fromCharCode(COL_A + i - 26) + 1;
		}else{
			var COL = String.fromCharCode(COL_A + i) + 1;
		}
		 
	   setExcelValue(exl, form, COL, colName[i]);
	} 
   //  数据
	for(var j=0; j< colData.length; j++){
		
		for(var q=0; q<colData[j].length; q++){
			if(COL_A + q > 90){
				var COL = 'A'+String.fromCharCode(COL_A + q - 26) + (j+2);
			}else{
				var COL = String.fromCharCode(COL_A + q) + (j+2);
			}
	  
		   setExcelValue(exl, form, COL, colData[j][q]);
			
		}
	 
   }
	exl.removeSheet("Sheet1");
	exl.setActiveSheet(form).save(tempFilePathName);
	
	return tempFilePathName;
}
/////////////////////////////////////////////////////////////Excel読み取り/////////////////////////////////////////////////////////////
