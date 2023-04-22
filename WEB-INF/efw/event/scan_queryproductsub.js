var scan_queryproductsub = {};
scan_queryproductsub.name = "商品スキャン检索";
scan_queryproductsub.paramsFormat = {
	"#select_productno":null,
	"#select_sub1":null,
	"#select_sub2":null,
	"opt":null,
	"#select_listno":null,
	"#subflg":null
};
 
	// 棚卸対象列表tr
	var objecttHTML ='<tr>' +
	'<td style="width: 90px;">{productno}</td>' +
	'<td style="width: 160px;">{sub1}</td>' +
	'<td style="width: 160px;">{sub2}</td>' +
	'<td style="width: 120px;">{asin}</td>' +
	'<td style="width: 150px;">{sku}</td>' +
	'<td style="width: 120px;">{label}</td>' +
	'<td style="width: 80px;">{num}</td>' +
	'<td style="width: 100px;">{inventorynum}</td>' +
	'</tr>'

	// 棚卸対象新规列表tr
	var insertobject ='<tr class="tr_pink">' +
	'<td style="width: 90px;">{productno}</td>' +
	'<td style="width: 160px;">{sub1}</td>' +
	'<td style="width: 160px;">{sub2}</td>' +
	'<td style="width: 120px;">{asin}</td>' +
	'<td style="width: 150px;">{sku}</td>' +
	'<td style="width: 120px;">{label}</td>' +
	'<td style="width: 80px;">{num}</td>' +
	'<td style="width: 100px;">{inventorynum}</td>' +
	'</tr>'

	// 棚卸結果列表tr
	var resultHTML ='<tr>' +
	'<td style="width: 90px;">{productno}</td>' +
	'<td style="width: 160px;">{sub1}</td>' +
	'<td style="width: 160px;">{sub2}</td>' +
	'<td style="width: 120px;">{asin}</td>' +
	'<td style="width: 150px;">{sku}</td>' +
	'<td style="width: 120px;">{label}</td>' +
	'<td style="width: 80px;">{num}</td>' +
	'</tr>'

