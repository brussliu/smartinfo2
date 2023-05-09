var labelprinting_reserve = {};
labelprinting_reserve.name = "LABEL印刷";
labelprinting_reserve.paramsFormat = {

	"tableArr": null, 

};

labelprinting_reserve.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var tableArr = params["tableArr"];

	//  清空Ali mst_label情報表
	var delResult = db.change(
		"LABELPRINTING",
		"delAliLabel",
		{
			"shopid": getShopId(),
		},
		"jdbc/efw2" 
	)
 

	if(getShopId() == 'Smart-Bear'){
		var delResult = db.change(
			"LABELPRINTING",
			"delAliSmart_bear",
			{},
			"jdbc/efw2" 
		)
 
	}
	if(tableArr != null || tableArr != ''){
		for(var i =0; i<tableArr.length;i++){
			var jsons = JSON.parse(tableArr[i]);
			var type = jsons.type;
			var productno = jsons.productno;
			var sub1 = jsons.sub1;
			var sub2 = jsons.sub2; 
			var label = jsons.label;
			var count = parseInt(jsons.count);


			// 新规Ali mst_label情報表数据
			var insertResult = db.change(
				"LABELPRINTING",
				"insertAliLabel",
				{
					"type":type,
					"productno":productno,
					"sub1":sub1,
					"sub2":sub2,
					"label":label,
					"count":count,
					"shopid": getShopId(),
				},
				"jdbc/efw2" 
			)
			 

			if(getShopId() == 'Smart-Bear'){
			
				for(var j=0; j < count; j++){
					// 新规Ali label_smart_bear表数据
					var insertResult = db.change(
						"LABELPRINTING",
						"insertAliSmart_bear",
						{ 
							"productno":productno,
							"sub1":sub1,
							"sub2":sub2,
							"label":label, 
						},
						"jdbc/efw2" 
					)
				 
				}
			}
		}
	}

 



		ret.eval("$('#btn_del').attr('disabled',true);")
		ret.eval("$('#btn_reserve').attr('disabled',true);")
		ret.eval('$("input:checkbox[name=alllabel]").prop( "checked" ,false);')
		ret.eval('init();')
	return ret;

};

 