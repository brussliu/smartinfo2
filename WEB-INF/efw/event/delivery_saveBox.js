var delivery_saveBox={};
delivery_saveBox.name="箱詰め情報保存";

delivery_saveBox.paramsFormat={

	"deliveryno":null,
	"#delivery_box_inputdialog":{
		"skuArr":null,
		"asinArr":null,
		"qArr":null,
	} 
};
 
/**
 * 新規或は修正の場合、保存イベント実行関数
 */
delivery_saveBox.fire=function(params){

	var ret = new Result();

	var deliveryno = params["deliveryno"];

	var skuArr = params["#delivery_box_inputdialog"]["skuArr"];

	var asinArr = params["#delivery_box_inputdialog"]["asinArr"];

	var qArr = params["#delivery_box_inputdialog"]["qArr"];

	var delResult = db.change(
		"DELIVERY",
		"deleteDeliveryContent",
		{
			no:deliveryno,
			shopid: getShopId()
		}
	);

	for(var i = 0;i < skuArr.length;i++){

		// SKU番号
		var sub_sku = skuArr[i];
		// ASIN番号
		var sub_asin = asinArr[i];
		// 数量
		var sub_q = qArr[i];

		var subInsertResult = db.change(
			"DELIVERY",
			"insertdeliverydata",
			{
				no:deliveryno,
				sku:sub_sku,
				asin:sub_asin,
				num:parseInt(sub_q),
				shopid: getShopId()
			}
		);

	}

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

	ret.eval("delivery_box_inputdialog.dialog('close');");
	return ret;

};
