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
};

 
cost_save.fire=function(params){
	
	var ret = new Result();

	// セッションチェック
	sessionCheck(ret);

	if(params["#opt"] == "NEW"){
		var jpy = null;
		var cny = null;
		params["#opt"].debug("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
		
	if(params["#opt_currency"] == "JPY" && params["#txt_exchangerate"] != null && params["#txt_account"] != null){
		jpy = parseFloat(params["#txt_account"]);
		jpy.debug("----------------------------------------------------");
		cny = jpy * parseFloat(params["#txt_exchangerate"]) / 100;
	}
	if(params["#opt_currency"] == "CNY" && params["#txt_exchangerate"] != null && params["#txt_account"] != null){
		cny = parseFloat(params["#txt_account"]);
		cny.debug("-1---1----1-----1------1---------1----------1-----1-----1---");
		jpy = cny / parseFloat(params["#txt_exchangerate"]) * 100;
	}

	// var arys = new Array();
	// arys = params["#txt_accrualdate"].split('/');
	
	var newDate = new Date(params["#txt_accrualdate"]);
	

	var selectResult = db.change(
		"COST",
		"insertCostInfo",
		{
			col2 : newDate,
			col3 : params["#opt_status"],
			col4 : params["#txt_classification"],
			col5 : params["#txt_title"],
			col6 : cny,
			col7 : jpy,
			col8 : parseFloat(params["#txt_exchangerate"]),
			col9 : params["#txt_remarks"],
			col10 :getShopId(),	
			
		}
	);
	}
	if(params["#opt"] == "UPDATE"){
		params["#opt"].debug("UPDATE>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
		var jpy = null;
		var cny = null;
	
	if(params["#opt_currency"] == "JPY" && params["#txt_exchangerate"] != null && params["#txt_account"] != null){
		jpy = parseFloat(params["#txt_account"]);
		jpy.debug("----------------------------------------------------");
		cny = jpy * parseFloat(params["#txt_exchangerate"]) / 100;
	}
	if(params["#opt_currency"] == "CNY" && params["#txt_exchangerate"] != null && params["#txt_account"] != null){
		cny = parseFloat(params["#txt_account"]);
		cny.debug("-1---1----1-----1------1---------1----------1-----1-----1---");
		jpy = cny / parseFloat(params["#txt_exchangerate"]) * 100;
	}

	var newDate = new Date(params["#txt_accrualdate"]);

		var updateResult = db.change(
			"COST",
			"updateCostInfo",
			{
				col2 : newDate,
				col3 : params["#opt_status"],
				col4 : params["#txt_classification"],
				col5 : params["#txt_title"],
				col6 : cny,
				col7 : jpy,
				col8 : parseFloat(params["#txt_exchangerate"]),
				col9 : params["#txt_remarks"],
				updateKey : params["updateKey"],
				shopid : getShopId(),
			}
		);
	}

	

 
	

	

	// ret.runat("#stocktable").remove("tr").append(resultHTML).withdata(selectResult);

	// var script = "$('.c_detail_header').show();$('.c_detail_content').show();";
	// ret.eval(script);

	// 画面へ結果を返す
	ret.eval("cost_inputdialog.dialog('close');");

	return ret.navigate("cost.jsp");

};
