var stockcommission_search={};
stockcommission_search.name="在庫保管手数料管理検索";
stockcommission_search.paramsFormat={
	"producttypeArr":null,
	"#opt_productno":null,
	"#text_keyword":null,
	"#opt_yearmonth":null,
};

stockcommission_search.fire=function(params){
	
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
	var opt_yearmonth = params["#opt_yearmonth"];
	var selectResult = db.select(
		"STOCKCOMMISSION",
		"selectstockcommission",
		{
			shopid : getShopId(),
			ptype : type,
			opt_productno : opt_productno,
			text_keyword : text_keyword,
			yearmonth : opt_yearmonth,
		
		}
	).getArray();

	var html1=' <tr> ' +
	'<td style="width: 40px;" class="c">{ids}</td>' +
	'<td style="width: 75px" class="c">{yearmonth}</td>' +
	'<td style="width: 140px" class="l"><span class="l5">{type}</span></td>' +
	'<td style="width: 75px;" class="c">{pno}</td>' +

	'<td style="width: 200px;" class="l"><span class="l5">{sub1}</span><br><span class="r5" style="float:right;">{sub2}</span></td>' +
	'<td style="width: 140px;" class="c">{asin}<br>{sku}<br>{label}</td>' +
	'<td style="width: 80px;" class="c">{country}-{fulfillment}</td>' +

	'<td style="width: 225px;" class="l">' +
		'<span class="l5">{longest}×{median}×{shortest}</span>' +
		'<br><span class="r5" style="float:right;">{item}</span>' +
		'<br><span class="l5" style="float:left;">{weight}</span>' +
	'</td>' +
	// '<td style="width: 80px;" class="r"><span class="r5">{median}</span></td>' +
	// '<td style="width: 80px;" class="r"><span class="r5">{shortest}</span></td>' +
	// '<td style="width: 81px;" class="r"><span class="r5">{weight}</span></td>' +
	// '<td style="width: 78px;" class="r"><span class="r5">{item}</span></td>' +

	'<td style="width: 90px;" class="r"><span class="r5">{category}</span></td>' +
	'<td style="width: 140px;" class="r"><span class="r5">{productsize}</span></td>' +
	'<td style="width: 110px;" class="r"><span class="r5">{monthlystoragefee}</span></td>' +
	'<td style="width: 80px;" class="r"><span class="r5">{incentiveamount}</span></td>' +

	'<td style="width: 90px;" class="r"><span class="r5">{additionalfeeperiod}</span></td>' +
	'<td style="width: 90px;" class="r"><span class="r5">{additionalfee}</span></td>' +
	'<td style="width: 90px;" class="r"><span class="r5">{inventorynumber}</span></td>' +
	'<td style="width: 90px;" class="r"><span class="r5">{amountrequested}</span></td>' +

	'</tr> '

	ret.runat("#stockcommissiontable").remove("tr").append(html1).withdata(selectResult);
 
	// 画面へ結果を返す
	return ret;

};
