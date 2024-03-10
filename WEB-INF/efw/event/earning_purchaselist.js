var earning_purchaselist = {};
earning_purchaselist.name = "仕入内容ボタン";
earning_purchaselist.paramsFormat = {
	"purchaseno": null

};

earning_purchaselist.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};
 
	var purchaseno = params["purchaseno"];

	// 仕入名称
	var selectResult = db.select(
		"EARNINGS",
		"seachPurchaseName",
		{
			purchaseno:purchaseno,
			shopid: getShopId()

		}
	).getSingle();

	var purchasename = selectResult['purchasename'];
	// 仕入NO
	ret.eval('$("#td_contno").html("' + purchaseno + '")');
	// 仕入名称
	ret.eval('$("#td_conname").html("' + purchasename + '")');

	// 明細検索
	var selectResult = db.select(
		"EARNINGS",
		"seachpurchasecontent",
		{
			purchaseno:purchaseno,
			shopid: getShopId()

		}
	).getArray();// TODO ソート順修正要

	var  resultHTML='<tr>' +
	'<td style="width: 90px;">{productno}</td>' +
	'<td style="width: 160px;">{sub1}</td>' +
	'<td style="width: 160px;">{sub2}</td>' +
	'<td style="width: 120px;">{asin}</td>' +
	'<td style="width: 150px;">{sku}</td>' +
	'<td style="width: 120px;">{label}</td>' +
	'<td style="width: 80px;">{fba}</td>' +
	'<td style="width: 80px;">{local1}</td>' +
	'<td style="width: 80px;">{local2}</td>' +
	'<td style="width: 80px;">{number}</td>' +
	'</tr>';

	ret.runat("#table_cot").remove("tr").append(resultHTML).withdata(selectResult);

	ret.eval("earnings_purchase_inputdialog.dialog('open');");

	// 画面へ結果を返す
	return ret;

};
