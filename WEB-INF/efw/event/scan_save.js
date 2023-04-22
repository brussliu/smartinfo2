var scan_save={};
scan_save.name="商品スキャン画面保存";
scan_save.paramsFormat={
	"tableArr": null,
	"#text_name": null,
	"#opt": null,
	"listno":null,
};
scan_save.fire=function(params){

	var ret = new Result();
	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var opt = params["#opt"];

	var name = params["#text_name"];
	var tableArr = params["tableArr"];
	
	if(opt == 'new'){
		var dates = new Date().format("yyyyMMdd-HHmmss");

		for(var i =0; i<tableArr.length;i++){
	 
			var jsons = JSON.parse(tableArr[i]);
			var label = jsons.label;
			var num = jsons.num;
		 
			var insertResult = db.change(
				"SCAN",
				"insertProductDetail1",
				{
					"listno":dates,
					"label":label,
					"num":parseInt(num),
					"shopid": getShopId()
				}
			);
		 
		}
			var insertResult = db.change(
				"SCAN",
				"insertProduct",
				{
					"listno":dates,
					"name":name,
					"shopid": getShopId()
				}
			);
 
	}

	if(opt == 'update'){
		var listno = params["listno"];

		// 删除明细
		var delResult = db.change(
			"SCAN",
			"delProductDetail",
			{
				"listno":listno,
				"shopid": getShopId()
			}
		);

		// 新规明细
		for(var i =0; i<tableArr.length;i++){
	 
			var jsons = JSON.parse(tableArr[i]);
			var label = jsons.label;
			var num = jsons.num;
		 
			var insertResult = db.change(
				"SCAN",
				"insertProductDetail1",
				{
					"listno":listno,
					"label":label,
					"num":parseInt(num),
					"shopid": getShopId()
				}
			);
 
		}

		// 更新商品list
		var updateResult = db.change(
			"SCAN",
			"updateProductByListno",
			{
				"listno":listno,
				"name":name,
				"shopid": getShopId()
			}
		);
	 

	}
	
	ret.eval("init();");
	ret.eval("choice('init');");
	ret.eval("scan_inputdialog.dialog('close');");
	return ret;


};
