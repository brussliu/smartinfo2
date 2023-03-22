var purchase_init = {};
purchase_init.name = "仕入情報管理画面初期表示";
purchase_init.paramsFormat = {


};

purchase_init.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);

	// 检索
	var selectResult = db.select(
		"PURCHASE",
		"selectpurchase",
		{
			shopid: getShopId()

		}
	).getArray();

	ret.runat("#purchasetable").remove("tr");

	// 検索結果をループする
	for (var i = 0; i < selectResult.length; i++) {

		// 仕入NO
		var purchaseno = selectResult[i]["no"];

		// 資料名称検索
		var selectResult2 = db.select(
			"PURCHASE",
			"selectfilename",
			{
				purchaseno: purchaseno,
				shopid: getShopId()

			}
		).getArray();

		var top = '<td style="width: 250px;" rowspan="2" class="l">  <ul>';
		var content = '';
		for (var j = 0; j < selectResult2.length; j++) {
			content = content + '<li class = "l5 a" onclick="down(this)">' + selectResult2[j]["filename"] + '.' + selectResult2[j]["suffix"] + '</li>'
		}
		var bottom = '</ul> </td> '
		var file = '' + top + content + bottom;

		// Array変換
		var record = new Record([selectResult[i]]).getArray();

		var resultHTML =
			'<tr>' +
			'<td style="width: 50px;" rowspan="2" class="c"><input type="radio" onclick="choice(this)" value="{no}" name="choice"></input></td>' +
			'<td style="width: 155px" rowspan="2" class="l"><span class="l5 a" onclick="outputFile(this)">{no}</span></td>' +
			'<td style="width: 200px;" rowspan="2" class="l"><span class="l5">{name}</span></td>' +

			'<td style="width: 200px;" rowspan="2" class="l"><span class="l5">{no}</span></td>' +
			'<td style="width: 100px;" rowspan="2" class="c">{type}</td>' +
			'<td style="width: 50px;" rowspan="2" class="r"><span class="r5">{number}</span></td>' +
			'<td style="width: 100px;" rowspan="2" class="r"><span class="r5">{money}</span></td>' +
			'<td style="width: 100px;" rowspan="2" class="c">{state}</td>' +

			'<td style="width: 120px;" rowspan="2" class="c">{logindate}</td>' +
			'<td style="width: 120px;" rowspan="2" class="c">{senddate1}</td>' +
			'<td style="width: 120px;" rowspan="2" class="c">{senddate2}</td>' +
			'<td style="width: 120px;" rowspan="2" class="c">{completiondate}</td>' +

			'<td style="width: 150px;" rowspan="2" class="l"><span class="l5">{sendway}</span></td>' +
			'<td style="width: 150px;" rowspan="2" class="l"><span class="l5">{tracknumber}</span></td>' +

			'<td style="width: 80px;" rowspan="2" class="r"><span class="r5">{rate}</span></td>' +

			'<td style="width: 120px;" class="r"><span class="r5">{productamountrmb}元</span></td>' +
			'<td style="width: 120px;" class="r"><span class="r5">{shipamountrmb}元</span></td>' +
			'<td style="width: 120px;" class="r"><span class="r5">{faxamountrmb}元</span></td>' +
			'<td style="width: 120px;" class="r"><span class="r5">{totalrmb}元</span></td>' +
			file +
			'</tr>' + '<tr>' +
			'<td class="r"><span class="r5">{productamountry}円</span></td>' +
			'<td class="r"><span class="r5">{shipamountry}円</span></td>' +
			'<td class="r"><span class="r5">{faxamountry}円</span></td>' +
			'<td class="r"><span class="r5">{totalry}円</span></td>' +
			'</tr>';

		ret.runat("#purchasetable").append(resultHTML).withdata(record);
	}
	var script = "changeColor();";
	ret.eval(script);

	ret.show('.c_detail_header').show('.c_detail_content');
	
	// var script = "$('.c_detail_header').show();$('.c_detail_content').show();";
	// ret.eval(script);
	// 画面へ結果を返す
	return ret;

};
