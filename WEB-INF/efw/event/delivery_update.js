var delivery_update = {};
delivery_update.name = "納品更新ボタン押下";
delivery_update.paramsFormat = {
	"deliveryno": null, 
	"#text_name": null,
	"#file_deliveryfile": null

};

delivery_update.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// 納品NO
	var deliveryno = params["deliveryno"];
	// 納品名称
	var names = params["#text_name"];
	// 	納品ファイル
	var deliveryfile = params["#file_deliveryfile"];

	if(deliveryfile!=null||deliveryfile!=''||typeof(deliveryfile)==="undefined"){

		// 明細導入
		importProContent(deliveryfile, deliveryno);
 
 	}

	// TRN_納品管理更新
	var selectResult2 = db.change(
		"DELIVERY",
		"updatedelivery",
		{
			no: deliveryno,
			names: names,
			shopid: getShopId()
		}
	);
 
	//TODO 新規数量更新
	
	ret.eval("$('#text_name').val('');");
	ret.eval("$('#file_deliveryfile').val('');");
	// ret.eval("choice('');");
	ret.eval("init();");
	// 画面へ結果を返す
	return ret;

};

function deleteProContent(deliveryno){

	// 納品明細削除
	var deleteResult = db.change(
		"DELIVERY",
		"deleteDeliveryContent",
		{
			no: deliveryno,
			shopid: getShopId()
		}
	);
}

// 納品内容導入
function importProContent(proContent, deliveryno) {

	deleteProContent(deliveryno);

	// ファイル
	file.saveUploadFiles(getShopId() + "/upload");
	var fa = proContent.split("\\");
	var f = fa[fa.length - 1];

	// Excelファイル
	var exl = new Excel(getShopId() + "/upload/" + f);

	// excelシート名
	var exlarray = exl.getSheetNames();

	// 列名
	var COL_B = "B";	//商品管理番号
	var COL_C = "C";	//ASIN番号
	var COL_D = "D";	//SKU番号
	var COL_F = "F";	//分類１
	var COL_G = "G";	//分類２
	var COL_Z = "Z";	//納品数量
	var Y_from = 3;		//EXCEL開始行
	var Y_to = 9999;	//EXCEL終了行

	
	// 各シートから仕入内容を取得
	for (var i = 0; i < exlarray.length; i++) {

		var sheetName = exlarray[i];

		if(sheetName == "暫定データ"){

		}else if(sheetName == "DELIVERYLIST"){
		
		}else if(sheetName == "PURCHASELIST"){
		
		}else{

			// ループ
			for (var y = Y_from; y <= Y_to; y++) {

				// ASIN番号
				var asin = exl.getValue(sheetName, COL_C + y);
				// SKU番号
				var sku = exl.getValue(sheetName, COL_D + y);
				// 納品数量
				var count = exl.getValue(sheetName, COL_Z + y);

				if (sku == null || sku == '' || asin == null || asin == '') {

						break;
					
				}else{

					if(count != null && count != '' && parseInt(count) > 0){

						// 新规TRN_納品明細
						var selectResult2 = db.change(
							"DELIVERY",
							"insertdeliverydata",
							{
								no: deliveryno,
								asin: asin,
								sku: sku,
								num: count,
								shopid: getShopId()
							}
						);
					}

				}
			}

		}
		
	}

}