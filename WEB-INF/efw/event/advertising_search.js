var advertising_search={};
advertising_search.name="商品別広告情報管理画面検索";
advertising_search.paramsFormat={
	"producttypeArr":null,
	"#opt_productno":null,
	"#text_keyword":null, 
	"#opt_yearmonths":null, 
};
 
advertising_search.fire=function(params){
	
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	var pdArr = params["producttypeArr"];
	var productno = params["#opt_productno"];
	var keyword = params["#text_keyword"].toUpperCase();
	var yearmonths = params["#opt_yearmonths"]; 

	var type="";
	for(let i=0;i<pdArr.length;i++){
		
		if(i==pdArr.length-1){
			type += "'"+pdArr[i]+"'"
		}else{
			type += "'"+pdArr[i]+"',";
		}
	}
	  
	var selectResult = db.select(
		"ADVERTISING",
		"searchadvertisinglist",
		{
		
			shopid : getShopId(),
			ptype : type,
			productno : productno,
			keyword : keyword,
			yearmonths : yearmonths 
		
		}
	).getArray();

 
	var resultHTML4 = '<tr >' +
						'<td style="width: 120px;"class="c">{yearmonths}</td>' +
						'<td style="width: 140px" class="l"><span class="l5">{categories}</span></td>' +
						'<td style="width: 80px;"class="c">{productno}</td>' +
						'<td style="width: 80px;"class="c">{preproduct}</td>' +
						'<td style="width: 160px;" class="l"><span class="l5">{sub1}</span></td>' +
						'<td style="width: 160px;" class="l"><span class="l5">{sub2}</span></td>' +

						'<td style="width: 140px;"class="c">{asin}</td>' +
						'<td style="width: 140px;"class="c">{sku}</td>' +
						'<td style="width: 140px;"class="c">{label}</td>' +

						'<td style="width: 120px;" class="c">{state}</td>' +
						'<td style="width: 120px;" class="c">{type}</td>' +
						'<td style="width: 200px;" class="l"><span class="l5">{sponsoredproduct}</span></td>' +
						'<td style="width: 120px;" class="r"><span class="r5">{sale}</span></td>' +
						'<td style="width: 120px;" class="r"><span class="r5">{roas}</span></td> ' +

						
						'<td style="width: 120px;" class="r"><span class="r5">{conversion}</span></td>' +
						'<td style="width: 140px;" class="r"><span class="r5">{impressionnumber}</span></td>' +
						'<td style="width: 120px;" class="r"><span class="r5">{clickvolume}</span></td>' +
						'<td style="width: 120px;" class="r"><span class="r5">{clickrate}</span></td>' +
						'<td style="width: 120px;" class="r"><span class="r5">{advertisingfee}</span></td> ' +

						
						'<td style="width: 120px;" class="r"><span class="r5">{averageprice}</span></td>' +
						'<td style="width: 120px;" class="r"><span class="r5">{orderform}</span></td>' +
						'<td style="width: 120px;" class="r"><span class="r5">{acos}</span></td>' + 

						'</tr>'

	ret.runat("#advertisingtable").remove("tr").append(resultHTML4).withdata(selectResult);

	// 画面へ結果を返す
	ret.eval('changeColor() ;')
	return ret;

};
