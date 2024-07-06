var study_testword_delete = {};
study_testword_delete.name = "単語テスト開始";
study_testword_delete.paramsFormat = {

	"testno": null,

};

study_testword_delete.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	// params.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

	//var testno = params["testno"];
	var testnoArr = params["testno"].split(",");

	for(var i=0;i <testnoArr.length;i ++){
		var testno = testnoArr[i];

		// 単語テスト情報
		db.change(
			"STUDY",
			"deleteTestInfo",
			{
				testno : testno,
			}
		);

		// 単語テスト詳細情報
		db.change(
			"STUDY",
			"deleteTestDetailInfo",
			{
				testno : testno,
			}
		);
	}


	// 画面へ結果を返す
	return ret.navigate("study_testword.jsp");

};
