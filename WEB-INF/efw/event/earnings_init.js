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

	ret.runat("#earningstable").remove("tr")


	var selectResult = db.select(
		"EARNINGS",
		"searchearningslist",
		{
			"shopid" : getShopId()
		}
	).getArray();

	// 定义一个字符存年份
		var yearNum = 0;
	// 记录年份第一个
		var yearCount = 0;
	// 切换年份
		var cutYear = 0;
	// 定义一个字符计算注文粗利益
		var orderprofitNum = -99999999;
	// 定义一个字符计算纯利益
		var profitNum = -99999999;
	var line1 = ' <tr style="border-top: 1px solid black;">' 
	var line2 = ' <tr >' 
	var line = 0
			// 统计利润
	var selectResult2 = db.select(
		"EARNINGS",
		"searchearningslistCount",
		{
			"shopid" : getShopId()
		}
	).getArray();
 
		if(selectResult.length>0){	
			for(var i = 0; i<selectResult.length ;i++){
				var record = new Record([selectResult[i]]).getSingle();
				yearNum = parseInt(record["yearmonth"].substring(0,4))
			
				// 取得该年份的总利润
				for(var j=0 ; j<selectResult2.length ; j++){
					if(yearNum == parseInt( selectResult2[j]["years"] )){
						if(yearCount == 0){
							orderprofitNum =parseInt( selectResult2[j]["orderprofitnum"])
							profitNum = parseInt(selectResult2[j]["profitnum"])
							yearCount = 1
							cutYear = yearNum
							break
						}
						if(yearCount == 1){
							yearCount = 2
							break
						}
					} 
				}
			
				var resultHTML2 =  ' <td style="width: 120px;"  class="c a"  onclick="opendetail(this)">{yearmonth}</td>' +
					' <td style="width: 100px" class="r">{ordercount}個</td>' +
					' <td style="width: 130px;" class="r">{orderprofit}円</td>' +

					' <td style="width: 100px;" class="r">{monthlyfee}円</td>' +
					' <td style="width: 100px;" class="r">{adfee}円</td>' +

					' <td style="width: 100px;" class="r">{fbashipfee}円</td>' +
					' <td style="width: 100px;" class="r">{fbastockfee}円</td>' +
					' <td style="width: 100px;" class="r">{fbaworkfee}円</td>' +
					' <td style="width: 100px;" class="r">{ruturnfee}円</td>' +

					' <td style="width: 110px;" class="r">{remittance}円</td>' +
					' <td style="width: 110px;" class="r">{purchase}円</td>' +
					' <td style="width: 100px;" class="r">{earining}円</td>' +
					' <td style="width: 100px;" class="r">{disburse}円</td>' +

					' <td style="width: 128px;font-weight: bold;" class="r">{profit}円</td>' +
					' <td style="width: 130px;font-weight: bold;" class="r">{orderprofitnum}円</td>' +
					' <td style="width: 130px;font-weight: bold;" class="r">{profitnum}円</td>' +
					' </tr>'

				// 遍历列表
				if(yearNum == cutYear){
					if(yearCount == 1){
						record['orderprofitnum'] = orderprofitNum
						record['profitnum'] = profitNum
						var record2 = new Record([record]).getArray();
						
						if(line == 0){
							resultHTML2 = line2+resultHTML2
						}else{
							resultHTML2 = line1+resultHTML2
						}
						ret.runat("#earningstable").append(resultHTML2).withdata(record2);
					}
					if(yearCount == 2){
						orderprofitNum = orderprofitNum - parseInt(selectResult[i-1]["orderprofit"])
						profitNum = profitNum - parseInt(selectResult[i-1]["profit"])
						record['orderprofitnum'] = orderprofitNum
						record['profitnum'] = profitNum
						var record2 = new Record([record]).getArray();
						
						if(line == 0){
							resultHTML2 = line2+resultHTML2
						}else{
							resultHTML2 = line1+resultHTML2
						}
						ret.runat("#earningstable").append(resultHTML2).withdata(record2);
						}
					line = 0
				}
				if(yearNum != cutYear){//不同年份，数据初始化
					 
					yearCount = 0
					orderprofitNum = -99999999
					profitNum = -99999999
					line = 1
				}
				
			 
			}
			
		}

	// 画面へ結果を返す
	return ret;

};
