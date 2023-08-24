var import_init = {};
import_init.name = "インポート画面初期表示";
import_init.paramsFormat = {

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

import_init.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	UPLOAD_FILE_PATH = getShopId() + "\\import\\" + "UPLOAD_FILE";
	PROCESS_FILE_PATH = getShopId() + "\\import\\" + "PROCESS_FILE";
	BACKUP_FILE_PATH = getShopId() + "\\import\\" + "BACKUP_FILE";
	UPLOADBK_FILE_PATH = getShopId() + "\\import\\" + "UPLOAD_FILE_BK";

	// 履歴テ―プルから前回導入日時と件数を取得する
	var selectResult1 = db.select("IMPORT",	"selectInitInfo1",	{"shopId": getShopId()}).getArray();

	var script = "";
	// 取得したデータを画面に表示する
	for (var i = 0; i < selectResult1.length; i++) {

		var datatype = selectResult1[i]["データ種別"];
		script = script + "setInit1('" + datatype + "','" + selectResult1[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult1[i]["導入件数"] + "');";
		
	}

	var selectResult2 = db.select("IMPORT",	"selectInitInfo2",	{"shopId": getShopId()}).getArray();
	
	// 取得したデータを画面に表示する
	for (var i = 0; i < selectResult2.length; i++) {

		var datatype = selectResult2[i]["データ種別"];
		script = script + "setInit2('" + datatype + "','" + selectResult2[i]["導入ファイル名"] + "','" + selectResult2[i]["導入日時"].format("yyyy-MM-dd HH:mm:ss") + "','" + selectResult2[i]["導入件数"] + "');";
		
	}

	var r1 = checkUpladFileExsits(UPLOAD_FILE_PATH);
	var r2 = checkUpladFileExsits(PROCESS_FILE_PATH);

	if(r1 == 0 && r2 > 0){

		script = script + "$('#btnImport').attr('disabled',false);"

	}


	// 定义四个表示改变颜色的符号
	var f1 = false;
	var f2 = false;
	var f3 = false;
	var f4 = false;


	f1 = changeColorForDay(FILE01_NAME);
	f2 = changeColorForDay(FILE02_NAME);
	f3 = changeColorForDay(FILE03_NAME);
	f4 = changeColorForMonth(FILE04_NAME);
 
	if(f1)
	ret.eval('$(".tr1").css("background","rgb(230, 101, 101)")')
	if(f2)
	ret.eval('$(".tr2").css("background","rgb(230, 101, 101)")')
	if(f3)
	ret.eval('$(".tr3").css("background","rgb(230, 101, 101)")')
	if(f4)
	ret.eval('$(".tr4").css("background","rgb(230, 101, 101)")')
	

	return ret.eval(script);

};

function changeColorForDay(files){
	// 获取目录下的文件夹
	var filelistUploadbk = file.list(UPLOADBK_FILE_PATH );
			// 获取当天时间
			var datas = new Date();
			// 当天
			var nday = parseInt(new Date(datas.setDate(datas.getDate())).format("yyyyMMdd"));
			// 前一天
			var yday = parseInt(new Date(datas.setDate(datas.getDate() - 1)).format("yyyyMMdd"));

			// 判断有无导入文件存在
			if(filelistUploadbk.length > 0){ 
				// 与当天数字比较，并查询是否已经上传
				for(var e=filelistUploadbk.length-1; e >=0; e--){
					// 将文件名中日期转成数字
					var oldDay = parseInt(filelistUploadbk[e]['name'].substring(0,8));				
					// 今天或昨天已上传
					if(oldDay == nday || oldDay == yday){
						// 判断当前文件是否存在
						var fe = file.list(UPLOADBK_FILE_PATH  + "\\" + filelistUploadbk[e]['name']+ "\\" + files);
						
						if (fe.length >0){
							return  false;
						}
					} 
				}
					
			}
			return true;
	}


	function changeColorForMonth(files){
		// 获取目录下的文件夹
		var filelistUploadbk = file.list(UPLOADBK_FILE_PATH );
				// 获取当天时间
				var datas = new Date();
				// 月
				var newMonth =  parseInt(new Date(datas.setMonth(datas.getMonth() )).format("yyyyMM"));
				var oldMonth =  parseInt(new Date(datas.setMonth(datas.getMonth() -1)).format("yyyyMM"));
	
				// 判断有无导入文件存在
				if(filelistUploadbk.length > 0){ 
				  
					for(var e=filelistUploadbk.length-1; e >=0; e--){
						// 获取年月
						var oldFile = parseInt(filelistUploadbk[e]['name'].substring(0,6));
						// 获取天
						var oldFileForDay = parseInt(filelistUploadbk[e]['name'].substring(6,8));
						 
						// 判断上个月2号或这个月2号有没有上传文件
						if(oldFile == newMonth || oldFile == oldMonth && 0 < oldFileForDay <=2){
							// 判断当前文件是否存在
							var fe = file.list(UPLOADBK_FILE_PATH  + "\\" + filelistUploadbk[e]['name']+ "\\" + files);
							 
							if (fe.length >0){
								return  false; 
							}
						}
					}
						
				}
				return true;
		}