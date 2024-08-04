var study_testword_starttest = {};
study_testword_starttest.name = "単語テスト開始";
study_testword_starttest.paramsFormat = {

	"#opt_book": null,
	"#opt_dayfrom": null,
	"#opt_dayto": null,

	"#opt_testcount": null,

	"#testway1hidden": null,
	"#opt_way2": null,
	"#opt_way3": null,
	"#testway4hidden": null,
	
};

study_testword_starttest.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	var book = params["#opt_book"];
	var dayfrom = params["#opt_dayfrom"];
	var dayto = params["#opt_dayto"];

	var way1 = params["#testway1hidden"];
	var way2 = params["#opt_way2"];
	var way3 = params["#opt_way3"];
	var way4 = params["#testway4hidden"];

	var selectcount = params["#opt_testcount"];


	var way1Str = "";
	var wordcount = 0;

	if(way1 == "part"){

		//  检索
		var selectResult = db.select(
			"STUDY",
			"selectRodomWord",
			{
				book: book,
				dayfrom: dayfrom,
				dayto: dayto,
				count: parseInt(selectcount),
			}
		).getArray();

		wordcount = parseInt(selectcount);

		if(wordcount < selectResult.length){
			selectResult.splice(wordcount, selectResult.length - wordcount);
		}

		way1Str = "一部抽選";
	}else{

		//  检索
		var selectResult = db.select(
			"STUDY",
			"selectWord",
			{
				book: book,
				dayfrom: dayfrom,
				dayto: dayto,
			}
		).getArray();

		wordcount = parseInt(selectcount);
		way1Str = "全部";
	}

	var classification = "";
	if((dayfrom == null || dayfrom == "") && (dayto == null || dayto == "")){

		classification = "===ALL===";

	}else{

		if(dayfrom != dayto){
			classification = dayfrom + "～" + dayto;
		}else{
			classification = dayfrom;
		}

	}

	// テスト番号
	var testno = new Date().format('yyyyMMdd-HHmmss');

	// 単語テスト情報
	db.change(
		"STUDY",
		"insertTestInfo",
		{
			testno : testno,
			book : book,
			classification : classification,
			div1 : way1Str,
			div2 : way2,
			div3 : way3,
			div4 : way4,
			count : selectResult.length,
			userid : getUserId()
		}
	);

	// 単語テスト詳細情報
	for(var i = 0;i < selectResult.length;i++){

		db.change(
			"STUDY",
			"insertTestDetailInfo",
			{
				testno : testno,
				subno : i+1,
				book : selectResult[i]["book"],
				classification : selectResult[i]["classification"],
				wordseq : selectResult[i]["wordseq"],
				userid : getUserId()
			}
		);
	}

	session.create();

	session.set("TEST_NO", testno);
	session.set("TEST_SUB_NO", 1);


	if(way3 == 1){
		return ret.navigate("study_testword_test2.jsp");
	}
	if(way4 == 3){
		return ret.navigate("study_testword_test3.jsp");
	}
	// 画面へ結果を返す
	return ret.navigate("study_testword_test.jsp");

};
