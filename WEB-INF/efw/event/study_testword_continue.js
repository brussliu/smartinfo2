var study_testword_continue = {};
study_testword_continue.name = "単語テスト継続";
study_testword_continue.paramsFormat = {

	"testno": null,

};

study_testword_continue.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	var testno = params["testno"];


	//  检索
	var selectResult = db.select(
		"STUDY",
		"selectMinTestSubNo",
		{
			testno : testno,
		}
	).getSingle();

	var minSubTestNo = selectResult["minsubtestno"];

	session.set("TEST_NO", testno);
	session.set("TEST_SUB_NO", minSubTestNo);

	ret.eval("continueTestPopup();");
	// 画面へ結果を返す
	return ret;

};
