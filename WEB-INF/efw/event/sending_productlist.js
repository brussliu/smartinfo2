var sending_productlist = {};
sending_productlist.name = "発送情報商品集計";
sending_productlist.paramsFormat = {
 
};

sending_productlist.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var selectResult = db.select( "SENDING", "queryproductlist", { shopid: getShopId() } ).getArray();

	ret.runat("#sendlist").remove("tr")
	
	var count = 0;//存在asin时数量
	var count1 = 0;

	// 未発送の情報を検索する
	for(var i = 0;i < selectResult.length;i ++){

		var res = new Record([selectResult[i]]).getSingle();

		if( i < selectResult.length - 1  ){
			
			// ASIN番号が存在する場合
			if(res['asin'] != null && res['asin'] != ''){
				
				// 次の商品と同じである場合
				if( res['asin'] == selectResult[i+1]['asin'] && res['sku'] == selectResult[i+1]['sku']){
					// 数量合計を計算する
					count = count+ parseInt(selectResult[i]["count"]);
					continue;
				
				}else{

					count = count+ parseInt(selectResult[i]["count"]);

					var r = db.select( "SENDING", "queryByAsinSku",
					{ 
						asin:res['asin'],
						sku:res['sku'],
						shopid: getShopId() 
					} ).getArray();
				
					var resultHTML = '<tr>' +
						'<td style="width: 100px;" class="c">{no}</td>' +
						'<td style="width: 160px;" class="l"><span class="l5">{sub1}</span></td>' +
						'<td style="width: 160px;" class="l"><span class="l5">{sub2}</span></td>' +
						'<td style="width: 120px;" class="c">{asin}</td>' +
						'<td style="width: 150px;" class="c">{sku}</td>' +
						'<td style="width: 120px;" class="c">{label}</td>' +
						'<td style="width: 80px;" class="r"><span class="r5">'+count+'</span></td>' +
						'</tr>'
					
					ret.runat("#sendlist").append(resultHTML).withdata(r);
					count = 0;
				}

			}else{

				count1 = count1 + parseInt(selectResult[i]["count"]);

				if(selectResult[i]['productname'] == selectResult[i+1]['productname']){

					count1 = count1 + parseInt(selectResult[i]["count"]);
					continue;

				}else{

					count1 = count1 + parseInt(selectResult[i]["count"]);
					var res2 = new Record([selectResult[i]]).getArray();
					var resultHTML = '<tr>' +
					'<td colspan="6" style="width: 815px;" class="l"><span class="l5">{productname}</span></td>' +
					'<td style="width: 80px;" class="r"><span class="r5">'+count1+'</span></td>' +
					'</tr>'
				
					ret.runat("#sendlist").append(resultHTML).withdata(res2);
					count1 = 0;
				}
				}
			}

			// 当是最后一个值时
			if(i == selectResult.length - 1 ){

				// 存在asin
				if(res['asin'] != null && res['asin'] != ''){

					var r = db.select( "SENDING", "queryByAsinSku",
					{ 
						asin:res['asin'],
						sku:res['sku'],
						shopid: getShopId() 
					} ).getArray();
				
					var resultHTML = '<tr>' +
						'<td style="width: 100px;" class="c">{no}</td>' +
						' <td style="width: 160px;" class="l"><span class="l5">{sub1}</span></td>' +
						'<td style="width: 160px;" class="l"><span class="l5">{sub2}</span></td>' +
						'<td style="width: 120px;" class="c">{asin}</td>' +
						'<td style="width: 150px;" class="c">{sku}</td>' +
						'<td style="width: 120px;" class="c">{label}</td>' +
						'<td style="width: 80px;" class="r"><span class="r5">'+selectResult[i]["count"]+'</span></td>' +
						'</tr>'
					
					ret.runat("#sendlist").append(resultHTML).withdata(r);

				}else{	// 不存在asin的情况

					var res2 = new Record([selectResult[i]]).getArray();
					var resultHTML = '<tr>' +
					'<td colspan="6" style="width: 815px;" class="l"><span class="l5">{productname}</span></td>' +
					'<td style="width: 80px;" class="r"><span class="r5">{count}</span></td>' +
					'</tr>'
				
					ret.runat("#sendlist").append(resultHTML).withdata(res2);
				}

			}

	}
 
	ret.eval('sending_list_inputdialog.dialog("open");')
	return ret;
};