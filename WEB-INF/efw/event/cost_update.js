var cost_update = {};
cost_update.name = "更新情報画面表示";
cost_update.paramsFormat = {
	// "#td_registrationdate":null,
	// "#opt_status":null,
	// "#txt_accrualdate":null,
	// "#txt_classification":null,
	// "#txt_title":null,
	// "#txt_account":null,
	// "#opt_currency":null,
	// "#txt_exchangerate":null,
	// "#txt_remarks":null,
	"updateKey":null,

};

cost_update.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };


	// var selectResult = db.change(
	// 	"COST",
	// 	"updateCostInfo",
	// 	{
	// 		col2 : newDate,
	// 		col3 : params["#opt_status"],
	// 		col4 : params["#txt_classification"],
	// 		col5 : params["#txt_title"],
	// 		col6 : cny,
	// 		col7 : jpy,
	// 		col8 : parseFloat(params["#txt_exchangerate"]),
	// 		col9 : params["#txt_remarks"],
	// 		col10 :getShopId(),
		
	// 	}
	// );
    
	// var selectResult = db.change(
	// 	"COST",
	// 	"selectCostInfo",
	// 	{
	// 		updateKey : params["updateKey"],
	// 		shopid : getShopId(),
		
	// 	}
	// );
	// params.debug("99999999999999999999999999999999999999999999999999999999999");
	var selectResult = db.select(
		"COST",
		"selectCostInfo",
		{
			updateKey : params["updateKey"],
			shopid : getShopId(),
			
		}
	).getSingle();
	selectResult.debug(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");

	ret.runat("#cost_inputdialog")
	.withdata(
		{ 
			"#td_registrationdate":selectResult["登録日"].format("yyyy/MM/dd HH:mm:ss"),
			"#txt_title":selectResult["タイトル"],
			"#txt_remarks":selectResult["備考"],
			"#txt_accrualdate":(selectResult["発生日"]).format("yyyy/MM/dd"),
			"#opt_status":selectResult["ステータス"],
			"#txt_classification":selectResult["分類"],
			"#txt_account":selectResult["金額（元）"],
			"#td_num":selectResult["金額（円）"] + "円",
			"#txt_exchangerate":selectResult["為替レート"],
		}
	);
	// [{"登録日":"2023-02-10T12:36:48.154Z","発生日":"2021-12-31T15:00:00.000Z","ステータス":"未支払","分類":"美工","タイトル":"2222","為替レート":5,"備考":"afa"}]
	//  {"登録日":"2023-02-10T12:36:22.405Z","発生日":"2022-12-01T15:00:00.000Z","ステータス":"未支払","分類":"資材","タイトル":"2023","為替レート":5,"備考":"sssss"}
	// 画面へ結果を返す
	return ret.eval("cost_inputdialog.dialog('open');");

};



