var advertising_init = {};
advertising_init.name = "商品別広告情報管理画面初期表示";
advertising_init.paramsFormat = {

};
 
advertising_init.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);

	// sl:商品管理番号初始化
	var selectResult1 = db.select(
		"ADVERTISING",
		"searchproducno",
		{
			"shopid": getShopId(),
		}
	).getArray();

	var resultHTML1 = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#opt_productno").remove("option .option").append(resultHTML1).withdata(selectResult1);

	// sl:商品分类初始化
	var selectResult2 = db.select(
		"ADVERTISING",
		"searchproducttype",
		{
			"shopid": getShopId(),
		}
	).getArray();

	var resultHTML2 = "<input type='checkbox' value='{value}'>&nbsp;{text}&nbsp;&nbsp;";

	ret.runat("#checkbox_producttype").remove("*").append(resultHTML2).withdata(selectResult2);

	// 年月初始化
	var selectResult3 = db.select(
		"ADVERTISING",
		"searchyearmonths",
		{
			"shopid": getShopId(),
		}
	).getArray();
	 
	var resultHTML3 = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#opt_yearmonths").remove("option .option").append(resultHTML3).withdata(selectResult3);
	ret.eval("$('#opt_yearmonths').find('option:eq(1)').attr('selected','selected');")


	// // 列表初始化
	// var selectResult4 = db.select(
	// 	"ADVERTISING",
	// 	"searchadvertisinglist",
	// 	{
	// 		"shopid": getShopId(),
	// 	}
	// ).getArray();
	// selectResult4.debug('--selectResult4')
	// var resultHTML4 = '<tr >' +
	// 					'<td style="width: 120px;"class="c">{yearmonths}</td>' +
	// 					'<td style="width: 140px" class="l"><span class="l5">{categories}</span></td>' +
	// 					'<td style="width: 80px;"class="c">{productno}</td>' +
	// 					'<td style="width: 80px;"class="c">{preproduct}</td>' +
	// 					'<td style="width: 160px;" class="l"><span class="l5">{sub1}</span></td>' +
	// 					'<td style="width: 160px;" class="l"><span class="l5">{sub2}</span></td>' +

	// 					'<td style="width: 140px;"class="c">{asin}</td>' +
	// 					'<td style="width: 140px;"class="c">{sku}</td>' +
	// 					'<td style="width: 140px;"class="c">{label}</td>' +

	// 					'<td style="width: 120px;" class="c">{state}</td>' +
	// 					'<td style="width: 120px;" class="c">{type}</td>' +
	// 					'<td style="width: 200px;" class="l"><span class="l5">{sponsoredproduct}</span></td>' +
	// 					'<td style="width: 120px;" class="r"><span class="r5">{sale}</span></td>' +
	// 					'<td style="width: 120px;" class="r"><span class="r5">{roas}</span></td> ' +

						
	// 					'<td style="width: 120px;" class="r"><span class="r5">{conversion}</span></td>' +
	// 					'<td style="width: 140px;" class="r"><span class="r5">{impressionnumber}</span></td>' +
	// 					'<td style="width: 120px;" class="r"><span class="r5">{clickvolume}</span></td>' +
	// 					'<td style="width: 120px;" class="r"><span class="r5">{clickrate}</span></td>' +
	// 					'<td style="width: 120px;" class="r"><span class="r5">{advertisingfee}</span></td> ' +

						
	// 					'<td style="width: 120px;" class="r"><span class="r5">{averageprice}</span></td>' +
	// 					'<td style="width: 120px;" class="r"><span class="r5">{orderform}</span></td>' +
	// 					'<td style="width: 120px;" class="r"><span class="r5">{acos}</span></td>' + 

	// 					'</tr>'

	// ret.runat("#advertisingtable").remove("tr").append(resultHTML4).withdata(selectResult4);

	// ret.eval('changeColor() ;');


	ret.eval("searchadvertising()");

	return ret;
};