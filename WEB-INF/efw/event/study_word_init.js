var study_word_init = {};
study_word_init.name = "単語テスト開始";
study_word_init.paramsFormat = {


};

study_word_init.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	initSelectOption1(ret);


	// 画面へ結果を返す
	return ret;

};

function initSelectOption1(ret){

	//  检索
	var selectResult = db.select(
		"STUDY",
		"searchWordBook",{}
	).getArray();

	selectResult.debug("888888888888888888888888888888888888888");

	var resultHTML = "<option class='dbvalue' value='{book}'>{book}</option>";

	ret.runat("#opt_book").remove(".dbvalue").append(resultHTML).withdata(selectResult);

}