var import_importfile = {};
import_importfile.name = "データ導入";//
import_importfile.paramsFormat = {


};
var num = 0;

var SHOP_ID = session.get("SHOP_ID");

var today = null;
var registrationDate = null;

var UPLOAD_FILE_PATH = "UPLOAD_FILE";
var PROCESS_FILE_PATH = "PROCESS_FILE";
var BACKUP_FILE_PATH = "BACKUP_FILE";

var UPLOADBK_FILE_PATH = "UPLOAD_FILE_BK";

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

import_importfile.fire = function (params) {   //

	var ret = new Result();

	if(SHOP_ID == null|| SHOP_ID == ""){
		return ret.navigate("login.jsp");
	}

	today = new Date();
	registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

	bakupUploadFile(today);

	var flg_file01 = importFile("01",	"UTF-8(BOM)",	"\t",	"\n",		null);
	var flg_file02 = importFile("02",	"S-JIS",		"\t",	"\r\n",		null);
	var flg_file03 = importFile("03",	"UTF-8",		"\t",	"\r\n",		null);
	var flg_file04 = importFile("04",	"S-JIS",		",",	"\r\n",		null);
	var flg_file05 = importFile("05",	"S-JIS",		"\t",	"\r\n",		null);
	var flg_file06 = false;
	var flg_file07 = importFile("07",	"UTF-8(BOM)",	",",	"\r\n",		null);
	var flg_file08 = importFile("08",	"UTF-8(BOM)",	",",	"\r\n",		null);
	var flg_file09 = importFile("09",	"UTF-8(BOM)",	",",	"\r\n",		null);
	var flg_file10 = importFile("10",	"UTF-8(BOM)",	",",	"\r\n",		null);

	var flg_file11 = importFile("11",	"UTF-8(BOM)",	",",	"\r\n",		1);
	var flg_file12 = importFile("12",	"UTF-8(BOM)",	",",	"\r\n",		1);

	var flg_file13 = importFile("13",	"S-JIS",		",",	"\r\n",		null);
	var flg_file14 = importFile("14",	"S-JIS",		",",	"\r\n",		null);

	var flg_file15 = importFile("15",	"S-JIS",		",",	"\r\n",		null);

	var flg_file16 = importFile("16",	"S-JIS",		",",	"\r\n",		null);
	var flg_file17 = importFile("17",	"S-JIS",		",",	"\r\n",		null);

	var flg_file18 = importFile("18",	"S-JIS",		",",	"\r\n",		null);

	moveFile("01");
	moveFile("02");
	moveFile("03");
	moveFile("04");
	moveFile("05");
	moveFile("07");
	moveFile("08");
	moveFile("09");
	moveFile("10");
	moveFile("11");
	moveFile("12");
	moveFile("13");
	moveFile("14");
	moveFile("15");
	moveFile("16");
	moveFile("17");
	moveFile("18");

	excute(	flg_file01, flg_file02, flg_file03, flg_file04, flg_file05, flg_file06,
			flg_file07, flg_file08, flg_file09, flg_file10, flg_file11, flg_file12,
			flg_file13, flg_file14, flg_file15, flg_file16, flg_file17, flg_file18);

	return ret.navigate("import.jsp");
};

function bakupUploadFile(){

	var daystr = today.format("yyyyMMdd-HHmmss");
		// ファイル移動
		file.duplicate(
			PROCESS_FILE_PATH,
			UPLOADBK_FILE_PATH + "\\" + daystr
		);
}


function moveFile(fileno){

	var filefoldername = "";
	eval('filefoldername = FILE' + fileno + '_NAME;');

	var filelist = file.list(PROCESS_FILE_PATH + "\\" + filefoldername);

	if(filelist.length == 0){

	}
	if(filelist.length == 1){

		// ファイル取込
		var filename = filelist[0]["name"];
		// ファイル移動
		file.duplicate(
			PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename,
			BACKUP_FILE_PATH + "\\" + filefoldername + "\\" + filename
		);
		
		file.remove(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename);
	}

}

