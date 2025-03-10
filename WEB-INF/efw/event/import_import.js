var import_import = {};
import_import.name = "データ導入";//
import_import.paramsFormat = {
	"#opt_yearMonth":null

};
var num = 0;
var yearMonths = '';
var today = null;
var registrationDate = null;

var UPLOAD_FILE_PATH = getShopId() + "\\import\\" + "UPLOAD_FILE";
var PROCESS_FILE_PATH = getShopId() + "\\import\\" + "PROCESS_FILE";
var BACKUP_FILE_PATH = getShopId() + "\\import\\" + "BACKUP_FILE";
var UPLOADBK_FILE_PATH = getShopId() + "\\import\\" + "UPLOAD_FILE_BK";

var FILE01_NAME = "01.すべての出品商品のレポート (カスタム)";
var FILE02_NAME = "02.全注文レポート";
var FILE03_NAME = "03.FBA在庫レポート";
var FILE04_NAME = "04.ペイメントレポート";
var FILE05_NAME = "05.FBA未出荷レポート";
var FILE06_NAME = "06.Qoo10未出荷レポート";
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
var FILE19_NAME = "19.広告明細費用レポート";

import_import.fire = function (params) {   //

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};
	yearMonths = params['#opt_yearMonth'];
	 
	UPLOAD_FILE_PATH = getShopId() + "\\import\\" + "UPLOAD_FILE";
	PROCESS_FILE_PATH = getShopId() + "\\import\\" + "PROCESS_FILE";
	BACKUP_FILE_PATH = getShopId() + "\\import\\" + "BACKUP_FILE";
	UPLOADBK_FILE_PATH = getShopId() + "\\import\\" + "UPLOAD_FILE_BK";

	today = new Date();
	registrationDate = today.format("yyyy-MM-dd HH:mm:ss");

	bakupUploadFile(today);

	var flg_file01 = importFile("01",	"UTF-8(BOM)",	"\t",	"\n",		null);
	var flg_file02 = importFile("02",	"S-JIS",		"\t",	"\r\n",		null);
	var flg_file03 = importFile("03",	"UTF-8",		"\t",	"\r\n",		null);
	var flg_file04 = importFile("04",	"UTF-8",		",",	"\n",		null);
	var flg_file05 = importFile("05",	"S-JIS",		"\t",	"\r\n",		null);
	var flg_file06 = importFile06();
	var flg_file07 = importFile("07",	"UTF-8(BOM)",	",",	"\r\n",		null);
	var flg_file08 = importFile("08",	"UTF-8(BOM)",	",",	"\r\n",		null);
	var flg_file09 = importFile("09",	"UTF-8(BOM)",	",",	"\r\n",		null);
	var flg_file10 = importFile("10",	"UTF-8(BOM)",	",",	"\r\n",		null);

	var flg_file11 = importFile("11",	"UTF-8(BOM)",	",",	"\r\n",		1);
	var flg_file12 = importFile("12",	"UTF-8(BOM)",	",",	"\r\n",		1);

	var flg_file13 = importFile("13",	"S-JIS",		",",	"\n",		null);
	var flg_file14 = importFile("14",	"UTF-8(BOM)",	",",	"\n",		1);

	var flg_file15 = importFile("15",	"S-JIS",		",",	"\n",		null);

	var flg_file16 = importFile("16",	"S-JIS",		",",	"\r\n",		null);
	var flg_file17 = importFile("17",	"S-JIS",		",",	"\r\n",		null);

	var flg_file18 = importFile("18",	"S-JIS",		",",	"\r\n",		null);

	var flg_file19 = importFile("19",	"UTF-8(BOM)",		",",	"\r\n",		1);


	moveFile("01");
	moveFile("02");
	moveFile("03");
	moveFile("04");
	moveFile("05");
	moveFile("06");
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
	moveFile("19");

	excute(	flg_file01, flg_file02, flg_file03, flg_file04, flg_file05, flg_file06,
			flg_file07, flg_file08, flg_file09, flg_file10, flg_file11, flg_file12,
			flg_file13, flg_file14, flg_file15, flg_file16, flg_file17, flg_file18, flg_file19);

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

	if(fileno == "06"){

		if(filelist.length == 2){
	
			// ファイル取込
			var filename1 = filelist[0]["name"];
			var filename2 = filelist[1]["name"];
			// ファイル移動
			file.duplicate(
				PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename1,
				BACKUP_FILE_PATH + "\\" + filefoldername + "\\" + filename1
			);
			file.duplicate(
				PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename2,
				BACKUP_FILE_PATH + "\\" + filefoldername + "\\" + filename2
			);

			file.remove(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename1);
			file.remove(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename2);
		}

	}else{

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



}

function getFileExe(filename){

	var array = filename.split(".");
	
	if(array.length < 2){

		return "";

	}else{

		return array[array.length-1];

	}

}

