var purchase_showfilelist = {};
purchase_showfilelist.name = "仕入更新画面";
purchase_showfilelist.paramsFormat = {
	"purchaseno": null

};

purchase_showfilelist.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var purchaseno = params["purchaseno"];

	// 添付ファイル検索
	var selectResult = db.select(
		"PURCHASE",
		"queryPurchaseFile",
		{
			purchaseno: purchaseno,
			shopid: getShopId()
		}
	).getArray();

	var resultHTML = "<tr>" +
	"<td><img src='img/{suffix}.png'></img></td>" +
	"<td style='width: 400px;' class='a'>{dataname}.{suffix}</td>" +
	"<td> <img src='img/delete.png' id='delfile' onclick='delfile(\"{filename}\")'></img></td>" +
	"</tr>";
		
	ret.runat("#filetable").remove("tr").append(resultHTML).withdata(selectResult);

	// 画面へ結果を返す
	return ret;

};
