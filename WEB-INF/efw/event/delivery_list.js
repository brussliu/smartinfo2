var delivery_list = {};
delivery_list.name = "納品内容ボタン押下";
delivery_list.paramsFormat = {
	"deliveryno": null

};

delivery_list.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};
 
	// 納品NO
	var deliveryno = params["deliveryno"];

	// 納品名称検索
	var selectResult = db.select(
		"DELIVERY",
		"seachDeliveryName",
		{
			no:deliveryno,
			shopid: getShopId()

		}
	).getSingle();

	var deliveryname = selectResult['name'];
 
	// 納品NO
	ret.eval("$('#td_contno').html('" + deliveryno + "')");

	// 納品名称
	ret.eval("$('#td_conname').html('" + deliveryname + "')");

	// 納品明細検索
	var selectResult = db.select(
		"DELIVERY",
		"seachdeliverycontent",
		{
			no:deliveryno,
			shopid: getShopId()
		}
	).getArray();

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

	ret.eval("delivery_content_inputdialog.dialog('open');");
	
	// 画面へ結果を返す
	return ret;

};
