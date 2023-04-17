var shipacting_pay = {};
shipacting_pay.name = "代行発送商品支払";
shipacting_pay.paramsFormat = {
	"no": null
};

shipacting_pay.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var no = params["no"];
	var shopid = getShopId();
	var state = getAuthorityInfo(shopid, 'btn-1001_04');

	if(state){
		var updateResult = db.change(
			"SHIPACTING",
			"payshipacting",
			{
				"no" : no,
				"shopid": shopid
			}
		); 
		var updateResult = db.change(
			"SHIPACTING",
			"payshipactingmaster",
			{
				"no" : no,
				"shopid": shopid
			}
		);
	}

	ret.eval("init();")
	//ret.eval("choice('init');");
	return ret;
};