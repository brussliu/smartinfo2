var import_checkfile = {};
import_checkfile.name = "ファイル識別";//
import_checkfile.paramsFormat = {
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

var HEADER01_LENGTH = 341;
var HEADER02_LENGTH = 393;
var HEADER03_LENGTH = 98;
var HEADER04_LENGTH = 56;
var HEADER05_LENGTH = 1314;
var HEADER07_LENGTH = 201;
var HEADER08_LENGTH = 139;
var HEADER09_LENGTH = 215;
var HEADER10_LENGTH = 284;
var HEADER11_LENGTH = 444;
var HEADER12_LENGTH = 141;
var HEADER13_LENGTH = 508;
var HEADER14_LENGTH = 458;
var HEADER15_LENGTH = 313;
var HEADER16_LENGTH = 107;
var HEADER17_LENGTH = 315;
var HEADER18_LENGTH = 183;

import_checkfile.fire = function (params) {   //

	var ret = new Result();

	if(SHOP_ID == null|| SHOP_ID == ""){
		return ret.navigate("login.jsp");
	}
	
	// １，ファイル数量判定
	// uploadフォルダにファイルが存在しない場合、エラー提示
	var checkResult1 = checkUpladFileCount1();
	if(checkResult1 == 0){
		return ret.eval("alert('ファイルが格納していません！')");
	}

	// ２，ファイル数量判定
	// uploadフォルダに複数ファイルが存在する場合、エラー提示
	var checkResult2 = checkUpladFileCount2();
	if(checkResult2 != ""){
		return ret.eval("alert('"+ checkResult2 +"')");
	}

	// ３，ファイル正確性をチェックする
	// uploadフォルダに複数ファイルが存在する場合、エラー提示
	var checkResult3 = checkUpladFileFormat();
	if(checkResult3 != ""){
		return ret.eval("alert('"+ checkResult3 +"')");
		// return ret.eval("alert('aaaaaaaaaa')");
	}

	// ４，process、uploadフォルダ両方ファイルが存在する場合、警告提示
	var checkResult4 = checkUpladFileCount4();
	if(checkResult4 > 0){
		
		return ret.eval("doReorganizeConfirm(1);");
	}

	return ret.eval("doReorganizeConfirm(0)");
};

function checkUpladFileCount1(){

	var result = 0;
	result = result + checkFile1("01");
	result = result + checkFile1("02");
	result = result + checkFile1("03");
	result = result + checkFile1("04");
	result = result + checkFile1("05");
	result = result + checkFile1("07");
	result = result + checkFile1("08");
	result = result + checkFile1("09");
	result = result + checkFile1("10");
	result = result + checkFile1("11");
	result = result + checkFile1("12");
	result = result + checkFile1("13");
	result = result + checkFile1("14");
	result = result + checkFile1("15");
	result = result + checkFile1("16");
	result = result + checkFile1("17");
	result = result + checkFile1("18");

	return result;

}

function checkFile1(fileno){

	var filefoldername = "";
	eval('filefoldername = FILE' + fileno + '_NAME;');

	var filelist = file.list(UPLOAD_FILE_PATH + "\\" + filefoldername);

	if(filelist.length == 0){

		return 0;
	}else{
		return 1;
	}
}

function checkUpladFileCount2(){

	var errorFile = "";
	var result = "";

	result = checkFile2("01");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("02");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("03");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("04");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("05");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("07");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("08");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("09");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("10");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("11");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("12");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("13");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("14");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("15");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("16");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("17");
	errorFile = makeMessage(errorFile, result);

	result = checkFile2("18");
	errorFile = makeMessage(errorFile, result);

	if(errorFile != ""){
		errorFile = "ファイル" + errorFile + "が複数指定しています。ご確認ください。";
	}

	return errorFile;

}

function makeMessage(message, appendmessage){

	if(message == ""){
		message = message + appendmessage;

	}else{
		if(appendmessage != ""){
			message = message + "、" + appendmessage;
		}
	}
	return message;

}

function checkFile2(fileno){

	var filefoldername = "";
	eval('filefoldername = FILE' + fileno + '_NAME;');

	var filelist = file.list(UPLOAD_FILE_PATH + "\\" + filefoldername);

	if(filelist.length > 1){

		return fileno;
	}else{
		return "";
	}

}

function checkUpladFileFormat(){

	var errorFile = "";
	var result = "";

	result = checkFileFormat("01");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("02");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("03");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("04");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("05");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("07");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("08");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("09");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("10");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("11");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("12");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("13");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("14");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("15");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("16");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("17");
	errorFile = makeMessage(errorFile, result);
	result = checkFileFormat("18");
	errorFile = makeMessage(errorFile, result);

	if(errorFile != ""){
		errorFile = "ファイル" + errorFile + "が正しくありません。ご確認ください。";
	}

	return errorFile;


}

function checkFileFormat(fileno){

	var filefoldername = "";
	eval('filefoldername = FILE' + fileno + '_NAME;');

	var filelist = file.list(UPLOAD_FILE_PATH + "\\" + filefoldername);

	if(filelist.length > 0){

		var fileinfo = filelist[0];

		var filename = fileinfo["name"];

		return checkFileTitleSize(fileno, UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + filename);
	}else{
		return "";
	}
}



function checkFileTitleSize(fileno, filenamewithpath){

	var txt = file.readAllLines(filenamewithpath);

	var filearray1 = txt.split("\r");
	var filearray2 = txt.split("\n");
	var count1 = filearray1.length;
	var count2 = filearray2.length;

	var header = "";

	if(count1 == count2){
		header = txt.split("\r\n")[0];
	}
	if(count1 > count2){
		header = txt.split("\r")[0];
	}
	if(count1 < count2){
		header = txt.split("\n")[0];
	}

	var headerlength = 0;
	eval('headerlength = HEADER' + fileno + '_LENGTH;');

	if(header.length != headerlength){

		return fileno;
	}else{
		return "";
	}

}



function checkUpladFileCount4(){

	var result = 0;
	result = result + checkFile4("01");
	result = result + checkFile4("02");
	result = result + checkFile4("03");
	result = result + checkFile4("04");
	result = result + checkFile4("05");
	result = result + checkFile4("07");
	result = result + checkFile4("08");
	result = result + checkFile4("09");
	result = result + checkFile4("10");
	result = result + checkFile4("11");
	result = result + checkFile4("12");
	result = result + checkFile4("13");
	result = result + checkFile4("14");
	result = result + checkFile4("15");
	result = result + checkFile4("16");
	result = result + checkFile4("17");
	result = result + checkFile4("18");

	return result;

}

function checkFile4(fileno){

	var filefoldername = "";
	eval('filefoldername = FILE' + fileno + '_NAME;');

	var filelist1 = file.list(UPLOAD_FILE_PATH + "\\" + filefoldername);

	var filelist2 = file.list(PROCESS_FILE_PATH + "\\" + filefoldername);

	if(filelist1.length > 0 && filelist2.length > 0){

		return 1;
	}
	return 0;
}