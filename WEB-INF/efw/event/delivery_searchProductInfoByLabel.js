var delivery_searchProductInfoByLabel={};
delivery_searchProductInfoByLabel.name="商品ラベルで商品情報検索";
delivery_searchProductInfoByLabel.paramsFormat={

	"labelno": null

};
delivery_searchProductInfoByLabel.fire=function(params){

	var ret = new Result();

 
	var labelno = params["labelno"];

	var selectResult = db.select(
		"DELIVERY",
		"searchProductInfo",
		{
			labelno:labelno,
			shopid: getShopId()
		}
	).getArray();

	if(selectResult.length > 0){
		var pno = selectResult[0]["pno"];
		var sub1 = selectResult[0]["sub1"];
		var sub2 = selectResult[0]["sub2"];
		var sku = selectResult[0]["sku"];
		var asin = selectResult[0]["asin"];
		var label = selectResult[0]["label"];
		var script = "displayToTable('" + pno + "','" + sub1 + "','" + sub2 + "','" + asin + "','" + sku +"','" + label + "');";
	}else{

		var script = "errorMsg();";
	}


	return ret.eval(script);


};