function importFile06(){

	var filefoldername = "";
	eval('filefoldername = FILE06_NAME;');

	var filelist = file.list(PROCESS_FILE_PATH + "\\" + filefoldername);

	if(filelist.length == 2){

		// ファイル取込
		var fileinfo1 = filelist[0];
		var fileinfo2 = filelist[1];

		var filename1 = fileinfo1["name"];
		var filename2 = fileinfo2["name"];

		var filename_exe1 = getFileExe(filename1);
		var filename_exe2 = getFileExe(filename2);

		var csvFile = "";
		var htmlFile = "";

		if(filename_exe1 == "csv"){
			csvFile = filename1;
			htmlFile = filename2;
		}
		if(filename_exe2 == "csv"){
			csvFile = filename2;
			htmlFile = filename1;
		}
		
		////////////////////////////////////////////////////////////////////////////////////////////////////////

		//var txt = file.readAllLines(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + csvFile, "MS932");
		
		//txt = txt.substring(1);

		//file.writeAllLines(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + csvFile, txt, "MS932");

		var csvReader = new CSVReader(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + csvFile, ",", "\"", "MS932");
		// データ全件削除
		var delResult = db.change("IMPORT",	"delAllFile06",{"shopId": getShopId()});

		num = 0;
		eval('csvReader.loopAllLines(import_06);');

		// 履歴テーブル挿入
		updateImortFileInfo("06_1", csvFile, num);

		////////////////////////////////////////////////////////////////////////////////////////////////////////


		var txt = file.readAllLines(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + htmlFile).split("発注書発行日 : ");
		num = 0;
		for(var i = 1;i < txt.length;i ++){

				var tablehtml = txt[i].substring(txt[i].indexOf("<table"), txt[i].indexOf("</table>")+8);

				var orderno_start = "注文番号</td><td class='content'>";
				var orderno_end = "</td>";
				var orderno = getContent(tablehtml, orderno_start, orderno_end);

				var buyername_start = "購入者名</td><td class='content'>";
				var buyername_end = "</td>";
				var buyername = getContent(tablehtml, buyername_start, buyername_end);

				var buyertel_start = "購入者電話番号</td><td class='content'>";
				var buyertel_end = "</td>";
				var buyertel = getContent(tablehtml, buyertel_start, buyertel_end);

				var recievename_start = "受取人名</td><td class='content'>";
				var recievename_end = "</td>";
				var recievename = getContent(tablehtml, recievename_start, recievename_end);

				var recievetel_start = "受取人電話番号</td><td class='content'>";
				var recievetel_end = "</td>";
				var recievetel = getContent(tablehtml, recievetel_start, recievetel_end);

				var postno_start = "郵便番号</td><td class='content'>";
				var postno_end = "</td>";
				var postno = getContent(tablehtml, postno_start, postno_end);

				var address_start = "住所</td><td style='width:760px;' colspan='3'>";
				var address_end = "</td>";
				var address = getContent(tablehtml, address_start, address_end);

				var updateResult = db.change(
					"IMPORT",
					"updateFile06",
					{
						"orderno":orderno,
						"col0":buyername,
						"col1":recievename,
						"col2":postno,
						"col3":address,
						"col4":recievetel,
						"col5":recievetel,
						"col6":buyertel,
						"shopid":getShopId()
					}
				);
				num = num + 1;
		}

		// 履歴テーブル挿入
		updateImortFileInfo("06_2", htmlFile, num);

		////////////////////////////////////////////////////////////////////////////////////////////////////////

		return true;

	}

	return false;

}

function getContent(tablehtml,start_txt,end_txt){

	var start_index = tablehtml.indexOf(start_txt) + start_txt.length;

	var txt_temp = tablehtml.substring(start_index);

	var end_index = start_index + txt_temp.indexOf(end_txt);

	var content = tablehtml.substring(start_index,   end_index);

	return content;

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
		var delResult = db.change("IMPORT",	"delAllFile" + fileno, {"shopId": getShopId()});

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
			"col2": getShopId(),
			"col3": "file" + fileno,
			"col4": filename
		}
	);
}

function makeSQLObj(aryField){

	var obj = {};

	for(var i = 0; i < aryField.length; i ++){
		obj["col"+i] = aryField[i]
	}
	
	obj["col" + (aryField.length)] = getShopId();
	obj["col" + (aryField.length+1)] = registrationDate;
	obj["col" + (aryField.length+2)] = registrationDate;

	return obj;

}

function makeSQLObj19(aryField ){ 
	var obj = {};
	obj["yearMonths"] = yearMonths;
	for(var i = 0; i < aryField.length; i ++){
		obj["col"+i] = aryField[i]
	}
	
	obj["col" + (aryField.length)] = getShopId();
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

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile06",	makeSQLObj(aryField));
		num++;
	}
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
function import_19(aryField, index) {

	if (index > 0) {
		var insertResult = db.change("IMPORT",	"insertFile19",	makeSQLObj19(aryField));
		num++;
	}
};