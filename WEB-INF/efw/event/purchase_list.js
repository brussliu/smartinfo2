var purchase_list = {};
purchase_list.name = "仕入内容ボタン";
purchase_list.paramsFormat = {
	"purchaseno": null

};

purchase_list.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	sessionCheck(ret);
 

	var purchaseno = params["purchaseno"];

	//  检索asin,sku
	var selectResult = db.select(
		"PURCHASE",
		"seachAsinAndSku",
		{
			purchaseno:purchaseno,
			shopid: getShopId()

		}
	).getArray();
	selectResult.debug('--seachAsinAndSku--')

	var purchasename=selectResult[0]['purchasename'];
	purchaseno.debug('------purchaseno-------')
	// 仕入NO
	ret.eval('$("#td_contno").html('+purchaseno+')');
	// 仕入名称
	ret.eval('$("#td_conname").html('+purchasename+')');

	//  检索明细列表
	var selectResult = db.select(
		"PURCHASE",
		"seachpurchasecontent",
		{
			purchaseno:purchaseno,
			shopid: getShopId()

		}
	).getArray();


	selectResult.debug("-------------seachpurchasecontent")

	var  resultHTML='<tr>' +
	'<td style="width: 90px;">{productno}</td>' +
	'<td style="width: 160px;">{sub1}</td>' +
	'<td style="width: 160px;">{sub2}</td>' +
	'<td style="width: 120px;">{asin}</td>' +
	'<td style="width: 150px;">{sku}</td>' +
	'<td style="width: 120px;">{label}</td>' +
	'<td style="width: 80px;">{fba}</td>' +
	'<td style="width: 80px;">{local}</td>' +
	'<td style="width: 80px;">{number}</td>' +
	'</tr>'
	ret.runat("#table_cot").remove("tr").append(resultHTML).withdata(selectResult);

	ret.eval("purchase_content_inputdialog.dialog('open');");
	// 画面へ結果を返す
	return ret;

};
