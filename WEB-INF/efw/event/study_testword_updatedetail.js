var study_testword_updatedetail = {};
study_testword_updatedetail.name = "単語テスト開始";
study_testword_updatedetail.paramsFormat = {

	"#hiddenOpt": null,
	"#hiddenTestNo": null,
	"#hiddenWordNo": null,
	"#hiddenWordCount": null,

	"#hiddenWordWrongTime": null,
	"#hiddenSen1WrongTime": null,
	"#hiddenSen2WrongTime": null,

	"#hiddenWordNoteSeq": null,
	"#hiddenSen1NoteSeq": null,
	"#hiddenSen2NoteSeq": null,

	"#hiddenWay3": null,
	
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

	var way3 = params["#hiddenWay3"];

	var wordseq = parseInt(params["#hiddenWordNoteSeq"]);
	var sen1seq = parseInt(params["#hiddenSen1NoteSeq"]);
	var sen2seq = parseInt(params["#hiddenSen2NoteSeq"]);

	var status = 9;
	
	if(way3 != "0"){
		status = 2;
	}

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
				"updateTestDetailInfo1",
				{
					testno : testno,
					testsubno : testsubno,
					status : 1,
					wordWrongTime : null,
					sen1WrongTime : null,
					sen2WrongTime : null,
					wordseq : null,
					sen1seq : null,
					sen2seq : null,
					costtime : null,
					userid : getUserId()
				}
			);

			// 判定結果更新
			db.change(
				"STUDY",
				"updateTestDetailInfo3",
				{
					testno : testno,
					testsubno : test_sub_no
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
			"updateTestDetailInfo1",
			{
				testno : testno,
				testsubno : test_sub_no,
				status : status,
				wordWrongTime : wordWrongTime,
				sen1WrongTime : sen1WrongTime,
				sen2WrongTime : sen2WrongTime,

				wordseq : wordseq,
				sen1seq : sen1seq,
				sen2seq : sen2seq,

				costtime : endtime,
				userid : getUserId()
			}
		);

		// 判定結果更新
		db.change(
			"STUDY",
			"updateTestDetailInfo2",
			{
				testno : testno,
				testsubno : test_sub_no
			}
		);

		// 臨時画像削除
		if(wordseq != null){
			db.change(
				"STUDY",
				"deleteTestWordNote",
				{
					seq : wordseq,
					userid : getUserId()
				}
			);
		}
		if(sen1seq != null && sen1seq != NaN){
			db.change(
				"STUDY",
				"deleteTestWordNote",
				{
					seq : sen1seq,
					userid : getUserId()
				}
			);
		}
		if(sen2seq != null && sen2seq != NaN){
			db.change(
				"STUDY",
				"deleteTestWordNote",
				{
					seq : sen2seq,
					userid : getUserId()
				}
			);
		}

		if(test_sub_no == 1){

			// 終了時間更新
			db.change(
				"STUDY",
				"updateTestStartTime",
				{
					testno : testno
				}
			);

			// session.set("TEST_NO", null);
			// session.set("TEST_SUB_NO", null);

			// return ret.eval("overTest();");

		}

		if(test_sub_no == wordCount){


			// 終了時間更新
			db.change(
				"STUDY",
				"updateTestEndTime",
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

	// //  检索
	// var selectResult2 = db.select(
	// 	"STUDY",
	// 	"selectTestInfo",
	// 	{
	// 		testno : testno,
	// 	}
	// ).getSingle();

	if(way3 != "0"){
		return ret.navigate("study_testword_test2.jsp");
	}

	// 画面へ結果を返す
	return ret.navigate("study_testword_test.jsp");

};
