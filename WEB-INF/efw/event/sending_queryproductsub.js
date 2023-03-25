var sending_queryproductsub = {};
sending_queryproductsub.name = "発送情報管理画面";
sending_queryproductsub.paramsFormat = {
	"product":null
};
 
sending_queryproductsub.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var product = params["product"];
	
	if(product != null && product != ''){

	var selectResult1 = db.select(
		"SENDING",
		"searchsub1",
		{
			"product":product,
			"shopid": getShopId(),
		}
	).getArray();

	var resultHTML1 = "<option value='{sub1}'class='option' >{sub1}</option>";
	ret.runat("#select_sub1").remove("option .option").append(resultHTML1).withdata(selectResult1);

	var selectResult2 = db.select(
		"SENDING",
		"searchsub2",
		{
			"product":product,
			"shopid": getShopId(),
		}
	).getArray();
	
	var resultHTML2 = "<option value='{sub2}'class='option' >{sub2}</option>";

	ret.runat("#select_sub2").remove("option .option").append(resultHTML2).withdata(selectResult2);
 		
	}else{
		ret.runat("#select_sub1").remove("option .option");
		ret.runat("#select_sub2").remove("option .option");
	}
	return ret;
};