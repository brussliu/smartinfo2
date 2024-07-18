var study_testword_allwrong = {};
study_testword_allwrong.name = "全て誤り単語テスト";
study_testword_allwrong.paramsFormat = {


};

study_testword_allwrong.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	//  检索
	var selectResult = db.select(
		"STUDY",
		"selectWrongWord",
		{
		}
	).getArray();

	if(selectResult.length <= 0){
		ret.eval("alert('誤り単語がないので、再テストできません！');");
		return ret;
	}

	// テスト番号


	var book = "";
	var testno = "";

	var new_book = "";
	var new_testno = "";

	var now = new Date();

	var n = null;
	var new_n = null;

	// 単語テスト詳細情報
	for(var i = 0;i < selectResult.length;i++){

		new_book = selectResult[i]["book"];

		if(book != new_book){

			n = new_n;
			new_n = 1;
			if(new_testno == ""){
				new_testno = now.format('yyyyMMdd-HHmmss');


			}else{

				now.setSeconds(now.getSeconds() + 1);
				new_testno = now.format('yyyyMMdd-HHmmss');
			}

		}



		db.change(
			"STUDY",
			"insertTestDetailInfo",
			{
				testno : new_testno,
				subno : new_n,
				book : new_book,
				classification : selectResult[i]["classification"],
				wordseq : selectResult[i]["wordseq"],
				userid : getUserId()
			}
		);

		if(book != new_book && i > 0){
			// 単語テスト情報
			db.change(
				"STUDY",
				"insertTestInfo",
				{
					testno : testno,
					book : book,
					classification : "===ALL===",
					div1 : "誤り単語",
					div2 : "1",
					div3 : "0",
					count : n - 1,
					userid : getUserId()
				}
			);

		}

		new_n = new_n + 1;
		book = new_book;
		testno = new_testno;
	
	}

	db.change(
		"STUDY",
		"insertTestInfo",
		{
			testno : testno,
			book : book,
			classification : "===ALL===",
			div1 : "誤り単語",
			div2 : "1",
			div3 : "0",
			count : new_n - 1,
			userid : getUserId()
		}
	);


	// 画面へ結果を返す
	return ret.navigate("study_testword.jsp");

};