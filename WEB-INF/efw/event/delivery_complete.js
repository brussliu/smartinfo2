var delivery_complete = {};
delivery_complete.name = "納品完了ボタン押下";
delivery_complete.paramsFormat = {
	"deliveryno": null,
	"#file_receiverfile": null

};

var deliveryno = "";

delivery_complete.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// 納品NO
	deliveryno = params["deliveryno"];

	// 受領ファイル
	var receiverfile = params["#file_receiverfile"];

	// TODO ステータス検索
	var status = "";


	// 2.発送済の場合
	if(status == "2.発送済"){

		// 受領ファイル取り込み
		loadAcceptanceFile(receiverfile, 1);

		// TODO
		// 1.更新途中在庫_入庫数量
		var update = db.change(
			"DELIVERY",
			"updateMSTDelveryAdd",
			{
				no: deliveryno,
				shopid: getShopId()
			}
		);

	// TODO 3.受領中の場合
	}else if(status == "3.受領中"){

		// TODO
		// 受領ファイル取り込み
		loadAcceptanceFile(receiverfile, 2);




	}



	// 更新纳品管理受領完了数量，状态和时间
	var update = db.change(
		"DELIVERY",
		"updateReceiveCompleteNumber",
		{
			no: deliveryno,
			shopid: getShopId()
		}
	);

	// 画面へ結果を返す

	ret.eval("init();");
	//ret.eval("choice('');");
	return ret;

};


function importAcceptance2(aryField, index) {

	// AMZ-納品番号
	if (index == 0) {
		var updResult = db.change("DELIVERY",	"updateDeliveryAmz1",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
	}
	// AMZ-納品名
	if (index == 1) {
		var updResult = db.change("DELIVERY",	"updateDeliveryAmz2",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
	}
	// AMZ-納品プラン番号
	if (index == 2) {
		var updResult = db.change("DELIVERY",	"updateDeliveryAmz3",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
	}
	// AMZ-納品先
	if (index == 3) {
		var updResult = db.change("DELIVERY",	"updateDeliveryAmz4",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
	}
	// AMZ-SKU合計
	if (index == 4) {
		var updResult = db.change("DELIVERY",	"updateDeliveryAmz5",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
	}
	// AMZ-商品合計数
	if (index == 5) {
		var updResult = db.change("DELIVERY",	"updateDeliveryAmz6",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
	}

	if (index >= 8) {

		var acceptance_new = parseInt(aryField[9]);
		var sku = aryField[0];
		var asin = aryField[2];

		// TODO 納品明細の数量と受領数量を検索する
		var count;
		var acceptance_old;

		if(acceptance_new > acceptance_old){

			// 数量 <= 受領数量
			if(count <= acceptance_old){

				// LOCAL数量 = LOCAL数量 + 受領数量 - 受領ファイル数量

				// 受領数量更新

			}else{

				// 途中数量 = LOCAL数量 + 受領数量 - 受領ファイル数量

				// LOCAL数量 = LOCAL数量 + 受領数量 - 受領ファイル数量

				// 受領数量更新

			}

		}

		// 納品明細に存在しない場合、Insert
		if (updResult == 0 || updResult == "0") {
			// var insResult = db.change(
			// 	"DELIVERY",
			// 	"insertAcceptanceDetail",
			// 	{
			// 		"col0": no,
			// 		"col1": aryField[0],
			// 		"col2": aryField[2],
			// 		"col3": aryField[9],
			// 		"shopid": getShopId()
			// 	}
			// );
		}

	}

};

function importAcceptance1(aryField, index) {

	// AMZ-納品番号
	if (index == 0) {
		var updResult = db.change("DELIVERY",	"updateDeliveryAmz1",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
	}
	// AMZ-納品名
	if (index == 1) {
		var updResult = db.change("DELIVERY",	"updateDeliveryAmz2",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
	}
	// AMZ-納品プラン番号
	if (index == 2) {
		var updResult = db.change("DELIVERY",	"updateDeliveryAmz3",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
	}
	// AMZ-納品先
	if (index == 3) {
		var updResult = db.change("DELIVERY",	"updateDeliveryAmz4",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
	}
	// AMZ-SKU合計
	if (index == 4) {
		var updResult = db.change("DELIVERY",	"updateDeliveryAmz5",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
	}
	// AMZ-商品合計数
	if (index == 5) {
		var updResult = db.change("DELIVERY",	"updateDeliveryAmz6",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
	}

	if (index >= 8) {

		// 受領数量更新
		var updResult = db.change(
			"DELIVERY",
			"updateDeliveryConAcceptance",
			{
				"acceptance": parseInt(aryField[9]),
				"sku": aryField[0],
				"asin": aryField[2],
				"col0": deliveryno,
				"shopid": getShopId()
			}
		);

		// 想定外納品
		if (updResult == 0 || updResult == "0") {
			var insResult = db.change(
				"DELIVERY",
				"insertAcceptanceDetail",
				{
					"col0": deliveryno,
					"col1": aryField[0],
					"col2": aryField[2],
					"col3": parseInt(aryField[9]),
					"shopid": getShopId()
				}
			);
		}

		
	}

};



// function importAcceptance(aryField, index) {

// 	// AMZ-納品番号
// 	if (index == 0) {
// 		var updResult = db.change("DELIVERY",	"updateDeliveryAmz1",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
// 	}
// 	// AMZ-納品名
// 	if (index == 1) {
// 		var updResult = db.change("DELIVERY",	"updateDeliveryAmz2",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
// 	}
// 	// AMZ-納品プラン番号
// 	if (index == 2) {
// 		var updResult = db.change("DELIVERY",	"updateDeliveryAmz3",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
// 	}
// 	// AMZ-納品先
// 	if (index == 3) {
// 		var updResult = db.change("DELIVERY",	"updateDeliveryAmz4",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
// 	}
// 	// AMZ-SKU合計
// 	if (index == 4) {
// 		var updResult = db.change("DELIVERY",	"updateDeliveryAmz5",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
// 	}
// 	// AMZ-商品合計数
// 	if (index == 5) {
// 		var updResult = db.change("DELIVERY",	"updateDeliveryAmz6",	{"info": aryField[1],	"col0": deliveryno,	"shopid": getShopId()});
// 	}

// 	if (index >= 8) {

// 		// 納品明細の受領数量を更新
// 		var updResult = db.change(
// 			"DELIVERY",
// 			"updateDeliveryNum",
// 			{
// 				"acceptance": aryField[9],
// 				"sku": aryField[0],
// 				"asin": aryField[2],
// 				"no": no,
// 				"shopid": getShopId()
// 			}
// 		);

// 		// 想定外納品
// 		if (updResult == 0 || updResult == "0") {
// 			var insResult3 = db.change(
// 				"DELIVERY",
// 				"insertAcceptanceDetail",
// 				{
// 					"col0": no,
// 					"col1": aryField[0],
// 					"col2": aryField[2],
// 					"col3": aryField[9],
// 					"shopid": getShopId()
// 				}
// 			);
// 		}

// 	}

// };