var study_word_updateitem = {};
study_word_updateitem.name = "単語内容更新";
study_word_updateitem.paramsFormat = {
	book : null, 
	classification : null, 
	wordseq : null, 
	flg : null, 
	content : null
};

study_word_updateitem.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var book = params["book"];
	var classification = params["classification"];
	var wordseq = params["wordseq"];

	var flg = params["flg"];
	var content = params["content"];

	if(book != "キクタン" && (flg == "wordE" || flg == "sen1E" || flg == "sen2E")){

		var args1 = new Array();

		args1[0] = book;
		args1[1] = classification;
		args1[2] = parseInt(wordseq);
		args1[3] = content;
		args1[4] = flg.substring(0, flg.length - 1);

		args1.debug("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&333333");

		// 中国語更新
		excuteJar("OptChineseExplain",args1);

		var args2 = new Array();

		args2[0] = book;
		args2[1] = classification;
		args2[2] = parseInt(wordseq);
		args2[3] = content;
		args2[4] = flg.substring(0, flg.length - 1);

		args2.debug("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&444444");
		//日本語更新
		excuteJar("OptJapaneseExplain",args2);
	}

	db.change(
		"STUDY",
		"updateWordInfo",
		{
			book : book,
			classification : classification,
			wordseq : parseInt(wordseq),
			flg : flg,
			content : content
		}
	);

	ret.eval("searchWord();");

	// 画面へ結果を返す
	return ret;

};
