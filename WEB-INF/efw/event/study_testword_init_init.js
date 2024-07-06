var study_testword_init_init = {};
study_testword_init_init.name = "単語テスト開始";
study_testword_init_init.paramsFormat = {


};

study_testword_init_init.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	//  检索
	var selectResult1 = db.select(
		"STUDY",
		"searchWordBook",{}
	).getArray();

	var resultHTML1 = "<option class='dbvalue' value='{book}'>{book}</option>";

	ret.runat("#opt_book").remove(".dbvalue").append(resultHTML1).withdata(selectResult1);


	//  检索
	var selectResult2 = db.select(
		"STUDY",
		"searchClassification",
		{ 
			book: selectResult1[0]["book"]
		}
	).getArray();

	var resultHTML2 = "<option class='dbvalue' value='{classification}'>{classification}</option>";

	ret.runat("#opt_dayfrom").remove(".dbvalue").append(resultHTML2).withdata(selectResult2);

	ret.runat("#opt_dayto").remove(".dbvalue").append(resultHTML2).withdata(selectResult2);

	// 画面へ結果を返す
	return ret;

};