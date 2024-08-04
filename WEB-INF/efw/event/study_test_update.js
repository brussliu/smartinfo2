var study_test_update = {};
study_test_update.name = "テスト情報管理画面更新";
study_test_update.paramsFormat = {
	"seq":null,
	"project":null
};

study_test_update.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	var seq = params["seq"];
	var project = params["project"];

	//  检索
	var selectResult = db.select(
		"STUDYTEST",
		"selectstudytestbyseq",
		{
			"seq":seq,
			"project":project,
			"shopid": getShopId()

		}
	).getSingle();
 
	ret.eval('  add();');
	ret.eval('$("#opt_academicyear").val("' + selectResult['academicyear'] + '")');
	ret.eval('$("#text_name").val("' + selectResult['tname'] + '")');
	ret.eval('$("#text_from").val("' + selectResult['froms'] + '")');
	ret.eval('$("#text_to").val("' + selectResult['tos'] + '")');
	 
	ret.eval(" assignment('"+ 
	selectResult['contentseq1'] +"','"+
	 selectResult['project'] +"','"+
	 selectResult['contentseq2'] +"','"+
	 selectResult['contentseq3'] +"','"+

	 selectResult['score'] +"','"+
	 selectResult['fulls'] +"','"+
	 selectResult['gradeaverage'] +"','"+
	 selectResult['yearaverage'] +"','"+

	 selectResult['academicrank1'] +"','"+
	 selectResult['academicrank2'] +"','"+
	 selectResult['academicyear1'] +"','"+
	 selectResult['academicyear2'] +"');");  
 
	return ret;

};
