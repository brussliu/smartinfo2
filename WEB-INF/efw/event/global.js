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
				flg_file13, flg_file14, flg_file15, flg_file16, flg_file17, flg_file18) {
					
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

					// --------------------------------↑↑↑確認済↑↑↑--------------------------------

					// --------------------------------↓↓↓実装中↓↓↓--------------------------------

					// excute_m1_m5();
					// excute_13_m5();


							
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

function excute_m1_m5() {

	var updateResult = db.change("IMPORT", "excute_m1_m5", {"shopId": getShopId()});

}

function excute_13_m5() {

	var updateResult = db.change("IMPORT", "excute_13_m5", {"shopId": getShopId()});

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


function excute_15_r3() {

	var updateResult = db.change("IMPORT", "update_15_r3", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insert_15_r3", {"shopId": getShopId()});

}

function excute_14_r2() {

	var updateResult = db.change("IMPORT", "update_14_r2", {"shopId": getShopId()});
	var insertResult = db.change("IMPORT", "insert_14_r2", {"shopId": getShopId()});
}


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