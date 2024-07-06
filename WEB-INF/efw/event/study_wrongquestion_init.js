var study_wrongquestion_init = {};
study_wrongquestion_init.name = "納品情報管理画面初期表示";
study_wrongquestion_init.paramsFormat = {


};

study_wrongquestion_init.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	if(sessionCheck(ret) == false){return ret};

	// タイトル情報設定
	setTitleInfo(ret);

	//  检索
	var selectResult = db.select(
		"DELIVERY",
		"selectdelivery",
		{
			shopid: getShopId()

		}
	).getArray();

	var resultHTML =
	' <tr>' +
	' <td style="width: 50px;" class="c"><input type="radio" onclick="choice(this)" name="choice" value="{no}"></input></td>' +
	' <td style="width: 155px" class="l a"><span class="l5" onclick="outputFile(this)">{no}</span> </td>' +
			' <td style="width: 300px;" class="l"><span class="l5">{name}</span></td>' +
			' <td style="width: 500px;" class="l"><span class="l5">{content}</span></td>' +
			' <td style="width: 80px;" class="r"><span class="r5">{number}</span></td>' +
			' <td style="width: 120px;" class="c">{state}</td>' +

			' <td style="width: 120px;" class="c">{logindate}</td>' +
			' <td style="width: 120px;" class="c">{senddate}</td>' +
			' <td style="width: 120px;" class="c">{receivedate}</td>' +
			' <td style="width: 120px;" class="c">{completiondate}</td>' +

			' <td style="width: 140px;" class="c">{amz1}</td>' +
			' <td style="width: 300px;" class="l"><span class="l5">{amz2}</span></td>' +
			' <td style="width: 160px;" class="c">{amz3}</td>' +
			' <td style="width: 140px;" class="l"><span class="l5">{amz4}</span></td>' +
			' <td style="width: 140px;" class="r"><span class="r5">{amz5}</span></td>' +
			' <td style="width: 140px;" class="r"><span class="r5">{amz6}</span></td>' +
			' </tr>'



	ret.runat("#deliverytable").remove("tr").append(resultHTML).withdata(selectResult);

	var script = "$('.c_detail_header').show();$('.c_detail_content').show();";
	ret.eval(script);
	ret.eval(" changeColor();");  
	// 画面へ結果を返す
	return ret;

};
