var sending_queryproductsub = {};
sending_queryproductsub.name = "発送情報管理画面";
sending_queryproductsub.paramsFormat = {
	"#select_product":null,
	"#select_sub1":null,
	"#select_sub2":null,
	"opt":null
};
 
sending_queryproductsub.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// 商品管理番号
	var product = params["#select_product"];
	// 分類１
	var sub1 = params["#select_sub1"];
	// 分類２
	var sub2 = params["#select_sub2"];
	// 操作区分（商品管理番号⇒0　分類１⇒1　分類２⇒2）
	var opt = params["opt"];

	// product.debug("PPPPPPPPPPPPPPPPPPPPPPPPPPPPPPPP");
	// sub1.debug("111111111111111111111111111111111111");
	// sub2.debug("222222222222222222222222222222222222");
	// 商品管理番号を選択する場合
	if(opt == '0'){

		ret.runat("#select_sub1").remove(".option");
		ret.runat("#select_sub2").remove(".option");

		ret.runat("#sending_inputdialog").withdata( {"#text_productname":null});

		if(product != null && product != ''){

			var selectResult1 = db.select(
				"SENDING",
				"searchsub1",
				{
					"product":product,
					"shopid": getShopId(),
				}
			).getArray();

			if(selectResult1.length > 0){
				var resultHTML1 = "<option value='{sub1}'class='option' >{sub1}</option>";
				ret.runat("#select_sub1").append(resultHTML1).withdata(selectResult1);

				// 一つ結果のみの場合
				if(selectResult1.length == 1){

					sub1 = selectResult1[0]["sub1"] == '‐‐‐‐' ? null : selectResult1[0]["sub1"];

					ret.eval("$('#select_sub1').get(0).selectedIndex = 1;");
					//ret.eval("$('#select_sub1').find(\"option:contains('" + sub1 + "')\").attr('selected',true);");

					var selectResult2 = db.select(
						"SENDING",
						"searchsub2Bysub1",
						{
							"product":product,
							"sub1":sub1,
							"shopid": getShopId(),
						}
					).getArray();
				 
					if(selectResult2.length > 0){
			
						var resultHTML2 = "<option value='{sub2}'class='option' >{sub2}</option>";
						ret.runat("#select_sub2").append(resultHTML2).withdata(selectResult2);

						if(selectResult2.length == 1){

							//sub2 = selectResult2[0]["sub2"];
							sub2 = selectResult1[0]["sub2"] == '‐‐‐‐' ? null : selectResult1[0]["sub2"];

							ret.eval("$('#select_sub2').get(0).selectedIndex = 1;");
							//ret.eval("$('#select_sub2').find(\"option:contains('" + sub2 + "')\").attr('selected',true);");

							var selectResult3 = db.select(
								"SENDING",
								"searchProductByAsinSku",
								{
									"product":product,
									"sub1":sub1,
									"sub2":sub2,
									"shopid": getShopId(),
								}
							).getSingle();
					 
							ret.runat("#sending_inputdialog").withdata( {"#text_productname":selectResult3["productname"]});
						}
			
					}

				}
			}
				
		}		
	}

	if(opt == '1'){

		ret.runat("#sending_inputdialog").withdata( {"#text_productname":null});
	
		ret.runat("#select_sub2").remove(".option");

		var selectResult2 = db.select(
			"SENDING",
			"searchsub2Bysub1",
			{
				"product":product,
				"sub1":sub1,
				"shopid": getShopId(),
			}
		).getArray();
	 
		if(selectResult2.length > 0){

			var resultHTML2 = "<option value='{sub2}'class='option' >{sub2}</option>";
			ret.runat("#select_sub2").append(resultHTML2).withdata(selectResult2); 

			if(selectResult2.length == 1){

				sub2 = selectResult2[0]["sub2"];

				ret.eval("$('#select_sub2').get(0).selectedIndex = 1;");
				//ret.eval("$('#select_sub2').find(\"option:contains('" + sub2 + "')\").attr('selected',true);");

				var selectResult3 = db.select(
					"SENDING",
					"searchProductByAsinSku",
					{
						"product":product,
						"sub1":sub1,
						"sub2":sub2,
						"shopid": getShopId(),
					}
				).getSingle();
		 
				ret.runat("#sending_inputdialog").withdata( {"#text_productname":selectResult3["productname"]});
			}

		}
		// else{

			
		// 	var selectResult = db.select(
		// 		"SENDING",
		// 		"searchProductByAsinSku",
		// 		{
		// 			"product":product,
		// 			"sub1":sub1,
		// 			"sub2":sub2,
		// 			"shopid": getShopId(),
		// 		}
		// 	).getSingle();
	 
		// 	ret.runat("#sending_inputdialog").withdata( {"#text_productname":selectResult["productname"],})
		// }
	}

	if(opt == '2'){

		ret.runat("#sending_inputdialog").withdata( {"#text_productname":null});
		
		var selectResult = db.select(
			"SENDING",
			"searchProductByAsinSku",
			{
				"product":product,
				"sub1":sub1,
				"sub2":sub2,
				"shopid": getShopId(),
			}
		).getSingle();
 
		ret.runat("#sending_inputdialog").withdata( {"#text_productname":selectResult["productname"]});

	}
	return ret;
};