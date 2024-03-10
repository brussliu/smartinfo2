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

	// MST_入庫仕入推奨数量情報 全体更新
	excute_m2_m4();

	// 途中入库校验
	var selectResult3 = db.select(
		"DELIVERY",
		"checkLocalNum0",
		{  
			shopid:  getShopId()
		}
	).getArray(); 
	var selectResult4 = db.select(
		"DELIVERY", 
		"checkLocalNum1",
		{  
			shopid:  getShopId()
		}
	).getSingle(); 
	var selectResult5 = db.select(
		"DELIVERY", 
		"checkLocalNum2",
		{  
			shopid:  getShopId()
		}
	).getSingle(); 

	var logtitle = '納品NO：'+deliveryno+' 操作：納品発送'
	
	if(selectResult3.length > 0 ){
		logtitle.debug('--------------------在庫数量<0');
		ret.eval("alert('数据出现异常，不要进行任何操作，等待处理！');alert('数据出现异常，不要进行任何操作，等待处理！');alert('数据出现异常，不要进行任何操作，等待处理！');");  
	} 

	if(selectResult4['ct1'] != selectResult5['ct2'] ){
		logtitle.debug('--------------------在庫数量不一致');
		ret.eval("alert('数据出现异常，不要进行任何操作，等待处理！');alert('数据出现异常，不要进行任何操作，等待处理！');alert('数据出现异常，不要进行任何操作，等待处理！');");  
	}

	ret.eval("init();");
	return ret;

};
