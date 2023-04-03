var cost_update = {};
cost_update.name = "更新情報画面表示";
cost_update.paramsFormat = {

	"updateKey":null,

};

cost_update.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };


	var selectResult = db.select(
		"COST",
		"selectCostInfo",
		{
			updateKey : params["updateKey"],
			shopid : getShopId(),
			
		}
	).getSingle();

		var type = selectResult['type'];

	if(type == '支出'){
		ret.eval('changetype("支出");')
		ret.eval("	$('input[name=type]').removeAttr('checked');")
		ret.eval('$("#radio_type1").attr("checked","true");')
	}else{
		ret.eval('changetype("収入");')
		ret.eval("	$('input[name=type]').removeAttr('checked');")
		ret.eval('$("#radio_type2").attr("checked","true");')
	}
 
	ret.runat("#cost_inputdialog")
	.withdata(
		{ 
			"#td_registrationdate":selectResult["registrationdate"].format("yyyy/MM/dd HH:mm:ss"),
			"#txt_title":selectResult["title"],
			"#txt_remarks":selectResult["remarks"],
			"#txt_accrualdate":(selectResult["accrualdate"]).format("yyyy/MM/dd"),
			"#txt_account":isNULLs(selectResult["amountcny"] , 1),
			"#td_num":isNULLs(selectResult["amountjpy"] , 2) ,
			"#txt_exchangerate":isNULLs(selectResult["exchangerate"] , 1),
		}
	);

	ret.eval("$('#opt_status').val('" + selectResult["status"] + "');");
	ret.eval("$('#txt_classification').val('" + selectResult["classification"] + "');");
	// 画面へ結果を返す
	return ret.eval("cost_inputdialog.dialog('open');");

};



function isNULLs(val,opt){
	if(val == null){
		return '';
	}else{
		if(opt==1){
		}
		if(opt==2){
			val = val +'円';
		}
		if(opt==3){
			val = val +'元';
		}
		if(opt==4){
			val = val.format('yyyy/MM/dd');
		}
	}
	return val;
}