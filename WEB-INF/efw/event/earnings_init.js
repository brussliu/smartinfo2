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
	// 切换年份
		var cutYear = -1;
	// 定义一个字符计算注文粗利益
		var orderprofitNum = -99999999;
	// 定义一个字符计算纯利益
		var profitNum = -99999999;
	// 每年第一行数据
		var q=0;
		
	var line1 = ' <tr style="border-top: 1px solid black;">' 
	var line2 = ' <tr >' 
 
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
				for(var j=q ; j<selectResult2.length ; j++){
					if(yearNum == parseInt( selectResult2[j]["years"] )){
						// 判断年份是否相同？同：不做处理  不同：合计总利润
						if(yearNum != cutYear){
								orderprofitNum =parseInt( selectResult2[j]["orderprofitnum"])
								profitNum = parseInt(selectResult2[j]["profitnum"])
								break;
							}
					
					} 
				}
			
				var resultHTML2 =  ' <td style="width: 120px;"  class="c a"  onclick="opendetail(this)">{yearmonth}</td>' +
					' <td style="width: 80px" class="r">{ordercount}個</td>' +
					' <td style="width: 110px;" class="r">{orderprofit}円</td>' +

					' <td style="width: 100px;" class="r">{monthlyfee}円</td>' +
					' <td style="width: 100px;" class="r">{adfee}円</td>' +

					' <td style="width: 100px;" class="r">{fbashipfee}円</td>' +
					' <td style="width: 100px;" class="r">{fbastockfee}円</td>' +
					' <td style="width: 100px;" class="r">{fbaworkfee}円</td>' +
					' <td style="width: 100px;" class="r">{ruturnfee}円</td>' +

					' <td style="width: 100px;" class="r">{remittance}円</td>' +
					' <td style="width: 110px;" class="r">{purchase}円</td>' +
					' <td style="width: 100px;" class="r">{earining}円</td>' +
					' <td style="width: 90px;" class="r">{disburse}円</td>' +

					' <td style="width: 90px;" class="r">{sendingcost}円</td>' +
					' <td style="width: 110px;font-weight: bold;" class="r">{profit}円</td>' +
					' <td style="width: 120px;font-weight: bold;" class="r">{orderprofitnum}円</td>' +
					' <td style="width: 120px;font-weight: bold;" class="r">{profitnum}円</td>' +
					' </tr>'
				
				// 遍历列表
					//  判断年份相同？同：减去下个月的利润  
								// 	不同：就是十二月，第一条数据，是两者年份相等，变为实线，新增第一条数据，q+1
				if(yearNum == cutYear){
					orderprofitNum = orderprofitNum - parseInt(selectResult[i-1]["orderprofit"])
					profitNum = profitNum - parseInt(selectResult[i-1]["profit"])
					record['orderprofitnum'] = orderprofitNum
					record['profitnum'] = profitNum
					var record2 = new Record([record]).getArray();
					 
					resultHTML2 = line2+resultHTML2
			 
					ret.runat("#earningstable").append(resultHTML2).withdata(record2);

				}
				if(yearNum != cutYear){
					cutYear = yearNum
					record['orderprofitnum'] = orderprofitNum
					record['profitnum'] = profitNum
					var record2 = new Record([record]).getArray();
					resultHTML2 = line1+resultHTML2
					q += 1 
					ret.runat("#earningstable").append(resultHTML2).withdata(record2);


				} 
			 
			}
			
		}

	// 画面へ結果を返す
	return ret;

};
