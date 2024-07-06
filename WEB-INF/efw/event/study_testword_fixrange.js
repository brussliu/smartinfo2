var study_testword_fixrange = {};
study_testword_fixrange.name = "単語テスト開始";
study_testword_fixrange.paramsFormat = {

	"#opt_book": null,
	"#opt_dayfrom": null,
	"#opt_dayto": null
};

study_testword_fixrange.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);
	
	// params.debug("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

	var book = params["#opt_book"];
	var dayfrom = params["#opt_dayfrom"];
	var dayto = params["#opt_dayto"];

	// // セッションチェック
	// if(sessionCheck(ret) == false){return ret};

	// // タイトル情報設定
	// setTitleInfo(ret);
	if(dayfrom != null && dayfrom != ""){
		dayfrom = "Day" + ( '00' + dayfrom ).slice( -2 );
	}

	if(dayto != null && dayto != ""){
		dayto = "Day" + ( '00' + dayto ).slice( -2 );
	}


	//  检索
	var selectResult = db.select(
		"STUDY",
		"selectWordCount",
		{
			book: book,
			dayfrom: dayfrom,
			dayto: dayto,
		}
	).getSingle();

	// var resultHTML =
	// ' <tr>' +
	// ' <td style="width: 50px;" class="c"><input type="radio" onclick="choice(this)" name="choice" value="{no}"></input></td>' +
	// ' <td style="width: 155px" class="l a"><span class="l5" onclick="outputFile(this)">{no}</span> </td>' +
	// 		' <td style="width: 300px;" class="l"><span class="l5">{name}</span></td>' +
	// 		' <td style="width: 500px;" class="l"><span class="l5">{content}</span></td>' +
	// 		' <td style="width: 80px;" class="r"><span class="r5">{number}</span></td>' +
	// 		' <td style="width: 120px;" class="c">{state}</td>' +

	// 		' <td style="width: 120px;" class="c">{logindate}</td>' +
	// 		' <td style="width: 120px;" class="c">{senddate}</td>' +
	// 		' <td style="width: 120px;" class="c">{receivedate}</td>' +
	// 		' <td style="width: 120px;" class="c">{completiondate}</td>' +

	// 		' <td style="width: 140px;" class="c">{amz1}</td>' +
	// 		' <td style="width: 300px;" class="l"><span class="l5">{amz2}</span></td>' +
	// 		' <td style="width: 160px;" class="c">{amz3}</td>' +
	// 		' <td style="width: 140px;" class="l"><span class="l5">{amz4}</span></td>' +
	// 		' <td style="width: 140px;" class="r"><span class="r5">{amz5}</span></td>' +
	// 		' <td style="width: 140px;" class="r"><span class="r5">{amz6}</span></td>' +
	// 		' </tr>'



	// ret.runat("#deliverytable").remove("tr").append(resultHTML).withdata(selectResult);

	// var script = "$('.c_detail_header').show();$('.c_detail_content').show();";
	// ret.eval(script);
	// ret.eval(" changeColor();");

	var worldcount = selectResult["ct"];


	var evalScript1 = "showWorldCount(" + worldcount + ");focusNext();";


	// 画面へ結果を返す
	return ret.eval(evalScript1);

};
