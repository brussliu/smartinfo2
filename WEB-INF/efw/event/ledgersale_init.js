var ledgersale_init = {};
ledgersale_init.name = "商品別売上管理画面初期表示";
ledgersale_init.paramsFormat = {

};
 
ledgersale_init.fire = function (params) {
	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);

	// sl:商品管理番号初始化
	var selectResult1 = db.select(
		"LEDGERSALE",
		"searchproducno",
		{
			"shopid": getShopId(),
		}
	).getArray();

	var resultHTML1 = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#opt_productno").remove("option .option").append(resultHTML1).withdata(selectResult1);
 

	// 年月初始化
	var selectResult3 = db.select(
		"LEDGERSALE",
		"searchyearmonths",
		{
			"shopid": getShopId(),
		}
	).getArray();
	 
	var resultHTML3 = "<option value='{value}'class='option' >{text}</option>";

	ret.runat("#opt_yearmonths").remove("option .option").append(resultHTML3).withdata(selectResult3);
	ret.eval("$('#opt_yearmonths').find('option:eq(0)').attr('selected','selected');")


	// 列表初始化
	var selectResult4 = db.select(
		"LEDGERSALE",
		"searchledgersalelist",
		{
			"shopid": getShopId(),
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

	ret.runat("#ledgersaletable").remove("tr").append(resultHTML4).withdata(selectResult4);
 
 

	return ret;
};