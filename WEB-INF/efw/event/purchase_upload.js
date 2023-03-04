var purchase_upload = {};
purchase_upload.name = "仕入資料アップロード";
purchase_upload.paramsFormat = {

	"#td_no": null,
	"#file_acces": null,
	"#text_filename": null
};

purchase_upload.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var purchaseno = params["#td_no"];

	// 添付ファイル
	var acces = params["#file_acces"];

	// 枝番検索
	var selectResult = db.select(
		"PURCHASE",
		"queryPurchaseData",
		{
			purchaseno: purchaseno,
			shopid: getShopId()

		}
	).getSingle();

	// 枝番
	var subno = selectResult['maxno'];

	if(subno == null || subno == ''){
		subno = 1;
	}else{
		subno = subno + 1;
	}

	// 元の添付ファイル名称
	var fa = acces.split("\\");
	var files = fa[fa.length - 1];

	// 拡張子取得
	var s = files.split(".");
	var suffix = s[s.length - 1];

	// 入力した資料名
	var customfilename = params["#text_filename"];
	//var dataname = customfilename.concat('.', suffix);

	// 物理ファイル名称
	var filename = purchaseno + '_' + padding(subno, 3) + "." + suffix;

	// フォルダ作成
	file.makeDir(getShopId() + "/purchasefile/" + purchaseno);

	// ファイル保存
	file.saveUploadFiles(getShopId() + "/purchasefile/" + purchaseno);

	// ファイル名修正
	var oldfilename = getShopId() + "/purchasefile/" + purchaseno + "/" + files;
	var newfilename = filename;
	file.rename(oldfilename, newfilename);

	// DB登録
	var selectResult = db.change(
		"PURCHASE",
		"savepurchasefile",
		{
			purchaseno: purchaseno,
			subno: subno,
			filename: filename,
			dataname: customfilename,
			suffix: suffix,
			shopid: getShopId()
		}
	);

	// //查询所有文件
	// var selectResult = db.select(
	// 	"PURCHASE",
	// 	"queryPurchaseFile",
	// 	{
	// 		purchaseno: purchaseno,
	// 		shopid: getShopId()
	// 	}
	// ).getArray();
	// selectResult.debug('----queryPurchaseFile---');
	// var resultHTML = '<tr>' +
	// 	'<td><img src="img/{suffix}.png"></img></td>' +
	// 	'<td style="width: 400px;" class="a">{dataname}.{suffix}</td>' +
	// 	'<td> <img src="img/delete.png" id="delfile" onclick="delfile(this)"></img></td>' +
	// 	'</tr>'
	// ret.runat("#filetable").remove("tr").append(resultHTML).withdata(selectResult);

	// 添付ファイル情報をクリアする
	ret.eval("$('#file_acces').val('');$('#text_filename').val('');");

	// 添付ファイル表示
	ret.eval("showFileList('" + purchaseno + "');");

	// 画面へ結果を返す
	return ret;

};

// 补0
// function addzero(val) {

// 	var num = Number(val) + 1;
// 	if (num <= 9 && num >= 0) {
// 		return '00' + num;
// 	} else if (num > 9 && num <= 99) {
// 		return '0' + num;
// 	} else {
// 		return '' + num;
// 	}
// }

function padding(num, length) {
	return (Array(length).join("0") + num).slice(-length);
}