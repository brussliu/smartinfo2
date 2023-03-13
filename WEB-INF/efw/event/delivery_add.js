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
	importProContent(deliveryfile, deliveryno);

	// file.saveUploadFiles(getShopId() + "/upload");
	// // ファイル名称
	// var fa = deliveryfile.split("\\");
	// var f = fa[fa.length - 1];
	// // Excelファイル
	// var exl = new Excel("Smart-Bear/upload/" + f);
	// // excel表名
	// var exlarray = exl.getSheetNames();
	// var shop = getShopId();
	// //  序号
	// var COL_C = "C";//ASIN番号
	// var COL_D = "D";//SKU番号
	// var COL_Z = "Z";//納品数量
	// var Y_from = 3;//EXCEL数据起始行
	// var Y_to = 999;//EXCEL数据结束行

	// // 导入納品明细
	// for (var i = 0; i < exlarray.length; i++) {
	// 	//文件，Excel表名，用户名 
	// 	importProContent(exl, exlarray[i], COL_C, COL_D, COL_Z, Y_from, Y_to, shop, date);
	// }

	// 新規TRN_納品管理
	var selectResult2 = db.change(
		"DELIVERY",
		"insertdelivery",
		{
			no: date,
			names: name,
			shopid: shop
		}
	);
	//selectResult2.debug('-----insertdelivery');

	//TODO 新規数量更新

	ret.eval("$('#text_name').val('');");
	ret.eval("$('#file_deliveryfile').val('');");
	
	//ret.eval("choice('');");
	ret.eval("init();");
	// 画面へ結果を返す
	return ret;

};


// 納品内容導入
function importProContent(proContent, deliveryno) {

	// deleteProContent(purchaseno);

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


// // 导入文件
// function importProContent(exl, sheetName, XC, XD, XZ, Y_from, Y_to, shopid, date) {

// 	// 循环
// 	for (var y = Y_from; y <= Y_to; y++) {
// 		// 获取excel值
// 		// ASIN番号
// 		var asin = exl.getValue(sheetName, XC + y);

// 		// SKU番号
// 		var sku = exl.getValue(sheetName, XD + y);

// 		// 納品数量
// 		var count = exl.getValue(sheetName, XZ + y);


// 		// 判断下一行数据是否为空
// 		if ((sku == null || sku == '') && (asin == null || asin == '')) {
// 			break;
// 		} else {
// 			if (sku == null || sku == '') {
// 				continue;
// 			} else {

 
// 			}
// 		}



// 	}

// }
