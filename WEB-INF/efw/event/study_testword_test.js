var study_testword_test = {};
study_testword_test.name = "単語テスト開始";
study_testword_test.paramsFormat = {


};

study_testword_test.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	//setTitleInfo(ret);

	var test_no = session.get("TEST_NO");
	var test_sub_no = session.get("TEST_SUB_NO");


	//  检索
	var selectResult = db.select(
		"STUDY",
		"selectTestInfo",
		{
			testno: test_no
		}
	).getSingle();

	var selectDetailResult = db.select(
		"STUDY",
		"selectTestDetailInfo",
		{
			testno: test_no,
			testsubno: test_sub_no
		}
	).getSingle();

	//selectResult.debug("============================================");

	//selectDetailResult.debug("+++++++++++++++++++++++++++++++++++++++++++++");

	var way2 = selectResult["div2"];
	if(selectResult["div2"] == '6'){
		way2 = parseInt(Math.round(Math.random() * 5));
	}
	var way3 = selectResult["div3"];

	ret.runat("body").withdata(
		{

			"#hiddenBook" : selectDetailResult["book"],
			"#hiddenclassification" : selectDetailResult["classification"],
			"#hiddenwordseq" : selectDetailResult["wordseq"],

			"#hiddenTestNo" : test_no,
			"#hiddenWordNo" : test_sub_no,
			"#hiddenWordCount" : selectResult["ct"],

			"#hiddenWordWrongTime" : null,
			"#hiddenSen1WrongTime" : null,
			"#hiddenSen2WrongTime" : null,

			"#hiddenWordE" : selectDetailResult["word_e"],
			"#hiddenWordJ" : selectDetailResult["word_j"],
			"#hiddenWordC" : selectDetailResult["word_c"],

			"#hiddenSen1E" : selectDetailResult["sen1_e"],
			"#hiddenSen1J" : selectDetailResult["sen1_j"],
			"#hiddenSen1C" : selectDetailResult["sen1_c"],

			"#hiddenSen2E" : selectDetailResult["sen2_e"],
			"#hiddenSen2J" : selectDetailResult["sen2_j"],
			"#hiddenSen2C" : selectDetailResult["sen2_c"],

			"#hiddenWay2" : way2,

			"#hiddenWay3" : way3,

			"#hiddenMp3" : null
			
		}
	);

	var script = "beginTest();";
	ret.eval(script);

	// var script1 = "showNumber();";
	// ret.eval(script1);
	// var script2 = "setContent();";
	// ret.eval(script2);
	// var script3 = "showWord();";
	// ret.eval(script3);

	// 開始時間を残す
	session.set("TEST_SUB_NO_STARTTIME", (new Date()).getTime());

	// 画面へ結果を返す
	return ret;

};
