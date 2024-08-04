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
	var selectResult1 = db.select(
		"STUDY",
		"selectMinTestSubNo",
		{
			testno : testno,
		}
	).getSingle();

	var minSubTestNo = selectResult1["minsubtestno"];

	session.set("TEST_NO", testno);
	session.set("TEST_SUB_NO", minSubTestNo);

	//  检索
	var selectResult2 = db.select(
		"STUDY",
		"selectTestInfo",
		{
			testno : testno,
		}
	).getSingle();

	var div3 = selectResult2["div3"];
	var div4 = selectResult2["div4"];

	if(div4 == "3"){
		ret.eval("continueTestPopup('2');");
	}else if(div3 == "1"){
		ret.eval("continueTestPopup('1');");
	}else{
		ret.eval("continueTestPopup('0');");
	}

	//ret.eval("continueTestPopup('" + selectResult2["div3"] + "');");
	
	// 画面へ結果を返す
	return ret;

};
