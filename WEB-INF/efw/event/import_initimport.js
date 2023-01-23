var import_initimport = {};
import_initimport.name = "インポート画面初期表示";
import_initimport.paramsFormat = {

};
var SHOP_ID = session.get("SHOP_ID");
var UPLOAD_FILE_PATH = "UPLOAD_FILE";
var PROCESS_FILE_PATH = "PROCESS_FILE";
var BACKUP_FILE_PATH = "BACKUP_FILE";

var FILE01_NAME = "01.すべての出品商品のレポート (カスタム)";
var FILE02_NAME = "02.全注文レポート";
var FILE03_NAME = "03.FBA在庫レポート";
var FILE04_NAME = "04.ペイメントレポート";
var FILE05_NAME = "05.FBA未出荷レポート";
var FILE07_NAME = "07.日付別_売上およびトラフィック";
var FILE08_NAME = "08.日付別_パフォーマンス";
var FILE09_NAME = "09.日付別_詳細ページ 売上トラフィック";
var FILE10_NAME = "10.ASIN別_詳細ページ 売上トラフィック";
var FILE11_NAME = "11.FBA在庫出荷レポート";
var FILE12_NAME = "12.出荷レポート";
var FILE13_NAME = "13.手数料見積り額レポート";
var FILE14_NAME = "14.在庫保管手数料レポート";
var FILE15_NAME = "15.長期在庫保管手数料請求額レポート";
var FILE16_NAME = "16.返品レポート";
var FILE17_NAME = "17.返送推奨レポート";
var FILE18_NAME = "18.返送所有権の放棄依頼の詳細レポート";

import_initimport.fire = function (params) {

	var ret = new Result();

	if(SHOP_ID == null|| SHOP_ID == ""){
		return ret.navigate("login.jsp");
	}

	// 履歴テ―プルから前回導入日時と件数を取得する
	var selectResult1 = db.select("IMPORT",	"selectInitInfo1",	{"shopId": SHOP_ID}).getArray();

	var script = "";
	// 取得したデータを画面に表示する
	for (var i = 0; i < selectResult1.length; i++) {

		var datatype = selectResult1[i]["データ種別"];
		script = script + "setInit1('" + datatype + "','" + selectResult1[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult1[i]["導入件数"] + "');";
		
	}

	var selectResult2 = db.select("IMPORT",	"selectInitInfo2",	{"shopId": SHOP_ID}).getArray();

	// 取得したデータを画面に表示する
	for (var i = 0; i < selectResult2.length; i++) {

		var datatype = selectResult2[i]["データ種別"];
		script = script + "setInit2('" + datatype + "','" + selectResult2[i]["導入ファイル名"] + "','" + selectResult2[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult2[i]["導入件数"] + "');";
		
	}

	var r1 = checkUpladFileCount5();
	var r2 = checkUpladFileCount6();

	if(r1 == 0 && r2 > 0){

		script = script + "$('#btnImport').attr('disabled',false);"

	}

	return ret.eval(script);
};

function checkUpladFileCount5(){

	var result1 = 0;

	result1 = result1 + checkFile5("01");
	result1 = result1 + checkFile5("02");
	result1 = result1 + checkFile5("03");
	result1 = result1 + checkFile5("04");
	result1 = result1 + checkFile5("05");
	result1 = result1 + checkFile5("07");
	result1 = result1 + checkFile5("08");
	result1 = result1 + checkFile5("09");
	result1 = result1 + checkFile5("10");
	result1 = result1 + checkFile5("11");
	result1 = result1 + checkFile5("12");
	result1 = result1 + checkFile5("13");
	result1 = result1 + checkFile5("14");
	result1 = result1 + checkFile5("15");
	result1 = result1 + checkFile5("16");
	result1 = result1 + checkFile5("17");
	result1 = result1 + checkFile5("18");

	return result1;

}

function checkFile5(fileno){

	var filefoldername = "";
	eval('filefoldername = FILE' + fileno + '_NAME;');

	var filelist = file.list(UPLOAD_FILE_PATH + "\\" + filefoldername);

	if(filelist.length == 0){

		return 0;
	}else{
		return 1;
	}
}

function checkUpladFileCount6(){

	var result2 = 0;
	result2 = result2 + checkFile6("01");
	result2 = result2 + checkFile6("02");
	result2 = result2 + checkFile6("03");
	result2 = result2 + checkFile6("04");
	result2 = result2 + checkFile6("05");
	result2 = result2 + checkFile6("07");
	result2 = result2 + checkFile6("08");
	result2 = result2 + checkFile6("09");
	result2 = result2 + checkFile6("10");
	result2 = result2 + checkFile6("11");
	result2 = result2 + checkFile6("12");
	result2 = result2 + checkFile6("13");
	result2 = result2 + checkFile6("14");
	result2 = result2 + checkFile6("15");
	result2 = result2 + checkFile6("16");
	result2 = result2 + checkFile6("17");
	result2 = result2 + checkFile6("18");

	return result2;

}

function checkFile6(fileno){

	var filefoldername = "";
	eval('filefoldername = FILE' + fileno + '_NAME;');

	var filelist = file.list(PROCESS_FILE_PATH + "\\" + filefoldername);

	if(filelist.length == 0){

		return 0;
	}else{
		return 1;
	}
}