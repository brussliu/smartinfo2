var cost_save={};

cost_save.name="保存画面";
cost_save.paramsFormat={
	"#td_registrationdate":null,
	"#opt_status":null,
	"#txt_accrualdate":null,
	"#txt_classification":null,
	"#txt_title":null,
	"#txt_account":null,
	"#opt_currency":null,
	"#txt_exchangerate":null,
	"#txt_remarks":null,
	"#opt":null,
	"updateKey":null,
	"type":null
};

 
cost_save.fire=function(params){
	
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
	// 区分
	var type = params["type"];
	// ステータス
	var status=params["#opt_status"];
	// 発生日
	var newDate = new Date(params["#txt_accrualdate"]);	
	// 分類
	var classification=params["#txt_classification"];
	// タイトル
	var title=params["#txt_title"];
	// 金額
	var account = parseFloat(params["#txt_account"])==null?0.00:params["#txt_account"];
	// 円or元
	var currency = params["#opt_currency"];
	// 為替レート
	var exchangerate= parseFloat(params["#txt_exchangerate"])==null?0.00:params["#txt_exchangerate"];
	// 備考
	var remarks=params["#txt_remarks"];

	var opt=params["#opt"];

	if(opt == "NEW"){

		var jpy = null;
		var cny = null;
	
		if(currency == "JPY" && exchangerate != null && exchangerate != '' && account != null){

			jpy =  account;
			cny = jpy * parseFloat(exchangerate) / 100;

		}

		if(currency == "CNY" && exchangerate != null && exchangerate != ''  && account != null){

			cny =  account;
			jpy = cny / parseFloat(exchangerate) * 100;

		}

		var selectResult = db.change(
			"COST",
			"insertCostInfo",
			{
				col1 : type,
				col2 : newDate,
				col3 : status,
				col4 : classification,
				col5 : title,
				col6 : cny,
				col7 : jpy,
				col8 : exchangerate,
				col9 : remarks,
				col10 :getShopId(),	
				
			}
		);
	 
	}

	if(opt == "UPDATE"){
		var updateKey= params["updateKey"];
		var jpy = null;
		var cny = null;
	
		if(currency == "JPY" && exchangerate != null && exchangerate != ''  && account != null){

			jpy = account;
			cny = jpy * parseFloat(exchangerate) / 100;
		}

		if(currency == "CNY" && exchangerate != null && exchangerate != ''  && account != null){
			cny = account;
			jpy = cny / parseFloat(exchangerate) * 100;
		}

			var updateResult = db.change(
				"COST",
				"updateCostInfo",
				{	
					col1 : type,
					col2 : newDate,
					col3 : status,
					col4 : classification,
					col5 : title,
					col6 : cny,
					col7 : jpy,
					col8 : exchangerate,
					col9 : remarks,
					updateKey : updateKey,
					shopid : getShopId(),
				}
			);

	}

	// 画面へ結果を返す
	ret.eval("cost_inputdialog.dialog('close');");

	return ret.navigate("cost.jsp");

};
