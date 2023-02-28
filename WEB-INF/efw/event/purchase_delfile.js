var purchase_delfile = {};
purchase_delfile.name = "仕入詳細文件削除";
purchase_delfile.paramsFormat = {
	"dataname": null,
	"purchaseno": null,

};

purchase_delfile.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	sessionCheck(ret);
	// 资源名
	var dataname = params["dataname"];
	// 仕入NO
	var purchaseno = params["purchaseno"];
	// 检索文件名
	var selectResult = db.select(
		"PURCHASE",
		"queryPurchaseFileForDataname",
		{
			dataname: dataname,
			purchaseno: purchaseno,
			shopid: getShopId()
		}
	).getArray();
	selectResult.debug("-------------queryPurchaseFileFordataname");
	
	// 删除本地文件
	var files = "Smart-Bear/purchasefile/" + purchaseno + "/" + selectResult[0]['files'] + "." + selectResult[0]['suffix'];
	file.remove(files);


	//  删除数据库文件
	var selectResult = db.change(
		"PURCHASE",
		"deletePurchaseFile",
		{
			shopid: getShopId(),
			dataname: dataname,
			purchaseno: purchaseno
		}
	)

	selectResult.debug("-------------deletePurchaseFile")


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

	// 画面へ結果を返す
	return ret;

};
