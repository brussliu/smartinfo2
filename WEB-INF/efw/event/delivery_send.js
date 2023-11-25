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


	// 途中入库校验
	var selectResult3 = db.select(
		"DELIVERY",
		"checkLocalNum",
		{  
			shopid:  getShopId()
		}
	).getArray(); 

	var logtitle = '納品NO：'+deliveryno+' 操作：納品発送'
	if(selectResult3.length > 0 ){
		logtitle.debug('--------------------');
		ret.eval("alert('数据出现异常，不要进行任何操作，等待处理！');");  
	}  
	ret.eval("init();");
	return ret;

};
