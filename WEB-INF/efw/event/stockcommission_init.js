var stockcommission_init = {};
stockcommission_init.name = "在庫保管手数料初期表示";
stockcommission_init.paramsFormat = {

};
 
stockcommission_init.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);

	// sl:商品管理番号初始化
	var selectResult1 = db.select(
		"STOCKCOMMISSION",
		"searchproducno",
		{
			"shopid": getShopId(),
		}
	).getArray();

	var resultHTML1 = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#opt_productno").remove("option .option").append(resultHTML1).withdata(selectResult1);

	// sl:商品分类初始化
	var selectResult2 = db.select(
		"STOCKCOMMISSION",
		"searchproducttype",
		{
			"shopid": getShopId(),
		}
	).getArray();

	var resultHTML2 = "<input type='checkbox' value='{value}'>&nbsp;{text}&nbsp;&nbsp;";

	ret.runat("#checkbox_producttype").remove("*").append(resultHTML2).withdata(selectResult2);
	
	// sl:商品管理番号初始化
	var selectResult4 = db.select(
		"STOCKCOMMISSION",
		"searchYearMonth",
		{
			"shopid": getShopId(),
		}
	).getArray();

	var resultHTML4 = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#opt_yearmonth").remove("option .option").append(resultHTML4).withdata(selectResult4);


	var selectResult3 = db.select(
		"STOCKCOMMISSION",
		"searchcommission",
		{
			"shopid": getShopId(),
		}
	).getArray();
 
	var html1=' <tr> ' +
	'<td style="width: 50px;" class="c">{ids}</td>' +
	'<td style="width: 140px" class="c">{yearmonth}</td>' +
	'<td style="width: 139px" class="l"><span class="l5">{type}</span></td>' +
	'<td style="width: 80px;" class="c">{pno}</td>' +
	'<td style="width: 161px;" class="l"><span class="l5">{sub1}</span></td>' +
	'<td style="width: 160px;" class="l"><span class="l5">{sub2}</span></td>' +

	'<td style="width: 121px;" class="c">{asin}</td>' +
	'<td style="width: 150px;" class="c">{sku}</td>' +
	'<td style="width: 120px;" class="c">{label}</td>' +
	
	'<td style="width: 80px;" class="c">{country}</td>' +
	'<td style="width: 80px;" class="r"><span class="r5">{fulfillment}</span></td>' +
	'<td style="width: 80px;" class="r"><span class="r5">{longest}</span></td>' +
	'<td style="width: 80px;" class="r"><span class="r5">{median}</span></td>' +
	'<td style="width: 80px;" class="r"><span class="r5">{shortest}</span></td>' +
	'<td style="width: 81px;" class="r"><span class="r5">{weight}</span></td>' +
	'<td style="width: 78px;" class="r"><span class="r5">{item}</span></td>' +

	'<td style="width: 114px;" class="r"><span class="r5">{category}</span></td>' +
	'<td style="width: 113px;" class="r"><span class="r5">{productsize}</span></td>' +
	'<td style="width: 114px;" class="r"><span class="r5">{monthlystoragefee}</span></td>' +
	'<td style="width: 112px;" class="r"><span class="r5">{incentiveamount}</span></td>' +

	'<td style="width: 108px;" class="r"><span class="r5">{additionalfeeperiod}</span></td>' +
	'<td style="width: 108px;" class="r"><span class="r5">{additionalfee}</span></td>' +
	'<td style="width: 109px;" class="r"><span class="r5">{inventorynumber}</span></td>' +
	'<td style="width: 106px;" class="r"><span class="r5">{amountrequested}</span></td>' +

	'</tr> '
	if(selectResult3.length > 0){
		ret.runat("#stockcommissiontable").remove("*").append(html1).withdata(selectResult3);

	}
	return ret;
};