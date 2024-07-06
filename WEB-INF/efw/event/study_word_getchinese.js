var study_word_getchinese = {};
study_word_getchinese.name = "単語テスト開始";
study_word_getchinese.paramsFormat = {
	"#opt_book" : null,
	"#opt_classification" : null,
};

study_word_getchinese.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var book = params["#opt_book"];
	var classification = params["#opt_classification"];

	//  检索
	var selectResult = db.select(
		"STUDY",
		"selectWord",
		{
			book : book,
			dayfrom : classification,
			dayto : classification
		}
	).getArray();

	// 単語テスト詳細情報
	for(var i = 0;i < selectResult.length;i++){

		var book = selectResult[i]["book"];
		var classification = selectResult[i]["classification"];
		var wordseq = selectResult[i]["seq"];


		var word_e = selectResult[i]["word_e"];
		var sen1_e = selectResult[i]["sen1_e"];
		var sen2_e = selectResult[i]["sen2_e"];
	
		var word_c = selectResult[i]["word_c"];
		var sen1_c = selectResult[i]["sen1_c"];
		var sen2_c = selectResult[i]["sen2_c"];

		var word_j = selectResult[i]["word_j"];
		var sen1_j = selectResult[i]["sen1_j"];
		var sen2_j = selectResult[i]["sen2_j"];

		if((word_j == null || word_j == "") && word_e != null && word_e != ""){

			var args = new Array();

			args[0] = book;
			args[1] = classification;
			args[2] = wordseq;
			args[3] = word_e;
			args[4] = "word";
			excuteJar("OptJapaneseExplain",args);
		}

		if((word_c == null || word_c == "") && word_e != null && word_e != ""){

			var args = new Array();

			args[0] = book;
			args[1] = classification;
			args[2] = wordseq;
			args[3] = word_e;
			args[4] = "word";
			excuteJar("OptChineseExplain",args);
		}

		if((sen1_j == null || sen1_j == "") && sen1_e != null && sen1_e != ""){

			var args = new Array();

			args[0] = book;
			args[1] = classification;
			args[2] = wordseq;
			args[3] = sen1_e;
			args[4] = "sen1";

			excuteJar("OptJapaneseExplain",args);

		}

		if((sen1_c == null || sen1_c == "") && sen1_e != null && sen1_e != ""){

			var args = new Array();

			args[0] = book;
			args[1] = classification;
			args[2] = wordseq;
			args[3] = sen1_e;
			args[4] = "sen1";

			excuteJar("OptChineseExplain",args);

		}

		if((sen2_j == null || sen2_j == "") && sen2_e != null && sen2_e != ""){

			var args = new Array();

			args[0] = book;
			args[1] = classification;
			args[2] = wordseq;
			args[3] = sen2_e;
			args[4] = "sen2";

			excuteJar("OptJapaneseExplain",args);

		}

		if((sen2_c == null || sen2_c == "") && sen2_e != null && sen2_e != ""){

			var args = new Array();

			args[0] = book;
			args[1] = classification;
			args[2] = wordseq;
			args[3] = sen2_e;
			args[4] = "sen2";

			excuteJar("OptChineseExplain",args);

		}
	}

	ret.eval("searchWord();");
	
	// 画面へ結果を返す
	return ret;

};
