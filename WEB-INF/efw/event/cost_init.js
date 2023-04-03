var cost_init = {};
cost_init.name = "収入支出情報画面初期表示";
cost_init.paramsFormat = {

};

cost_init.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);
    
	
	var selectResult = (db.select(
		"COST",
		"searchCostInfo",
		{
			shopid : getShopId(),
			// registrationDate : registrationDate.toLowerCase,
			
		}
	)).map(
		{
			"registrationdate" : ["registrationdate",'yyyy/MM/dd HH:mm:ss'],
			"type" : "type",
			"accrualdate" : ["accrualdate",'yyyy/MM/dd'],
			"status" : "status",
			"classification" : "classification",
			"title" : "title",
			"amountcny" : "amountcny",
			"amountjpy" : "amountjpy",
			"exchangerate" : "exchangerate",
			"remarks" : "remarks",
		}
	).getArray();

	var resultHTML =
	"<tr>" +
		"<td style='width: 50px;' class='c'><input type='radio' name='choice' value='{registrationdate}' onclick='chooseItem();'></input></td>" +
		"<td style='width: 200px;' class='c'>{registrationdate}</td>" +
		"<td style='width: 150px;' class='c'>{type}</td>" +	
		"<td style='width: 150px;' class='c'>{accrualdate}</td>" +		
		"<td style='width: 120px;' class='c'>{status}</td>" +
		"<td style='width: 200px;' class='l'><span class='l5'>{classification}</span></td>" +
		"<td style='width: 250px;' class='l'><span class='l5'>{title}</span></td>" +		
		"<td style='width: 120px;' class='r'><span class='r5'>{amountcny}</span></td>" +
		"<td style='width: 120px;' class='r'><span class='r5'>{amountjpy}</span></td>" +
		"<td style='width: 100px;' class='r'><span class='r5'>{exchangerate}</span></td>" +
		"<td style='width: 316px;' class='l'><span class='l5'>{remarks}</span></td>" +
	"</tr>"

	ret.runat(".table_detail_content").remove("tr").append(resultHTML).withdata(selectResult);




	return ret;
};



