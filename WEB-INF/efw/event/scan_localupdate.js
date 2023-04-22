var scan_localupdate = {};
scan_localupdate.name = "商品スキャン在庫更新";
scan_localupdate.paramsFormat = {
	"objectArray" : null,
	"insertArray" : null,
	"#select_listno":null
};
 
scan_localupdate.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var objectArray = params["objectArray"];
	var insertArray = params["insertArray"];
	var listno = params["#select_listno"];

	if(objectArray != null || objectArray != ''){
		for(var i =0; i<objectArray.length;i++){
			var jsons = JSON.parse(objectArray[i]);
			var productno = jsons.productno;
			var sub1 = jsons.sub1;
			var sub2 = jsons.sub2;
			var asin = jsons.asin;
			var sku = jsons.sku;
			var label = jsons.label;
			var inventorynum = jsons.inventorynum;
			if(inventorynum == null || inventorynum == ''){
					ret.eval('alter("リストNO IS NULL")');
					
					return ret;
			}else{ 
				var updateResult = db.change(
					"SCAN",
					"updateProductLocal",
					{
						"productno":productno,
						"sub1":sub1,
						"sub2":sub2,
						"asin":asin,
						"sku":sku,
						"label":label,
						"inventorynum":parseInt(inventorynum),
						"shopid": getShopId()
					}
				);
						
			}
		 
		}
	}

	if(insertArray != null || insertArray != ''){
		for(var i =0; i < insertArray.length; i++){
			var jsons = JSON.parse(insertArray[i]);
			var productno = jsons.productno;
			var sub1 = jsons.sub1;
			var sub2 = jsons.sub2;
			var asin = jsons.asin;
			var sku = jsons.sku;
			var label = jsons.label;
			var inventorynum = jsons.inventorynum;

			
			var insertResult = db.change(
				"SCAN",
				"insertProductLocal",
				{
					"productno":productno,
					"sub1":sub1,
					"sub2":sub2,
					"asin":asin,
					"sku":sku,
					"label":label,
					"inventorynum":parseInt(inventorynum),
					"shopid": getShopId()
				}
			);
	 
		
		}
	}

	if(listno != null || listno != ''){
		var updateResult = db.change(
			"SCAN",
			"updateProductDetailStatus",
			{
				"listno":listno,
				"shopid": getShopId()
			}
		);
	}


	ret.eval("init();");
	ret.eval("choice('init');");
	ret.eval("scan_inventory_inputdialog.dialog('close');");

	return ret;
};