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

		var orderno = parseInt(arr[i]);
		var trackno = arr[i+1];

		// 発送情報のステータス
		var selectResult = db.select(
			"SENDING",
			"quertstatus",
			{	
				"orderno":orderno,
				"shopid": getShopId(),
			}
		).getSingle();

		var status = selectResult["status"];

		if(status == '1.未発送'){
					// 查询是否是C.代行発送
					var selectcase = db.select(
						"SENDING",
						"querycase",
						{
							orderno:orderno,
							shopid: getShopId()
						}
					).getSingle();

					var dcase = selectcase["dcase"];
			if(dcase == 'C.代行発送'){ 
				
				// 更新代行発送詳細情報追跡番号
				var updateResult = db.change(
					"SENDING",
					"updateshipatingtrackno",
					{
						orderno:orderno,
						trackno: trackno,
						shopid: getShopId()
					}
				); 

				// 在庫数量減らす
				var updateResult = db.change(
					"SENDING",
					"updateshipatingmasterLocal",
					{
						orderno:orderno,
						shopid: getShopId()
					}
				);

			}else{
					// 检索是否存在ASIN,SKU
					var select = db.select(
						"SENDING",
						"queryAsinSku",
						{
							orderno:orderno,
							shopid: getShopId()
						}
					).getArray();

					if(select.length > 0){
						// 在庫数量減らす
						var updateResult = db.change(
							"SENDING",
							"minusLocal2",
							{
								orderno:orderno,
								shopid: getShopId()
							}
						);
					}
			}
		}

		var updateResult = db.change(
			"SENDING",
			"updatetrackno",
			{
				orderno:orderno,
				trackno: trackno,
				shopid: getShopId()
			}
		);

		i++;
	}

	ret.eval('init();')
	ret.eval('choice("0");')
	return ret;
};