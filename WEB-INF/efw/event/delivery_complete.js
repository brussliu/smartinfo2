var delivery_complete = {};
delivery_complete.name = "納品完了ボタン押下";
delivery_complete.paramsFormat = {
	"no": null,
	"#file_receiverfile": null

};

delivery_complete.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };


	var no = params["no"];
	var receiverfile = params["#file_receiverfile"];
	file.saveUploadFiles("Smart-Bear/upload");
	// 文件名
	var fa = receiverfile.split("\\");
	var f = fa[fa.length - 1];


	var csvReader = new CSVReader("Smart-Bear/upload/" + f, "\t");

	// データ全件導入
	csvReader.loopAllLines(importAcceptance);



	// 更新纳品管理受領完了数量，状态和时间
	var update = db.change(
		"DELIVERY",
		"updateReceiveCompleteNumber",
		{
			no: no,
			shopid: getShopId()
		}
	);

	// 画面へ結果を返す

	ret.eval("init();");
	ret.eval("choice('');");
	return ret;

};

function importAcceptance(aryField, index) {

	var amz_delivery_no = "";
	var amz_delivery_name = "";
	var amz_delivery_plan = "";
	var amz_delivery_point = "";
	var amz_delivery_sku = "";
	var amz_delivery_count = "";
	if (index == 0) {
		amz_delivery_no = aryField[1];
		var updResult = db.change(
			"DELIVERY",
			"updateDeliveryAmz1",
			{
				"info": amz_delivery_no,
				"col0": no,
				"shopid": getShopId()
			}
		);
	}
	if (index == 1) {
		amz_delivery_name = aryField[1];
		var updResult = db.change(
			"DELIVERY",
			"updateDeliveryAmz2",
			{
				"info": amz_delivery_name,
				"col0": no,
				"shopid": getShopId()
			}
		);
	}
	if (index == 2) {
		amz_delivery_plan = aryField[1];
		var updResult = db.change(
			"DELIVERY",
			"updateDeliveryAmz3",
			{
				"info": amz_delivery_plan,
				"col0": no,
				"shopid": getShopId()
			}
		);
	}
	if (index == 3) {
		amz_delivery_point = aryField[1];
		var updResult = db.change(
			"DELIVERY",
			"updateDeliveryAmz4",
			{
				"info": amz_delivery_point,
				"col0": no,
				"shopid": getShopId()
			}
		);
	}

	if (index == 4) {
		amz_delivery_sku = aryField[1];
		var updResult = db.change(
			"DELIVERY",
			"updateDeliveryAmz5",
			{
				"info": amz_delivery_sku,
				"col0": no,
				"shopid": getShopId()
			}
		);
	}

	if (index == 5) {
		amz_delivery_count = aryField[1];
		var updResult = db.change(
			"DELIVERY",
			"updateDeliveryAmz6",
			{
				"info": amz_delivery_count,
				"col0": no,
				"shopid": getShopId()
			}
		);
	}

	if (index >= 8) {

		// 納品明細の受領数量を更新
		var updResult = db.change(
			"DELIVERY",
			"updateDeliveryNum",
			{
				"acceptance": aryField[9],
				"sku": aryField[0],
				"asin": aryField[2],
				"no": no,
				"shopid": getShopId()
			}
		);

		// 想定外納品
		if (updResult == 0 || updResult == "0") {
			var insResult3 = db.change(
				"DELIVERY",
				"insertAcceptanceDetail",
				{
					"col0": no,
					"col1": aryField[0],
					"col2": aryField[2],
					"col3": aryField[9],
					"shopid": getShopId()
				}
			);
		}

	}

};