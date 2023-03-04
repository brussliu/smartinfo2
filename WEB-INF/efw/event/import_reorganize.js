var import_reorganize = {};
import_reorganize.name = "ファイル識別";//
import_reorganize.paramsFormat = {
};

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


import_reorganize.fire = function (params) {   //

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	UPLOAD_FILE_PATH = getShopId() + "\\import\\" + "UPLOAD_FILE";
	PROCESS_FILE_PATH = getShopId() + "\\import\\" + "PROCESS_FILE";
	BACKUP_FILE_PATH = getShopId() + "\\import\\" + "BACKUP_FILE";
	UPLOADBK_FILE_PATH = getShopId() + "\\import\\" + "UPLOAD_FILE_BK";

	processFile("01", -2);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("02", -2);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("03", -1);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("04", -9);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("05", -2);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("06", -2);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("07", -1);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("08", -1);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("09", -1);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("10", -1);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("11", -2);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("12", -2);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("13", -2);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("14", -2);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("15", -2);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("16", -2);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("17", -2);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("18", -2);	// if(status != ""){	return ret.eval("alert('" + status + "')");	}

	return ret.navigate("import.jsp");
};

function processFile(fileno, countKS){

	var filefoldername = "";
	eval('filefoldername = FILE' + fileno + '_NAME;');

	var filelistUpload = file.list(UPLOAD_FILE_PATH + "\\" + filefoldername);
	var filelistProcess = file.list(PROCESS_FILE_PATH + "\\" + filefoldername);

	if(fileno == "06"){

		if(filelistUpload.length > 0){

			var fileinfo1 = filelistUpload[0];
			var fileinfo2 = filelistUpload[1];
	
			var filename_old1 = fileinfo1["name"];
			var filename_old_exe1 = getFileExe(fileinfo1["name"]);

			var filename_old2 = fileinfo2["name"];
			var filename_old_exe2 = getFileExe(fileinfo2["name"]);

			var csvFile = "";
			var htmlFile = "";

			if(filename_old_exe1 == "csv"){
				csvFile = filename_old1;
				htmlFile = filename_old2;
			}
			if(filename_old_exe2 == "csv"){
				csvFile = filename_old2;
				htmlFile = filename_old1;
			}


			var recordCount = getFileRecordCount(UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + csvFile) + countKS;
	
			var today = new Date();
			var nowTime = today.format("yyyyMMdd_HHmmss");
			var filename_new_csv  = "file" + fileno + "_" + nowTime + ".csv";
			var filename_new_html = "file" + fileno + "_" + nowTime + ".html";

			if(filelistProcess.length == 0){
	
				file.duplicate(
					UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + csvFile,
					PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename_new_csv
				);
				file.duplicate(
					UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + htmlFile,
					PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename_new_html
				);

				file.remove(UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + csvFile);
				file.remove(UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + htmlFile);
	
				fileno.debug("ファイル"+fileno+"はProcessingに移動しました！");

			}else{
	
				var fileinfoProcess1 = filelistProcess[0];
				var fileinfoProcess2 = filelistProcess[1];

				var filenameProcess1 = fileinfoProcess1["name"];
				var filenameProcess2 = fileinfoProcess2["name"];
	
				file.remove(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filenameProcess1);
				file.remove(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filenameProcess2);
	
				file.duplicate(
					UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + csvFile,
					PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename_new_csv
				);
				file.duplicate(
					UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + htmlFile,
					PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename_new_html
				);
	
				file.remove(UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + csvFile);
				file.remove(UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + htmlFile);
				
				deleteImortFileInfo(fileno+"_1");
				deleteImortFileInfo(fileno+"_2");
	
				fileno.debug("Processingに存在したものを削除して、新しいファイル"+fileno+"を、再度Processingに移動しました！");
	
			}

			// 履歴テーブル挿入
			saveImortFileInfo(fileno+"_1", csvFile, today, recordCount);
			saveImortFileInfo(fileno+"_2", htmlFile, today, recordCount);

		}

	}else{

		if(filelistUpload.length > 0){

			var fileinfo = filelistUpload[0];
	
			var filename_old = fileinfo["name"];
			var filename_old_exe = getFileExe(fileinfo["name"]);
	
			var recordCount = getFileRecordCount(UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + filename_old) + countKS;
	
			var today = new Date();
			var nowTime = today.format("yyyyMMdd_HHmmss");
			var filename_new = "file" + fileno + "_" + nowTime + "."+ filename_old_exe;
	
			if(filelistProcess.length == 0){
	
				file.duplicate(
					UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + filename_old,
					PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename_new
				);
		
				file.remove(UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + filename_old);
	
				fileno.debug("ファイル"+fileno+"はProcessingに移動しました！");
			}else{
	
				var fileinfo2 = filelistProcess[0];
				var filename2_old = fileinfo2["name"];
	
				file.remove(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename2_old);
	
				file.duplicate(
					UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + filename_old,
					PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename_new
				);
	
				file.remove(UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + filename_old);
				
				deleteImortFileInfo(fileno);
	
				fileno.debug("Processingに存在したものを削除して、新しいファイル"+fileno+"を、再度Processingに移動しました！");
	
			}
	
			// 履歴テーブル挿入
			saveImortFileInfo(fileno, filename_old, today, recordCount);
		
		}
	}



}

function deleteImortFileInfo(fileno) {

	var saveResult = db.change(
		"IMPORT",
		"deleteImportFileInfo",
		{
			"col0": getShopId(),
			"col1": "file" + fileno,
			"col2": "識別済み"
		}
	);
}

function saveImortFileInfo(fileno, filename_old, today, recordCount) {

	var saveResult = db.change(
		"IMPORT",
		"insertImportFileInfo",
		{
			"col0": getShopId(),
			"col1": "file" + fileno,
			"col2": filename_old,
			"col3": today,
			"col4": recordCount,
			"col5": "識別済み"
		}
	);
}


function getFileExe(filename){

	var array = filename.split(".");
	
	if(array.length < 2){

		return "";

	}else{

		return array[array.length-1];

	}

}

function getFileRecordCount(filenamewithpath){

	var txt = file.readAllLines(filenamewithpath);

	var filearray1 = txt.split("\r");
	var filearray2 = txt.split("\n");
	var count1 = filearray1.length;
	var count2 = filearray2.length;

	if(count1 == count2){
		return count1;
	}
	if(count1 > count2){
		return count1;
	}
	if(count1 < count2){
		return count2;
	}


}