scan_queryproductsub.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// 商品管理番号
	var product = params["#select_productno"];

	// 操作区分（商品管理番号⇒0　分類１⇒1　分類２⇒2）
	var opt = params["opt"];
	// リストNO
	var listno = params["#select_listno"];

	var shopid = getShopId();
	// 商品管理番号を選択する場合
	if(opt == '0'){
  
		if(product != null && product != ''){
  
			// 当listno为空时
			if(listno == null || listno == ''){

				selectobjecttHTML( ret , product ,shopid);

				ret.eval('$("#select_listno").attr("disabled", false);')
				ret.eval('$("#btn_localupdate").attr("disabled", true);')
			}else{
					// 1.获取结果listno的所有label番号 和数量，
					var selectResult2 = db.select(
						"SCAN",
						"queryProductDetailByListno_2",
						{
							"listno" : listno,
							"shopid": getShopId()
						}
					).getArray();
  
				// 判断是否存在其他商品管理番号
				var productnoFlg = false;

				if(selectResult2 != null && selectResult2 != ''){
					for(var k = 0; k < selectResult2.length ;k++){
						if(selectResult2[k]["productno"] != product){
							productnoFlg = true;
						}
					}
					if(productnoFlg){

						selectobjecttHTML( ret , product ,shopid);

						ret.eval('$("#select_listno").attr("disabled", false);')
						ret.eval('$("#btn_localupdate").attr("disabled", true);')
						return ret ;
					}else{
						var selectResult = db.select(
							"SCAN",
							"searchProduct_0_1",
							{
								"listno" :listno,
								"product":product,
								"shopid": getShopId(),
							}
						).getArray();

						ret.runat("#inventoryReturnTable").remove("tr").append(resultHTML).withdata(selectResult2);
					
						// 3.在对象list中逐个比对 
						comparison( selectResult , selectResult2 , ret  );
						//  4. 更新合计数量
						changeNum(ret , listno , getShopId() );
						
						ret.eval('$("#select_listno").attr("disabled", false);')
						ret.eval('$("#btn_localupdate").attr("disabled", false);')
					}

				} else{

					selectobjecttHTML( ret , product ,shopid);

					ret.eval('$("#select_listno").attr("disabled", false);')
					ret.eval('$("#btn_localupdate").attr("disabled", true);')
				}
		 
			}
	 
			
		 
		}else{

			ret.runat("#inventoryObjectTable").remove("tr");//棚卸対象list
			ret.runat("#inventoryReturnTable").remove("tr");//棚卸結果list
			ret.eval("$('#select_listno').get(0).selectedIndex = 0;");//リストNO
			ret.runat("#scan_inventory_inputdialog").withdata( {"#td_name":null ,"#td_num":null});//リスト名称,合計数量
			
			ret.eval('$("#select_listno").attr("disabled", true);')
			ret.eval('$("#btn_localupdate").attr("disabled", true);')
		}

		
	}


	//更新リストNO
	if(opt == '3'){

		//  productno 条件判断
		if(listno == null || listno == ''){
		// リストNO 为空时
			// 1.清空棚卸结果list
			ret.runat("#inventoryReturnTable").remove("tr");
			ret.eval('$("#btn_localupdate").attr("disabled", true);')
			ret.eval('$("#td_name").html("");');
			ret.eval('$("#td_num").html("");');
			// 2.根据当前product 查询棚卸对象
				 
			selectobjecttHTML( ret , product ,shopid);
		}else{
			
			// 	获取リスト名称
			var selectResult3 = db.select(
				"SCAN",
				"searchProductNameByListno",
				{
					"listno": listno,
					"shopid": getShopId()
				}
			).getSingle();
			ret.eval('$("#td_name").html("'+selectResult3["name"]+'");');	

			//   更新合计数量
			changeNum(ret , listno , getShopId() );

			// 获取结果listno 
			var selectResult2 = db.select(
				"SCAN",
				"queryProductDetailByListno_2",
				{
					"listno" : listno,
					"shopid": getShopId()
				}
			).getArray();
			ret.runat("#inventoryReturnTable").remove("tr").append(resultHTML).withdata(selectResult2);


			

			// 判断是否存在其他商品管理番号
			var productnoFlg = false;

			if(selectResult2 != null && selectResult2 != ''){
				for(var k = 0; k < selectResult2.length ;k++){
					if(selectResult2[k]["productno"] != product){
						productnoFlg = true;
					}
				}
				if(productnoFlg){

					selectobjecttHTML( ret , product ,shopid);
					
					ret.eval('$("#btn_localupdate").attr("disabled", true);')
				 
					
					return ret ;
				}else{
					// 条件查询对象list 棚改数量默认为0
					 var selectResult = db.select(
						"SCAN",
						"searchProduct_0_1",
						{
							"listno" :listno,
							"product":product,
							"shopid": getShopId(),
						}
					).getArray();
					// 3.在对象list中逐个比对 
						comparison( selectResult , selectResult2 , ret  );
						ret.eval('$("#btn_localupdate").attr("disabled", false);')
				}
				
			}else{
				ret.eval('$("#td_name").html("");');
				ret.eval('$("#td_num").html("");');
				ret.runat("#inventoryReturnTable").remove("tr");
				ret.eval('$("#btn_localupdate").attr("disabled", true);')
				
			}
			
		}

	}

	return ret;
};
// 对比
function comparison( selectResult , selectResult2 , ret  ){
	var insertArray = new Array();
	// 3.2 循环比对
	for(var i=0;i< selectResult2.length;i++){
		// 判断在库中是否不存在
		var ex = true;
		// 记录下标值
		var index = -1;

		for( var j = 0; j<selectResult.length;j++){
			// 查到相同的了
			if(selectResult2[i]["label"] == selectResult[j]["label"]){
				selectResult[j]["inventorynum"] = selectResult2[i]["num"]
				ex = false;
				index = -1;
				break;
			}
		}
  
		// 添加到新规list
		if(ex){
			index = i;
			// 获取了下标值
			if(index >=0){
				 
				// 获取该条数据的值
				var t = selectResult2[index];
			 
				// 在该条结果中插入数量值-0
				var temp={"productno": t["productno"],"sub1": t["sub1"]
						,"sub2": t["sub2"],"asin": t["asin"],"sku": t["sku"]
						,"label": t["label"],"num": 0,"inventorynum": t["num"]}
													 
				// 将该条数据加入自定义list中
				insertArray.push(temp)
			 
			}
		}
	}
	ret.runat("#inventoryObjectTable").remove("tr").append(insertobject).withdata(insertArray);
	ret.runat("#inventoryObjectTable").append(objecttHTML).withdata(selectResult);
}

// 更新合计数量
function changeNum(ret , listno , shopid){
	var selectResult4 = db.select(
		"SCAN",
		"searchProductNumByListno",
		{
			"listno": listno,
			"shopid": shopid
		}
	).getSingle();	
	ret.eval('$("#td_num").html("'+selectResult4["num"]+'");');
}
 
function selectobjecttHTML( ret , product , shopid){
	// 检索所有商品信息-棚卸対象
	var selectResult1 = db.select(
		"SCAN",
		"searchProduct_0",
		{
			"product":product,
			"shopid": shopid,
		}
	).getArray();

	ret.runat("#inventoryObjectTable").remove("tr").append(objecttHTML).withdata(selectResult1);

}