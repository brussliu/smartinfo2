var delivery_send = {};
delivery_send.name = "納品発送ボタン押下";
delivery_send.paramsFormat = {
	"deliveryno": null

};

delivery_send.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var deliveryno = params["deliveryno"];

	// 更新LOCAL数量-minus
	var update = db.change(
		"DELIVERY",
		"removeDeliveryFromLocal",
		{
			no: deliveryno,
			shopid: getShopId()
		}
	);

	// 更新途中在庫_入庫数量-add
	var update = db.change(
		"DELIVERY",
		"allocateDeliveryToShip",
		{
			no: deliveryno,
			shopid: getShopId()
		}
	);
 
	// 更新纳品管理発送数量
	var updateResult = db.change(
		"DELIVERY",
		"updateDeliverySend",
		{
			no: deliveryno,
			shopid: getShopId()
		}
	);


	// 画面へ結果を返す

	ret.eval("init();");
	// ret.eval("choice('');");
	return ret;

};
