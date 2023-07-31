var earnings_openearnings={};
earnings_openearnings.name="売上詳細情報";
earnings_openearnings.paramsFormat={
	"yearmonth":null
};

earnings_openearnings.fire=function(params){

	var ret = new Result();
	// セッションチェック
	if(sessionCheck(ret) == false){return ret};
	
	var yearmonth = params["yearmonth"];
  
	/////////////////////////////////////////////////////////////////////////////////
	//広告費用 月額登録料
	var selectResult2 = db.select(
		"EARNINGS",
		"searchearningsdetail2",
		{
			"yearmonth" : yearmonth,
			"shopid" : getShopId()
		}
	);
	// 広告費用
	var adfee = selectResult2.seek("説明","eq","広告費用").getValue("合計") + "円";
	// 月額登録料
	var monthlyfee = selectResult2.seek("説明","eq","月額登録料").getValue("合計") + "円";

	var script3 = "showaddmonthlyfee('" + adfee + "','" + monthlyfee + "');";
	ret.eval(script3);

	/////////////////////////////////////////////////////////////////////////////////
	//注文 
	var selectResult1 = db.select(
		"EARNINGS",
		"searchearningsdetail1",
		{
			"yearmonth" : yearmonth,
			"shopid" : getShopId()
		}
	);

 
	// 年月
	var yearmonth = selectResult1.getValue("yearmonth");
	// 注文数量
	var ordercount = selectResult1.getValue("ordercount") + "個";
	// 注文売上
	var orderearnings = selectResult1.getValue("orderearnings") + "円";
	// 配送料
	var shipfee = selectResult1.getValue("shipfee") + "円";
	// 包装手数料
	var packfee = selectResult1.getValue("packfee") + "円";
	// 手数料
	var orderfee = selectResult1.getValue("orderfee") + "円";
	// FBA手数料
	var fbafee = selectResult1.getValue("fbafee") + "円";
	// ポイント費用
	var pointfee = selectResult1.getValue("pointfee") + "円";
	// プロモーション割引
	var discountfee = selectResult1.getValue("discountfee") + "円";
	// その他料金
	var others = selectResult1.getValue("others") + "円";
	// 注文粗利益
	var orderprofit = (selectResult1.getValue("orderearnings")
						+ selectResult1.getValue("shipfee") 
						+ selectResult1.getValue("packfee")
						+ selectResult1.getValue("orderfee")
						+ selectResult1.getValue("fbafee")
						+ selectResult1.getValue("pointfee")
						+ selectResult1.getValue("discountfee")
						+ selectResult1.getValue("others")) + "円";

	var script1 = "showyearmonth('" + yearmonth + "');";
	ret.eval(script1);

	var script2 = "showearnings('" 
			+ ordercount + "','" 
			+ orderearnings + "','" 
			+ shipfee + "','" 
			+ packfee + "','" 
			+ orderfee + "','" 
			+ fbafee + "','" 
			+ pointfee + "','" 
			+ discountfee + "','" 
			+ others + "','" 
			+ orderprofit + "');";
	ret.eval(script2);

	/////////////////////////////////////////////////////////////////////////////////
	//返品
	var selectResult3 = db.select(
		"EARNINGS",
		"searchearningsdetail3",
		{
			"yearmonth" : yearmonth,
			"shopid" : getShopId()
		}
	).getSingle();

	// 返品数量
	var returncount = isNull(selectResult3["amount"]) + "個";
	// 返品金額
	var returnamount = isNull(selectResult3["total"]) + "円";

	var selectResult32 = db.select(
		"EARNINGS",
		"searchearningsdetail32",
		{
			"yearmonth" : yearmonth,
			"shopid" : getShopId()
		}
	);

	// 返品作業料
	var returnfee = isNull(selectResult32.seek("トランザクションの種類","eq","FBA Customer Return Fee").getValue("合計")) + "円";
	// 返金調整額
	var returnadjust = isNull(selectResult32.seek("トランザクションの種類","eq","調整").getValue("合計")) + "円";
	// 返品損失
	var allReturn = (isNull(selectResult3["total"])
						+ isNull(selectResult32.seek("トランザクションの種類","eq","FBA Customer Return Fee").getValue("合計"))
						+ isNull( selectResult32.seek("トランザクションの種類","eq","調整").getValue("合計"))) + "円";
					
	var script4 = "showreturninfo('" 
			+ returncount + "','" 
			+ returnamount + "','" 
			+ returnfee  + "','" 
			+ returnadjust  + "','" 
			+ allReturn + "');";
	ret.eval(script4);

	/////////////////////////////////////////////////////////////////////////////////
	//FBA保管 FBA作業
	var selectResult4 = db.select(
		"EARNINGS",
		"searchearningsdetail4",
		{
			"yearmonth" : yearmonth,
			"shopid" : getShopId()
		}
	);
	
	// FBA保管手数料
	var fbastockfee = selectResult4.seek("説明","eq","FBA保管手数料").getValue("合計") + "円";
	// FBA長期保管手数料
	var fbalongtermstockfee = selectResult4.seek("説明","eq","FBA長期在庫保管手数料").getValue("合計") + "円";
	
	// FBA商品発送料金
	var fbashipfee = isNull(selectResult4.seek("説明","eq","FBA在庫の返送手数料").getValue("合計")) + "円";
	// FBA廃棄返送手数料
	var fbadiscardfee = isNull(selectResult4.seek("説明","eq","FBA在庫の廃棄手数料").getValue("合計")) + "円";

	var script5 = "showfbainfo('" 
			+ fbastockfee + "','" 
			+ fbalongtermstockfee + "','" 
			+ (isNull(selectResult4.seek("説明","eq","FBA保管手数料").getValue("合計"))+isNull(selectResult4.seek("説明","eq","FBA長期在庫保管手数料").getValue("合計")) + "円") + "','" 
			+ fbashipfee + "','" 
			+ fbadiscardfee + "','" 
			+ (isNull(selectResult4.seek("説明","eq","FBA在庫の返送手数料").getValue("合計"))+isNull(selectResult4.seek("説明","eq","FBA在庫の廃棄手数料").getValue("合計")) + "円") + "');";
	ret.eval(script5);

	/////////////////////////////////////////////////////////////////////////////////
	//振込
	var selectResult5 = db.select(
		"EARNINGS",
		"searchearningsdetail5",
		{
			"yearmonth" : yearmonth,
			"shopid" : getShopId()
		}
	).getArray();

    var resultHTML='<tr>' +
				'<td><span>{purchasedate}円</span></td>' +
				'<td><span>{purchaseamount}円</span></td>' +
				'</tr>'

	ret.runat("#tab_remittance").remove("tr").append(resultHTML).withdata(selectResult5);
	var all = 0;
	if(selectResult5 != '' && selectResult5 !=null){
		
		for(var i=0; i< selectResult5.length; i++){
			
			all = all + parseFloat( selectResult5[i]["purchaseamount"]);
		}
		
	}
	all = all + "円";
	var script6 = "showpurchaseinfo('"+ all + "');";
	
	ret.eval(script6);
	/////////////////////////////////////////////////////////////////////////////////
	//仕入
	var selectResult6 = db.select(
		"EARNINGS",
		"searchearningsdetail6",
		{
			"yearmonth" : yearmonth,
			"shopid" : getShopId()
		}
	).getArray();

	var html ='<tr>' +
			'<td style="width:32%"><span class="a" onclick="openPurchase(this)">{purchasedate}</span></td>' +
			'<td><span>{purchasecontent}</span></td>' +
			'<td><span>{total}円</span></td>' +
			'</tr>'

	ret.runat("#tab_purchase").remove("tr").append(html).withdata(selectResult6);
	var total = 0;
	if(selectResult6 != '' && selectResult6 !=null){
		
		for(var i=0; i< selectResult6.length; i++){
			 
			total = total+ selectResult6[i]["total"];
		}
		
	}
	total = total + "円";
	var script6 = "showpurchase('" + total + "');";

	ret.eval(script6);

 
	/////////////////////////////////////////////////////////////////////////////////
	//その他収入/支出
	var selectResult7 = db.select(
		"EARNINGS",
		"searchearningsdetail7",
		{
			"yearmonth" : yearmonth,
			"shopid" : getShopId()
		}
	).getArray();

	var html ='<tr>' +
				'<td style= "width:23%;" ><span>{accrualdate}</span></td>' +
				'<td ><span>{type}/{div}/{title}</span></td>' +
				'<td ><span>{amountjp}円</span></td>' +
				'</tr>'

	ret.runat("#tab_others").remove("tr").append(html).withdata(selectResult7);
	var allOthers = 0;
	if(selectResult7 != '' && selectResult7 !=null){
		
	
		for(var i=0; i< selectResult7.length; i++){
			
			allOthers = allOthers+ selectResult7[i]["amountjp"];
		}
	
	}
	allOthers = allOthers+ "円";
	var script7 = "showothers('" + allOthers + "');";

	ret.eval(script7);
 /////////////////////////////////////////////////////////////////////////////////
	//纳品
	var selectResult8 = db.select(
		"EARNINGS",
		"searchearningsdetail8",
		{
			"yearmonth" : yearmonth,
			"shopid" : getShopId()
		}
	).getArray();

	var html ='<tr>' +
			'<td><span>{ymd}</span></td>' +
			'<td><span>{amount}円</span></td>' +
			'</tr>'

	ret.runat("#tab_fbaDelTable").remove("tr").append(html).withdata(selectResult8);
	
	var amount = 0;
	if(selectResult8 != '' && selectResult8 !=null){
		
		for(var i=0; i< selectResult8.length; i++){
			
			amount = amount+  selectResult8[i]["amount"];
		}
		
	}

	amount = amount + "円";
	var script6 = "showdelivery('" + amount  + "');";
	ret.eval(script6);
	

	return ret.eval("earnings_detail_inputdialog.dialog('open')");

};

function isNull(val){
	if(val == '' || val == null)
		return 0;
	
	return val;
}