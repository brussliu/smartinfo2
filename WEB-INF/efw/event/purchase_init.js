var purchase_init = {};
purchase_init.name = "仕入情報管理画面初期表示";
purchase_init.paramsFormat = {


};

purchase_init.fire = function (params) {

	var ret = new Result();
	// セッションチェック
	sessionCheck(ret);

	// タイトル情報設定
	setTitleInfo(ret);

	// var ptArr = params["producttypeArr"];

	//  检索
	var selectResult = db.select(
		"PURCHASE",
		"selectpurchase",
		{
			shopid: getShopId()

		}
	).getArray();

	selectResult.debug("-------------selectstockinfo")
	var resultHTML =
			'<tr>' +
			'<td style="width: 50px;" rowspan="2" class="c"><input type="radio" onclick="choice(this)" name="choice"></input></td>' +
			'<td style="width: 155px" rowspan="2" class="l"><span class="l5 a" onclick="down({no})">{no}</span></td>' +
			'<td style="width: 200px;" rowspan="2" class="l"><span class="l5">{name}</span></td>' +

			'<td style="width: 200px;" rowspan="2" class="l"><span class="l5">{no}</span></td>' +
			'<td style="width: 100px;" rowspan="2" class="c">{type}</td>' +
			'<td style="width: 50px;" rowspan="2" class="r"><span class="r5">{number}</span></td>' +
			'<td style="width: 100px;" rowspan="2" class="r"><span class="r5">{money}</span></td>' +
			'<td style="width: 120px;" rowspan="2" class="c">{state}</td>' +

			'<td style="width: 150px;" rowspan="2" class="c">{logindate}</td>' +
			'<td style="width: 150px;" rowspan="2" class="c">{senddate1}</td>' +
			'<td style="width: 150px;" rowspan="2" class="c">{senddate2}</td>' +
			'<td style="width: 150px;" rowspan="2" class="c">{completiondate}</td>' +

			'<td style="width: 150px;" rowspan="2" class="l"><span class="l5">{sendway}</span></td>' +
			'<td style="width: 80px;" rowspan="2" class="r"><span class="r5">{rate}</span></td>' +

			'<td style="width: 120px;" class="r"><span class="r5">{productamountrmb}元</span></td>' +
			'<td style="width: 120px;" class="r"><span class="r5">{shipamountrmb}元</span></td>' +
			'<td style="width: 120px;" class="r"><span class="r5">{faxamountrmb}元</span></td>' +
			'<td style="width: 120px;" class="r"><span class="r5">{totalrmb}元</span></td>' +
			'</tr>' + '<tr>' +
			'<td class="r"><span class="r5">{productamountry}円</span></td>' +
			'<td class="r"><span class="r5">{shipamountry}円</span></td>' +
			'<td class="r"><span class="r5">{faxamountry}円</span></td>' +
			'<td class="r"><span class="r5">{totalry}円</span></td>' +
			'</tr>';		




	ret.runat("#purchasetable").remove("tr").append(resultHTML).withdata(selectResult);

	var script = "$('.c_detail_header').show();$('.c_detail_content').show();";
	ret.eval(script);
	// ret.eval("changeColor()");
	// 画面へ結果を返す
	return ret;

};
