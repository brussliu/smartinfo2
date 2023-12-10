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

	for(var r=0; r< selectResult.length; r++){
		selectResult[r]['salesrate'] = salesratePercentage(selectResult[r]['type'],  selectResult[r]['price'])
		selectResult[r]['estimated'] = estimatedPercentage(selectResult[r]['type'],  selectResult[r]['price'])
	}
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

	'<td style="width: 100px;" class="l"><span class="l5">{agencyfees}</span></td>' +
	'<td style="width: 100px;" class="r"><span class="r5">{deliverycommission}</span></td>' +
	'<td style="width: 100px;" class="r"><span class="r5">{commissiontotal}</span></td> ' + 

	'<td style="width: 90px;" class="r"><span class="r5">{purchaseprice}</span></td> ' +                          
	'<td style="width: 105px;" class="r"><span class="r5">{grossprofit}</span></td> ' +                             
	'</tr> '

	ret.runat("#commissiontable").remove("tr").append(html1).withdata(selectResult);
	 
 
	// 画面へ結果を返す
	return ret;

};

function salesratePercentage(type, price ){
	if(price == null || price == ''){
		return ''
	}
	type = type.substring(3 ,type.length)
	price = price.substring(0 ,price.length-1) 
	var salesrate = ''
	if(type == '雨靴'){
		if(price <=7500){
			salesrate = '12.00%'
		}else{
			salesrate = '12% + 6%'
		}
	}else if(type == 'レインコート' ||type == '靴下' ||type == '膝当て' 
	||type == 'スキー靴下' ||type == 'パジャマ' ||type == 'バスタオル' ){
		if(price <=3000){
			salesrate = '12.00%'
		}else{
			salesrate = '12% + 8%'
		}
	}else if(type == 'Amazonデバイス用アクセサリ'){
		salesrate = '45.00%'
	}else if(type == 'その他'){
		salesrate = '10.00%'
	}

	return salesrate;
}
function estimatedPercentage(type, price ){
	if(price == null || price == ''){
		return ''
	}
	type = type.substring(3 ,type.length)
	price = price.substring(0 ,price.length-1)
	var unit = '円'
	var estimated = ''
	if(type == '雨靴'){
		if(price <=7500){
			estimated = (price * 12 / 100) ;
		}else{
			estimated = ((7500 * 12 / 100) + ((price - 7500) * 6 / 100));
		}
	}else if(type == 'レインコート' ||type == '靴下' ||type == '膝当て' 
	||type == 'スキー靴下' ||type == 'パジャマ' ||type == 'バスタオル' ){
		if(price <=3000){
			estimated = (price * 12 / 100) ;
		}else{
			estimated = ((3000 * 12 / 100) + ((price - 3000) * 8 / 100));
		}
	}else if(type == 'Amazonデバイス用アクセサリ'){
		estimated = (price * 45 / 100) ;
	}else if(type == 'その他'){
		estimated = (price * 10 / 100) ;
	}
	estimated = Math.ceil(estimated)
	if(estimated < 30){
		estimated = 30 ;
	}
	return estimated + unit;
}