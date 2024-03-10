var ledgersale_search={};
ledgersale_search.name="商品別売上管理画面検索";
ledgersale_search.paramsFormat={ 
	"#opt_productno":null,
	"#text_keyword":null, 
	"#opt_yearmonths":null, 
};
 
ledgersale_search.fire=function(params){
	
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };
 
	var productno = params["#opt_productno"];
	var keyword = params["#text_keyword"].toUpperCase();
	var yearmonths = params["#opt_yearmonths"]; 
 
	var selectResult = db.select(
		"LEDGERSALE",
		"searchledgersalelist",
		{
		
			shopid : getShopId(), 
			productno : productno,
			keyword : keyword,
			yearmonths : yearmonths 
		
		}
	).getArray();

	var resultHTML4 = ' <tr >' +
	' <td style="width: 120px;"class="c">{yearmonths}</td>' +
	' <td style="width: 140px" class="l"><span class="l5">{type}</span></td>' +
	' <td style="width: 80px;"class="c">{no}</td> ' +
	' <td style="width: 160px;"class="l"><span class="l5">{sub1}</span></td>' +
	' <td style="width: 160px;"class="l"><span class="l5">{sub2}</span></td>' +

	' <td style="width: 140px;"class="c">{asin}</td>' +
	' <td style="width: 140px;"class="c">{sku}</td>' +
	' <td style="width: 140px;"class="c">{label}</td>' +

	' <td style="width: 120px;" class="r"><span class="r5">{ordercount}</span></td>' +
	' <td style="width: 120px;"class="r"><span class="r5">{orderprofit}</span></td>' +
	' <td style="width: 120px;" class="r"><span class="r5">{adfee}</span></td>' +
	' <td style="width: 120px;" class="r"><span class="r5">{msfee}</span></td>' +
	' <td style="width: 120px;" class="r"><span class="r5">{lmsfee}</span></td> ' +
	' <td style="width: 120px;" class="r"><span class="r5">{purchasefee}</span></td>' +
	' <td style="width: 120px;" class="r"><span class="r5">{ruturnfee}</span></td>' +
	' <td style="width: 120px;" class="r"><span class="r5">{profit}</span></td> ' +

	' </tr>'

	ret.runat("#ledgersaletable").remove("tr").append(resultHTML4).withdata(selectResult);
 
  
	return ret;

};
