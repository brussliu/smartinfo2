var import_reorganizefile = {};
import_reorganizefile.name = "ファイル識別";//
import_reorganizefile.paramsFormat = {
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


import_reorganizefile.fire = function (params) {   //

	var ret = new Result();

	if(SHOP_ID == null|| SHOP_ID == ""){
		return ret.navigate("login.jsp");
	}

	processFile("01");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("02");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("03");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("04");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("05");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("07");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("08");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("09");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("10");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("11");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("12");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("13");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("14");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("15");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("16");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("17");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}
	processFile("18");	// if(status != ""){	return ret.eval("alert('" + status + "')");	}

	return ret.navigate("import.jsp");
};

function processFile(fileno){

	var filefoldername = "";
	eval('filefoldername = FILE' + fileno + '_NAME;');

	var filelist1 = file.list(UPLOAD_FILE_PATH + "\\" + filefoldername);
	var filelist2 = file.list(PROCESS_FILE_PATH + "\\" + filefoldername);

	if(filelist1.length > 0){

		var fileinfo = filelist1[0];

		var filename_old = fileinfo["name"];
		var filename_old_exe = getFileExe(fileinfo["name"]);

		var recordCount = getFileRecordCount(UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + filename_old);

		var today = new Date();
		var nowTime = today.format("yyyyMMdd_HHmmss");
		var filename_new = "file" + fileno + "_" + nowTime + "."+ filename_old_exe;

		if(filelist2 == 0){

			file.duplicate(
				UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + filename_old,
				PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename_new
			);
	
			file.remove(UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + filename_old);
		}else{

			file.remove(PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename_old);

			file.duplicate(
				UPLOAD_FILE_PATH + "\\" + filefoldername + "\\" + filename_old,
				PROCESS_FILE_PATH + "\\" + filefoldername + "\\" + filename_new
			);

			deleteImortFileInfo(fileno);

		}

		// 履歴テーブル挿入
		saveImortFileInfo(fileno, filename_new, today, recordCount);
	
	}

}

function deleteImortFileInfo(fileno) {

	var saveResult = db.change(
		"IMPORT",
		"deleteImportFileInfo",
		{
			"col0": SHOP_ID,
			"col1": "file" + fileno,
			"col2": "識別済み"
		}
	);
}

function saveImortFileInfo(fileno, filename_new, today, recordCount) {

	var saveResult = db.change(
		"IMPORT",
		"insertImportFileInfo",
		{
			"col0": SHOP_ID,
			"col1": "file" + fileno,
			"col2": filename_new,
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