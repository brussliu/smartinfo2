var delivery_update = {};
delivery_update.name = "納品更新ボタン押下";
delivery_update.paramsFormat = {
	"deliveryno": null, 
	"#text_name": null,
	"#file_deliveryfile": null

};

delivery_update.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// 納品NO
	var deliveryno = params["deliveryno"];
	// 納品名称
	var names = params["#text_name"];
	// 	納品ファイル
	var deliveryfile = params["#file_deliveryfile"];

	if(deliveryfile != null && deliveryfile != "" && typeof(deliveryfile) !="undefined"){

		// 明細導入
		importProContent(deliveryfile, deliveryno ,1);
 
 	}

	// TRN_納品管理更新
	var selectResult2 = db.change(
		"DELIVERY",
		"updatedelivery",
		{
			no: deliveryno,
			names: names,
			shopid: getShopId()
		}
	);
 
	// 新規数量更新
	var selectResult2 = db.change(
		"DELIVERY",
		"updateDeliveryNew",
		{
			no: deliveryno,
			shopid: getShopId()
		}
	);
	
	// 納品内容更新
	var selectResult = db.select(
		"DELIVERY",
		"queryDeliveryContent",
		{
			no: deliveryno,
			shopid: getShopId()
		}
	).getSingle();

	var content = selectResult["no"];

	var updateResult = db.change(
		"DELIVERY",
		"updateDeliveryContent",
		{
			no: deliveryno,
			content: content,
			shopid: getShopId()
		}
	);

	ret.eval("$('#text_name').val('');");
	ret.eval("$('#file_deliveryfile').val('');");
	ret.eval("init();");
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

	var logtitle = '納品NO：'+deliveryno+' 操作：納品更新'
	if(selectResult3.length > 0 ){
		logtitle.debug('--------------------在庫数量<0');
		ret.eval("alert('数据出现异常，不要进行任何操作，等待处理！');alert('数据出现异常，不要进行任何操作，等待处理！');alert('数据出现异常，不要进行任何操作，等待处理！');");  
	} 

	if(selectResult4['ct1'] != selectResult5['ct2'] ){
		logtitle.debug('--------------------在庫数量不一致');
		ret.eval("alert('数据出现异常，不要进行任何操作，等待处理！');alert('数据出现异常，不要进行任何操作，等待处理！');alert('数据出现异常，不要进行任何操作，等待处理！');");  
	}
   
	// 画面へ結果を返す
	return ret;

};

