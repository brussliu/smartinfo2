var study_testword_getwordnote = {};
study_testword_getwordnote.name = "単語テスト開始";
study_testword_getwordnote.paramsFormat = {

	// "testno": null,
};

study_testword_getwordnote.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	//  检索
	var selectResult = db.select(
		"STUDY",
		"selectWordNote",
		{
		}
	).getSingle();

	var notecontent = selectResult["note"];
	var seq = selectResult["seq"];
	
	if(seq == null){
		return ret;
	}

	// ユーザー更新
	db.change(
		"STUDY",
		"updateWordNoteUser",
		{
			userid : getUserId(),
			seq : seq,
		}
	);

	var script = "displayNote('" + seq + "','" + notecontent + "');"
	ret.eval(script);

	// var script2 = "setNoteSeq('" + seq + "');"
	// ret.eval(script2);

	// 画面へ結果を返す
	return ret;

};