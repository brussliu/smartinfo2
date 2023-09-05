var stockinfo_search={};
stockinfo_search.name="在庫情報管理画面検索";
stockinfo_search.paramsFormat={
	"producttypeArr":null,
	"#opt_productno":null,
	"#text_keyword":null,
	// "aslArr":null
	// "send":null,
	"#shippingway_fba":null,
	"#shippingway_fbm":null,
	"#select_item":null,
	"#text_minNum":null,
	"#text_maxNum":null,

};

stockinfo_search.fire=function(params){
	
	var ret = new Result();

	// セッションチェック
	sessionCheck(ret);

	var ptArr = params["producttypeArr"];
	var type="";
	for(let i=0;i<ptArr.length;i++){
		
		if(i==ptArr.length-1){
			type += "'"+ptArr[i]+"'"
		}else{
			type += "'"+ptArr[i]+"',";
		}
	}
	var opt_productno = params["#opt_productno"];
	var text_keyword = params["#text_keyword"].toUpperCase();

	// var send = params["send"];
	// var send1="";
	// var sendArr="";
	// if(send.length>1){
	// 	sendArr='2';
	// }else{
	// 	send1=send[0];
	// }
	var shippingway = "";
	if(params["#shippingway_fba"] == 'FBA'){
		shippingway = shippingway + "'FBA'";
	}
	if(params["#shippingway_fbm"] == 'FBM'){
		if(shippingway == ""){
			shippingway = shippingway + "'FBM'";
		}else{
			shippingway = shippingway + ',' + "'FBM'";
		}
	}

	// 数量範囲
	var item = params["#select_item"]
	var minNum =params["#text_minNum"] == ''? null : params["#text_minNum"]
	var maxNum =params["#text_maxNum"] == ''? null : params["#text_maxNum"]

	var selectResult = db.select(
		"STOCK",
		"selectstockinfo",
		{
			shopid : getShopId(),
			ptype : type,
			opt_productno : opt_productno,
			text_keyword : text_keyword,
			shippingway :shippingway,
			item :item,
			minNum :minNum,
			maxNum :maxNum
		
		}
	).getArray();

	var resultHTML =
		'<tr>' +
			'<td style="width: 50px;" class="c"><input type="checkbox" onchange="check(this);"><input type="hidden" value="{zt_flg}"></td>' +
			'<td style="width: 140px" class="l"><span class="l5">{type}</span></td>' +
			'<td style="width: 80px;" class="c">{pno}</td>' +
			'<td style="width: 70px;" class="c">{preproduct}</td>' +
			'<td style="width: 160px;" class="l"><span class="l5">{sub1}</span></td>' +
			'<td style="width: 160px;" class="l"><span class="l5">{sub2}</span></td>' +
			'<td style="width: 120px;" class="c">{asin}</td>' +
			'<td style="width: 150px;" class="c">{sku}</td>' +
			'<td style="width: 120px;" class="c">{label}</td>' +
			// '<td style="width: 817px;" class="l"><span>{productname}</span></td>' +
			'<td style="width: 80px;" class="c">{shippingway}</td>' +
			'<td style="width: 80px;" class="r"><span class="r5">{fba}</span></td>' +
			'<td style="width: 80px;" class="r"><span class="r5">{fbm}</span></td>' +
			'<td style="width: 80px;" class="r"><span class="r5">{put}</span></td>' +
			'<td style="width: 80px;" class="r"><span>{local}</span> </td>' +
			'<td style="width: 80px;" class="r"><span class="r5">{purchase}</span></td>' +
			'<td style="width: 80px;" class="r"><span class="r5"><span>{stockonsell}</span></td>' +
			'<td style="width: 80px;" class="r"><span class="r5"><span>{stockprepare}</span></td>' +
			'<td style="width: 80px;" class="r"><span class="r5"><span>{stockall}</span></td>' +
			'<td style="width: 350px;" class="c">{selled3} / {selled7} / {selled30} / {selled60} / {selled90} / {selled180} / {selled360}</td>' +
			'<td style="width: 100px;" class="r"><span class="r5">{dayaverage}</span></td>' +
			'<td style="width: 100px;" class="r"><span class="r5">{stocknumber}</span></td>' +
			'<td style="width: 100px;" class="r"><span class="r5">{salenumber}</span></td>' +
			'<td style="width: 100px;" class="r"><span class="r5">{deliveryquantity}</span></td>' +
			'<td style="width: 100px;" class="r"><span class="r5">{purchasequantity}</span></td>' +
		'</tr>';

	ret.runat("#stocktable").remove("tr").append(resultHTML).withdata(selectResult);
	 
	ret.show('.c_detail_header').show('.c_detail_content');

	ret.eval("changeColor()");
	// 画面へ結果を返す
	return ret;

};
