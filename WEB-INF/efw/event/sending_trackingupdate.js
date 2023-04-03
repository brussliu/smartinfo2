var sending_trackingupdate = {};
sending_trackingupdate.name = "発送情報更新追跡番号";
sending_trackingupdate.paramsFormat = {
	"arr": null
};

sending_trackingupdate.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var arr = params["arr"];

 
 
	for(var i=0;i<arr.length;i++){
		var key = parseInt(arr[i]);
		var value = arr[i+1];
 

		var updateResult = db.change(
			"SENDING",
			"updatetrackno",
			{
				key:key,
				value: value,
				shopid: getShopId()
			}
		);
		i++;
	}

	ret.eval('init();')
	ret.eval('choice("0");')
	return ret;
};