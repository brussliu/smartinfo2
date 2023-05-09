var labelprinting_del = {};
labelprinting_del.name = "LABEL印刷削除";
labelprinting_del.paramsFormat = {

	"productno": null,
	"sub1": null,
	"sub2": null,
	"label": null, 

};

labelprinting_del.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var productno = params["productno"];
	var sub1 = params["sub1"]  == '‐‐‐‐' ? '' :params["sub1"];
	var sub2 = params["sub2"] == '‐‐‐‐' ? '' :params["sub2"];
	var label = params["label"];
	 

 
	var changeResult = db.change(
		"LABELPRINTING",
		"deletelabelprinting",
		{
			"shopid": getShopId(),

			"productno": productno,
			"sub1": sub1,
			"sub2": sub2,
			"label": label, 
		}
	)

		ret.eval("$('#btn_del').attr('disabled',true);")
		ret.eval("$('#btn_reserve').attr('disabled',true);")
	return ret;

};

 