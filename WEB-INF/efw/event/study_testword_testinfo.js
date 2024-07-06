var study_testword_testinfo = {};
study_testword_testinfo.name = "単語テスト開始";
study_testword_testinfo.paramsFormat = {
	"#opt_book" : null,
	"#opt_classification" : null,
};

study_testword_testinfo.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	//setTitleInfo(ret);

	var book = params["#opt_book"];

	var classification = params["#opt_classification"];
	// if(classification != null && classification != ""){
	// 	classification = "Day" + ( '00' + classification ).slice( -2 );
	// }

	//  检索
	var selectResult = db.select(
		"STUDY",
		"searchTestResult",
		{
			book : book,
			classification : classification,
			userid : getUserId(),
		}
	).getArray();

	var resultHTML =
		"<tr>" +
			"<td style='width:  60px;text-align: center;'><input type='checkbox' name='testitem' value='{testno}' onchange='checkTest(this)'></input></td>" +
			"<td style='width: 180px;'><span class='l5'>{book}</span></td>" +
			"<td style='width: 250px;'><span class='l5'>{classification}</span></td>" +
			"<td style='width: 100px;'><span class='l5'>{status}</span></td>" +
			"<td style='width: 160px;'><span class='l5'>{div1}</span></td>" +
			"<td style='width: 160px;'><span class='l5'>{div2}</span></td>" +
			"<td style='width: 280px;'><span class='l5'>{starttime}～{endtime}</span></td>" +
			"<td style='width: 320px;'>" +
				"<table border=0><tr>" +
				"<td style='border:0;width:5px;'></td>" +
				"<td style='border:0;width:25px;'><img style='width: 20px;height: 20px;margin: -2px;cursor: pointer;' src='img/all.png' onclick=\"listWord('{testno}');\"/></td>" +
				"<td style='border:0;width:45px;'><span style='font-size: 12px;'>{count}</span></td>" +
				"<td style='border:0;width:25px;'><img style='width: 20px;height: 20px;margin: -2px;' src='img/sun.png' /></td>" +
				"<td style='border:0;width:45px;'><span style='font-size: 12px;'>{suncount}</span></td>" +
				"<td style='border:0;width:25px;'><img style='width: 20px;height: 20px;margin: -2px;' src='img/cloudy.png' /></td>" +
				"<td style='border:0;width:45px;'><span style='font-size: 12px;'>{cloudycount}</span></td>" +
				"<td style='border:0;width:25px;'><img style='width: 20px;height: 20px;margin: -2px;' src='img/rain.png' /></td>" +
				"<td style='border:0;width:45px;'><span style='font-size: 12px;'>{raincount}</span></td>" +
				"</tr></table>" +
			"</td>" +
			"<td style='width: 120px;' class='r'><span class='r5'>{per}</span></td>" +
			"<td style='width: 140px;' class='r'><span class='r5'>{costtime1}:{costtime2}:{costtime3}</span></td>" +
		"</tr>";

	ret.runat("#testwordtable").remove("tr").append(resultHTML).withdata(selectResult);

	ret.eval("changeStyleForTestInfo();");
	// 画面へ結果を返す
	return ret;

};
