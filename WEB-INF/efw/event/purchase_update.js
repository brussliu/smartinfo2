var purchase_update = {};
purchase_update.name = "仕入更新画面";
purchase_update.paramsFormat = {
	"purchaseno": null

};

purchase_update.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var purchaseno = params["purchaseno"];

	//  检索
	var selectResultObj = db.select(
		"PURCHASE",
		"seachpurchaseforno",
		{
			purchaseno:purchaseno,
			shopid: getShopId()

		}
	).getSingle();

	ret.runat("#purchase_detail_inputdialog").withdata(
		{
			// 仕入NO
			"#td_no":selectResultObj["purchaseno"],
			// 仕入名称
			"#text_purchase":selectResultObj["purchasename"],
			// 発送方式
			"#opt_ship":selectResultObj["sendway"],
			// 登録日
			"#date_entrydate":selectResultObj["logindate"] == null ? "" : selectResultObj["logindate"].format('yyyy/MM/dd'),
			// 発送日①
			"#date_forwarddate1":selectResultObj["senddate1"] == null ? "" : selectResultObj["senddate1"].format('yyyy/MM/dd'),
			// 発送日②
			"#date_forwarddate2":selectResultObj["senddate2"] == null ? "" : selectResultObj["senddate2"].format('yyyy/MM/dd'),
			// 完了日
			"#date_completiondate":selectResultObj["completiondate"] == null ? "" : selectResultObj["completiondate"].format('yyyy/MM/dd'),
			// 商品費用
			"#number_productamountRMB":selectResultObj["productamountrmb"],
			// 商品費用（円）
			"#number_productamountRY":selectResultObj["productamountry"]+"円",
			// 物流費用
			"#number_shipamountRMB":selectResultObj["shipamountrmb"],
			// 物流費用（円）
			"#number_shipamountRY":selectResultObj["shipamountry"]+"円",
			// 税金
			"#number_faxamountRMB":selectResultObj["faxamountrmb"],
			// 税金（円）
			"#number_faxamountRY":selectResultObj["faxamountry"]+"元",
			// 為替レート
			"#number_rate":selectResultObj["rate"],
			// 合計
			"#text_totalRMB":selectResultObj["totalrmb"]+"元",
			// 合計
			"#text_totalRY":selectResultObj["totalry"]+"円",
			// 追跡番号
			"#text_track":selectResultObj["tracknumber"]
		}
	);

	// // 添付ファイル検索
	// var selectResult = db.select(
	// 	"PURCHASE",
	// 	"queryPurchaseFile",
	// 	{
	// 		purchaseno: purchaseno,
	// 		shopid: getShopId()
	// 	}
	// ).getArray();

	// var resultHTML = '<tr>' +
	// 	'<td><img src="img/{suffix}.png"></img></td>' +
	// 	'<td style="width: 400px;" class="a">{dataname}.{suffix}</td>' +
	// 	'<td> <img src="img/delete.png" id="delfile" onclick="delfile(this)"></img></td>' +
	// 	'</tr>';
		
	// ret.runat("#filetable").remove("tr").append(resultHTML).withdata(selectResult);

	// 添付ファイル表示
	ret.eval("showFileList('" + purchaseno + "');");

	ret.eval("purchase_detail_inputdialog.dialog('open');");

	// 画面へ結果を返す
	return ret;

};
