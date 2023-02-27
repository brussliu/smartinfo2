var purchase_upload = {};
purchase_upload.name = "仕入詳細upload";
purchase_upload.paramsFormat = {
	"#purchaseno": null,
	"#file_acces": null,
	"#text_filename": null
};

purchase_upload.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	sessionCheck(ret);
	var purchaseno = params["#purchaseno"];
	// 获取文件
	var acces = params["#file_acces"];
	//  检索max枝番
	var selectResult = db.select(
		"PURCHASE",
		"queryPurchaseData",
		{
			purchaseno: purchaseno,
			shopid: getShopId()

		}
	).getArray();
	selectResult.debug("-------------queryPurchaseData");
	//枝番
 
	var maxno = selectResult[0]['maxno'];
	if(maxno==null||maxno==''){
		maxno=0;
	}
	// 原文件名
	var fa = acces.split("\\");
	var files = fa[fa.length - 1];
	// 切割文件名与后缀
	var s = files.split(".");
	// 拡張子
	var suffix = s[s.length - 1];
	// 自定义文件名
	var customfilename = params["#text_filename"];

	// 資料名称
	var dataname = customfilename.concat('.', suffix);
	// ファイル名称
	var filename = '仕入番号_' + addzero(maxno);

	if (customfilename != null && customfilename != '') {
		// 新规文件
		var selectResult = db.change(
			"PURCHASE",
			"savepurchasefile",
			{
				purchaseno: purchaseno,
				maxno: maxno+1,
				filename: filename,
				dataname: customfilename,
				suffix: suffix,
				shopid: getShopId()
			}
		);

		selectResult.debug('----savepurchasefile---');
	// 创建文件夹
	file.makeDir("purchasefile/" + purchaseno);
	// 保存文件
	file.saveUploadFiles("purchasefile/" + purchaseno);
	// 修改文件名
	var oldfilename = "purchasefile/" + purchaseno + "/" + files;
	var newfilename = filename.concat(".", suffix);
	file.rename(oldfilename, newfilename);
	//查询所有文件
	var selectResult = db.select(
		"PURCHASE",
		"queryPurchaseFile",
		{
			purchaseno: purchaseno,
			shopid: getShopId()
		}
	).getArray();
	selectResult.debug('----queryPurchaseFile---');
	var resultHTML = '<tr>' +
		'<td><img src="img/{suffix}.png"></img></td>' +
		'<td style="width: 400px;" class="a">{dataname}.{suffix}</td>' +
		'<td> <img src="img/delete.png" id="delfile" onclick="delfile(this)"></img></td>' +
		'</tr>'
	ret.runat("#filetable").remove("tr").append(resultHTML).withdata(selectResult);

}
	// 清空文件上传信息
	ret.eval("$('#file_acces').val('');$('#text_filename').val('');");
	// 画面へ結果を返す
	return ret;

};
// 补0
function addzero(val) {
	var num = Number(val) + 1;
	if (num <= 9 && num >= 0) {
		return '00' + num;
	} else if (num > 9 && num <= 99) {
		return '0' + num;
	} else {
		return '' + num;
	}
}