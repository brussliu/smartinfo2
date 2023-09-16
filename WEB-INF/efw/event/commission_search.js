var commission_search={};
commission_search.name="手数料見積情報画面検索";
commission_search.paramsFormat={
	"producttypeArr":null,
	"#opt_productno":null,
	"#text_keyword":null,
	"#text_exchange":null,
};

commission_search.fire=function(params){
	
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
	var exchange = params["#text_exchange"];
	var selectResult = db.select(
		"COMMISSION",
		"selectcommission",
		{
			shopid : getShopId(),
			ptype : type,
			opt_productno : opt_productno,
			text_keyword : text_keyword,
			exchange : exchange,
		
		}
	).getArray();

	var html1=' <tr>' +
	'<td style="width: 50px;" class="c">{ids}</td>' +
	'<td style="width: 140px" class="l"><span class="l5">{type}</span></td>' +
	'<td style="width: 75px;" class="c">{pno}</td> 	' +

	'<td style="width: 200px;" class="l"><span class="l5">{sub1}</span><br><span class="r5" style="float:right;">{sub2}</span></td>' +

	'<td style="width: 140px;" class="c">{asin}<br>{sku}<br>{label}</td>' +

	'<td style="width: 90px;" class="r"><span class="r5">{long}</span></td>' +
	'<td style="width: 90px;" class="r"><span class="r5">{middle}</span></td>' +
	'<td style="width: 90px;" class="r"><span class="r5">{short}</span></td>' +
	'<td style="width: 90px;" class="r"><span class="r5">{weight}</span></td>' +

	'<td style="width: 90px;"  class="r"><span class="r5">{price}</span></td>' +
	'<td style="width: 100px;" class="r"><span class="r5">{salesrate}</span></td>' +
	'<td style="width: 100px;" class="r"><span class="r5">{estimated}</span></td>' +

	'<td style="width: 100px;" class="r"><span class="r5">{agencyfees}</span></td>' +
	'<td style="width: 100px;" class="r"><span class="r5">{deliverycommission}</span></td>' +
	'<td style="width: 100px;" class="r"><span class="r5">{commissiontotal}</span></td> ' + 

	'<td style="width: 90px;" class="r"><span class="r5">{purchaseprice}</span></td> ' +                          
	'<td style="width: 105px;" class="r"><span class="r5">{grossprofit}</span></td> ' +                            
	'</tr> '

	ret.runat("#commissiontable").remove("tr").append(html1).withdata(selectResult);
	 
 
	// 画面へ結果を返す
	return ret;

};
