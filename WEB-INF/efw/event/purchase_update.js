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
			"#date_entrydate":isNULLs(selectResultObj["logindate"],4),
			// 発送日①
			"#date_forwarddate1":isNULLs(selectResultObj["senddate1"],4),
			// 発送日②
			"#date_forwarddate2":isNULLs(selectResultObj["senddate2"],4),
			// 完了日
			"#date_completiondate":isNULLs(selectResultObj["completiondate"],4),
			// 商品費用
			"#number_productamountRMB":isNULLs(selectResultObj["productamountrmb"],1),
			// 商品費用（円）
			"#number_productamountRY":isNULLs(selectResultObj["productamountry"],2),
			// 物流費用
			"#number_shipamountRMB":isNULLs(selectResultObj["shipamountrmb"],1),
			// 物流費用（円）
			"#number_shipamountRY":isNULLs(selectResultObj["shipamountry"],2),
			// 税金
			"#number_faxamountRMB":isNULLs(selectResultObj["faxamountrmb"],1),
			// 税金（円）
			"#number_faxamountRY":isNULLs(selectResultObj["faxamountry"],3),
			// 為替レート
			"#number_rate":selectResultObj["rate"],
			// 合計
			"#text_totalRMB":isNULLs(selectResultObj["totalrmb"],3),
			// 合計
			"#text_totalRY":isNULLs(selectResultObj["totalry"],2),
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

function isNULLs(val,opt){
	if(val == null){
		return '';
	}else{
		if(opt==1){
		}
		if(opt==2){
			val = val +'円';
		}
		if(opt==3){
			val = val +'元';
		}
		if(opt==4){
			val = val.format('yyyy/MM/dd');
		}
	}
	return val;
}
