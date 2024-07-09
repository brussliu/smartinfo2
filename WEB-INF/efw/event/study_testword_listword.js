var study_testword_listword = {};
study_testword_listword.name = "単語テスト開始";
study_testword_listword.paramsFormat = {

	testno : null,
};

study_testword_listword.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var testno = params["testno"];

	//  检索
	var selectResult = db.select(
		"STUDY",
		"selectTestDetailInfo",
		{
			testno : testno,
		}
	).getArray();

	//selectResult.debug("6666666666666666666666666666666666666666666666666666666666666666666666666666");

	var resultHTML =
		"<tr style='color: {color};height:28px;'>" +
			"<td class='l'><span class='l5'>{testsubno}</span></td>" +
			"<td class='l'><span class='l5'>{book}</span></td>" +
			"<td class='l'><span class='l5'>{classification}</span></td>" +
			"<td class='l'><span class='l5'>{wordseq}</span></td>" +
			"<td class='l' style='background-color: {word_color}'><a herf='#' onclick='openWord(this)'><span class='l5' style='text-decoration: underline;'>{word_e}</span></a></td>" +
			"<td class='l'><span class='l5'>{word_j}</span></td>" +
			"<td class='l' style='background-color: {sen1_color}'><span class='l5'>{sen1_e}</span></td>" +
			"<td class='l'><span class='l5'>{sen1_j}</span></td>" +
			"<td class='l' style='background-color: {sen2_color}'><span class='l5'>{sen2_e}</span></td>" +
			"<td class='l'><span class='l5'>{sen2_j}</span></td>" +
		"</tr>";

		//selectResult.debug("yyyyyyyyyyyyyyyyyyyy");

	ret.runat("#wordlisttable tbody").remove("tr").append(resultHTML).withdata(selectResult);

	// var script = "$('.c_detail_header').show();$('.c_detail_content').show();";
	// ret.eval(script);
	// ret.eval(" changeColor();");

	ret.eval("study_testword_inputdialog.dialog('open');");
	// 画面へ結果を返す
	return ret;

};
