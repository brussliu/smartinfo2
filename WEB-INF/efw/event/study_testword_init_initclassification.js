var study_testword_init_initclassification = {};
study_testword_init_initclassification.name = "単語テスト開始";
study_testword_init_initclassification.paramsFormat = {

	"#opt_book": null,
};

study_testword_init_initclassification.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	//  检索
	var selectResult = db.select(
		"STUDY",
		"searchClassification",
		{ 
			book: params["#opt_book"]
		}
	).getArray();

	var resultHTML = "<option class='dbvalue' value='{classification}'>{classification}</option>";

	ret.runat("#opt_dayfrom").remove(".dbvalue").append(resultHTML).withdata(selectResult);

	ret.runat("#opt_dayto").remove(".dbvalue").append(resultHTML).withdata(selectResult);


	// 画面へ結果を返す
	return ret;

};

