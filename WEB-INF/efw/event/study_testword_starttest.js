var study_testword_starttest = {};
study_testword_starttest.name = "単語テスト開始";
study_testword_starttest.paramsFormat = {

	"#opt_book": null,
	"#opt_dayfrom": null,
	"#opt_dayto": null,

	"#testwayhidden1": null,
	"#opt_testcount": null,
	"#opt_testkbn": null,

	"#opt_testdiv": null,
	
};

study_testword_starttest.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	// params.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

	var book = params["#opt_book"];
	var dayfrom = params["#opt_dayfrom"];
	var dayto = params["#opt_dayto"];

	var way1 = params["#testwayhidden1"];
	var way2 = params["#opt_testkbn"];

	var way3 = params["#opt_testdiv"];

	var selectcount = params["#opt_testcount"];

	// if(dayfrom != null && dayfrom != ""){
	// 	dayfrom = "Day" + ( '00' + dayfrom ).slice( -2 );
	// }

	// if(dayto != null && dayto != ""){
	// 	dayto = "Day" + ( '00' + dayto ).slice( -2 );
	// }

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

	var wordcount = parseInt(selectcount);

	var way1Str = "全部";

	if(way1 == "part"){
		if(wordcount < selectResult.length){
			selectResult.splice(wordcount, selectResult.length - wordcount);
		}

		way1Str = "一部抽選";
	}

	// var way2Str = "日訳英";
	// if(way2 == "onlyVoice"){
	// 	way2Str = "音声";
	// }
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

	//selectResult.length.debug("============================================");

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
				wordseq : selectResult[i]["seq"],
				userid : getUserId()
			}
		);
	}

	session.create();

	session.set("TEST_NO", testno);
	session.set("TEST_SUB_NO", 1);

	

	// var wordNo = 1;
	// var wordCount = selectResult.length;

	// var firstword = selectResult[0];

	// var script1 = "showNumber(1," + selectResult.length + ");";
	// var script2 = "showWord(" +
	// 	"'" + firstword["word_e"] + "'," +
	// 	"'" + firstword["word_j"] + "'," +
	// 	"'" + firstword["word_c"] + "'," +

	// 	"'" + firstword["sen1_e"] + "'," +
	// 	"'" + firstword["sen1_j"] + "'," +
	// 	"'" + firstword["sen1_c"] + "'," +

	// 	"'" + firstword["sen2_e"] + "'," +
	// 	"'" + firstword["sen2_j"] + "'," +
	// 	"'" + firstword["sen2_c"] + "'" +
	// ");"

	// ret.eval(script1);

	if(way3 == 1){
		return ret.navigate("study_testword_test2.jsp");
	}

	// 画面へ結果を返す
	return ret.navigate("study_testword_test.jsp");

};