function importFile(fileno, encoding, separator, breakcode, opt){


	var filefoldername = "";
	eval('filefoldername = FILE' + fileno + '_NAME;');

	var filelist = file.list(PROCESS_FILE_PATH + "\\" + filefoldername);

	if(filelist.length == 0){

		return false;

	}
	if(filelist.length == 1){

		// ファイル取込
		var fileinfo = filelist[0];
		var filename = fileinfo["name"];

		///////////////////////////////////////////////////////////////////////////////////

		if(opt != null || breakcode != "\r\n"){
			
			var txt = null;

			if(encoding == "S-JIS"){
				txt = file.readAllLines(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename, "MS932");
			}else{
				txt = file.readAllLines(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename);
			}
			
			if(opt != null){
				txt = txt.substring(opt);
			}
			if(breakcode != "\r\n"){
				txt = txt.replaceAll(breakcode,"\r\n");
			}

			// if(encoding == "S-JIS"){
				file.writeAllLines(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename, txt, "MS932");
			// }else{
			// 	file.writeAllLines(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename, txt);
			// }
			
		}

		var csvReader = null;

		if(encoding == "S-JIS" || opt != null || breakcode != "\r\n"){
			csvReader = new CSVReader(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename, separator, "\"", "MS932");
		}else{
			csvReader = new CSVReader(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename, separator);
		}
		
		// データ全件削除
		var delResult = db.change("IMPORT",	"delAllFile" + fileno,{});

		//データ全件導入
		num = 0;

		eval('csvReader.loopAllLines(import_' + fileno +');');

		///////////////////////////////////////////////////////////////////////////////////

		// 履歴テーブル挿入
		updateImortFileInfo(fileno, filename, num);

		return true;
	
	}
}

function updateImortFileInfo(fileno, filename, recordCount) {

	var saveResult = db.change(
		"IMPORT",
		"updateImportFileInfo",
		{
			"col0": today,
			"col1": recordCount,
			"col2": "取込済み",
			"col3": SHOP_ID,
			"col4": "file" + fileno,
			"col5": filename
		}
	);
}

function makeSQLObj(aryField){

	var obj = {};

	for(var i = 0; i < aryField.length; i ++){
		obj["col"+i] = aryField[i]
	}
	
	obj["col" + (aryField.length)] = SHOP_ID;
	obj["col" + (aryField.length+1)] = registrationDate;
	obj["col" + (aryField.length+2)] = registrationDate;

	return obj;

}



function import_01(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile01",	makeSQLObj(aryField));
		num++;

	}
};
function import_02(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile02",	makeSQLObj(aryField));
		num++;
	}
};
function import_03(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile03",	makeSQLObj(aryField));
		num++;
	}
};
function import_04(aryField, index) {

	if (index > 7) {
		var insertResult = db.change("IMPORT",	"insertFile04",	makeSQLObj(aryField));
		num++;
	}
};
function import_05(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile05",	makeSQLObj(aryField));
		num++;
	}
};
function import_06(aryField, index) {

};
function import_07(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile07",	makeSQLObj(aryField));
		num++;
	}
};
function import_08(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile08",	makeSQLObj(aryField));
		num++;
	}
};
function import_09(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile09",	makeSQLObj(aryField));
		num++;
	}
};
function import_10(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile10",	makeSQLObj(aryField));
		num++;
	}
};
function import_11(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile11",	makeSQLObj(aryField));
		num++;
	}
};
function import_12(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile12",	makeSQLObj(aryField));
		num++;
	}
};
function import_13(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile13",	makeSQLObj(aryField));
		num++;
	}
};
function import_14(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile14",	makeSQLObj(aryField));
		num++;
	}
};
function import_15(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile15",	makeSQLObj(aryField));
		num++;
	}
};
function import_16(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile16",	makeSQLObj(aryField));
		num++;
	}
};
function import_17(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile17",	makeSQLObj(aryField));
		num++;
	}
};
function import_18(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile18",	makeSQLObj(aryField));
		num++;
	}
};