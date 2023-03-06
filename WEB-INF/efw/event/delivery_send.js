var delivery_send = {};
delivery_send.name = "納品発送ボタン押下";
delivery_send.paramsFormat = {
	"no": null

};

delivery_send.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };


	var no = params["no"];

	// 更新LOCAL数量-minus
	var update = db.change(
		"DELIVERY",
		"removeDeliveryFromLocal",
		{
			no: no,
			shopid: getShopId()
		}
	);

	// 更新途中在庫_入庫数量-add
	var update = db.change(
		"DELIVERY",
		"allocateDeliveryToShip",
		{
			no: no,
			shopid: getShopId()
		}
	);
 
	// 更新纳品管理発送数量
	var updateResult = db.change(
		"DELIVERY",
		"updateDeliverySend",
		{
			no: no,
			shopid: getShopId()
		}
	);


	// 画面へ結果を返す

	ret.eval("init();");
	ret.eval("choice('');");
	return ret;

};
