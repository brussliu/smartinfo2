var study_testword_updatedetail = {};
study_testword_updatedetail.name = "単語テスト開始";
study_testword_updatedetail.paramsFormat = {

	"#hiddenOpt": null,
	"#hiddenTestNo": null,
	"#hiddenWordNo": null,
	"#hiddenWordCount": null,

	"#hiddenWordWrongTime": null,
	"#hiddenSen1WrongTime": null,
	"#hiddenSen2WrongTime": null

};

study_testword_updatedetail.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	//setTitleInfo(ret);

	// params.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

	var opt = params["#hiddenOpt"];

	var testno = session.get("TEST_NO");
	var testsubno = 0;


	if(opt == "back"){

		var wordCount = parseInt(params["#hiddenWordCount"]);
		var test_sub_no = parseInt(params["#hiddenWordNo"]);

		if(test_sub_no == 1){

			session.invalidate();
			// 前のページに戻る
			return ret.navigate("study_testword_init.jsp");
		}else{
			testsubno = test_sub_no - 1;

			db.change(
				"STUDY",
				"updateTestDetailInfo",
				{
					testno : testno,
					testsubno : testsubno,
					status : 1,
					wordWrongTime : null,
					sen1WrongTime : null,
					sen2WrongTime : null,
					costtime : null,
				}
			);

			session.set("TEST_NO", testno);
			session.set("TEST_SUB_NO", testsubno);
		}

	}else if(opt == "next"){

		var wordCount = parseInt(params["#hiddenWordCount"]);
		var test_sub_no = parseInt(params["#hiddenWordNo"]);

		var endtime =  (new Date()).getTime();
		

		endtime = endtime - session.get("TEST_SUB_NO_STARTTIME");

		if(endtime >= 1000){
			endtime = Math.round(endtime / 1000);
		}else{
			endtime = 1;
		}

		var wordWrongTime = null;
		if(params["#hiddenWordWrongTime"] != null && params["#hiddenWordWrongTime"] != ""){
			wordWrongTime = parseInt(params["#hiddenWordWrongTime"]);;
		}

		var sen1WrongTime = null;
		if(params["#hiddenSen1WrongTime"] != null && params["#hiddenSen1WrongTime"] != ""){
			sen1WrongTime = parseInt(params["#hiddenSen1WrongTime"]);;
		}

		var sen2WrongTime = null;
		if(params["#hiddenSen2WrongTime"] != null && params["#hiddenSen2WrongTime"] != ""){
			sen2WrongTime = parseInt(params["#hiddenSen2WrongTime"]);;
		}

		db.change(
			"STUDY",
			"updateTestDetailInfo",
			{
				testno : testno,
				testsubno : test_sub_no,
				status : 9,
				wordWrongTime : wordWrongTime,
				sen1WrongTime : sen1WrongTime,
				sen2WrongTime : sen2WrongTime,
				costtime : endtime
			}
		);

		if(test_sub_no == wordCount){


			// 終了時間更新
			db.change(
				"STUDY",
				"updateTestInfo",
				{
					testno : testno
				}
			);

			session.set("TEST_NO", null);
			session.set("TEST_SUB_NO", null);

			return ret.eval("overTest();");

		}else{

			testsubno = test_sub_no + 1;
			session.set("TEST_NO", testno);
			session.set("TEST_SUB_NO", testsubno);
		}


	}


	// 画面へ結果を返す
	return ret.navigate("study_testword_test.jsp");

};
