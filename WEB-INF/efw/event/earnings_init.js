var earnings_init={};
earnings_init.name="売上情報検索";
earnings_init.paramsFormat={

};
 
earnings_init.fire=function(params){
	var ret = new Result();
	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	var resultHTML = ' <tr>' +
	' <td style="width: 120px;"  class="c a"  onclick="opendetail(this)">{yearmonth}</td>' +
	' <td style="width: 120px" class="r">{ordercount}個</td>' +
	' <td style="width: 138px;" class="r">{orderprofit}円</td>' +
   
	' <td style="width: 138px;" class="r">{monthlyfee}円</td>' +
	' <td style="width: 110px;" class="r">{adfee}円</td>' +

	' <td style="width: 138px;" class="r">{fbashipfee}円</td>' +
	' <td style="width: 138px;" class="r">{fbastockfee}円</td>' +
	' <td style="width: 138px;" class="r">{fbaworkfee}円</td>' +

	' <td style="width: 138px;" class="r">{ruturnfee}円</td>' +
	
	' <td style="width: 110px;" class="r">{remittance}円</td>' +
	' <td style="width: 110px;" class="r">{purchase}円</td>' +
	' <td style="width: 100px;" class="r">{earining}円</td>' +
	' <td style="width: 100px;" class="r">{disburse}円</td>' +
	' <td style="width: 143px;font-weight: bold;" class="r">{profit}円</td>' +
	' </tr>'
	var selectResult = db.select(
		"EARNINGS",
		"searchearningslist",
		{
			"shopid" : getShopId()
		}
	).getArray();


	ret.runat("#earningstable").remove("tr").append(resultHTML).withdata(selectResult);



	// 画面へ結果を返す
	return ret;

};
