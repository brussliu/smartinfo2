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

	"#file_proContent": null,
	"#text_track": null,
	//"#purchaseno": null,
	"#opt": null,
};

purchase_save.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	params.debug("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");

	// 操作区分
	var opt = params["#opt"];
	// // 仕入NO
	// var date = params["#purchaseno"];
	var newpurchaseno = new Date().format("yyyyMMdd-HHmmss");
	var purchaseno = params["#td_no"];
	// 仕入名称
	var purchase = params["#text_purchase"];
	// 発送方式
	var ship = params["#opt_ship"];
	// 発送日１
	var forwarddate1 = params["#date_forwarddate1"];
	// 発送日２
	var forwarddate2 = params["#date_forwarddate2"];
	// 完了日
	var completiondate = params["#date_completiondate"];
	// 商品費用
	var productamountRMB = params["#number_productamountRMB"];
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
	var proContent = params["#file_proContent"];
	if (opt == 'new' && (proContent == null || proContent == '')) {
		ret.eval("alert('仕入内容を添付してください！')");
		return ret;
	}

	// 追跡番号
	var track = params["#text_track"];

	// 新規の場合
	if (opt == 'new') {

		// TRN_仕入管理保存
		var selectResult = db.change(
			"PURCHASE",
			"insertpurchase",
			{
				purchaseno: newpurchaseno,
				purchase: purchase,
				ship: ship,

				// count: count,
				// money: money,
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
		
		importProContent(proContent, newpurchaseno , 2);


	// 更新の場合 
	}else if (opt == 'update') {

		// ステータス
		var selectResult = db.select(
			"PURCHASE",
			"seachPurchaseStatus",
			{
				purchaseno:purchaseno,
				shopid: getShopId()

			}
		).getSingle();

		var status = selectResult["status"];

		// 更新TRN_仕入管理
		var selectResult = db.change(
			"PURCHASE",
			"updatepurchase",
			{
				purchaseno: purchaseno,
				purchase: purchase,
				ship: ship,

				// count: count,
				// money: money,
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


		if (proContent != null && proContent == '') {

			// 新規の場合、明細のみ導入
			if(status == "1.新　規"){

				// 明細導入
				importProContent(proContent, purchaseno , 2);
			}

			// 発送済の場合、途中計上を削除し、導入して、再度途中に計上する
			if(status == "2.発送済"){

				// 途中在庫から除く
				var updateResult = db.change(
					"PURCHASE",
					"removeStockFromShip",
					{
						purchaseno: purchaseno,
						shopid: getShopId()
					}
				);

				// 明細導入
				importProContent(proContent, purchaseno , 2);

				// 途中在庫へ計上
				var updateResult = db.change(
					"PURCHASE",
					"allocateStockToShip",
					{
						purchaseno: purchaseno,
						shopid: getShopId()
					}
				);

			}

			// 受取済の場合、LOCALから削除し、導入して、再度LOCALに計上する
			if(status == "3.仕入済"){

				// Local在庫から除く
				var updateResult = db.change(
					"PURCHASE",
					"removeStockFromLocal",
					{
						purchaseno: purchaseno,
						shopid: getShopId()
					}
				);

				// 明細導入
				importProContent(proContent, purchaseno , 2);

				// Local在庫へ計上
				var updateResult = db.change(
					"PURCHASE",
					"allocateStockToLocal",
					{
						purchaseno: purchaseno,
						shopid: getShopId()
					}
				);
				
			}

		}


	}


	if (proContent != null && proContent == '') {
		// 数量合計、金額合計を更新
		var countResult = db.change(
			"PURCHASE",
			"updateCountAndAmount",
			{
				purchaseno: purchaseno,
				shopid: getShopId()
			}
		).getArray();
	}

	ret.eval("purchase_detail_inputdialog.dialog('close');");
	ret.eval("init();");
	// 画面へ結果を返す
	return ret;

};


// sl:根据单位确认左右的值
function unit(unit, cny, jpy) {
	var zh;

	if (unit == "CNY") {

		zh = cny;
		cny = jpy;
		jpy = zh;
	}
}