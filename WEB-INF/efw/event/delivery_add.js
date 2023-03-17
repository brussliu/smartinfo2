var delivery_add = {};
delivery_add.name = "納品情報新規ボタン押下";
delivery_add.paramsFormat = {
	"#text_name": null,
	"#file_deliveryfile": null
 
};

delivery_add.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// 納品NO
	var deliveryno = new Date().format('yyyyMMdd-HHmmss');

	// 納品名称
	var name = params["#text_name"];

	// 納品ファイル
	var deliveryfile = params["#file_deliveryfile"];

	// 明細導入
	importProContent(deliveryfile, deliveryno, 1);

	// 新規TRN_納品管理
	var selectResult1 = db.change(
		"DELIVERY",
		"insertdelivery",
		{
			no: deliveryno,
			names: name,
			shopid: getShopId()
		}
	);
	// 新規数量更新
	var selectResult2 = db.change(
		"DELIVERY",
		"updateDeliveryNew",
		{
			no: deliveryno,
			shopid: getShopId()
		}
	);

	ret.eval("$('#text_name').val('');");
	ret.eval("$('#file_deliveryfile').val('');");
	
	//ret.eval("choice('');");
	ret.eval("init();");
	// 画面へ結果を返す
	return ret;

};
