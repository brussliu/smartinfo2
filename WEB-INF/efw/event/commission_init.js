var commission_init = {};
commission_init.name = "手数料見積情報初期表示";
commission_init.paramsFormat = {

};
 
commission_init.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);

	// 最終更新日
	var selectTime = db.select(
		"COMMISSION",
		"searchTime",
		{
			"shopid": getShopId()
		}
	).getSingle()
	ret.eval("$('#td_time').html('" + selectTime['endtime'] + "')");

	// sl:商品管理番号初始化
	var selectResult1 = db.select(
		"COMMISSION",
		"searchproducno",
		{
			"shopid": getShopId(),
		}
	).getArray();

	var resultHTML1 = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#opt_productno").remove("option .option").append(resultHTML1).withdata(selectResult1);

	// sl:商品分类初始化
	var selectResult2 = db.select(
		"COMMISSION",
		"searchproducttype",
		{
			"shopid": getShopId(),
		}
	).getArray();

	var resultHTML2 = "<input type='checkbox' value='{value}'>&nbsp;{text}&nbsp;&nbsp;";

	ret.runat("#checkbox_producttype").remove("*").append(resultHTML2).withdata(selectResult2);

	// sl:列表初始化
	var selectResult3 = db.select(
		"COMMISSION",
		"searchcommission",
		{
			"shopid": getShopId(),
		}
	).getArray();
 
	for(var r=0; r< selectResult3.length; r++){
		selectResult3[r]['salesrate'] = salesratePercentage(selectResult3[r]['type'],  selectResult3[r]['price'])
		selectResult3[r]['estimated'] = estimatedPercentage(selectResult3[r]['type'],  selectResult3[r]['price'])
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
	if(selectResult3.length > 0){
		ret.runat("#commissiontable").remove("tr").append(html1).withdata(selectResult3);

	}
	ret.eval('typeDistinction();')
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