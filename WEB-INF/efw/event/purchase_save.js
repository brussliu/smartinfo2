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
	"purchaseno": null

};

purchase_save.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	sessionCheck(ret);
	// 当前时间
	// var date = new Date().format("yyyyMMdd-HHmmss");
	var date = params["purchaseno"];

	// 仕入NO
	var no = params["#td_no"];
	// 仕入名称
	var purchase = params["#text_purchase"];
	// 発送方式
	var ship = params["#opt_ship"];
	// 登録日
	var entrydate = params["#date_entrydate"];
	// 発送日①
	var forwarddate1 = params["#date_forwarddate1"];
	// 発送日②
	var forwarddate2 = params["#date_forwarddate2"];
	// 完了日
	var completiondate = params["#date_completiondate"];
	// 商品費用
	var productamountRMB = params["#number_productamountRMB"];
	// 商品費用货币单位
	var monetaryunit1 = params["#opt_monetaryunit1"];
	// 商品費用转换值
	var productamountRY = params["#number_productamountRY"];
	unit(monetaryunit1, productamountRMB, productamountRY);
	// 物流費用
	var shipamountRMB = params["#number_shipamountRMB"];
	var monetaryunit2 = params["#opt_monetaryunit2"];
	var shipamountRY = params["#number_shipamountRY"];
	unit(monetaryunit2, shipamountRMB, shipamountRY);
	// 税金
	var faxamountRMB = params["#number_faxamountRMB"];
	var monetaryunit3 = params["#opt_monetaryunit3"];
	var faxamountRY = params["#number_faxamountRY"];
	unit(monetaryunit3, faxamountRMB, faxamountRY);
	// 為替レート
	var rate = params["#number_rate"];
	// 合計
	var total1 = params["#text_totalRMB"];
	var totalRMB = total1.substring(0, total1.length - 1);
	var total2 = params["#text_totalRY"];
	var totalRY = total2.substring(0, total2.length - 1);
	totalRY.debug('totalRY');
	// 仕入内容
	var ProContent = params["#file_ProContent"];
	// 追跡番号
	var track = params["#text_track"];



	var shop = getShopId();

	file.saveUploadFiles("upload");
	// 文件名
	var fa = ProContent.split("\\");
	var f = fa[fa.length - 1];
	// Excelファイル
	var exl = new Excel("upload/" + f);
	// excel表名
	var exlarray = exl.getSheetNames();

	//  序号
	var COL_B = "B";//管理番号
	var COL_C = "C";//ASIN番号
	var COL_D = "D";//SKU番号
	var COL_E = "E";//LABEL番号
	var COL_F = "F";//分類①
	var COL_G = "G";//分類②
	var COL_O = "O";//仕入数量

	var Y_from = 3;//EXCEL数据起始行
	var Y_to = 99;//EXCEL数据起始行
	// 仕入明细
	for (var i = 0; i < exlarray.length; i++) {
		//文件，Excel表名，用户名 
		importProContent(exl, exlarray[i], COL_B, COL_C, COL_D, COL_E, COL_F, COL_G, COL_O, Y_from, Y_to, shop, date);
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


	// 保存
	var selectResult = db.change(
		"PURCHASE",
		"savepurchase",
		{
			no: date,
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
	ret.eval("$('#purchaseno').val(" + date + ")");
	ret.eval("purchase_detail_inputdialog.dialog('close');");
	ret.eval("init();");
	// 画面へ結果を返す
	return ret;

};
// 导入文件
function importProContent(exl, sheetName, XB, XC, XD, XE, XF, XG, XO, Y_from, Y_to, shopid, date) {

	// 循环
	for (var y = Y_from; y <= Y_to; y++) {
		// 获取excel值
		// 管理番号
		var productno = exl.getValue(sheetName, XB + y);
		// ASIN番号
		var asin = exl.getValue(sheetName, XC + y);
		// SKU番号
		var sku = exl.getValue(sheetName, XD + y);
		// LABEL番号
		var label = exl.getValue(sheetName, XE + y);
		// 分類①
		var sub1 = exl.getValue(sheetName, XF + y);
		// 分類②
		var sub2 = exl.getValue(sheetName, XG + y);
		// 仕入数量
		var count = exl.getValue(sheetName, XO + y);

		if ((sku == null || sku == '') && (asin == null || asin == '')) {

			// 通过暂定数据查商品,获取价格
			var selectResult = db.select(
				"PURCHASE",
				"searchProduct",
				{
					type: sheetName,
					no: productno,
					sub1: sub1,
					sub2: sub2,
					shopid: shopid
				}
			).getArray();
			// selectResult.debug('--searchProduct/-----');
		} else {
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
			// selectResult.debug('--searchProductAS/-----');
		}


		var price = '';
		// 価格
		if (selectResult.length > 0) {
			price = Number(selectResult[0]['price']);
			// price.debug('======price====');	
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
						type: sheetName,
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