var delivery_update = {};
delivery_update.name = "納品更新ボタン押下";
delivery_update.paramsFormat = {
	"no": null, 
	"#text_name": null,
	"#file_deliveryfile": null

};

delivery_update.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	if(sessionCheck(ret) == false){return ret};
	// 納品NO
	var no = params["no"];
	// 納品名称
	var names = params["#text_name"];

	
	// 	納品ファイル
	var deliveryfile = params["#file_deliveryfile"];

	if(deliveryfile!=null||deliveryfile!=''||typeof(deliveryfile)==="undefined"){

	// 删除当前明细
	var deleteResult = db.change(
		"DELIVERY",
		"deleteDeliveryContent",
		{
			no: no,
			shopid: getShopId()
		}
	);
 

	file.saveUploadFiles("Smart-Bear/upload");
	// 文件名
	var fa = deliveryfile.split("\\");
	var f = fa[fa.length - 1];
	// Excelファイル
	var exl = new Excel("Smart-Bear/upload/" + f);
	// excel表名
	var exlarray = exl.getSheetNames();
	var shop = getShopId();
	//  序号
	var COL_C = "C";//ASIN番号
	var COL_D = "D";//SKU番号
	var COL_Z = "Z";//納品数量
	var Y_from = 3;//EXCEL数据起始行
	var Y_to = 999;//EXCEL数据结束行

	// 导入納品明细
	for (var i = 0; i < exlarray.length; i++) {
		//文件，Excel表名，用户名 
		importProContent(exl, exlarray[i], COL_C, COL_D, COL_Z, Y_from, Y_to, shop, no);
	}
 
 }
	// 更新TRN_納品管理
	var selectResult2 = db.change(
		"DELIVERY",
		"updatedelivery",
		{
			no: no,
			names: names,
			shopid: shop
		}
	);
 
	ret.eval("$('#text_name').val('');");
	ret.eval("$('#file_deliveryfile').val('');");
	ret.eval("choice('');");
	ret.eval("init();");
	// 画面へ結果を返す
	return ret;

};

// 导入文件
function importProContent(exl, sheetName, XC, XD, XZ, Y_from, Y_to, shopid, date) {

	// 循环
	for (var y = Y_from; y <= Y_to; y++) {
		// 获取excel值
		// ASIN番号
		var asin = exl.getValue(sheetName, XC + y);

		// SKU番号
		var sku = exl.getValue(sheetName, XD + y);

		// 納品数量
		var count = exl.getValue(sheetName, XZ + y);


		// 判断下一行数据是否为空
		if ((sku == null || sku == '') && (asin == null || asin == '')) {
			break;
		} else {
			if (sku == null || sku == '') {
				continue;
			} else {
				// 新规TRN_納品明細
				var selectResult2 = db.change(
					"DELIVERY",
					"insertdeliverydata",
					{
						no: date,
						asin: asin,
						sku: sku,
						num: count,
						shopid: shopid
					}
				);
 
			}
		}



	}

}
