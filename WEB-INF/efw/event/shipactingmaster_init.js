var shipactingmaster_init = {};
shipactingmaster_init.name = "代行発送情報画面初期表示";
shipactingmaster_init.paramsFormat = {

};
 
shipactingmaster_init.fire = function (params) {

	var ret = new Result();

	// セッションチェック
	if (sessionCheck(ret) == false) { return ret };

	// タイトル情報設定
	setTitleInfo(ret);

	setAuthorityInfo(ret, "09");

	var selectResult = db.select(
		"SHIPACTINGMASTER",
		"searchshipactingmaster",
		{
			"shopid": getShopId(),
		}
	).getArray();
 
	var resultHTML ='<tr>' +
	'<td style="width: 50px;" class="c"><input type="radio"name="choice" value="{no}" onchange="choice(this)"></input></td>' +
	'<td style="width: 120px;" class="c">{no}</td>' +
	'<td style="width: 150px;" class="l"><span class="l5">{type}</span></td>' +
	'<td style="width: 400px;" class="l"><span class="l5">{productname_cn}</span></td>' +
	'<td style="width: 200px;" class="l"><span class="l5">{productname_jp}</span></td>' +
	'<td style="width: 150px;" class="r"><span class="r5">{num}</span></td>' +
	'</tr>'
	ret.runat("#shipactingmastertable").remove("tr").append(resultHTML).withdata(selectResult);

	ret.eval("$('#btn_update').attr('disabled', true);");
	ret.eval("$('#btn_del').attr('disabled', true);");
	ret.eval(" changeColor();"); 
	return ret;
};