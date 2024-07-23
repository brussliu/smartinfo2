var study_testword_listcheck = {};
study_testword_listcheck.name = "単語テスト開始";
study_testword_listcheck.paramsFormat = {

	testno : null,
};

study_testword_listcheck.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	var testno = params["testno"];

	// 自動採点
	db.change("STUDY",	"updateToCheck1",	{testno : testno,});
	db.change("STUDY",	"updateToCheck2",	{testno : testno,});
	db.change("STUDY",	"updateToCheck3",	{testno : testno,});
	db.change("STUDY",	"updateToCheck4",	{testno : testno,});
	db.change("STUDY",	"updateToCheck5",	{testno : testno,});
	db.change("STUDY",	"updateToCheck6",	{testno : testno,});
	db.change("STUDY",	"updateToCheck7",	{testno : testno,});
	
	//  检索
	var selectResult = db.select(
		"STUDY",
		"selectTestDetailInfoToCheck",
		{
			testno : testno,
		}
	).getArray();

	var disabled = "";

	var role = getRole();

	if(role == "user"){

		disabled = "disabled";

	}

	// <th style="width: 160px;">書籍</th>
	// <th style="width: 100px;">分類</th>
	// <th style="width: 100px;">SEQ</th>
	// <th style="width: 100px;">区分</th>

	// <th style="width: 140px;">正解</th>
	// <th style="width: 220px;">答え</th>

	// <th style="width: 100px;">○</th>
	// <th style="width: 100px;">×</th>

	var resultHTML =
		"<tr style='height:28px;background-color:{color};'>" +
			"<td style='width: 160px;' class='l'><span class='l5'>{testno}</span></td>" +
			"<td style='width:  60px;' class='l'><span class='l5'>{subno}</span></td>" +
			"<td style='width: 160px;' class='l'><span class='l5'>{book}</span></td>" +
			"<td style='width: 100px;' class='l'><span class='l5'>{classification}</span></td>" +
			"<td style='width: 100px;' class='l'><span class='l5'>{wordseq}</span></td>" +
			"<td style='width: 100px;' class='l'><span class='l5'>{kbn}</span></td>" +
			"<td style='width: 200px;' class='l'><span class='l5' style='color:red;font-size:24px;'>{en}</span></td>" +
			"<td style='width: 410px;background-color:rgb(255,255,240);' class='l'>" +
				"<img src='{content}' width='400px' style='border: 1px solid gray;display: {display}'>" +
			"</td>" +
			"<td style='width: 100px;text-align: center;' class='l'>" +
				"<input " + disabled + " onchange='checkWord(this);' style='width: 20px;height: 20px;' type='radio' name='cr_{testno}_{subno}_{kbn}_{book}_{classification}_{wordseq}' value='○' {right}></input>" +
			"</td>" +
			"<td style='width: 100px;text-align: center;' class='l'>" +
				"<input " + disabled + " onchange='checkWord(this);' style='width: 20px;height: 20px;' type='radio' name='cr_{testno}_{subno}_{kbn}_{book}_{classification}_{wordseq}' value='×' {wrong}></input>" +
			"</td>" +
		"</tr>";

	ret.runat("#testwordchecktable").remove("tr").append(resultHTML).withdata(selectResult);


	// 画面へ結果を返す
	return ret;

};
