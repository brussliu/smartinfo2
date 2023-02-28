var purchase_save = {};
purchase_save.name = "仕入情報管理画面保存";
purchase_save.paramsFormat = {
	"#td_no": null,
	"#text_purchase": null,
	"#opt_ship": null,

	"#date_entrydate": null,
	"#date_forwarddate1": null,
	"#date_forwarddate2": null,

	"#date_completiondate": null,

	"#number_productamountRMB": null,
	"#opt_monetaryunit1": null,
	"#number_productamountRY": null,

	"#number_shipamountRMB": null,
	"#opt_monetaryunit2": null,
	"#number_shipamountRY": null,

	"#number_faxamountRMB": null,
	"#opt_monetaryunit3": null,
	"#number_faxamountRY": null,

	"#number_rate": null,
	"#text_totalRMB": null,
	"#text_totalRY": null,

	"#file_ProContent": null,
	"#text_track": null,
	"#purchaseno": null,
	"#flg": null,
	"state": null
};

purchase_save.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	sessionCheck(ret);
	// 当前时间
	// 仕入NO
	var date = params["#purchaseno"];



	// 仕入名称
	var purchase = params["#text_purchase"];
	// 発送方式
	var ship = params["#opt_ship"];

	// 発送日①
	var forwarddate1 = params["#date_forwarddate1"];
	// 発送日②
	var forwarddate2 = params["#date_forwarddate2"];
	// 完了日
	var completiondate = params["#date_completiondate"];
	// 商品費用
	var productamountRMB = params["#number_productamountRMB"];

	productamountRMB.debug('111--productamountRMB');
	// 商品費用货币单位
	var monetaryunit1 = params["#opt_monetaryunit1"];
	// 商品費用转换值
	var productamount2 = params["#number_productamountRY"];
	var productamountRY = productamount2.substring(0, productamount2.length - 1);

	unit(monetaryunit1, productamountRMB, productamountRY);

	// 物流費用
	var shipamountRMB = params["#number_shipamountRMB"];
	var monetaryunit2 = params["#opt_monetaryunit2"];
	var shipamount2 = params["#number_shipamountRY"];
	var shipamountRY = shipamount2.substring(0, shipamount2.length - 1);
	unit(monetaryunit2, shipamountRMB, shipamountRY);
	// 税金
	var faxamountRMB = params["#number_faxamountRMB"];
	var monetaryunit3 = params["#opt_monetaryunit3"];
	var faxamount2 = params["#number_faxamountRY"];
	var faxamountRY = faxamount2.substring(0, faxamount2.length - 1);
	unit(monetaryunit3, faxamountRMB, faxamountRY);
	// 為替レート
	var rate = params["#number_rate"];
	// 合計
	var total1 = params["#text_totalRMB"];
	var totalRMB = total1.substring(0, total1.length - 1);
	var total2 = params["#text_totalRY"];
	var totalRY = total2.substring(0, total2.length - 1);

	// 仕入内容
	var ProContent = params["#file_ProContent"];
	if (ProContent == null || ProContent == '') {
		ret.eval("alter('仕入内容is null')");
	}
	// 追跡番号
	var track = params["#text_track"];
	// 新规or更新
	var flg = params["#flg"];
	//  ステータス
	var state = params["state"];
	var shop = getShopId();
	if (flg == 'new') {

	} else {
		if (state == '2.発送済') {
			// 检索仕入明细所有sku,asin,数量
			var selectOld = db.select(
				"PURCHASE",
				"queryPurchaseCount",
				{
					purchaseno: date,
					shopid: getShopId()
				}
			).getArray();

			// 更新途中在庫_仕入数量
			for (var i = 0; i < selectOld.length; i++) {
				var update = db.change(
					"PURCHASE",
					"updateMSTPurMinus",
					{
						asin: selectOld[i]['asin'],
						sku: selectOld[i]['sku'],
						count: selectOld[i]['count'],
						purchaseno: date,
						shopid: getShopId()
					}
				);
			}


		} else if (state == '3.仕入済') {
			// 检索仕入明细所有sku,asin,数量
			var selectOld = db.select(
				"PURCHASE",
				"queryPurchaseCount",
				{
					purchaseno: date,
					shopid: getShopId()
				}
			).getArray();

			// 更新MST_在庫情報-减去LOCAL在庫数量
			for (var i = 0; i < selectOld.length; i++) {
				var update = db.change(
					"PURCHASE",
					"updateMSTLocalMinus",
					{
						asin: selectOld[i]['asin'],
						sku: selectOld[i]['sku'],
						count: selectOld[i]['count'],
						purchaseno: date,
						shopid: getShopId()
					}
				);
			}

		}


		// 删除仕入明细
		var deleteResult = db.change(
			"PURCHASE",
			"deletePurchaseContent",
			{
				purchaseno: date,
				shopid: getShopId()
			}
		);
		deleteResult.debug('--------deletePurchaseContent--------')
	}




	file.saveUploadFiles("Smart-Bear/upload");
	// 文件名
	var fa = ProContent.split("\\");
	var f = fa[fa.length - 1];
	// Excelファイル
	var exl = new Excel("Smart-Bear/upload/" + f);
	// excel表名
	var exlarray = exl.getSheetNames();
	//  序号
	var COL_C = "C";//ASIN番号
	var COL_D = "D";//SKU番号
	var COL_Z = "Z";//仕入数量
	var Y_from = 3;//EXCEL数据起始行
	var Y_to = 999;//EXCEL数据起始行

	// 导入仕入明细
	for (var i = 0; i < exlarray.length; i++) {
		//文件，Excel表名，用户名 
		importProContent(exl, exlarray[i], COL_C, COL_D, COL_Z, Y_from, Y_to, shop, date);
	}


	// 统计数量，金额
	var countResult = db.select(
		"PURCHASE",
		"countNumberAndMoney",
		{
			purchaseno: date,
			shopid: getShopId()
		}
	).getArray();

	var count = countResult[0]['count'];
	var money = countResult[0]['money'];


	if (flg == 'new') {
		// 保存TRN_仕入管理
		var selectResult = db.change(
			"PURCHASE",
			"savepurchase",
			{
				purchaseno: date,
				purchase: purchase,
				ship: ship,

				count: count,
				money: money,
				forwarddate1: forwarddate1,
				forwarddate2: forwarddate2,

				completiondate: completiondate,

				productamountRMB: productamountRMB,
				productamountRY: productamountRY,

				shipamountRMB: shipamountRMB,
				shipamountRY: shipamountRY,

				faxamountRMB: faxamountRMB,
				faxamountRY: faxamountRY,

				rate: rate,
				totalRMB: totalRMB,
				totalRY: totalRY,
				track: track,
				shopid: getShopId()
			}
		);
		selectResult.debug('------savepurchase----');

	} else {

		if (state == '2.発送済') {
			// 检索仕入明细所有sku,asin,数量
			var selectNew = db.select(
				"PURCHASE",
				"queryPurchaseCount",
				{
					purchaseno: date,
					shopid: getShopId()
				}
			).getArray();

				// 更新途中在庫_仕入数量
			for (var i = 0; i < selectNew.length; i++) {
				var update = db.change(
					"PURCHASE",
					"updateMSTPurAdd",
					{
						asin: selectNew[i]['asin'],
						sku: selectNew[i]['sku'],
						count: selectNew[i]['count'],
						purchaseno: date,
						shopid: getShopId()
					}
				);
			}

		} else if (state == '3.仕入済') {
			// 检索仕入明细所有sku,asin,数量
			var selectNew = db.select(
				"PURCHASE",
				"queryPurchaseCount",
				{
					purchaseno: date,
					shopid: getShopId()
				}
			).getArray();

			// 更新MST_在庫情報-加上LOCAL在庫数量
			for (var i = 0; i < selectNew.length; i++) {
				var update = db.change(
					"PURCHASE",
					"updateMSTLocalAdd",
					{
						asin: selectNew[i]['asin'],
						sku: selectNew[i]['sku'],
						count: selectNew[i]['count'],
						purchaseno: date,
						shopid: getShopId()
					}
				);
			}
		}
		// 更新TRN_仕入管理
		var selectResult = db.change(
			"PURCHASE",
			"updatepurchase",
			{
				purchaseno: date,
				purchase: purchase,
				ship: ship,

				count: count,
				money: money,
				forwarddate1: forwarddate1,
				forwarddate2: forwarddate2,

				completiondate: completiondate,

				productamountRMB: productamountRMB,
				productamountRY: productamountRY,

				shipamountRMB: shipamountRMB,
				shipamountRY: shipamountRY,

				faxamountRMB: faxamountRMB,
				faxamountRY: faxamountRY,

				rate: rate,
				totalRMB: totalRMB,
				totalRY: totalRY,
				track: track,
				shopid: getShopId()
			}
		);
		selectResult.debug('------updatepurchase----');

	}

	ret.eval("$('#purchaseno').val(" + date + ")");
	ret.eval("purchase_detail_inputdialog.dialog('close');");
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

		// 仕入数量
		var count = exl.getValue(sheetName, XZ + y);

		// if ((sku == null || sku == '') && (asin == null || asin == '')) {

		// 	// 通过暂定数据查商品,获取价格
		// 	var selectResult = db.select(
		// 		"PURCHASE",
		// 		"searchProduct",
		// 		{
		// 			type: sheetName,
		// 			no: productno,
		// 			sub1: sub1,
		// 			sub2: sub2,
		// 			shopid: shopid
		// 		}
		// 	).getArray();

		// } else {
		if ((sku != null && sku != '') && (asin != null && asin != '')) {
			// 通过ASIN番号，SKU番号查商品,获取价格
			var selectResult = db.select(
				"PURCHASE",
				"searchProductAS",
				{
					asin: asin,
					sku: sku,
					shopid: shopid
				}
			).getArray();

			var productno = selectResult[0]['productno'];
			var type = selectResult[0]['type'];
			var sub1 = selectResult[0]['sub1'];
			var sub2 = selectResult[0]['sub2'];
			var price = Number(selectResult[0]['price']);
		}

		// 判断下一行数据是否为空
		if ((sku == null || sku == '') && (asin == null || asin == '')
			&& (productno == null || productno == '')
			&& (sub1 == null || sub1 == '') && (sub2 == null || sub2 == '')) {
			break;
		} else {
			if (price == null || price == '') {
				continue;
			} else {
				// 新规TRN_仕入明細
				var selectResult2 = db.change(
					"PURCHASE",
					"insertpurchasedata",
					{
						no: date,
						asin: asin,
						sku: sku,
						productno: productno,
						type: type,
						sub1: sub1,
						sub2: sub2,
						price: price,
						num: count,
						shopid: shopid
					}
				);

			}
		}



	}

}


// sl:根据单位确认左右的值
function unit(unit, cny, jpy) {
	var zh;

	if (unit == "CNY") {

		zh = cny;
		cny = jpy;
		jpy = zh;
	}
}