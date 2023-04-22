var scan_update = {};
scan_update.name = "商品スキャン更新ボタン押下";
scan_update.paramsFormat = {
	"listno" : null
};
 
scan_update.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var listno = params["listno"];

	
		var selectResultObj = db.select(
			"SCAN",
			"queryProductNameByListno",
			{
				"listno" : listno,
				"shopid": getShopId()
			}
		).getSingle();
	
		//リストNO,名称
		ret.runat("#scan_inputdialog").withdata( {"#td_no": listno , "#text_name": selectResultObj['name']});

	

		var selectResultObj = db.select(
			"SCAN",
			"queryProductDetailByListno",
			{
				"listno" : listno,
				"shopid": getShopId()
			}
		).getArray();
	
		var resultHTML ='<tr>' +
		'<td style="width: 90px;">{productno}</td>' +
		'<td style="width: 160px;">{sub1}</td>' +
		'<td style="width: 160px;">{sub2}</td>' +
		'<td style="width: 120px;">{asin}</td>' +
		'<td style="width: 150px;">{sku}</td>' +
		'<td style="width: 120px;">{label}</td>' +
		'<td style="width: 80px;">{num}</td>' +
		'</tr>'

		ret.runat("#boxinfobody").remove("tr").append(resultHTML).withdata(selectResultObj);


		ret.eval("scan_inputdialog.dialog('open');");

		return ret;
};