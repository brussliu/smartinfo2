var study_testword_init = {};
study_testword_init.name = "単語テスト開始";
study_testword_init.paramsFormat = {


};

study_testword_init.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	initSelectOption(ret);

	//  检索
	var selectResult = db.select(
		"STUDY",
		"searchTestResult",
		{
			userid : getUserId(),
		}
	).getArray();

	//selectResult.debug("6666666666666666666666666666666666666666666666666666666666666666666666666666");

	var resultHTML =
		"<tr>" +
			"<td style='width:  60px;text-align: center;'><input type='checkbox' name='testitem' value='{testno}' onchange='checkTest(this)'></input></td>" +
			"<td style='width: 180px;'><span class='l5'>{book}</span></td>" +
			"<td style='width: 380px;'><span class='l5'>{classification}</span></td>" +
			"<td style='width: 100px;'><span class='l5'>{status}</span></td>" +
			"<td style='width: 140px;'><span class='l5'>{div1}</span></td>" +
			"<td style='width: 160px;'><span class='l5'>{div2}</span></td>" +
			"<td style='width: 230px;'><span class='l5'>{starttime}～{endtime}</span></td>" +
			"<td style='width: 300px;'>" +
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
			"<td style='width: 100px;' class='r'><span class='r5'>{per}</span></td>" +
			"<td style='width: 120px;' class='r'><span class='r5'>{costtime1}:{costtime2}:{costtime3}</span></td>" +
		"</tr>";

	ret.runat("#testwordtable").remove("tr").append(resultHTML).withdata(selectResult);

	ret.eval("changeStyleForTestInfo();");



	//勉強時間取得studytime
	//  检索
	var selectResult2 = db.select(
		"STUDY",
		"selectStudyTime",
		{
		}
	).getSingle();

	ret.runat("body").withdata(
		{
			// 勉強時間
			"#studytime" : "今日勉強時間　" + selectResult2["costtime1"] + ":" + selectResult2["costtime2"] + ":" + selectResult2["costtime3"]
  
		} 
	);


	// 画面へ結果を返す
	return ret;

};

function initSelectOption(ret){

	//  检索
	var selectResult = db.select(
		"STUDY",
		"searchWordBook",{}
	).getArray();

	var resultHTML = "<option class='dbvalue' value='{book}'>{book}</option>";

	ret.runat("#opt_book").remove(".dbvalue").append(resultHTML).withdata(selectResult);

}