var study_word_search = {};
study_word_search.name = "単語状況検索";
study_word_search.paramsFormat = {
	"#opt_book" : null,
	"#opt_classification" : null,
	"#opt_accuracy" : null,
	"#keyword" : null
};

study_word_search.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var book = params["#opt_book"];

	var classification = params["#opt_classification"];

	var accuracy = params["#opt_accuracy"];

	var keyword = params["#keyword"];

	//  检索
	var selectResult = db.select(
		"STUDY",
		"selectWordTestInfo",
		{
			book : book,
			classification : classification,
			accuracy : accuracy,
			keyword : keyword
		}
	).getArray();


	var resultHTML =
		"<tr>" +
			"<td style='width: 120px;' class='l'><span class='l5'>{book}</span></td>" +
			"<td style='width: 120px;' class='l'><span class='l5'>{classification}</span></td>" +
			"<td style='width: 120px;' class='r'><span class='r5'>{wordseq}</span></td>" +

			"<td style='width: 100px;' class='c'><span class=''>{costtime1}:{costtime2}:{costtime3}</span></td>" +
			"<td style='width: 100px;' class='r'><span class='r5'>{testtimes}</span></td>" +
			"<td style='width: 100px;' class='r'><span class='r5'>{all_right}</span></td>" +
			"<td style='width: 100px;' class='r'><span class='r5'>{per}</span></td>" +

			"<td style='width: 200px;' class='l' ondblclick='updateItem(1,this);'><span class='l5 word'>{word_e}</span></td>" +
			"<td style='width: 200px;' class='l' ondblclick='updateItem(2,this);'><span class='l5'>{word_j}</span></td>" +
			"<td style='width: 500px;' class='l' ondblclick='updateItem(3,this);'><span class='l5'>{word_c}</span></td>" +
			"<td style='width: 100px;' class='r'><span class='r5'>{word_right}</span></td>" +
			"<td style='width: 100px;' class='r'><span class='r5'>{word_wrong}</span></td>" +

			"<td style='width: 250px;' class='l' ondblclick='updateItem(4,this);'><span class='l5'>{sen1_e}</span></td>" +
			"<td style='width: 250px;' class='l' ondblclick='updateItem(5,this);'><span class='l5'>{sen1_j}</span></td>" +
			"<td style='width: 250px;' class='l' ondblclick='updateItem(6,this);'><span class='l5'>{sen1_c}</span></td>" +
			"<td style='width: 100px;' class='r'><span class='r5'>{sen1_right}</span></td>" +
			"<td style='width: 100px;' class='r'><span class='r5'>{sen1_wrong}</span></td>" +

			"<td style='width: 250px;' class='l' ondblclick='updateItem(7,this);'><span class='l5'>{sen2_e}</span></td>" +
			"<td style='width: 250px;' class='l' ondblclick='updateItem(8,this);'><span class='l5'>{sen2_j}</span></td>" +
			"<td style='width: 250px;' class='l' ondblclick='updateItem(9,this);'><span class='l5'>{sen2_c}</span></td>" +
			"<td style='width: 100px;' class='r'><span class='r5'>{sen2_right}</span></td>" +
			"<td style='width: 100px;' class='r'><span class='r5'>{sen2_wrong}</span></td>" +
		"</tr>";

	ret.runat("#wordinfotable").remove("tr").append(resultHTML).withdata(selectResult);

	ret.eval("changeStyleForWordInfo();");
	// 画面へ結果を返す
	return ret;

};
